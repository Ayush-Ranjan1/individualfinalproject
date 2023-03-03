extends KinematicBody2D

#vector2 manipulates 2d kinematic body
const moveup = Vector2(0,-1)
const gravity = 20 
const fallingspeed = 100
const movementspeed = 80
const jump = 200
const acc = 10

var movement = Vector2()

func _ready():
	pass 

func _physics_process(delta):
	movement.y += gravity
	if movement.y > fallingspeed:
		movement.y = fallingspeed

	if Input.is_action_just_pressed("right"):
		movement.x += acc
	elif Input.is_action_pressed("left"):
		movement.x -= acc
	else:
		movement.x = lerp(movement.x,0,0.5)
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			movement.y = -jump
