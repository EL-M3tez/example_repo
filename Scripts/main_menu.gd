extends Control
const LEVEL_1 = preload("uid://wbajawi3uf5a")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_1)

func _on_options_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
