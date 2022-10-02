extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var caught_blahaj = false
var target_position
var timer
var player
const MIN_VERTICAL_POSITION = 40.0
const MAX_VERTICAL_POSITION = 500.0
const MIN_MAX_VERTICAL_POSITION_RANGE_HALVED = (MAX_VERTICAL_POSITION - MIN_VERTICAL_POSITION) * 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node("/root/World/blahaj")
	timer = $Timer
	connect("body_entered", player, "on_damage")
	player.connect("caught", self, "catch_blahaj")
	timer.wait_time = randf() * 4.0 + 3.0
	target_position = rand_range(MIN_VERTICAL_POSITION, MAX_VERTICAL_POSITION)
	timer.one_shot = true
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.start()
	

func catch_blahaj():
	caught_blahaj = true
	

func _on_timer_timeout():
	timer.wait_time = randf() * 4.0 + 3.0
	target_position = rand_range(MIN_VERTICAL_POSITION, MAX_VERTICAL_POSITION)
	timer.one_shot = true
	timer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !caught_blahaj:
		target_position += sin(position.y * 2.0)
	else:
		target_position = 20.0
	
	position.y = lerp(position.y, target_position, delta)
