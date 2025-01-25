extends Button

@export var plant_key = ""
@export var plant_scene: PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$title.text = plant_key
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_parent().visible:
		$qty.text = "[center]"+str(Global.plant_products[plant_key]["storage"])
		
		


func _on_pressed() -> void:
	if Global.plant_products[plant_key]["storage"] > 0:
		get_parent().get_parent().get_parent().new_plant(plant_scene)
		get_parent().visible
	
