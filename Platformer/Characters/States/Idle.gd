extends 'res://Platformer/Characters/States/State.gd'

var Acceleration
var Max_Speed

func enter(prev_state):
	.enter(prev_state)
#	_AnimationPlayer.play("Idle")
	self.Acceleration = $"../Move".Acceleration 
	self.Max_Speed = $"../Move".Max_Speed
	
func exit():
	.exit()
	_AnimationPlayer.stop()

func update(dt):
	.update(dt)
	if self._Character.move_direction.x != 0:
		return "Move"
	return ""

func physics_update(dt):
	_Character.velocity = owner.move_and_slide(
		_Character.apply(dt,Vector2(0,.5*pow(owner.gravity.y,2)),Vector2(0,1),
		_Character.velocity
		))
	return ""
