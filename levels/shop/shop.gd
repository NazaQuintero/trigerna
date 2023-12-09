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
		var name = selected_shop_item.name
		var texture = Global.shop_weapons[name].texture
		var shop_scale = Global.shop_weapons[name].scale
		var level_scale = Global.level_weapons[name].scale
		Global.shop_equipped_weapons.merge({ Global.current_weapon: { "name": name, "texture": texture, "scale": shop_scale }})
		Global.level_equipped_weapons.merge({ Global.current_weapon: { "name": name, "texture": texture, "scale": level_scale }})
#		print("Equipped weapons: ", Global.shop_equipped_weapons)
		$Inventory_UI.set_weapons(Array(Global.shop_equipped_weapons.values()))
	
