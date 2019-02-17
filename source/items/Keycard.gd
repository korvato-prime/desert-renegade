extends Area2D

func _on_Keycard_body_entered(body):
	if body == Global.Player:
		Global.play_pickup()
		body.add_keycard()
		queue_free()
