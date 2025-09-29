extends Control
@onready var character: Character = $VBoxContainer/Character
const LEVEL_1 = preload("uid://b0dlnig58o1yq")



func _on_button_2_pressed() -> void:
	character.Speed = character.Speed / 2
	get_tree().change_scene_to_packed(LEVEL_1)
	
func _on_button_pressed() -> void:
	character.Jump_Velocity = character.Jump_Velocity * 0.75
	get_tree().change_scene_to_packed(LEVEL_1)
