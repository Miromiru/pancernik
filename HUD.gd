extends CanvasLayer
export(int) var Points_To_Sum
signal kupione50

func _ready():
	preload("res://Pancernik.tscn")

func update_score(score):
	$ScoreLabel.text = str(score)
	

func _on_WyjdDotyk_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)


func _on_ZmieKolorDotyk_pressed():
	get_tree().change_scene("res://SkinChangeMenu.tscn")


func _on_NowaGraDotyk_pressed():
	get_tree().change_scene("res://Main.tscn")


func _on_PowrtDoMenu_pressed():
	get_tree().change_scene("res://StartMenu.tscn")


func _on_50Pancernik_pressed():
	emit_signal("kupione50")
