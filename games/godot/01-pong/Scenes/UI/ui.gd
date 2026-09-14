extends Node2D

func update_scores(player1Score, player2Score: int) -> void:
	$Player1Score.text = str(player1Score)
	$Player2Score.text = str(player2Score)
