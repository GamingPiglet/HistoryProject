extends Node

var items = []
var fusion1 = ""
var fusion1Index = -1
var fusion2Index = -1
var fusions = {"item1": {"item2": "item3"}, "item2": {"item1": "item3"}
}
var used = []
var tooltips = {
	"item1" : "fuse this with item2",
	"item2" : "fuse this with item1",
	"item3" : "put this in the box to end the prototype demo",
	"gauze1" : "A roll of gauze. It’s slick with oil emulsion. Smells sickly sweet.",
	"gauze2" : "A roll of gauze. It’s slick with oil emulsion. Smells sickly sweet.",
	"plaster" : "Some plaster. Pretty sticky and firm.",
	"tools" : "A suture kit. Useful for closing wounds.",
	"tools1" : "A suture kit. Useful for closing wounds.",
	"tube" : "A drinking straw. Could be used as a tube in emergencies."
}

## Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
