extends Node2D

var spawn_timer = 0.0
var spawn_interval = 0.1 
var entity_scene_path = "res://Entity.tscn"
var entity_scene = preload("res://Entity.tscn")

func _process(delta):
	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_entity()
		spawn_timer = 0.0

func spawn_entity():
	var new_entity = entity_scene.instantiate()
	if new_entity:
		add_child(new_entity)
		new_entity.position = get_viewport_rect().size / 2 
		new_entity.scale /= 2.0
