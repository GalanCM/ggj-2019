extends Mushroom

var bounce_count = 0

func _ready() -> void:
	connect("player_bounce", self, "bird_spawn")

