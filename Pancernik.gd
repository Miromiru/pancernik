extends KinematicBody2D

export (int) var jump_speed = -740
export (int) var gravity = 1100
signal hit
signal texturestatus(status)

var velocity = Vector2()
var on_floor = true
var skok = false

export (int) var status

func _ready():
	print(status)
	if status == 1:
		var image = preload("res://Assets/pancernikART.png")
		$Sprite.set_texture(image)
		print(status)
	if status == 2:
		var image = preload("res://Assets/pancernikART2.png")
		$Sprite.set_texture(image)
		print(status)
	if status == 3:
		var image = preload("res://Assets/pancernikART3.png")
		$Sprite.set_texture(image)
		print(status)
	if status == 4:
		var image = preload("res://Assets/pancernikART4.png")
		$Sprite.set_texture(image)
		print(status)
		
	$AnimationPlayer.play("Walk")



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


func _on_0Pancernik_pressed():
	var image = preload("res://Assets/pancernikART.png")
	$Sprite.set_texture(image)
	status = 1
	emit_signal("texturestatus", 1)
	print(status)


func _on_50Pancernik_pressed():
	var image = preload("res://Assets/pancernikART2.png")
	$Sprite.set_texture(image)
	status = 2
	emit_signal("texturestatus", 2)
	print(status)


func _on_150Pancernik_pressed():
	var image = preload("res://Assets/pancernikART3.png")
	$Sprite.set_texture(image)
	status = 3
	print(status)


func _on_200Pancernik_pressed():
	var image = preload("res://Assets/pancernikART4.png")
	$Sprite.set_texture(image)
	status = 4
	print(status)


