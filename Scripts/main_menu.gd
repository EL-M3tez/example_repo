extends Control
const LEVEL_1 = preload("res://Scenes/level_1.tscn")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_1)

func _on_quit_pressed() -> void:
	get_tree().quit()
