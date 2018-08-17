extends "res://Platformer/Characters/States/Move.gd"

func handle_input(event):
	if event.is_action_pressed("Jump"):
		if owner.is_on_ground():
			return "Jump"
		else:
			$'../Jump'.double = true
			return "Jump"
	if event.is_action("Sprint") and event.is_pressed():
		return "Sprint"
	
