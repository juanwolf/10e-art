extends Area2D

signal player2_scored

func _on_body_entered(body: Node2D) -> void:
	player2_scored.emit()
 
