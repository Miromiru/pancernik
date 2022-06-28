extends Node

onready var file = "res://save_game.txt"

func _ready():
	preload("res://Main.tscn")
	preload("res://Pancernik.tscn")
	$HUD/ScoreLabel.visible = false
	$HUD/ChangeSkinMenu.visible = false
	$HUD/MainMenu.visible = true
	load_file()	


func load_file():
	var f = File.new()
	f.open(file, File.READ)
	var index = 1
	while not f.eof_reached(): # iterate through all lines until the end of file is reached
		var line = f.get_line()
		line += " "
		$HUD/MainMenu/BestScore.text = str(line)
		index += 1
	f.close()
	return
