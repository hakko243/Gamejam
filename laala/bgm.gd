extends Node

@onready var player = $AudioStreamPlayer2D

func play_bgm():
	player.play()
