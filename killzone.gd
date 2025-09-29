extends Area2D




func _on_body_entered(body: Character) -> void:
	get_tree().reload_current_scene()
