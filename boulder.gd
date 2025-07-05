class_name Boulder extends RigidBody2D

@onready var boulder_collision_shape: CollisionShape2D = $BoulderCollisionShape


func get_collision_shape():
	return boulder_collision_shape
