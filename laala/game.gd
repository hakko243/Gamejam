extends Node2D

@onready var bgm = $Bgm

func _ready():
	bgm.play_bgm()
