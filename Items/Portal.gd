extends Node2D

var skipping_level = false

func _on_Area2D_body_entered(body: KinematicBody2D):
	skipping_level = true
	body.stop()
	$Area2D/Particles2D.process_material.orbit_velocity = 1
	#get_tree().call_group('Gamestate', "win_game")
	$Timer.stop()
	$Timer.start()
	$PortalSoundEffect.play()
	body.enterPortalAnimation(self)

func _on_Area2D_body_exited(body):
	$Area2D/Particles2D.process_material.orbit_velocity = 0.25
	skipping_level = false

func _on_Timer_timeout():
	if skipping_level:
		get_tree().call_group('Gamestate', "win_game")
	
