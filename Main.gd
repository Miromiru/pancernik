extends Node2D
export (PackedScene) var Cloud_scene
export (PackedScene) var Cactus_scene
var score = 0
var cactus_timer = 0.0
onready var file = "res://save_game.txt"

func _ready():
	$HUD/MainMenu.visible = false
	randomize()
	$StartTimer.start()
	pass 
	
var game_over = false


func _on_StartTimer_timeout():
	$CloudTimer.start()
	$ScoreTimer.start()


func _process(delta):
	cactus_timer =+ cactus_timer + delta
	if cactus_timer > 4.0:
		cactus_timer = 0.0
	
	var random_cactus_timer = rand_range(1.5,4.0)
	if cactus_timer > random_cactus_timer and game_over == false:
		var cactus = Cactus_scene.instance()
		
		var cactus_spawn_location = get_node("CactusPath/CactusSpawnLocation")
		cactus_spawn_location.offset = 0
		
		var direction = cactus_spawn_location.rotation
		
		cactus.position = cactus_spawn_location.position
		
		var velocity = Vector2(-270.0, 0.0)
		cactus.linear_velocity = velocity.rotated(direction)
		
		add_child(cactus)
		cactus_timer = 0.0


func _on_CloudTimer_timeout():
	var cloud = Cloud_scene.instance()

	var cloud_spawn_location = get_node("CloudPath/CloudSpawnLocation")
	cloud_spawn_location.offset = randi()

	var direction = cloud_spawn_location.rotation + PI / 2

	cloud.position = cloud_spawn_location.position

	var velocity = Vector2(rand_range(150.0, 250.0), 0.0)
	cloud.linear_velocity = velocity.rotated(direction)

	add_child(cloud)
	if game_over == true:
		$CloudTimer.stop()


func _on_ScoreTimer_timeout():
	score += 1
	$HUD.update_score(score)
	if game_over == true:
		$ScoreTimer.stop()
		load_file(file)
	

func _on_Pancernik_hit():
	game_over = true
	$KoniecGryInfo.visible = true
	
	
func save(score):
	var file = File.new()
	file.open("res://save_game.txt", File.WRITE)
	file.store_string(str(score))
	file.close()
	print("dupa")

func load_file(file):
	var f = File.new()
	f.open(file, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		line += " "
		print(line + str(index))
		index += 1
		if line as int < score:
			save(score)
			print("kupa")
	f.close()
	return
