extends Control
@onready var character: Character = $".."

func _ready() -> void:
	Engine.time_scale = 0

func _on_button_pressed() -> void:
	character.Speed *= 0.7
	character.Jump_Velocity *= 1.5
	Engine.time_scale = 1.0
	queue_free()


func _on_button_2_pressed() -> void:
	character.Speed *= 1.5
	character.Jump_Velocity *= 0.7
	Engine.time_scale = 1.0
	queue_free()
