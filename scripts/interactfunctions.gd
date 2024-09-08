extends Node


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func tubeincorrect():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario3.dialogue"), "tubeneeded")
	await DialogueManager.dialogue_ended

func tools1incorrect():
	toolsincorrect()

func gauze2incorrect():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario1.dialogue"), "gauzeincorrect")
	await DialogueManager.dialogue_ended

func stitched2():
	var temp = preload("res://scenes/FadeTransition.tscn").instantiate()
	get_tree().current_scene.add_child(temp)
	temp.get_node("AnimationPlayer").play("Fade")
	await temp.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file("res://scenes/scenario3/patient2.tscn")

func ending():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario3.dialogue"), "tubeinserted")
	await DialogueManager.dialogue_ended
	var temp = preload("res://scenes/FadeTransition.tscn").instantiate()
	get_tree().current_scene.add_child(temp)
	temp.get_node("AnimationPlayer").play("Fade")
	await temp.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file("res://scenes/ending.tscn")

func toolsincorrect():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario2.dialogue"), "stitcheswrong")
	await DialogueManager.dialogue_ended

func stitched():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario2.dialogue"), "woundssutured")
	await DialogueManager.dialogue_ended
	var temp = preload("res://scenes/FadeTransition.tscn").instantiate()
	get_tree().current_scene.add_child(temp)
	temp.get_node("AnimationPlayer").play("Fade")
	await temp.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file("res://scenes/scenario3/main.tscn")

func gauzepacked1():
	var temp = preload("res://scenes/FadeTransition.tscn").instantiate()
	get_tree().current_scene.add_child(temp)
	temp.get_node("AnimationPlayer").play("Fade")
	await temp.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file("res://scenes/scenario2/patient2.tscn")

func plasterapplied():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario1.dialogue"), "plasterapplied")
	await DialogueManager.dialogue_ended
	var temp = preload("res://scenes/FadeTransition.tscn").instantiate()
	get_tree().current_scene.add_child(temp)
	temp.get_node("AnimationPlayer").play("Fade")
	await temp.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file("res://scenes/scenario2/main.tscn")

func gauzeused():
	var temp = preload("res://scenes/FadeTransition.tscn").instantiate()
	get_tree().current_scene.add_child(temp)
	temp.get_node("AnimationPlayer").play("Fade")
	await temp.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file("res://scenes/scenario1/patient2.tscn")
	

func plasterincorrect():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario1.dialogue"), "plasterincorrect")
	await DialogueManager.dialogue_ended

func gauze1incorrect():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/scenario1.dialogue"), "gauzeincorrect")
	await DialogueManager.dialogue_ended

func end():
	DialogueManager.show_example_dialogue_balloon(load("res://dialogue/main.dialogue"), "ending")
	await DialogueManager.dialogue_ended
	get_tree().quit()

