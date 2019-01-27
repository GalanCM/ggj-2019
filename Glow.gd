extends Sprite

func _process(delta: float) -> void:
	var player = get_tree().get_nodes_in_group("Player")
	if player.size() == 0:
		return
	player = player[0]
	
	var distance = global_position.distance_to(player.global_position)
	
	modulate.a = ( 1 - (distance / 1000) ) * 0.2