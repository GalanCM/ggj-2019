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
	
	if $Area2D.overlaps_body(player):
		$AnimatedSprite.play("squish")
		yield( $AnimatedSprite, "animation_finished")
		$AnimatedSprite.play("default")
	
func bounce(body):
	if (body is Player):
		emit_signal("player_bounce")

		if rotation == 0 and body.global_position.y < global_position.y-20:
			body.velocity.y = min(body.velocity.y * -1.5, -50)
			body.jumping = true
		elif body.global_position.y > global_position.y+20:
			body.velocity.y = max(body.velocity.y * -1.5, 300)
#			print(body.velocity.reflect(Vector2(0,-1).rotated(rotation) ) * 10)
#			body.velocity = body.velocity.reflect( Vector2(0,-1).rotated(-rotation) ) * 1
