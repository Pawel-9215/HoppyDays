extends Node2D

var active = true

func _ready():
	pass


func _on_Area2D_body_entered(body):
	if active:
		active = false
		$AnimationPlayer.play("collect")
		$AudioStreamPlayer2D.play()
		get_tree().call_group("GameState", "coin_up")
	
func vanish():
	queue_free()
