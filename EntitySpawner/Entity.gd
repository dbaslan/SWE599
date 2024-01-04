extends Node2D

var speed = 100
var direction = Vector2()

func _ready():
	set_random_direction()

func _process(delta):
	var move = direction * speed * delta
	translate(move)

	if position.x < 0 or position.x > get_viewport_rect().size.x:
		set_random_direction()
	if position.y < 0 or position.y > get_viewport_rect().size.y:
		set_random_direction()

func set_random_direction():
	var random_angle = randf_range(0, 360)
	direction = Vector2.RIGHT.rotated(deg_to_rad(random_angle))

func _on_Area2D_body_entered(body):
	if body.is_in_group("entities"):
		set_random_direction()


func area_entered(area):
	set_random_direction()
