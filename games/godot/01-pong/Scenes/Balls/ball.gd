extends CharacterBody2D

@export var initial_speed = 20
@export var hit_acceleration_factor = 1.1

var current_speed = initial_speed

func _ready():
	# Set initial velocity
	self.velocity = Vector2(-initial_speed, 0).normalized() * current_speed

func from_angle_to_vector2(angle: float) -> Vector2:
	return Vector2(cos(angle), sin(angle))

func bounce_vector() -> Vector2:
	return Vector2(sign(self.velocity.x) * -1, sign(self.velocity.y) * -1).normalized()

func padel_bounce(collision: KinematicCollision2D):
	self.current_speed *= hit_acceleration_factor
	var angle = collision.get_angle(self.bounce_vector())
	self.velocity = from_angle_to_vector2(angle) * self.current_speed

func wall_bounce():
	self.velocity = Vector2(self.velocity.x, self.velocity.y * -1)

func back_wall_bounce():
	self.velocity = Vector2(self.velocity.x * -1, self.velocity.y)

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
