extends Node

var sfx = {
	enemy_die = [
		preload("res://audio/sfx/Enemies_Dying_1.wav"),
		preload("res://audio/sfx/Enemies_Dying_2.wav"),
		preload("res://audio/sfx/Enemies_Dying_3.wav")
	],
	enemy_hurt = [
		preload("res://audio/sfx/Enemies_Hurt_1.wav"),
		preload("res://audio/sfx/Enemies_Hurt_2.wav"),
		preload("res://audio/sfx/Enemies_Hurt_3.wav"),
		preload("res://audio/sfx/Enemies_Hurt_4.wav"),
	],
	enemy_throw = [
		preload("res://audio/sfx/Enemies_Throwing_1.wav"),
		preload("res://audio/sfx/Enemies_Throwing_2.wav"),
		preload("res://audio/sfx/Enemies_Throwing_3.wav"),
		preload("res://audio/sfx/Enemies_Throwing_4.wav")
	],
	foot_steps = [
		preload("res://audio/sfx/Foot_Steps_1.wav"),
		preload("res://audio/sfx/Foot_Steps_2.wav"),
		preload("res://audio/sfx/Foot_Steps_3.wav"),
		preload("res://audio/sfx/Foot_Steps_4.wav")
	],
	needle_miss = [
		preload("res://audio/sfx/Needle_Missing_1.wav"),
		preload("res://audio/sfx/Needle_Missing_2.wav")
	],
	needle_shoot = [
		preload("res://audio/sfx/Needle_Shooting_1.wav"),
		preload("res://audio/sfx/Needle_Shooting_2.wav"),
		preload("res://audio/sfx/Needle_Shooting_3.wav"),
		preload("res://audio/sfx/Needle_Shooting_4.wav"),
		preload("res://audio/sfx/Needle_Shooting_5.wav"),
		preload("res://audio/sfx/Needle_Shooting_6.wav")
	],
	needle_touch = [
		preload("res://audio/sfx/Needle_Touching_1.wav"),
		preload("res://audio/sfx/Needle_Touching_2.wav"),
		preload("res://audio/sfx/Needle_Touching_3.wav"),
		preload("res://audio/sfx/Needle_Touching_4.wav"),
	]
}

func get_random_sfx(sfx_name):
	randomize()
	return sfx[sfx_name][randi() % sfx[sfx_name].size()]
