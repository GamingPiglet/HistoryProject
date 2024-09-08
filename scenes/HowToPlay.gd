extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$FadeTransition/AnimationPlayer.play_backwards("Fade")


func _on_button_pressed():
	$FadeTransition.get_node("AnimationPlayer").play("Fade")
	await $FadeTransition.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file("res://scenes/exposition.tscn")
