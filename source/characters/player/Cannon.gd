extends Node2D

var mouse_position

var can_shoot = false
var flip = false

const NEEDLE = preload("res://source/characters/player/Needle.tscn")

func _process(delta):
	_aim_gun()
	_shoot(delta)
	
func _shoot(delta):
	if Input.is_action_pressed("fire") and can_shoot:
		can_shoot = false
		$GunTimer.start()
		#$Shoot.play()
		var dir = ($GunPoint.global_transform.origin - global_transform.origin).normalized()
		#player.emit_signal('shoot', Bullet, $ShootPoint.global_position, dir)
		var needle = NEEDLE.instance()
		needle.global_position = $GunPoint.position
		if sign($GunPoint.position.x) == 1:
			needle.set_needle_direction(1)
		else:
			needle.set_needle_direction(-1)
		#"get_node("Game").add_child(needle)
		self.add_child(needle)
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