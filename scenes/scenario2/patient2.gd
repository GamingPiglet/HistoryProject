extends "res://scripts/room.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	if (Dialogueflags.notgauzepacked1):
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_PASS
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario2.dialogue"), "holesplugged")
		await DialogueManager.dialogue_ended
		Dialogueflags.notgauzepacked1 = false
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_IGNORE

