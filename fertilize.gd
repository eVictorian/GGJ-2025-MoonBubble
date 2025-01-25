extends Button

var plant_key: String
var quantity_per_hour: int
var active = false

@export var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible:
		text = plant_key+"\n"+str(quantity_per_hour)+"/H"


func _on_pressed() -> void:
	if active:
		get_parent().get_parent().get_parent().deactivateFertilizer(index)
		
	else:
		if Global.plant_products[plant_key]["storage"] > 0:
			active = true
			get_parent().get_parent().get_parent().activateFertilizer(index)
			self_modulate = Color(0,1,0)
