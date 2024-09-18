extends Node

@onready var pause_panel: Panel = %PausePanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var esc_pressed = Input.is_action_just_pressed("escape")
	if esc_pressed == true:
		get_tree().paused = true
		pause_panel.show()


func _on_menu_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_resume_pressed() -> void:
	get_tree().paused = false
	pause_panel.hide()
