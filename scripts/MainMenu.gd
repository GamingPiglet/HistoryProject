extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$FadeTransition.get_node("AnimationPlayer").play_backwards("Fade")
	await $FadeTransition.get_node("AnimationPlayer").animation_finished
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_button_pressed():
	$FadeTransition.get_node("AnimationPlayer").play("Fade")
	await $FadeTransition.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file("res://scenes/HowToPlay.tscn")


func _on_button_2_pressed():
	$FadeTransition.get_node("AnimationPlayer").play("Fade")
	await $FadeTransition.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file("res://scenes/exposition.tscn")
