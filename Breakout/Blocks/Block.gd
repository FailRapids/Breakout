extends Area2D

func _on_Block_body_entered(body):
	if body.is_in_group("Ball"):
		self.queue_free()
