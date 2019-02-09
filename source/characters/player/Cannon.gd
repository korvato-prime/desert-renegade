extends Node2D

var mouse_position

var can_shoot = false
var flip = false

const NEEDLE = preload("res://source/characters/player/Needle.tscn")

const SPEED = 100
var bullet_direction = Vector2()

func _process(delta):
	_aim_gun()
	_shoot(delta)
	
func _shoot(delta):
	if Input.is_action_pressed("fire") and can_shoot:
		can_shoot = false
		$GunTimer.start()
		var needle = NEEDLE.instance()
		needle.global_position = $GunPoint.global_position
		bullet_direction = ($GunPoint.global_transform.origin - global_transform.origin).normalized()
		needle.set_needle_direction(bullet_direction)
		get_parent().get_parent().add_child(needle)
		needle.rotation = self.rotation

func _aim_gun():
#	mouse_position = get_local_mouse_position()
#	rotation +=  mouse_position.angle()*0.1
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

	if mouse_pos.x > global_position.x:
		$ArmSprite.flip_v = false
		flip = false
	elif mouse_pos.x < global_position.x:
		$ArmSprite.flip_v = true
		flip = true

func _on_GunTimer_timeout():
	can_shoot = true