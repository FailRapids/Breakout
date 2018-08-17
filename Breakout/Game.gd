extends Node2D
func _process(delta):
	if Input.is_action_pressed("Exit"):
		get_tree().reload_current_scene()
func _on_Death_body_entered(body):
	if body.is_in_group("Ball"):
		body.queue_free()
