extends Control
export var timed = true

func _ready():
	pass

func _on_restart_button_pressed():
	get_tree().change_scene("res://levels/level1.tscn")

func _on_Timer_timeout():
	if timed:
		get_tree().change_scene("res://levels/level1.tscn")
