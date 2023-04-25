extends CharacterBody2D


const SPEED = 5

var enabled := false
var player : CharacterBody2D


func _ready():
	putAwaySaw()


func _process(delta):
	
	$Polygon2D.rotate(5 * PI * delta)
	



func _physics_process(delta):
	
	if enabled:
		velocity = get_local_mouse_position() * SPEED
		visible = true
		collision_layer = 0b100
		collision_mask = 0b100
		$DamageArea.collision_layer = 0b100
		$DamageArea.collision_mask = 0b100
	elif visible:
		velocity = -position * SPEED
		collision_layer = 0b0
		collision_mask = 0b0
		$DamageArea.collision_layer = 0b0
		$DamageArea.collision_mask = 0b0
	
	
	move_and_slide()
	
	if position.length() < 10:
		putAwaySaw()



func putAwaySaw():
	visible = false
	position = Vector2.ZERO

