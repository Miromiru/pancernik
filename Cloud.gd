extends RigidBody2D

func _ready():
	var cloud_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = cloud_types[randi() % cloud_types.size()]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
