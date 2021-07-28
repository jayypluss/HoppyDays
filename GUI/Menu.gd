extends ColorRect

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func pause():
	get_tree().paused = not get_tree().paused
	$Pause.visible = get_tree().paused
	visible = get_tree().paused
	if visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event.is_action_pressed("Pause"):
		pause()

func _on_ResumeButton_pressed():
	pause()


func _on_CreditsButton_pressed():
	$Credits.visible = not $Credits.visible


func _on_CloseCreditsButton_pressed():
	_on_CreditsButton_pressed()
