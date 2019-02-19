extends AudioStreamPlayer


var level1 = {
	intro = preload("res://audio/music/Level1_Intro.wav"),
	loop = preload("res://audio/music/Level1_Loop.wav")
}

var level2 = {
	intro = preload("res://audio/music/Level2_Loop.wav"),
	loop = preload("res://audio/music/Level2_Loop.wav")
}

var boss = {
	intro = preload("res://audio/music/Boss_Theme.wav"),
	loop = preload("res://audio/music/Boss_Theme.wav")
}

var current_set = null

func play_set(set):
	current_set = set
	stream = current_set.intro
	play()

func _on_Looper_finished():
	if stream != current_set.loop:
		stream = current_set.loop
	play()
