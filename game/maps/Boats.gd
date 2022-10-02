extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var movement = Vector2()
const VERTICAL_MOVEMENT = 3.0
const HORIZONTAL_MOVEMENT = 1.0
const DAMPEN_Y = 0.2
const DAMPEN_X = 0.05
var offsets = []
var children = []

# Called when the node enters the scene tree for the first time.
func _ready():
	offsets.resize(get_child_count())
	children = get_children()
	
	for i in range(offsets.size()):
		offsets[i] = Vector2(randf() * 500, randf() * 400)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement.y += VERTICAL_MOVEMENT * delta
	movement.x += HORIZONTAL_MOVEMENT * delta
	for i in range(offsets.size()):
		children[i].position.y += sin(movement.y + offsets[i].y) * DAMPEN_Y
		children[i].position.x += sin(movement.x + offsets[i].x) * DAMPEN_X
