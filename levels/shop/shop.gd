extends CanvasLayer


func _ready():
	Global.collected_coins = 5000 #PLZ delete this line as it is as a way to test coins behavior runing this scene in stand alone mode
	update_coins_label()
	update_inventory()
	$ShopControl.receive_on_purchase_cb(on_purchase)

func _on_continue_pressed():
	pass # Replace with function body.

var on_purchase = func():
	var selected_shop_item = Global.get_selected_shop_item()
	var new_available_coins = Global.collected_coins - selected_shop_item.cost
	
	if (new_available_coins >= 0):
		Global.collected_coins = new_available_coins
		update_coins_label()
		Global.add_new_equipped_weapon(selected_shop_item.name)
		update_inventory()


func update_coins_label():
	$CoinsUI.get_child(0).text = "Coins: " + str(Global.collected_coins)

func update_inventory():
	$Inventory_UI.set_weapons(Array(Global.shop_equipped_weapons.values()))
