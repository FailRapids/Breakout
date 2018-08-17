extends Node

onready var _Character = $"../.."
onready var _AnimationPlayer = $"../../AnimationPlayer"
onready var _Tween = $"../../Tween"

var prev_state 
var time_in_state = 0

func enter(prev_state):
	self.prev_state = prev_state

func exit():
	self.time_in_state = 0

func handle_input(event):
	return ""
	
func update(dt):
	self.time_in_state += dt
	return ""

func physics_update(dt):
	return ""

func _on_animation_finished(animation_name):
	return ""

func _on_tween_finshed(object,key):
	return ""
