extends Control

@export var plant_key = ""

var buy_price = 0
var sell_price = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$name.text = plant_key
	buy_price = Global.plant_products[plant_key]["buy_price"]
	$buy.text = "Buy 10\n£"+str(buy_price)
	sell_price = Global.plant_products[plant_key]["sell_price"]
	$sell.text = "Sell 10\n£"+str(sell_price)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_buy_pressed() -> void:
	pass # Replace with function body.


func _on_sell_pressed() -> void:
	pass # Replace with function body.
