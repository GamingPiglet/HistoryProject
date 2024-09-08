extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$Inventory.refresh()
	$FadeTransition.get_node("AnimationPlayer").play_backwards("Fade")
	for i in InventoryVars.used:
		if (get_node(i) != null):
			if (get_node(i).texture_disabled == null):
				get_node(i).queue_free()
			else:
				get_node(i).disabled = true
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
# func _process(delta):
#	pass

func _on_item_pickup(name, origname):
	$Inventory._on_item_collect(get_node(origname).texture_normal, name)
	InventoryVars.used.append(origname)
	get_node(origname).queue_free()
	
func _on_room_transition(path):
	$FadeTransition.get_node("AnimationPlayer").play("Fade")
	await $FadeTransition.get_node("AnimationPlayer").animation_finished
	get_tree().change_scene_to_file(path)

func _on_item_interact(required, origname, functionCall):
	if InventoryVars.fusion1 == required:
		InventoryVars.used.append(origname)
		get_node(origname).disabled = true
		InventoryVars.items.pop_at(InventoryVars.fusion1Index)
		InventoryVars.fusion1 = ""
		$Inventory.refresh()
		Interactfunctions.call_deferred(functionCall)
	else:
		if InventoryVars.fusion1Index == -1:
			InventoryVars.fusion1Index = 0
		InventoryVars.fusion1 = ""
		$Inventory.blocks[InventoryVars.fusion1Index].set_pressed_no_signal(false)
		Interactfunctions.call_deferred(required + "incorrect")

