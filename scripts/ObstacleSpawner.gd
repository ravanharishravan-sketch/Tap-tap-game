extends Node

signal obstacle_passed

var obstacle_scene = preload("res://scenes/Obstacle.tscn")
var spawn_timer = 0
var spawn_interval = 2.0
var obstacle_speed = 300
var can_spawn = true
var viewport_size
var obstacles = []

func _ready():
	viewport_size = get_viewport_rect().size

func _process(delta):
	if not can_spawn:
		return

	spawn_timer += delta
	if spawn_timer >= spawn_interval:
		spawn_obstacle()
		spawn_timer = 0

	# Remove obstacles that are off-screen
	for obstacle in obstacles:
		if obstacle.position.x < -100:
			if not obstacle.counted:
				emit_signal("obstacle_passed")
				obstacle.counted = true

func spawn_obstacle():
	var obstacle = obstacle_scene.instance()
	add_child(obstacle)
	obstacles.append(obstacle)
	
	# Random height
	var spawn_height = randf() * (viewport_size.y - 300) + 100
	obstacle.position = Vector2(viewport_size.x + 50, spawn_height)
	obstacle.speed = obstacle_speed

func update_difficulty(level):
	# Increase speed and decrease spawn interval
	obstacle_speed = 300 + (level - 1) * 50
	spawn_interval = max(1.0, 2.0 - (level - 1) * 0.1)

func stop_spawning():
	can_spawn = false
