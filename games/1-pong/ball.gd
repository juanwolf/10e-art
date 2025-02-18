extends RigidBody2D

@export var initial_speed = 200

func _ready():
	# Set initial velocity
	linear_velocity = Vector2(-initial_speed, initial_speed).normalized() * initial_speed
	
	# Disable gravity
	gravity_scale = 0
	
	# Set bounce to 1 for perfect reflection
	physics_material_override = PhysicsMaterial.new()
	physics_material_override.bounce = 1.0
	


func _physics_process(delta):
	# Maintain constant speed
	linear_velocity = linear_velocity.normalized() * initial_speed
	
	# Prevent getting stuck in vertical movement
	if abs(linear_velocity.y) > 0.95 * initial_speed:
		linear_velocity.x = sign(linear_velocity.x) * initial_speed * 0.3

func _on_body_entered(body):
	# Add a small impulse on collision to prevent losing momentum
	apply_central_impulse(linear_velocity.normalized() * 10)
