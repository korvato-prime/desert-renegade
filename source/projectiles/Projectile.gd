extends Area2D

var direction = null
var fire = false

export(float) var lifetime = 2
export(int) var speed = 200
export(bool) var rotate = false

onready var life_timer = $LifeTimer
	
func _ready():
	life_timer.wait_time = lifetime
	life_timer.start()

func _process(delta):
	if fire and rotate:
		rotation_degrees = int(rotation_degrees + delta * 400) % 360

func _physics_process(delta):
	if fire:
		global_position += direction * speed * delta

func initialize(position, destination):
	self.global_position = position
	self.direction = (destination - global_position).normalized()
	look_at(destination)

func fire():
	fire = true

func _on_Bottle_body_entered(body):
	if Global.Player and body == Global.Player:
		print(body.name)
		queue_free()
	else:
		print(body.name)
		queue_free()

func _on_LifeTimer_timeout():
	queue_free()
