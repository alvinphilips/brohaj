extends AudioStreamPlayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var player = get_node("/root/World/blahaj")
	player.connect("caught", self, "_on_blahaj_caught")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_blahaj_caught():
	pitch_scale = 0.8

func _on_Button_button_down():
	self.playing = !self.playing
