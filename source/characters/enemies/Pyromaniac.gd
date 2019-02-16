extends Enemy

func _ready():
	tex_dead = Global.tex_pyromaniac_dead

func shoot():
	
	if shoot_timer.is_stopped() and reload_timer.is_stopped():
		var projectile = Global.Flame.instance()
		play_anim("shoot")
		get_parent().add_child(projectile)
		projectile.initialize(global_position, Global.Player.global_position)
		projectile.fire()
		shoot_timer.start()
		if clip_size <= 1:
			reload_timer.start()
		else:
			clip_size -= 1