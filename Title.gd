extends Node2D

var started = false

func _input(event: InputEvent) -> void:
	if not started and (event.is_action_pressed("Left") or event.is_action_pressed("Right") or event.is_action_pressed("Jump")):
		$AnimationPlayer.play("FadeOut")
		started = true
	
