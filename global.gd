extends Node

var money = 50

var plants = {
	"Spato": {"qty_produced":50,"growth_time":24,"fertalizer":[["none"]]},
	"Thornato": {"qty_produced":4,"growth_time":48,"fertalizer":[["Spato",1]]}
}

var plant_products = {
	"Spato":{"sell_price":5,"buy_price":10,"storage":50},
	"Thornato":{"sell_price":12,"buy_price":24,"storage":25}
}
