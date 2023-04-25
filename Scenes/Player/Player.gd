extends CharacterBody2D


const SPEED = 300.0
const SPRINT_BOOST = 1.5
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity : float = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	$Saw.player = self


func _process(delta):
	$Saw.enabled = Input.is_action_pressed("saw")
	


func _physics_process(delta : float):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	var cur_speed := SPEED
	if Input.is_action_pressed("sprint"):
		cur_speed *= SPRINT_BOOST
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction : float = Input.get_axis("move_left", "move_right")
	
	if !is_zero_approx(direction):
		velocity.x = direction * cur_speed
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
