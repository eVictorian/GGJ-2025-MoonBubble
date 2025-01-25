extends Node2D

var water_left = 2
var max_water = 6
var wattering_progress = 0
var wattering_frame_speed = 250
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Panel.visible:
		if $Panel/time_left.visible:
			if get_child(3).days_left() == 0:
				$Panel/time_left.text = str(get_child(3).hours_left)+"Hs"
			else:
				$Panel/time_left.text = str(get_child(3).days_left())+"Ds"
				
		$Panel/water_time.text = str(water_left)+"Hs"
		
		if Input.is_action_pressed("interact"):
			print(wattering_progress)
			if wattering_progress >= 100:
				if water_left < max_water:
					water_left += 1
				wattering_progress = 0
			elif water_left < max_water:
				wattering_progress += wattering_frame_speed*delta
		
		if get_child_count() < 4:
			$Panel/Button.text = "Plant"
		elif get_child(3).hours_left > 0:
			$Panel/Button.text = "Cut"
		else:
			$Panel/Button.text = "Harvest"
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		$Panel.visible = true
		if get_child_count() > 3:
			$Panel/time_left.visible = true
			$Panel/fertilize_menu.visible = true
		else:
			$Panel/time_left.visible = false
			$Panel/fertilize_menu.visible = false
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "player":
		$Panel.visible = false
		$Panel/seeding_menu.visible = false
 	

func _on_button_pressed() -> void:
	if get_child_count() < 4:
		if $Panel/seeding_menu.visible == false:
			$Panel/seeding_menu.visible = true
		else:
			$Panel/seeding_menu.visible = false
	elif get_child(3).hours_left > 0:
		Global.plant_products[get_child(3).plant_key]["storage"] += 1
		get_child(3).queue_free()
	else:
		Global.plant_products[get_child(3).plant_key]["storage"] += Global.plants[get_child(3).plant_key]["qty_produced"]
		get_child(3).queue_free()
func new_plant(plant_scene: PackedScene) -> void:
	var new_plant = plant_scene.instantiate()
	add_child(new_plant)
	
