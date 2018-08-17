extends "State.gd"

export(int) var Acceleration  = 10 
export(int) var Max_Speed  = 30

func enter(prev_state):
	.enter(prev_state)

func exit():
	.exit()
	self.owner.velocity.x = 0

func update(dt):
	.update(dt)
	
	


func physics_update(dt): 
	var direction = owner.move_direction
	if direction.x != 0:
		owner.velocity = owner.move_and_slide(
			owner.apply(dt, Vector2(self.Acceleration,0),Vector2(direction.x, 0),
			
			Vector2(
				clamp(owner.velocity.x,-self.Max_Speed,self.Max_Speed),
				owner.velocity.y)
		))
	else:
		owner.velocity = owner.move_and_slide(
			owner.apply(dt, Vector2(6.5*self.Acceleration,0),Vector2(0, 0),
			
			Vector2(
				clamp(owner.velocity.x,-self.Max_Speed,self.Max_Speed),
				owner.velocity.y)
		))
		if (abs(owner.velocity.x) <= 10):
			return "Idle" 
	return ""

	
	






