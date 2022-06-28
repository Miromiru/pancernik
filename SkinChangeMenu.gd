extends Node2D

onready var file = "res://save_points.txt"
export(int) var money

func _ready():
	$HUD/MainMenu.visible = false
	$HUD/ScoreLabel.visible = false
	$HUD/ChangeSkinMenu.visible = true
	load_file(file)
	pass


func load_file(file):
	var f = File.new()
	f.open(file, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		line += " "
		index += 1
		$HUD/ChangeSkinMenu/PointsSum.text = str(line)
		money = int(line)
	f.close()
	return



func _on_HUD_kupione50():
	money = int(money) - 50
	addPoints(money)
	load_file(file)
	
	
func addPoints(money):
	var file = File.new()
	file.open("res://save_points.txt", File.WRITE)
	file.store_string(str(money))
	file.close()
