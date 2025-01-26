extends Node2D

@export var timer: Timer

var time_of_day = 0
var dayLength = 13

var oxygen_sell = 1

var end_screen = preload("res://end_screen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$UI/money.text = "£"+str(Global.money)

func add_plant_time(time) -> void:
	for i in range($pots.get_child_count()):
		for j in range(time):
			var pot = $pots.get_child(i)
			if pot.get_child_count() > 3:
				if pot.water_left > 0 and pot.get_child(3).hours_left > 0:
					if pot.tree == true:
						Global.money += oxygen_sell
					var fertalizers = pot.get_child(2).get_child(5)
					for f in range(fertalizers.get_child_count()):
						if fertalizers.get_child(f).active == true:
							if Global.plant_products[fertalizers.get_child(f).plant_key]["storage"] >= fertalizers.get_child(f).quantity_per_hour:
								Global.plant_products[fertalizers.get_child(f).plant_key]["storage"] -= fertalizers.get_child(f).quantity_per_hour
							else:
								pot.deactivateFertilizer(f)
								
					pot.get_child(3).time_passed(1)
					pot.water_left -= 1
				else:
					break
				animationUpdate(pot)
				
func _on_hour_timeout() -> void:
	add_plant_time(1)
	$UI/time.text = "[center]"+str(time_of_day + 10)+":00"
	time_of_day += 1
	if time_of_day != dayLength:
		timer.start()
		
func sleep() -> void:
	time_of_day = 0
	$UI/time.text = "[center]"+str(time_of_day + 10)+":00"
	add_plant_time(12)
	timer.start()
	
func animationUpdate(current_pot) -> void:
	if current_pot.tree == true:
		var progress = float(current_pot.get_child(3).hours_left) / float(Global.plants["Tree"]["growth_time"])
		if current_pot.get_child(3).hours_left <= 0:
			current_pot.get_child(3).hours_left = 0
			current_pot.get_child(1).frame = 5
			win()
		elif progress < 0.166:
			current_pot.get_child(1).frame = 4
			oxygen_sell = 10
		elif progress < 0.333:
			current_pot.get_child(1).frame = 3
			oxygen_sell = 6
		elif progress < 0.499:
			current_pot.get_child(1).frame = 2
			oxygen_sell = 4
		elif progress < 0.666:
			current_pot.get_child(1).frame = 1
			oxygen_sell = 2
		else:
			current_pot.get_child(1).frame = 0
			oxygen_sell = 1
	else:
		var progress = float(current_pot.get_child(3).hours_left) / float(Global.plants[current_pot.get_child(3).plant_key]["growth_time"])
		if current_pot.get_child(3).hours_left <= 0:
			current_pot.get_child(3).hours_left = 0
			current_pot.get_child(3).sprite.frame = 2
		elif progress < 0.5:
			current_pot.get_child(3).sprite.frame = 1
		else:
			current_pot.get_child(3).sprite.frame = 0
func win():
	get_tree().change_scene_to_packed(end_screen)
	
