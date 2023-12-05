extends CanvasLayer

var selected = 0

var last_item_position = Global.shop_items.size() - 1
const FIRST_POSITION = 0

func switchItem(item_position):
	selected = item_position
	var item_name = Global.shop_items[selected]["name"]
	get_node("Control/Name").text = item_name
	get_node("Control/Description").text = Global.shop_items[selected]["desc"]
	get_node("Control/Price").text = "Price: " + str(Global.shop_items[selected]["cost"])
	get_node("Control/${item_name}").texture = Global.shop_items[selected]["texture"]


func _on_purchase_pressed():
	print(Global.shop_items[selected])


func _on_prev_pressed():
	var prev_position_candidate = selected - 1
	if (prev_position_candidate >= FIRST_POSITION):
		switchItem(prev_position_candidate)
	else:
		switchItem(last_item_position)


func _on_next_pressed():
	var next_position_candidate = selected + 1
	if (next_position_candidate <= last_item_position):
		switchItem(next_position_candidate)
	else:
		switchItem(FIRST_POSITION)
