extends CanvasLayer

@onready var box_container: HBoxContainer = $BoxContainer

@onready var restart_button: Button = $BoxContainer/Restart
@onready var quit_button: Button = $BoxContainer/Quit

@onready var game_over_label: Label = $GameOverLabel
@onready var points_label: Label = $PointsLabel

@onready var snake: Snake = $"../snake"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	snake.on_game_over.connect(on_game_over)
	snake.on_point_scored.connect(on_point_scored)
	quit_button.pressed.connect(on_quit_button_pressed)
	



func on_game_over():
	box_container.visible = true
	game_over_label.visible = true
	

func on_point_scored(points: int):
	points_label.text = "Points: %d" % points


func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()

func on_quit_button_pressed():
	get_tree().quit()
