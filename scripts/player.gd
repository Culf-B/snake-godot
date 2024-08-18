extends Node2D

var movementDirection = Vector2(-1, 0)
var prevMovementDirection = movementDirection
var timeSincePrevMove = 0
var moveDelta = 0.25
var length = 1
var tileSize = 50
signal moved

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Add the player head
	#var color_rect = ColorRect.new()
	#color_rect.color = Color(1, 0, 0, 1)  # Red color (R, G, B, A)
	#color_rect.set_size(Vector2(100, 100))
	#add_child(color_rect)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Input
	if Input.is_action_pressed("ui_right") and prevMovementDirection != Vector2(-1, 0):
		# Move right.
		movementDirection = Vector2(1, 0)
	if Input.is_action_pressed("ui_left") and prevMovementDirection != Vector2(1, 0):
		# Move left.
		movementDirection = Vector2(-1, 0)
	if Input.is_action_pressed("ui_up") and prevMovementDirection != Vector2(0, 1):
		# Move up.
		movementDirection = Vector2(0, -1)
	if Input.is_action_pressed("ui_down") and prevMovementDirection != Vector2(0, -1):
		# Move down.
		movementDirection = Vector2(0, 1)
		
	# Move
	timeSincePrevMove += delta
	if timeSincePrevMove >= moveDelta:
		self.translate(movementDirection * tileSize)
		timeSincePrevMove -= moveDelta
		emit_signal("moved")
		prevMovementDirection = movementDirection


func _mapExit(area: Area2D) -> void:
	print("Map exit!")


func _appleHit(area: Area2D) -> void:
	print("Apple hit!")
