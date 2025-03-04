extends CharacterBody2D

@export var initial_speed = 20
@export var hit_acceleration_factor = 1.1

var current_speed = initial_speed

func _ready():
	# Set initial velocity
	self.velocity = Vector2(-initial_speed, 0).normalized() * current_speed


func bounce_vector() -> Vector2:
	return Vector2(sign(self.velocity.x) * -1, sign(self.velocity.y) * -1).normalized()

func padel_bounce(_collision: KinematicCollision2D):
	self.current_speed *= hit_acceleration_factor
	self.velocity = self.bounce_vector() * self.current_speed

func wall_bounce():
	self.velocity = self.bounce_vector()

func _physics_process(_delta):
	# Maintain constant speed
	self.velocity = velocity.normalized() * current_speed
	var collision = self.move_and_collide(self.velocity)
	if collision:
		var collider = collision.get_collider()
		if collider is CharacterBody2D:
			self.padel_bounce(collision)
		else:
			self.wall_bounce()
