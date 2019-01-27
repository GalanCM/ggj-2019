extends Camera2D

func zoom_to(new_zoom):
	var target_zoom := Vector2(new_zoom, new_zoom)
	zoom = target_zoom

	$ZoomTween.remove_all()
	$ZoomTween.interpolate_method(self, "set_zoom", get_zoom(), target_zoom, 0.2, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	$ZoomTween.start()