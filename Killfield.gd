extends Area2D

func _ready() -> void:
	connect("body_entered", self, "kill")
	
func kill(body):
	if body is preload("res://Player.gd"):
		body.respawn()
