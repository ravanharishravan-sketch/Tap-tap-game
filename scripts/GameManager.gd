extends Node2D

var score = 0
var level = 1
var game_over = false
var obstacle_spawner
var player
var hud_layer

func _ready():
	player = get_node("Player")
	obstacle_spawner = get_node("ObstacleSpawner")
	hud_layer = get_node("HUD")
	player.connect("hit", self, "_on_player_hit")
	obstacle_spawner.connect("obstacle_passed", self, "_on_obstacle_passed")

func _process(delta):
	if game_over:
		if Input.is_action_just_pressed("ui_touch") or Input.is_action_just_pressed("ui_accept"):
			get_tree().reload_current_scene()

func _on_player_hit():
	game_over = true
	hud_layer.get_node("GameOverPanel").visible = true
	hud_layer.get_node("GameOverPanel/FinalScoreLabel").text = "Score: " + str(score)
	player.can_move = false
	obstacle_spawner.stop_spawning()

func _on_obstacle_passed():
	score += 10
	level = int(score / 10) + 1
	hud_layer.get_node("ScoreLabel").text = "Score: " + str(score)
	hud_layer.get_node("LevelLabel").text = "Level: " + str(level)
	obstacle_spawner.update_difficulty(level)
