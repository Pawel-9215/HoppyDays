extends Node2D

var lives = 3
var coins = 0
const WORLD_LIMIT = 369
const PRICE_OF_LIFE = 10

func _process(delta):
	if $Player.position.y > WORLD_LIMIT:
		end_game()

func _ready():
	add_to_group("GameState")
	update_gui()
	
func coin_up():
	coins += 1
	if coins >= PRICE_OF_LIFE:
		lives += 1
		coins = 0
	
	update_gui()

func hurt():
	lives -= 1
	$Player.hurt()
	if lives < 0:
		end_game()
	update_gui()
	
func end_game():
	get_tree().change_scene("res://levels/EndGame.tscn")
	
func update_gui():
	get_tree().call_group("GUI", "update", lives, coins)
	
