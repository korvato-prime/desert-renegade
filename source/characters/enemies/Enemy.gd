class_name Enemy extends KinematicBody2D

var motion = Vector2(0, 0)

export(int) var health = 3
export(int) var speed = 100
export(int) var vision = 180
export(int) var attack_range = 80
export(int) var shoot_timeout = 1

onready var anim = $AnimationPlayer
onready var shoot_timer = $ShootTimer

func _ready():
	shoot_timer.wait_time = shoot_timeout

func _process(delta):
	update()
	
	if is_player_in_radius(attack_range):
		shoot()
	
	elif is_player_in_radius(vision):
		move_to_player(delta)

func _draw():
	draw_circle(to_local(global_position), attack_range, Color("20ff0000"))
	draw_circle(to_local(global_position), vision, Color("200000ff"))

func hurt():
	health -= 1
	anim.play("hurt")
	if health == 0:
		queue_free()

func move_to_player(delta):
	var direction = (Global.Player.global_position - global_position).normalized()
	move_and_slide(direction * Vector2(speed, speed))

func shoot():
	
	if shoot_timer.is_stopped():
		var bottle = Global.Bottle.instance()
		
		get_parent().add_child(bottle)
		bottle.initialize(global_position, Global.Player.global_position)
		bottle.fire()
		shoot_timer.start()

func is_player_in_radius(radius):
	
	if not Global.Player:
		return false
	
	return (Global.Player.global_position - global_position).length() < radius