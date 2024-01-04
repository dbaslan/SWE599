extends CharacterBody2D

var movement_speed = 400
var acceleration = 10

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

func _ready():
	$AnimatedSprite2D.animation = "walk"
	$AnimatedSprite2D.play()

func _physics_process(_delta):

	var direction = Vector3()
	navigation_agent.target_position =get_global_mouse_position()
	direction = navigation_agent.get_next_path_position() - global_position
	direction = direction.normalized()
	velocity = velocity.lerp(direction * movement_speed, acceleration * _delta)
	move_and_slide()
