extends CanvasLayer

@onready var fade = $ColorRect

func _ready():
	await get_tree().create_timer(3).timeout
	start_transition()

func start_transition():
	var tween = create_tween()
	tween.tween_property(fade, "modulate:a", 1, 1)
	await tween.finished
	
	get_tree().change_scene_to_file("res://game.tscn")
