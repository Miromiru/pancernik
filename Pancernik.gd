extends KinematicBody2D

export (int) var jump_speed = -740
export (int) var gravity = 1100
signal hit

var velocity = Vector2()
var on_floor = true
var skok = false

func _ready():
	$AnimationPlayer.play("Walk")
	pass 


func _process(delta):	
	if Input.is_action_just_pressed("ui_up") and on_floor or skok == true and on_floor:
		velocity.y = jump_speed	
		$AnimationPlayer.play("Jump")
		on_floor = false
	if velocity.length() > 0:
		velocity.y += gravity * delta
	move_and_collide(velocity * delta)
	if velocity.y > 740:
		$AnimationPlayer.play("Walk")
		on_floor = true
		skok = false


var game_is_over = false

func _on_TouchScreenButton_pressed():
	skok = true
	if game_is_over:
		get_tree().change_scene("res://StartMenu.tscn")

func _on_Area2D_area_entered(area):
	emit_signal("hit")
	game_is_over = true
	$Particles2D.emitting = true
	velocity.y = 0
	$AnimationPlayer.play("Death")
	
	
func Visibility():
	self.visible = false
