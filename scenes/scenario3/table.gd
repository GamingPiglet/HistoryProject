extends "res://scripts/room.gd"

func _on_item_pickup(name, origname):
	super(name, origname)
	if (name == "tube"):
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_PASS
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario3.dialogue"), "needlefound")
		await DialogueManager.dialogue_ended
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_IGNORE

