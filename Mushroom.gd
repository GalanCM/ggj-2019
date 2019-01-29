extends StaticBody2D
class_name Mushroom

signal player_bounce

func _ready() -> void:
	$Area2D.connect("body_entered", self, "bounce")
	
func _physics_process(delta: float) -> void:
	var player = get_tree().get_nodes_in_group("Player")
	if player.size() == 0:
		return
	player = player[0]
	
func bounce(body):
	if (body is Player):
		emit_signal("player_bounce")
		$BouncePlayer.play()

		if rotation == 0 and body.global_position.y < global_position.y-20:
			body.velocity.y = min(body.velocity.y * -1.5, -50)
			body.jumping = true
		elif body.global_position.y > global_position.y+20:
			body.velocity.y = max(body.velocity.y * -1.5, 300)
			
		$AnimatedSprite.play("squish")
		yield( $AnimatedSprite, "animation_finished")
		$AnimatedSprite.play("default")