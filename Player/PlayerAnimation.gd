extends AnimatedSprite


func _ready():
	pass


func _on_Player_animate(motion):
	if motion.y > 50:
		play("descend")
	elif motion.y < -10:
		play("ascend")
	elif motion.x != 0:
		play("run")
	else:
		play("idle")

	if motion.x > 0:
		flip_h = false
	elif motion.x < 0:
		flip_h = true
		
	# print(motion)
