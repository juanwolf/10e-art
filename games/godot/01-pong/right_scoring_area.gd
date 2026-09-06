extends Area2D

signal player1_scored

func _on_body_entered(body: Node2D) -> void:
	player1_scored.emit()
	pass # Replace with function body.
