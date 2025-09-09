extends RigidBody

# Kick force settings
export var kick_force = 10.0
export var kick_upward_bias = 0.3
export var torque_multiplier = 2.0

# Contact threshold
export var min_impact_force = 5.0

# Variables to track collision state
var last_collision_point = Vector3()
var is_being_kicked = false

func _ready():
	# Set up physics properties
	contact_monitor = true
	contacts_reported = 4
	# Connect collision signal
	connect("body_entered", self, "_on_body_collision")

func _on_body_collision(body):
	# Check if the colliding body is a character (assuming it's in the "player" group)
	if body.is_in_group("player"):
	   last_collision_point = global_transform.origin
	   _handle_kick(body, body)

func _handle_kick(collision, kicker):
	# Calculate kick direction based on kicker's forward vector
	var kick_direction = (global_transform.origin - kicker.global_transform.origin).normalized()
	
	# Add upward component for more natural arc
	kick_direction.y += kick_upward_bias
	kick_direction = kick_direction.normalized()
	
	# Calculate kick force based on kicker's velocity
#	var kick_velocity = Vector3()
#	if kicker.has_method("get_velocity"):
#		kick_velocity = kicker.get_velocity()
#
#	var impact_force = kick_velocity.length()
	
	# Only apply kick if impact force is significant
	if Input.is_action_pressed("kick"):
		# Apply the main kick force
		apply_central_impulse(kick_direction * kick_force)
		
		# Apply random torque for rotation
		var random_torque = Vector3(
			rand_range(-1, 1),
			rand_range(-1, 1),
			rand_range(-1, 1)
		).normalized() * torque_multiplier
		
		apply_torque_impulse(random_torque)
		
		# Optional: Emit particles or play sound
		_on_kicked()

func _on_kicked():
	# Placeholder for kick effects
	if has_node("KickParticles"):
		get_node("KickParticles").set_emitting(true)
	
	# You can add sound effects here
	if has_node("KickSound"):
		get_node("KickSound").play()

# Optional: Add visual feedback when box is interactive
func _on_player_nearby():
	# Add highlight shader or material change
	pass

func _on_player_left():
	# Remove highlight
	pass
