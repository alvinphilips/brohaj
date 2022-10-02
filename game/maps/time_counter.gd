extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var is_caught = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var player = get_node("/root/World/blahaj")
	player.connect("caught", self, "on_blahaj_caught")

var time = 0
var minutes
var seconds
var millis

func on_blahaj_caught():
	is_caught = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_caught:
		return
		
	time += delta
	millis = int(time * 100) % 100
	minutes = time / 3600
	seconds = int(time - minutes) % 60
	
	text = "%d:%02d:%02d" % [minutes, seconds, millis]
