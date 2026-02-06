extends CanvasLayer

@onready var fade_rect = $ColorRect

var is_transitioning = false

func change_scene(target_scene):
	if is_transitioning:
		return
	
	is_transitioning = true
	
	var tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1, 0.5)
	await tween.finished
	
	get_tree().change_scene_to_file(target_scene)
	
	await get_tree().process_frame
	
	tween = create_tween()
	tween.tween_property(fade_rect, "modulate:a", 0, 0.5)
	await tween.finished
	
	is_transitioning = false
