extends Control

func _on_RectangleButton_pressed():
	get_tree().change_scene("res://Levels/Level0.tscn")

func _input(event):
	if event.is_action_pressed('space') or event.is_action_pressed('enter'):
		get_tree().change_scene("res://Levels/Level0.tscn")
	
