extends KinematicBody2D

# Member variables
const MOTION_SPEED = 160 # Pixels/second

func _ready():
	Global.Player = self
	
var directions = ["right", "down_right", "down", "down_left", "left", "up_left", "up", "up_right"]
var facing = Vector2()

var have_card = false

#func _physics_process(delta):
#	var motion = Vector2()
	
#	if Input.is_action_pressed("w"):
#		motion += Vector2(0, -1)
#		$Sprite.play("up")
#	if Input.is_action_pressed("a") and Input.is_action_pressed("w"):
#		$Sprite.play("up_left")
#	if Input.is_action_pressed("s"):
#		motion += Vector2(0, 1)
#		$Sprite.play("down")
#	if Input.is_action_pressed("a"):
#		motion += Vector2(-1, 0)
#		$Sprite.play("left")
#	if Input.is_action_pressed("d"):
#		motion += Vector2(1, 0)
#		$Sprite.play("right")
#	motion = motion.normalized() * MOTION_SPEED

#	move_and_slide(motion)

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

func _on_Level_exit_body_entered(body):
	if have_card:
		get_tree().change_scene("res://source/Level2.tscn")

func _on_Area2D_body_entered(body):
	have_card = true
	$Keycard2.visible = true
	get_parent().get_node("Keycard").visible = false

func _on_Glitch_body_entered(body):
	get_parent().get_node("CanvasLayer/ParallaxBackground/TextureRect").visible = true
	get_parent().get_node("AudioStreamPlayer").playing = false 

func _on_Glitch_area_entered(area):
	get_parent().get_node("CanvasLayer/ParallaxBackground/TextureRect").visible = true
	get_parent().get_node("AudioStreamPlayer").playing = false 

func _on_survivepop_body_entered(body):
	get_parent().get_node("CanvasLayer2/Control/TextureRect").visible = true
	get_parent().get_node("survivepop").queue_free()
	get_parent().get_node("Timer").start()
	
