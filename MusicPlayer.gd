extends Node

func switch():
	$"Lack Thereof/Tween".interpolate_method($"Lack Thereof", "set_volume_db", $"Lack Thereof".volume_db, -80, 5, Tween.TRANS_LINEAR, Tween.TRANS_SINE)
	$Thereof/Tween.interpolate_method($Thereof, "set_volume_db", $Thereof.volume_db, -5, 3, Tween.EASE_IN_OUT, Tween.TRANS_LINEAR)
	$"Lack Thereof/Tween".start()
	$Thereof/Tween.start()