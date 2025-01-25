extends Panel

@export var plant_key = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if plant_key != "":
		$qty.text = ("[center]"+str(Global.plant_products[plant_key]["storage"]))
