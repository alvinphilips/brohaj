extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var move = Vector2()
const HORIZONTAL_MOVEMENT_SPEED = 1000.0
const VERTICAL_MOVEMENT_SPEED = 400.0

func _physics_process(delta):
	move -= move * 0.05
	
	if Input.is_action_pressed("ui_up"):
		move.y -= VERTICAL_MOVEMENT_SPEED * delta
	if Input.is_action_pressed("ui_down"):
		move.y += VERTICAL_MOVEMENT_SPEED * delta
	if Input.is_action_pressed("ui_right"):
		move.x += HORIZONTAL_MOVEMENT_SPEED * delta
	if Input.is_action_pressed("ui_left"):
		move.x -= HORIZONTAL_MOVEMENT_SPEED * delta
	
	# Small hack to flip image based on movement direction
	#
	# flip_h requires a floar, so we first subtract 1 from (-1, 1) to get
	# the range (-2, 0). We then multiply by 0.5 (Divide by 2) to get a range of
	# (-1, 0). We then take the absolute value of this, letting us flip the
	# horizontal axis when we are moving backwards
	#
	# As a side effect, this also lets BLAHAJ sometimes dance
	$Sprite.flip_h = abs((sign(move.x) - 1.0) * 0.5)

	move = move_and_slide(move, Vector2.UP)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
