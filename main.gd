extends Node2D

@export var timer: Timer

var time_of_day = 0
var dayLength = 12

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_plant_time(time) -> void:
	for i in range($pots.get_child_count()):
		for j in range(time):
			var pot = $pots.get_child(i)
			if pot.get_child_count() > 3:
				if pot.water_left > 0:
					var fertalizers = pot.get_child(2).get_child(5)
					for f in range(fertalizers.get_child_count()):
						print(fertalizers.get_child(f).active)
						if fertalizers.get_child(f).active == true:
							print("AHSAgh")
							if Global.plant_products[fertalizers.get_child(f).plant_key]["storage"] >= fertalizers.get_child(f).quantity_per_hour:
								Global.plant_products[fertalizers.get_child(f).plant_key]["storage"] -= fertalizers.get_child(f).quantity_per_hour
							else:
								pot.deactivateFertilizer(f)
								
					pot.get_child(3).time_passed(1)
					pot.water_left -= 1
				else:
					break
				
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
	
