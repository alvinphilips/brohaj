extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var player
var pos_x
const MIN_X = 375
const MAX_X = 650

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"../blahaj"
	self.smoothing_enabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pos_x = lerp(position.x, player.position.x, 0.5)
	position.x = clamp(pos_x, MIN_X, MAX_X)
