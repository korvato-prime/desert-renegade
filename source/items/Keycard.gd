extends Area2D

func _on_Keycard_body_entered(body):
	if body == Global.Player:
		body.add_keycard()
		queue_free()
