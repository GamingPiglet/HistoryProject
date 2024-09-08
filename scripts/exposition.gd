extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/exposition.dialogue"), "part1")
	await DialogueManager.dialogue_ended
	get_tree().change_scene_to_file("res://scenes/scenario1/main.tscn")

