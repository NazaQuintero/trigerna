extends CanvasLayer


func _ready():
	$CoinsUI.get_child(0).text = "Coins: " + str(Global.collected_coins)
	$Inventory_UI.set_weapons(Array(Global.shop_equipped_weapons.values()))

func _on_continue_pressed():
	pass # Replace with function body.
