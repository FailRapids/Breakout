extends Area2D

export(int) var max_hp = 2
export(Array,Color) var hp_colors = [Color()]

var hp = 0 setget set_hp,get_hp

func _ready():
	assert hp_colors.size() >= max_hp
	self.hp = max_hp

func _on_Block_body_entered(body):
	if body.is_in_group("Ball"): 
		if hp == 0:
			self.queue_free()
		else:
			self.hp -= 1

func set_hp(value):
	if value > hp_colors.size()-1:
		$"Body/BodyShape".color = hp_colors.back()
	else:
		$"Body/BodyShape".color = hp_colors[value]

	hp = value

func get_hp():
	return hp
		