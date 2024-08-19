extends RichTextLabel

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	text = "Score: " + str(score)
	
func _updateScore() -> void:
	score += 1
	print(score)
