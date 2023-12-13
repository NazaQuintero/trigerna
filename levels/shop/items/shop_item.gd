extends Node

func change_texture(texture, scaleX, scaleY):
	var sprite_node = get_node("Sprite2D")
	sprite_node.texture = load(texture)
	sprite_node.position.x = 100
	sprite_node.position.y = 66
	sprite_node.scale.x = scaleX
	sprite_node.scale.y = scaleY
	
