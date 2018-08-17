extends KinematicBody2D

var state_stack = []
var active_state = null setget set_active_state

onready var Commands =[
	"Start",
	"Pause",
	"Stop",
	"Clear",
	"Previous",
]

onready var States = {
	"Idle": $States/Idle,
	"Move": $States/Move,
}

var move_direction = Vector2() setget ,get_move_direction

var velocity = Vector2() setget ,get_velocity

func _ready():
	call_command("Start")
	self.active_state = States["Idle"]
	
func _process(delta):
	assert(state_stack.front().has_method("update"))
	var status = state_stack.front().update(delta)

	if status in Commands: call_command(status)
	if status in States: self.active_state = self.States[status]

func _physics_process(delta):
	assert(state_stack.front().has_method("physics_update"))
	var status = state_stack.front().physics_update(delta)
	if status in Commands: call_command(status)
	if status in States: self.active_state = self.States[status]

		
func call_command(command):
	match command:
		"":
			#NOP Should never happen (you fuck up)
			breakpoint
			
		"Start":
			assert self.state_stack.empty()
			self.state_stack.push_front(States["Idle"])
		"Pause":
			pass
		"Stop":
			self.state_stack = []
		"Clear":
			for i in range(len(self.state_stack)):
				assert(self.state_stack.front().has_method("exit"))
				self.state_stack.pop_front().exit()
				
		"Previous":
			assert not self.state_stack.empty() and len(self.state_stack) > 1
			self.state_stack.pop_front().exit()
			
			
func change_state(state ):
	var prev_state = self.state_stack.front() 
	match state:
		"":
			#NOP Should Never Happen(you fuck up)
			breakpoint
		"Move":
			call_command("Clear")
			self.state_stack.push_front(States[state])
		"Idle":
			call_command("Clear")
			self.state_stack.push_front(States[state])
	self.state_stack.front().enter(prev_state)

func _on_animation_finished(animation_name):
	assert self.state_stack.front().has_method("_on_animation_finished")
	var status = state_stack.front()._on_animation_finished(animation_name)

	if status in Commands: call_command(status)
	if status in States: self.active_state = self.States[status]

func _on_tween_finished(object,key):
	assert self.state_stack.front().has_method("_on_tween_finished")
	var status = state_stack.front()._on_tween_finished(object,key)  
	
	if status in Commands: call_command(status)
	if status in States: self.active_state = self.States[status]

	

		
func apply(dt, force, direction, velocity): 
	if (sign(direction.x) != sign(velocity.x)) and abs(velocity.x) != 0:
		if sign(direction.x) != 0:
			force.x = 2*force.x

	var new_velocity = velocity
	force *= dt
	if direction.x != 0 :
		new_velocity.x += force.x * direction.normalized().x
	else:
		new_velocity.x -= force.x * velocity.normalized().x
	
	if direction.y != 0:
		new_velocity.y += force.y * direction.normalized().y
	else:
		new_velocity.y -= force.y * velocity.normalized().y
	
	var steered_velocity = new_velocity + (new_velocity-velocity)
	
	return steered_velocity

		
func get_move_direction():
	return move_direction
	
func set_active_state(state):
	assert state.name in States
	active_state = state
	change_state(state.name)

func get_velocity():
	return velocity


