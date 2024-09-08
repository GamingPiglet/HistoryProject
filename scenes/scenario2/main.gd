extends "res://scripts/room.gd"


func _ready():
	super()
	if Dialogueflags.scenario2Start:
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_PASS
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario2.dialogue"), "scenariostart")
		Dialogueflags.scenario2Start = false
		await DialogueManager.dialogue_ended
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_IGNORE
		
func _on_room_transition(path):
	if (path == "res://scenes/scenario2/patient.tscn" and not Dialogueflags.notgauzepacked1):
		$FadeTransition.get_node("AnimationPlayer").play("Fade")
		await $FadeTransition.get_node("AnimationPlayer").animation_finished
		get_tree().change_scene_to_file("res://scenes/scenario2/patient2.tscn")
	else:
		super(path)
