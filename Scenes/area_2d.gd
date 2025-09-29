extends Area2D
const WIN = preload("uid://cuixx8qcjhs")




func _on_body_entered(body: Character) -> void:
	get_tree().change_scene_to_packed(WIN)
