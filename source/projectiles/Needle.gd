extends Area2D

const SPEED = 250
var velocity = Vector2()
var direction = 1

func _physics_process(delta):
	translate(SPEED * delta * direction)
	pass
	
func set_needle_direction(bullet_direction):
	direction = bullet_direction

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func _on_Needle_body_entered(body):
	if body is Enemy:
		body.hurt()
	queue_free()