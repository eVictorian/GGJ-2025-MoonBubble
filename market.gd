extends Node2D

var send_rocket = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$market_popup.visible = true
		$Background.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		$market_popup.visible = false
		$Background.visible = false
		launch_rocket()
func launch_rocket():
	pass
