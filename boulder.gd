class_name Boulder extends RigidBody2D

var max_x_point:Vector2
var min_x_point:Vector2
var last_velocity:Vector2
var current_velocity:Vector2

signal new_max_point
signal new_min_point

func _ready() -> void:
	# Might have to use global position later
	max_x_point = self.position 
	min_x_point = self.position

func _process(delta: float) -> void:
	
	self.last_velocity = self.current_velocity
	self.current_velocity = self.linear_velocity
	
	var dist_right_x = self.max_x_point.x - self.position.x
	if dist_right_x < 0:
		self.max_x_point = self.position
		
	var dist_left_x = self.min_x_point.x - self.position.x
	if dist_left_x > 0:
		self.min_x_point = self.position
		
	var dir_change_to_left = self.current_velocity.x < 0 and self.last_velocity.x > 0
	var dir_change_to_right = self.current_velocity.x > 0 and self.last_velocity.x < 0
	if dir_change_to_left:
		print("Boulder Direction Change to Left")
	if dir_change_to_right:
		print("Boulder Direction Change to Right")
	
