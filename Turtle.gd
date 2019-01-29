extends Node2D

var activated := false

func _physics_process(delta: float) -> void:
	if not activated:
		var player = get_tree().get_nodes_in_group("Player")[0]
		if $Start.overlaps_body(player):
			activated = true
			$MovementPlayer.play("Walk")
			player.sit()
			
			$TurtlePlayer.play()
			
func fade_out():
	var camera = get_tree().get_nodes_in_group("Camera")
	if camera.size() > 0:
		camera = camera[0]
		camera.fade_out()