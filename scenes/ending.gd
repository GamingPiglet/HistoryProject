extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/ending.dialogue"), "start")
	await DialogueManager.dialogue_ended
	get_tree().quit()
