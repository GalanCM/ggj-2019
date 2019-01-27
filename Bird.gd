extends Node2D

var player_parent = null
var spawn_area_enter_count = 0

func _ready() -> void:
	hide()
	$CutscenePlayer.play("Carry")
	$CutscenePlayer.stop()

	$SpawnArea.connect("body_entered", self, "spawn")
	$Area2D.connect("body_entered", self, "trigger")
	
func spawn(body) -> void:
	if body is Player:
		if spawn_area_enter_count == 1:
			
			yield($SpawnArea, "body_exited")
			show()
		else:
			spawn_area_enter_count += 1
			
#		if spawn_area_enter_count == 1:
#			var camera = get_tree().get_nodes_in_group("Camera")
#			if camera.size() > 0:
#				camera[0].zoom_to(0.5)
			
	
func trigger(body):
	if visible and body is Player and body.is_physics_processing() == true:
		(body as Node).set_physics_process(false)
		$CutscenePlayer.play("Carry")

func grab_player():
	var player = get_tree().get_nodes_in_group("Player")
	if player.size() == 0:
		return
	player = player[0]
	
	
	player_parent = player.get_parent()
	
	var player_transform = player.global_transform
	player_parent.remove_child(player)
	$AnimatedSprite.add_child(player)
	player.global_transform = player_transform
	player.hide()
	
#	yield(get_tree().create_timer(0.1), "timeout")
#	var camera = get_tree().get_nodes_in_group("Camera")
#	if camera.size() > 0:
#		camera[0].zoom_to(1.2)
	
func release_player():
	var player = get_tree().get_nodes_in_group("Player")
	if player.size() == 0:
		return
	player = player[0]
#
#	var camera = get_tree().get_nodes_in_group("Camera")
#	if camera.size() > 0:
#		camera[0].zoom_to(1.2)
	
	var player_transform = player.global_transform
	$AnimatedSprite.remove_child(player)
	player_parent.add_child(player)
	player.global_transform = player_transform
	player.show()
	
	player.set_physics_process(true)
