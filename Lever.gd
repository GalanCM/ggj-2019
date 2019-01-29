extends KinematicBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.

onready var start_position = global_position

func _physics_process(delta):
	var collider = move_and_collide(Vector2(0,0))
	
	global_position = start_position
	
	if (collider != null and collider.collider is Player):
		var relative_X = (collider.position-global_position)[0]
		if not $LeverPlayer.playing:
			$LeverPlayer.play()
		
		rotation_degrees = clamp(rotation_degrees+(relative_X*delta * 0.4),-20,20)
	elif $LeverPlayer.playing:
		$LeverPlayer.stop()