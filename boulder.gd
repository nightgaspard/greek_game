class_name Boulder extends RigidBody2D


var last_velocity:Vector2
var current_velocity:Vector2

signal new_max_point
signal new_min_point

signal boulder_changed_direction

func _process(delta: float) -> void:
	
	self.last_velocity = self.current_velocity
	self.current_velocity = self.linear_velocity
		
	var dir_change_to_left = self.current_velocity.x < 0 and self.last_velocity.x > 0
	var dir_change_to_right = self.current_velocity.x > 0 and self.last_velocity.x < 0
	if dir_change_to_left:
		print("Boulder Direction Change to Left")
		emit_signal("boulder_changed_direction", self)
	if dir_change_to_right:
		print("Boulder Direction Change to Right")
		emit_signal("boulder_changed_direction", self)
	
