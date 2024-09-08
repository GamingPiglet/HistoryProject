extends "res://scripts/room.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	if (Dialogueflags.notgauzepacked):
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_PASS
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario1.dialogue"), "gauzepacked")
		await DialogueManager.dialogue_ended
		Dialogueflags.notgauzepacked = false
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_IGNORE
