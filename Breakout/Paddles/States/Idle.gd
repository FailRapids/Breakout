extends "State.gd"

var Acceleration
var Max_Speed

func enter(prev_state):
	.enter(prev_state)
	self.owner.velocity = Vector2()
	self.Acceleration = $"../Move".Acceleration 
	self.Max_Speed = $"../Move".Max_Speed
	
func exit():
	.exit()

func update(dt):
	.update(dt)
	if self.owner.move_direction.x != 0:
		return "Move"
	return ""

func physics_update(dt):
	pass
	
