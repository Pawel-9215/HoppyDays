extends Camera2D

const OFFSET = 40

func _ready():
	pass

func _on_Player_animate(motion):
	if motion.x > 0:
		position.x = OFFSET
	elif motion.x < 0:
		position.x = -OFFSET
	else:
		pass
