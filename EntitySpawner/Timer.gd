extends Control

var timer_label: Label
var game_timer: float = 0

func _ready():
	timer_label = $Label

func _process(delta):
	game_timer += delta
	timer_label.text = "Time: " + str(round(game_timer))
