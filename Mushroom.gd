extends StaticBody2D

func _ready() -> void:
	$Area2D.connect("body_entered", self, "bounce")
	
func bounce(body):
	if (body is Player and body.global_position.y < global_position.y):
		body.jumping = true
		body.velocity.y = -450
		
