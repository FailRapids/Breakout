extends "res://Platformer/Characters/States/Jump.gd"

func handle_input(event):
	if event.is_action_pressed("Jump") and not event.is_echo(): 
		if not self.double and not owner.is_on_ground():
			self.falling = false
			self.double = true
			self.start_height = owner.position.y

	 