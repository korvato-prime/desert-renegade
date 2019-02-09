extends Area2D

var direction = null
var speed = 200

var fire = false

func _process(delta):
	if fire:
		rotation_degrees = int(rotation_degrees + delta * 400) % 360

func _physics_process(delta):
	if fire:
		global_position += direction * speed * delta

func initialize(position, destination):
	self.global_position = position
	self.direction = (destination - global_position).normalized()

func fire():
	fire = true

func _on_Bottle_body_entered(body):
	if Global.Player and body == Global.Player:
		print(body.name)
		queue_free()
	else:
		print(body.name)
		queue_free()
