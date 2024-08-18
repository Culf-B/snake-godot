extends Node2D

var tailElements = []
var playerPosition

var score = 0
var playerHead

func _ready() -> void:
	playerHead = get_child(0)
	playerPosition = playerHead.position
	
func _process(delta: float) -> void:
	pass
	
func _move() -> void:
	tailElements.append(tailElements.pop_at(0))
	tailElements[-1].position = playerPosition
	playerPosition = playerHead.position

func _appleHit(area: Area2D) -> void:
	print("Apple hit!")
	score += 1
	
	# Add tail area
	var newTailArea = Area2D.new()
	newTailArea.position = Vector2(-1000, -1000)
	tailElements.reverse()
	tailElements.append(newTailArea)
	tailElements.reverse()
	add_child(newTailArea)
	
	# Add tail colorRect
	var newColorRect = ColorRect.new()
	newColorRect.color = Color(0, 0, 1, 1)  # Red color (R, G, B, A)
	newColorRect.set_size(Vector2(50, 50))
	newTailArea.add_child(newColorRect)
	
	# Add tail collider
	var newTailCollider = CollisionShape2D.new()
	newTailArea.add_child(newTailCollider)
	newTailCollider.position = Vector2(25, 25)
	newTailCollider.shape = RectangleShape2D.new()
	newTailCollider.shape.size = Vector2(48, 48)
	
	newTailArea.set_collision_layer_value(1, false)
	newTailArea.set_collision_layer_value(2, true)

func _outOfBounds(area: Area2D) -> void:
	print("Out of bounds!")
	
func _tailHit(area: Area2D) -> void:
	print("Tail hit!")
