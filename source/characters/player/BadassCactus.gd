extends KinematicBody2D

# Member variables
const MOTION_SPEED = 160 # Pixels/second

var directions = ["right", "down_right", "down", "down_left", "left", "up_left", "up", "up_right"]
var facing = Vector2()

var have_card = false

var health setget _set_health

export(int) var max_health = 12

onready var audio = $AudioStreamPlayer
onready var anim = $AnimationPlayer

onready var life_bar = $HUD/LifeBar
onready var keycard = $HUD/Keycard

func _ready():
	Global.Player = self
	_set_health(max_health)

func _physics_process(delta):
	var move_direction = Vector2()
	var motion = Vector2()	
	
	var LEFT = Input.is_action_pressed("a")
	var RIGHT = Input.is_action_pressed("d")
	var UP = Input.is_action_pressed("w")
	var DOWN = Input.is_action_pressed("s")
	
	move_direction.x = int(RIGHT) - int(LEFT)
	move_direction.y = int(DOWN) - int(UP)
	
	var animation = "idle"
	
	if LEFT || RIGHT || UP || DOWN:
		facing = move_direction
		animation = direction2str(facing)
#	else:
#		animation = "idle"
	
	if $Sprite.animation != "Idle":
		$Sprite.play(animation)
		
	if Input.is_action_pressed("w"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("s"):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("a"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("d"):
		motion += Vector2(1, 0)

	motion = motion.normalized() * MOTION_SPEED
	move_and_slide(motion)

func direction2str(direction):
    var angle = direction.angle()
    if angle < 0:
        angle += 2 * PI
    var index = round(angle / PI * 4)
    return directions[index]

func play_sfx(sfx_name):
	if not audio.is_playing():
		var sfx = Audio.get_random_sfx(sfx_name)
		if sfx != audio.stream:
			audio.stream = sfx
			audio.play()

func heal(value):
	_set_health(health + value)
	anim.play("heal")

func hurt():
	_set_health(health - 1)
	if health <= 0:
		get_tree().reload_current_scene()
		play_sfx("enemy_die")
	else:
		anim.play("hurt")
		play_sfx("enemy_hurt")

func _set_health(value):
	health = value
	if health > 12:
		health = 12
	life_bar.value = health
	
func add_keycard():
	keycard.visible = true
	have_card = true
	
func remove_keycard():
	keycard.visible = false
	have_card = false