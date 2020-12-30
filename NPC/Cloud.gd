extends Node2D

var timeout = false

func _ready():
	pass
	
func _process(delta):
	if $AnimatedSprite/RayCast2D.is_colliding():
		fire()
		
func fire():
	if not timeout:
		timeout = true
		$AnimatedSprite/RayCast2D.add_child(load("res://NPC/lightning.tscn").instance())
		$AnimatedSprite/Timer.start()


func _on_Timer_timeout():
	timeout = false
