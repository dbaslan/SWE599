extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	$GameOver.hide()
	$Choose.show()
	$YouWin.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_enemy_body_entered(body):
	$GameOver.show()
	$Choose.hide()

func _on_treasure_body_entered(body):
	$Choose.hide()
	$YouWin.show()

func _on_restart_pressed():
	get_tree().reload_current_scene()

func _on_quit_pressed():
	get_tree().quit()

func _on_mute_toggled(button_pressed):
	if button_pressed:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
