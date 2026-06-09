extends Area2D

signal hit

var velocity = Vector2.ZERO
var gravity = 500
var jump_force = -400
var can_move = true

func _ready():
	connect("area_entered", self, "_on_area_entered")

# Draw simple pixel player
func _draw():
	var colors = [
		Color(1, 0.2, 0.2, 1),  # Red
		Color(1, 0.4, 0.2, 1),  # Orange
	]
	
	# Draw pixel character (8-bit style)
	draw_rect(Rect2(-8, -8, 4, 4), colors[0])
	draw_rect(Rect2(-4, -8, 4, 4), colors[0])
	draw_rect(Rect2(0, -8, 4, 4), colors[1])
	draw_rect(Rect2(4, -8, 4, 4), colors[1])
	
	draw_rect(Rect2(-8, -4, 4, 4), colors[0])
	draw_rect(Rect2(-4, -4, 16, 4), colors[0])
	draw_rect(Rect2(4, -4, 4, 4), colors[1])
	draw_rect(Rect2(8, -4, 4, 4), colors[1])
	
	draw_rect(Rect2(-8, 0, 4, 4), colors[0])
	draw_rect(Rect2(-4, 0, 4, 4), colors[0])
	draw_rect(Rect2(0, 0, 4, 4), colors[0])
	draw_rect(Rect2(4, 0, 4, 4), colors[0])
	draw_rect(Rect2(8, 0, 4, 4), colors[1])
	
	draw_rect(Rect2(-8, 4, 4, 4), colors[0])
	draw_rect(Rect2(4, 4, 4, 4), colors[1])

func _process(delta):
	if not can_move:
		return

	# Gravity
	velocity.y += gravity * delta
	
	# Jump on tap/click
	if Input.is_action_just_pressed("ui_touch") or Input.is_action_just_pressed("ui_accept"):
		if position.y >= get_viewport_rect().size.y - 100:
			velocity.y = jump_force
	
	# Update position
	position.y += velocity.y * delta
	
	# Keep in bounds (bottom)
	if position.y > get_viewport_rect().size.y + 50:
		emit_signal("hit")
		position.y = get_viewport_rect().size.y - 50
	
	# Keep in bounds (top)
	if position.y < 0:
		position.y = 0
		velocity.y = 0

func _on_area_entered(area):
	if area.is_in_group("obstacles"):
		emit_signal("hit")
