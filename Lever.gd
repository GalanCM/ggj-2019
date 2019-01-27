extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.

onready var start_position = $Platform.global_position
onready var played = false

func _physics_process(delta):
	var collider = $Platform.move_and_collide(Vector2(0,0))
	
	$Platform.global_position = start_position
	
	if (collider != null and collider.collider is Player):
		var relative_X = (collider.position-$Platform.global_position)[0]
		
		$Platform.rotation_degrees = clamp($Platform.rotation_degrees+(relative_X*delta * 0.4),-20,20)
		
		if not $LeverSound.playing and not played:
			$LeverSound.play()
			played = true