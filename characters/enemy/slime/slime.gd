extends Enemy
class_name Slime


func _init():
	super()


func _initialize_values(): 
	self.hitpoints = 2
	self.max_speed = 80
	self.acceleration = 20
	self.friction = 0.5
