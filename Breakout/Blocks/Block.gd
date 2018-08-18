extends Area2D
export(int) var hp = 1
func _on_Block_body_entered(body):
	
	if body.is_in_group("Ball") and hp == 0:
		self.queue_free()
	elif body.is_in_group("Ball"):
		hp -= 1
		