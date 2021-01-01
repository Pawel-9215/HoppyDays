extends Node2D

var lives = 3
var coins = 0
var player_hurting = false
var alpha = 1

const WORLD_LIMIT = 369
const PRICE_OF_LIFE = 10

func _process(delta):
	if $Player.position.y > WORLD_LIMIT:
		end_game()
	if player_hurting:
		blink()
		

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
	if player_hurting == false:
		player_hurting = true
		$Timer.start()
		lives -= 1
		$Player.hurt()
		if lives < 0:
			end_game()
		update_gui()
	
func end_game():
	get_tree().change_scene("res://levels/EndGame.tscn")
	
func win_game():
	get_tree().change_scene("res://levels/Victory.tscn")
	
func update_gui():
	get_tree().call_group("GUI", "update", lives, coins)
	
func blink():
	if alpha == 0:
		alpha = 1
	else:
		alpha = 0
	$Player/PlayerAnimation.self_modulate = Color( 0.95, 0, 0, alpha )

func _on_Timer_timeout():
	player_hurting = false
	$Player/PlayerAnimation.self_modulate = Color( 1, 1, 1, 1 )
