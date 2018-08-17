extends "res://Platformer/Characters/States/State.gd"


export(int) var Max_Height  = 15

var falling = false
var double  = false

var start_height 
var height 

func enter(prev_state):
	.enter(prev_state)
	self.start_height = owner.position.y
#	_AnimationPlayer.play("Jump")
	
func exit():
	.exit()
	self.falling = false
	self.double = false
	_AnimationPlayer.stop()

func update(dt):
	.update(dt)
	return ""
	
func physics_update(dt):
	var direction = owner.move_direction
	
	self.height = owner.position.y
	if (not self.falling) and (abs(height-start_height) < Max_Height):
		owner.velocity = owner.move_and_slide(
			owner.apply(dt,Vector2(prev_state.Acceleration,0),Vector2(direction.x,0),
			owner.apply(dt,Vector2(0,.35*pow(owner.gravity.y,2)),Vector2(0,-1),
			Vector2(
				clamp(owner.velocity.x,-self.prev_state.Max_Speed,self.prev_state.Max_Speed),
				owner.velocity.y
			))),Vector2(0,-1))
		if owner.is_on_ceiling():
			self.falling = true
			
	elif (abs(height-start_height) > Max_Height) or self.falling:
		self.falling = true
		owner.velocity = owner.move_and_slide(
			owner.apply(dt,Vector2(self.prev_state.Acceleration,0),Vector2(direction.x,0),
			owner.apply(dt,Vector2(0,.35*pow(owner.gravity.y,2)),Vector2(0,1),
			Vector2(
				clamp(owner.velocity.x,-self.prev_state.Max_Speed,self.prev_state.Max_Speed),
				owner.velocity.y
			))),Vector2(0,-1))
		if owner.is_on_floor():
			return "Previous"
				
	return ""

