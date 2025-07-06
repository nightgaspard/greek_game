@tool
class_name Player extends RigidBody2D

@export var default_roll_force:float = 500
@export var default_jump_force:float  = 1500

@onready var gruntPlayer:AudioStreamPlayer = $GruntPlayer
var grunt_playing: bool = false

@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var debug_ray_cast_right: Line2D = $DebugRayCastRight
@onready var debug_ray_cast_left: Line2D = $DebugRayCastLeft
@onready var player_sprite: Sprite2D = $PlayerSprite
var last_direction: String = ""

var grunt_sounds: Array[AudioStreamWAV] = [
	preload("res://grunts/grunting_1.wav"),
	preload("res://grunts/grunting_2.wav"),
	preload("res://grunts/grunting_3.wav"),
	preload("res://grunts/grunting_4.wav"),
	preload("res://grunts/grunting_5.wav"),
	preload("res://grunts/grunting_6.wav"),
	preload("res://grunts/grunting_7.wav"),
	preload("res://grunts/grunting_8.wav"),
	preload("res://grunts/grunting_9.wav"),
	preload("res://grunts/grunting_10.wav"),
	preload("res://grunts/grunting_11.wav"),
	preload("res://grunts/grunting_12.wav"),
	preload("res://grunts/grunting_13.wav"),
	preload("res://grunts/grunting_14.wav"),
	preload("res://grunts/grunting_15.wav"),
	preload("res://grunts/grunting_16.wav"),
	preload("res://grunts/grunting_17.wav"),
	preload("res://grunts/grunting_18.wav"),
	preload("res://grunts/grunting_19.wav"),
	preload("res://grunts/grunting_20.wav"),
]



func _process(_delta:float) -> void:
	
	if Engine.is_editor_hint():
		return
		
	ray_cast_left.global_rotation = 0
	ray_cast_right.global_rotation = 0
	debug_ray_cast_left.global_rotation = 0
	debug_ray_cast_right.global_rotation = 0
	
	var roll_force = default_roll_force * 60
	var jump_force = default_jump_force * 60
	
	if Input.is_action_pressed("right"):
		self.apply_central_force(Vector2.RIGHT*roll_force * _delta)
		last_direction = "right"
	if Input.is_action_pressed("left"):
		self.apply_central_force(Vector2.LEFT*roll_force * _delta)
		last_direction = "left"
	if Input.is_action_just_pressed("jump"):
		self.apply_central_force(Vector2.UP*jump_force * _delta)
	
	if self.linear_velocity.x > 60.0 and last_direction == "right":
		player_sprite.flip_h = false
		
	elif  self.linear_velocity.x < -60.0 and last_direction == "left":
		player_sprite.flip_h = true
	
	var should_play_grunt: bool = gruntPlayer and grunt_playing == false
	should_play_grunt = should_play_grunt and (ray_cast_left.is_colliding() or ray_cast_right.is_colliding())
	
	if should_play_grunt:
		gruntPlayer.play()
		grunt_playing = true
	
	pass
	

func _on_audio_stream_player_finished() -> void:
	gruntPlayer.stream = grunt_sounds[randi() % grunt_sounds.size()]
	var timer = get_tree().create_timer(1.0)
	await timer.timeout
	grunt_playing = false
	pass # Replace with function body.

	
