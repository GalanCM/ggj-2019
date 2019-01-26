extends KinematicBody2D

var jumping := false
var velocity := Vector2()

func _physics_process(delta: float) -> void:
	var acceleration := Vector2()

	# determine acceleration for this frame
	if Input.is_action_pressed("Left"):
		acceleration.x -= 20
	if Input.is_action_pressed("Right"):
		acceleration.x += 20
	
	# apply friction if there is no input
	if acceleration.x == 0:
		if velocity.x > 0:
			velocity.x = max(velocity.x - 20, 0)
		if velocity.x < 0:
			velocity.x = min(velocity.x + 20, 0)
	
	# apply acceleration if there is input
	else:
		velocity.x = clamp(velocity.x + acceleration.x, -200, + 200)
		
	# apply jump
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		jumping = true
		velocity.y = -240
	elif Input.is_action_pressed("Jump") and jumping:
		velocity.y -= 4

	# apply gravity
	velocity.y = min(velocity.y + 8, 300)
	if velocity.y > 100:
		jumping = false
	
	if not jumping:
		move_and_slide_with_snap(velocity, Vector2(0,5), Vector2(0,-1))
	else:
		move_and_slide(velocity, Vector2(0,-1))