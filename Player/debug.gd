extends Node2D
tool

const DELTA = 0.016
const SPEED = 250
const GRAVITY = 25
const UP = Vector2(0,-1)
const JUMP_SPEED = 500
const COLOR = Color( 1, 0.71, 0.76, 1 )

const BOOST_MULTIPLIER = 1.5

var current_position = position

func _draw():
	# draw_line(position, Vector2(40,0),  Color( 1, 0.71, 0.76, 1 ))
	for i in range(60):
		draw_line(current_position, Vector2(current_position.x+SPEED*DELTA, current_position.y-JUMP_SPEED*DELTA+GRAVITY*DELTA*i), COLOR)
		current_position = Vector2(current_position.x+SPEED*DELTA, current_position.y-JUMP_SPEED*DELTA+GRAVITY*DELTA*i)
	current_position = position
		


func _ready():
	pass
