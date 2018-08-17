extends "res://Platformer/Characters/States/State.gd"

export(int) var Acceleration  = 10 
export(int) var Max_Speed  = 30

func enter(prev_state):
	.enter(prev_state)
#	_AnimationPlayer.play("Walk")

func exit():
	.exit()
	self.owner.velocity.x = 0
	_AnimationPlayer.stop()

func update(dt):
	.update(dt)
	if not owner.is_on_ground():
		return ""
	


func physics_update(dt): 
	var direction = owner.move_direction
	if direction.x != 0:
		owner.velocity = owner.move_and_slide(
			owner.apply(dt, Vector2(self.Acceleration,0),Vector2(direction.x, 0),
			owner.apply(dt, Vector2(0,.5*pow(owner.gravity.y,2)), Vector2(0,1),
			Vector2(
				clamp(owner.velocity.x,-self.Max_Speed,self.Max_Speed),
				owner.velocity.y)
		)))
	else:
		owner.velocity = owner.move_and_slide(
			owner.apply(dt, Vector2(6.5*self.Acceleration,0),Vector2(0, 0),
			owner.apply(dt, Vector2(0,.5*pow(owner.gravity.y,2)), Vector2(0,1),
			Vector2(
				clamp(owner.velocity.x,-self.Max_Speed,self.Max_Speed),
				owner.velocity.y)
		)))
		if (abs(owner.velocity.x) <= 1):
			return "Idle" 
	return ""

	
	






