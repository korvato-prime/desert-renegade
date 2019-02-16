extends Node2D

# References
var Player = null

# Scenes
var Main = "res://source/interface/Main.tscn"
var Intro = "res://source/interface/Intro.tscn"
var Ending = "res://source/interface/Ending.tscn"
var Level1 = "res://source/Level1.tscn"
var Level2 = "res://source/Level2.tscn"
var Level3 = "res://source/BossArena.tscn"


# Projectiles
var Needle = preload("res://source/projectiles/Needle.tscn")

var Flame = preload("res://source/projectiles/Flame.tscn")

var Bottle = preload("res://source/projectiles/Bottle.tscn")
var Bullet = preload("res://source/projectiles/Bullet.tscn")
var Brush = preload("res://source/projectiles/Brush.tscn")
var Glass = preload("res://source/projectiles/Glass.tscn")
var Knife = preload("res://source/projectiles/Knife.tscn")
var MysteryBullet = preload("res://source/projectiles/MysteryBullet.tscn")

var Fire = preload("res://source/items/Fire.tscn")

# Resources
var tex_inmate1 = preload("res://graphics/images/enemies/inmate.png")
var tex_inmate2 = preload("res://graphics/images/enemies/inmate02.png")

# Global.tscn

var next_scene = null

onready var anim = $AnimationPlayer

func change_scene(scene):
	next_scene = scene
	anim.play("fade_out")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_out":
		get_tree().change_scene(next_scene)
		anim.play("fade_in")
		next_scene = null
