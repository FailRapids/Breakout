extends "res://Platformer/Characters/States/Idle.gd"

func handle_input(event):
	if event.is_action("Jump"):
		if event.is_pressed():
			return "Jump"
	
	return ""
