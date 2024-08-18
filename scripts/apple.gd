extends Area2D

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomizePosition()

func randomizePosition() -> void:
	position = Vector2(rng.randi_range(-10, 9) * 50, rng.randi_range(-10, 9) * 50)
	print(position)

func _hit(area: Area2D) -> void:
	randomizePosition()
