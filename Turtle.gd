extends Node2D

var activated := false

func _physics_process(delta: float) -> void:
	if not activated:
		var collision = $Shell.move_and_collide(Vector2(0,0))
		if collision and collision.collider is Player:
			activated = true
			$MovementPlayer.play("Walk")