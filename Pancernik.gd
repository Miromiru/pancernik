extends KinematicBody2D

export (int) var jump_speed = -740
export (int) var gravity = 1100

var velocity = Vector2()

func _ready():
	pass 


func _process(delta):	
	if Input.is_action_just_pressed("ui_up"):
		velocity.y = jump_speed	
		print("kupa")
	if velocity.length() > 0:
		velocity.y += gravity * delta
	position += velocity * delta


func _on_TouchScreenButton_pressed():
	velocity.y = jump_speed	
	print("kupa")
