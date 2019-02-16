extends Position2D

export (PackedScene) var spawnScene
onready var spawnReference = load (spawnScene.get_path())

export (NodePath) var timerPath
onready var timerNode = get_node(timerPath)

export (float) var minWaitTime 
export (float) var maxWaitTime 

func _ready():
	randomize()
	timerNode.set_wait_time(rand_range(minWaitTime, maxWaitTime))
	timerNode.start()
	$AnimationPlayer.play()

func _on_Timer_timeout():
	var spawnInstance = spawnReference.instance()
	
	get_parent().add_child(spawnInstance)
	spawnInstance.position = position
	
	timerNode.set_wait_time(rand_range(minWaitTime, maxWaitTime))
	timerNode.start()