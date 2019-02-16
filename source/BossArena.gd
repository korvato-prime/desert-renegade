extends Node2D

func _on_Pyromaniac_death():
	get_tree().change_scene(Global.Ending)
