extends "res://scripts/room.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	super()
	if Dialogueflags.scenario3Start:
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_PASS
		DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario3.dialogue"), "scenariostart")
		Dialogueflags.scenario3Start = false
		await DialogueManager.dialogue_ended
		get_node("FadeTransition").mouse_filter = get_node("FadeTransition").MOUSE_FILTER_IGNORE
		
func _on_room_transition(path):
	if (path == "res://scenes/scenario3/patient.tscn" and not Dialogueflags.holenotmade):
		$FadeTransition.get_node("AnimationPlayer").play("Fade")
		await $FadeTransition.get_node("AnimationPlayer").animation_finished
		get_tree().change_scene_to_file("res://scenes/scenario3/patient2.tscn")
	else:
		super(path)

