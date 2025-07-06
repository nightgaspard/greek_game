extends Node2D

var max_x_point:Vector2
var min_x_point:Vector2

@onready var red_flag: Node2D = $RedFlag
@onready var yellow_flag: Node2D = $YellowFlag


func _ready():
	var boulder:Boulder = $Boulder
	boulder.boulder_changed_direction.connect(_on_boulder_changed_direction)
	
	max_x_point = boulder.position 
	min_x_point = boulder.position
	
func _on_boulder_changed_direction(boulder:Boulder):
	
	if max_x_point.x < boulder.position.x:
		max_x_point = boulder.position
		red_flag.visible = true
		red_flag.position = max_x_point
		
	if min_x_point.x > boulder.position.x:
		min_x_point = boulder.position
		yellow_flag.visible = true
		yellow_flag.position = min_x_point
		
	print("Boulder changed direction! Reference:", boulder)
