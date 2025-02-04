extends CharacterBody2D


@export var speed = 300.0 
var jump_velocity = 1000


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity *-1
		$AnimatedSprite2D.stop()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if is_on_floor():
			$AnimatedSprite2D.play("walk")
		velocity.x = direction * speed			
		if direction < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		if is_on_floor():
			$AnimatedSprite2D.play("idle")

	move_and_slide()
