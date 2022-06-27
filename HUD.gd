extends CanvasLayer

func update_score(score):
	$ScoreLabel.text = str(score)


func _on_WyjdDotyk_pressed():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)


func _on_ZmieKolorDotyk_pressed():
	pass # Replace with function body.


func _on_NowaGraDotyk_pressed():
	get_tree().change_scene("res://Main.tscn")
