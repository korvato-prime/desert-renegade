extends Projectile

onready var sprite = $Sprite

func _ready():
	randomize()

func _process(delta):
	sprite.scale += Vector2(delta * 4, delta * 4)
	spawn_fire()

func spawn_fire():
	if randf() < 0.01:
		var fire = Global.Fire.instance()
		get_parent().add_child(fire)
		fire.global_position = global_position

func initialize(position, destination):
	self.global_position = position
	self.direction = (destination - global_position).normalized()

