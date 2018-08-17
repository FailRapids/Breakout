extends RigidBody2D
export(int,100,600) var max_speed = 400
func _on_Ball_body_entered(body):
	self.linear_velocity =(5*self.linear_velocity).clamped(max_speed)
