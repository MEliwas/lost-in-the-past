extends Control

@onready var item_icon = $interBorder/item_icon
@onready var item_quantity = $interBorder/item_icon/item_quantity
@onready var info_panel = $info_panel
@onready var item_name = $info_panel/item_name
@onready var item_type = $info_panel/item_type
@onready var item_effect = $info_panel/item_effect
@onready var usage_panel = $usage_panel

var item = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_button_item_mouse_exited():
	info_panel.visible = false


func _on_button_item_mouse_entered():
	if item != null:
		usage_panel.visible = !usage_panel.visible
		info_panel.visible = true



func _on_button_item_pressed():
	if item != null:
		usage_panel.visible = !usage_panel.visible


func set_empty():
	item_icon.texture = null
	item_quantity.text = ""


func set_item(new_item):
	item = new_item
	item_icon.texture = item["item_texture"]
	item_quantity.text = str(item["quantity"])
	item_name.text = str(item["item_name"])
	item_type.text = str(item["item_type"])

	if item["item_effect"] != "":
		item_effect.text = "+ " + str(item["item_effect"])
	else:
		item_effect.text = ""
