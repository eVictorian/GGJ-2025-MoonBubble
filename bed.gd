extends Node2D

var atBed = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact") and atBed and get_parent().time_of_day >= get_parent().dayLength:
		get_parent().sleep()
		$sleep_prompt/text.text = "[center]Sleep At 22:00"
	pass



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$sleep_prompt.visible = true
		atBed = true
		if get_parent().time_of_day >= get_parent().dayLength:
			$sleep_prompt/text.text = "[center]Press E To Sleep "
		else:
			$sleep_prompt/text.text = "[center]Sleep At 22:00"


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		$sleep_prompt.visible = false
		atBed = false
