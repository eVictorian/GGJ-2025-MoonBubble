extends Node

var plants = {
	"Spato": {"qty_produced":4,"growth_time":96,"fertalizer":[["none"]]},
	"Thornato": {"qty_produced":4,"growth_time":96,"fertalizer":[["Spato",1]]}
}

var plant_products = {
	"Spato":{"sell_price":5,"buy_price":10,"storage":5}
}
