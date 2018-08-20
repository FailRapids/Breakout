extends KinematicBody2D

export(int) var speed = 750
export(int) var power = 2
var velocity = Vector2()

func _ready():
	velocity = Vector2(0, speed)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.normal)
		var body = collision.collider
		if body.is_in_group("Blocks"):
			body.take_damage(power)
