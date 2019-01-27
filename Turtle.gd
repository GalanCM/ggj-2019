extends Node2D

var activated := false
onready var played = false

func _physics_process(delta: float) -> void:
	if not activated:
		var player = get_tree().get_nodes_in_group("Player")[0]
		if $Start.overlaps_body(player):
			activated = true
			if not $TurtleSound.playing and not played:
				played = true
				$TurtleSound.play()
			$MovementPlayer.play("Walk")
			player.sit()
			
func fade_out():
	var camera = get_tree().get_nodes_in_group("Camera")
	if camera.size() > 0:
		camera = camera[0]
		camera.fade_out()