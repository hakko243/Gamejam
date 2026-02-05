extends CharacterBody2D

@export var speed := 200.0
var can_interact := false
var dialog_active := false

func _physics_process(delta):
	velocity.x = 0

	if Input.is_action_pressed("move_left"):
		velocity.x = -speed
	elif Input.is_action_pressed("move_right"):
		velocity.x = speed
	if dialog_active:
		velocity = Vector2.ZERO
		return

	move_and_slide()

	# Clamp posisi player ke area map
	global_position.x = clamp(global_position.x, 0, 3000)


	if Input.is_action_just_pressed("interact") and can_interact:
		print("Interaksi!")

func _on_interact_area_area_entered(area):
	can_interact = true

func _on_interact_area_area_exited(area):
	can_interact = false
	
func set_dialog_active(value):
	dialog_active = value
