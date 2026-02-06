extends Control

func _ready():
	await get_tree().create_timer(3).timeout
	start_game()

func _input(event):
	if event.is_pressed():
		start_game()

func start_game():
	get_tree().change_scene_to_file("res://game.tscn")
