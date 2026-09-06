extends Node2D

func update_scores(player1Score, player2Score: int) -> void:
	$Player1Score.text = player1Score
	$Player2Score.text = player2Score
