extends Enemy
class_name FlyingEnemy


func _init():
	super()


func _initialize_values(): 
	self.hitpoints = 2
	self.max_speed = 100
	self.acceleration = 20
	self.friction = 0.5
