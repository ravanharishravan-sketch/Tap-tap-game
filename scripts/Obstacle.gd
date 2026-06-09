extends Area2D

var speed = 300
var counted = false

func _ready():
	# Create simple pixel obstacle
	var collision_shape = get_node("CollisionShape2D")
	collision_shape.shape = RectangleShape2D.new()
	collision_shape.shape.extents = Vector2(16, 32)

func _draw():
	# Draw retro 8-bit obstacle (blue spike)
	var blue = Color(0.2, 0.4, 1, 1)
	var dark_blue = Color(0.1, 0.2, 0.8, 1)
	
	# Main body
	draw_rect(Rect2(-12, -20, 8, 40), blue)
	draw_rect(Rect2(-4, -20, 8, 40), blue)
	draw_rect(Rect2(4, -20, 8, 40), dark_blue)
	
	# Spikes
	draw_rect(Rect2(-12, -28, 4, 8), blue)
	draw_rect(Rect2(-4, -28, 4, 8), dark_blue)
	draw_rect(Rect2(4, -28, 4, 8), blue)

func _process(delta):
	position.x -= speed * delta
