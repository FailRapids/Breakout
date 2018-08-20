extends StaticBody2D

export(int) var max_hp = 3
export(Array,Color) var hp_colors = [Color()]

var hp = 0 setget set_hp

func _ready():
	assert hp_colors.size() >= max_hp
	self.hp = max_hp

func take_damage(amnt):
	if self.hp:
		self.hp -= amnt
	else:
		self.queue_free()


func set_hp(value):
	if value > hp_colors.size()-1:
		$"BodyShape".color = hp_colors.back()
	else:
		$"BodyShape".color = hp_colors[value]

	hp = value
