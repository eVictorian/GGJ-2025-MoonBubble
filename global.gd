extends Node

var money = 50

var plants = {
	"Tree": {"qty_produced":0,"growth_time":26280,"fertalizer":[["Glowberry",1],["Weird CaGlowberryctus",1],["Moonusvie",1]]},
	
	"Spato": {"qty_produced":50,"growth_time":24,"fertalizer":[["none"]]},
	"Big Flower": {"qty_produced":60,"growth_time":48,"fertalizer":[["none"]]},
	"Thornato": {"qty_produced":10,"growth_time":60,"fertalizer":[["Spato",1]]},
	"Glowberry": {"qty_produced":100,"growth_time":96,"fertalizer":[["Big Flower",1]]},
	"Weird Cactus": {"qty_produced":30,"growth_time":192,"fertalizer":[["Thornato",1],["Big Flower",1]]},
	"Mushroom":{"qty_produced":60,"growth_time":400,"fertalizer":[["Glowberry",1],["Spato",1]]},
	"Moonusvie" :{"qty_produced":80,"growth_time":480,"fertalizer":[["Weird Cactus",1],["Mushroom",1]]}
}

var plant_products = {
	"Spato":{"sell_price":5,"buy_price":10,"storage":50},
	"Big Flower":{"sell_price":11,"buy_price":22,"storage":10},
	"Thornato":{"sell_price":50,"buy_price":100,"storage":0},
	"Glowberry":{"sell_price":12,"buy_price":24,"storage":0},
	"Weird Cactus":{"sell_price":60,"buy_price":120,"storage":0},
	"Mushroom":{"sell_price":80,"buy_price":160,"storage":0},
	"Moonusvie":{"sell_price":50,"buy_price":100,"storage":0},
}
