extends StaticBody2D

func _ready() -> void:
	$Area2D.connect("body_entered", self, "bounce")
	
func _physics_process(delta: float) -> void:
	var player = get_tree().get_nodes_in_group("Player")
	if player.size() == 0:
		return
	player = player[0]
	
	if $Area2D.overlaps_body(player):
		$AnimatedSprite.play("squish")
		yield( $AnimatedSprite, "animation_finished")
		$AnimatedSprite.play("default")
	
func bounce(body):
	if (body is Player and body.global_position.y < global_position.y):
		body.jumping = true
		body.velocity.y *= -1.5 #-450
		
