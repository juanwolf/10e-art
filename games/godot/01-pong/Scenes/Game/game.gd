extends Node2D

@export var win_points = 5

@onready var UI = $UI

var scorePlayer1 = 0
var scorePlayer2 = 0

func _ready() -> void:
	var field_left_scoring_area = get_node("Field/LeftScoringArea")
	var field_right_scoring_area = get_node("Field/RightScoringArea")
	field_left_scoring_area.connect("player2_scored", _on_player2_score)
	field_right_scoring_area.connect("player1_scored", _on_player1_score)
	

func _on_player1_score() -> void:
	self.scorePlayer1 += 1
	self.UI.update_scores(self.scorePlayer1, self.scorePlayer2)
	
func _on_player2_score() -> void:
	self.scorePlayer2 += 1
