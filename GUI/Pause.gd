extends Control

const sensitivity_text = "Mouse Sensitivity: %.2f"
const music_volume_text = "Music Volume: %d"
const sound_volume_text = "Sound Volume: %d"

func _ready():
	pass
#  $VBoxContainer/MusicVolumeLabel.text = music_volume_text % Configuration.get_value("audio", "music_volume")
#  $VBoxContainer/MusicVolumeSlider.value = Configuration.get_value("audio", "music_volume")

func pause():
	get_tree().paused = not get_tree().paused
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
