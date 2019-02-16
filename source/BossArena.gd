extends Node2D

func _on_Pyromaniac_death():
	Global.change_scene(Global.Ending)
