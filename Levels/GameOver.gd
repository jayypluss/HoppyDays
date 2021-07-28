extends Control

func _on_RectangleButton_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")

func _input(event):
	if event.is_action_pressed('Jump') or event.is_action_pressed('Ok'):
		get_tree().change_scene("res://Levels/Level1.tscn")
	
