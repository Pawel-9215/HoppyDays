extends Node2D

const SPEED = 80

func _ready():
	set_as_toplevel(true)
	global_position = get_parent().global_position

func _process(delta):
	
	position.y += SPEED*delta

func _on_VisibilityNotifier2D_viewport_exited(viewport):
	queue_free()
