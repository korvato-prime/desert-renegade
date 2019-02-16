extends KinematicBody2D

# Member variables
const MOTION_SPEED = 160 # Pixels/second

var directions = ["right", "down_right", "down", "down_left", "left", "up_left", "up", "up_right"]
var facing = Vector2()

var have_card = false

onready var health_label = $HUD/Health
onready var keycard = $HUD/Keycard

func _ready():
	Global.Player = self

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

func add_keycard():
	keycard.visible = true
	have_card = true
	
func remove_keycard():
	keycard.visible = false
	have_card = false