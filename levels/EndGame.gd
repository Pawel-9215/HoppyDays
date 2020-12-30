extends Control


func _ready():
	pass


func _on_restart_button_pressed():
	get_tree().change_scene("res://levels/level1.tscn")
