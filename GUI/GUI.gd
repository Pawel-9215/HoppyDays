extends CanvasLayer


func _ready():
	pass
	
func update(lives, coins):
	$Control/HBoxContainer/lifes.text = str(lives)
	$Control/HBoxContainer/coins.text = str(coins)
