extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 250
const GRAVITY = 25
const UP = Vector2(0,-1)
const JUMP_SPEED = 500
const ACCELERATION = 30

const BOOST_MULTIPLIER = 1.5

signal animate


func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)
	if motion.x !=0:
		print(motion)
	
func apply_gravity():
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 10
	else:
		motion.y += GRAVITY

func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSfx.play()
		
func move():
	if Input.is_action_pressed("left") and (Input.is_action_pressed("right") != true):
		if motion.x > -SPEED:
			motion.x -= ACCELERATION
		elif motion.x < -SPEED:
			motion.x = -SPEED
	elif Input.is_action_pressed("right") and (Input.is_action_pressed("left") != true):
		if motion.x < SPEED:
			motion.x += ACCELERATION
		elif motion.x > SPEED:
			motion.x = SPEED
	else:
		if motion.x > -ACCELERATION and motion.x < ACCELERATION:
			motion.x = 0
		elif motion.x > 0:
			motion.x -= ACCELERATION
		elif motion.x < 0:
			motion.x += ACCELERATION
		
func animate():
	emit_signal("animate", motion)

func hurt():
	
	motion.y = -JUMP_SPEED
	$HurtSfx.play()
#	if lives <= 0:
#		end_game()
		
func boost():

	motion.y = -JUMP_SPEED*BOOST_MULTIPLIER

