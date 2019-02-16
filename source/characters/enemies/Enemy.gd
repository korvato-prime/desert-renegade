class_name Enemy extends KinematicBody2D

var motion = Vector2(0, 0)
var clip_size = 1

export(int) var health = 3
export(int) var speed = 100
export(int) var vision = 180
export(int) var attack_range = 80
export(int) var max_clip_size = 1
export(float) var shoot_time = 1
export(float) var reload_time = 1

onready var anim = $AnimationPlayer
onready var anim_sprite = $AnimatedSprite
onready var shoot_timer = $ShootTimer
onready var reload_timer = $ReloadTimer

signal death

func _ready():
	shoot_timer.wait_time = shoot_time
	reload_timer.wait_time = reload_time

func _process(delta):
	update()
	
	if is_player_in_radius(attack_range):
		shoot()
	elif is_player_in_radius(vision):
		play_anim("walk")
		move_to_player(delta)
	else:
		play_anim("idle")

func _draw():
	draw_circle(to_local(global_position), attack_range, Color("20ff0000"))
	draw_circle(to_local(global_position), vision, Color("200000ff"))
	
func hurt():
	health -= 1
	anim.play("hurt")
	if health == 0:
		queue_free()
		emit_signal("death")

func move_to_player(delta):
	var direction = (Global.Player.global_position - global_position).normalized()
	move_and_slide(direction * Vector2(speed, speed))

func shoot():
	print("Overwrite!")

func is_player_in_radius(radius):
	
	if not Global.Player:
		return false
	
	return (Global.Player.global_position - global_position).length() < radius

func play_anim(anim_name):
	if anim_sprite.animation != anim_name:
		anim_sprite.play(anim_name)

func _on_ReloadTimer_timeout():
	clip_size = max_clip_size

func _on_AnimatedSprite_animation_finished():
	play_anim("idle")
