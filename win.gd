extends Control
const MAIN_MENU = preload("uid://pxvufo3s1uqj")



func _on_button_pressed() -> void:
	get_tree().change_scene_to_packed(MAIN_MENU)
