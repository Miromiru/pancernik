extends RigidBody2D


func _ready():
	var cactus_types = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = cactus_types[randi() % cactus_types.size()]

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
