extends Node2D


func _ready():
	pass
	
func _process(delta):
	if $AnimatedSprite/RayCast2D.is_colliding():
		fire()
		
func fire():
	$AnimatedSprite/RayCast2D.add_child(load("res://NPC/lightning.tscn").instance())
	
