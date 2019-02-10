extends KinematicBody2D

# Member variables
const MOTION_SPEED = 160 # Pixels/second

func _ready():
	Global.Player = self

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("w"):
		motion += Vector2(0, -1)
		$Sprite.play("up_right")
	if Input.is_action_pressed("s"):
		motion += Vector2(0, 1)
		$Sprite.play("down_left")
	if Input.is_action_pressed("a"):
		motion += Vector2(-1, 0)
		$Sprite.play("up_left")
	if Input.is_action_pressed("d"):
		motion += Vector2(1, 0)
		$Sprite.play("down_right")
	
	motion = motion.normalized() * MOTION_SPEED

	move_and_slide(motion)
