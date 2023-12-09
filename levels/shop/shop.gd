extends CanvasLayer


func _ready():
	Global.collected_coins = 5000
	$CoinsUI.get_child(0).text = "Coins: " + str(Global.collected_coins)
	$Inventory_UI.set_weapons(Array(Global.shop_equipped_weapons.values()))
	$ShopControl.receive_on_purchase_cb(on_purchase)

func _on_continue_pressed():
	pass # Replace with function body.

var on_purchase = func():
	var selected_shop_item = Global.shop_items[Global.shop_item_selected]
	var new_available_coins = Global.collected_coins - selected_shop_item.cost
	if (new_available_coins >= 0):
		Global.collected_coins = new_available_coins
	$CoinsUI.get_child(0).text = "Coins: " + str(Global.collected_coins)
