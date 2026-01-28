extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func change_level():
	get_tree().change_scene_to_file("res://cenas/act01/" + name + ".tscn")


func _on_body_entered(body: Node2D) -> void:
	call_deferred("change_level") # Replace with function body.
