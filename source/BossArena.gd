extends Node2D

func _ready():
	Global.looper.play_set(Global.looper.boss)

func _on_Pyromaniac_death():
	Global.change_scene(Global.Ending)
