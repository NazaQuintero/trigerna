extends Control

var on_purchase_pressed: Callable

var last_item_position = Global.shop_items.size() - 1
const FIRST_POSITION = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	set_displayed_values()
	
func set_displayed_values():
	var item_name = Global.shop_items[Global.shop_item_selected]["name"]
	get_node("Name").text = item_name
	get_node("Description").text = Global.shop_items[Global.shop_item_selected]["desc"]
	get_node("Price").text = "Price: " + str(Global.shop_items[Global.shop_item_selected]["cost"])
	var texture = Global.shop_items[Global.shop_item_selected]["texture"]
	var scaleX = Global.shop_items[Global.shop_item_selected]["scaleX"]
	var scaleY = Global.shop_items[Global.shop_item_selected]["scaleY"]
	get_node("ShopItem").change_texture(texture, scaleX, scaleY)
	

func switchItem(item_position):
	Global.shop_item_selected = item_position
	set_displayed_values()

func _on_purchase_pressed():
	on_purchase_pressed.call()


func _on_prev_pressed():
	var prev_position_candidate = Global.shop_item_selected - 1
	if (prev_position_candidate >= FIRST_POSITION):
		switchItem(prev_position_candidate)
	else:
		switchItem(last_item_position)


func _on_next_pressed():
	var next_position_candidate = Global.shop_item_selected + 1
	if (next_position_candidate <= last_item_position):
		switchItem(next_position_candidate)
	else:
		switchItem(FIRST_POSITION)
		
func receive_on_purchase_cb(cb: Callable):
	on_purchase_pressed = cb
