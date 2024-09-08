extends TextureRect

var blocks = []

# Called when the node enters the scene tree for the first time.
func _ready():
	blocks = [$ItemBlock, $ItemBlock2, $ItemBlock3, 
	$ItemBlock4, $ItemBlock5, $ItemBlock6, $ItemBlock7, 
	$ItemBlock8, $ItemBlock9, $ItemBlock10]

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func fusion_check(item):
	if (InventoryVars.fusions.has(InventoryVars.fusion1)):
		if (InventoryVars.fusions.get(InventoryVars.fusion1).has(item)):
			if (InventoryVars.fusion1Index > InventoryVars.fusion2Index):
				InventoryVars.fusion1Index -= 1
			InventoryVars.items.pop_at(InventoryVars.fusion2Index)
			InventoryVars.items[InventoryVars.fusion1Index] = InventoryVars.fusions.get(InventoryVars.fusion1).get(item)
			blocks[InventoryVars.fusion1Index].get_node("ToolTip").text = InventoryVars.tooltips.get(InventoryVars.fusion1)
			InventoryVars.fusion1 = ""
			refresh()

func refresh():
	for i in range(10):
		if i < InventoryVars.items.size():
			blocks[i].get_node("TextureRect").texture = load("res://images/" + InventoryVars.items[i] + ".png")
			blocks[i].disabled = false
			blocks[i].get_node("ToolTip").text = InventoryVars.tooltips.get(InventoryVars.items[i])
			if i == InventoryVars.fusion1Index and InventoryVars.fusion1 != "":
				blocks[i].set_pressed_no_signal(true)
		else:
			blocks[i].get_node("TextureRect").texture = null
			blocks[i].disabled = true

func _on_item_collect(texture, name):
	var itemBlock = blocks[InventoryVars.items.size()]
	itemBlock.get_node("TextureRect").texture = texture
	InventoryVars.items.append(name)
	itemBlock.get_node("ToolTip").text = InventoryVars.tooltips.get(name)
	itemBlock.disabled = false
	refresh()

func _on_texture_button_pressed(extra_arg_0):
	if InventoryVars.fusion1 == "":
		InventoryVars.fusion1 = InventoryVars.items[extra_arg_0]
		InventoryVars.fusion1Index = extra_arg_0
	else:
		InventoryVars.fusion2Index = extra_arg_0
		fusion_check(InventoryVars.items[extra_arg_0])
		InventoryVars.fusion1 = ""
		blocks[InventoryVars.fusion1Index].set_pressed_no_signal(false)
		blocks[InventoryVars.fusion2Index].set_pressed_no_signal(false)


func _on_item_block_mouse_entered(index):
	if (blocks.size() > index):
		blocks[index].get_node("ToolTip").show()
	

func _on_item_block_mouse_exited(index):
	if (blocks.size() > index):
		blocks[index].get_node("ToolTip").hide()
