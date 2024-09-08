extends "res://scripts/room.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	if Dialogueflags.holenotmade:
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_PASS
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario3.dialogue"), "holemade")
		Dialogueflags.holenotmade = false
		await DialogueManager.dialogue_ended
		if (not InventoryVars.items.has("tube")):
			Dialogueflags.strawlast = true
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_IGNORE

