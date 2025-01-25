extends Node2D

@export var plant_key = "a"

var hours_left = 10000000000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hours_left = Global.plants[plant_key]["growth_time"]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func time_passed(time_passed: int):
	hours_left -= time_passed
	
func days_left() -> int:
	return int(hours_left/24)
