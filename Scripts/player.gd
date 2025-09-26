extends Character
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var dash_timer: Timer = $DashTimer
@onready var dash_cooldown: Timer = $DashCooldown
@onready var fall_timer: Timer = $FallTimer
var is_dashing = false
var dash_direction: float

func _ready():
	dash_timer.timeout.connect(end_dash)
	dash_cooldown.timeout.connect(reset_dash_cooldown)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	var direction := Input.get_axis("Move_left", "Move_right")
	if not is_on_floor():
		fall_timer.start(3)
		velocity += get_gravity() * delta
		if fall_timer.timeout:
			anim.play("Fall")

	# Handle actions.
	if Input.is_action_just_pressed("Dash") and not is_dashing and dash_cooldown.is_stopped():
		start_dash(direction)
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		anim.play("Jump")
		velocity.y = Jump_Velocity

	# Movement logic
	if is_dashing:
		velocity.x = dash_direction * Speed * 2.5
	elif direction:
		velocity.x = direction * Speed
		if direction == 1 and velocity.y == 0:
			anim.flip_h = false
			anim.play("Run")
		elif direction == -1 and velocity.y == 0:
			anim.flip_h = true
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, Speed)
		if velocity.y == 0:
			anim.play("Idle")
	
	print(velocity.x)
	move_and_slide()

func start_dash(direction: float):
	is_dashing = true
	if anim.flip_h == true:
		dash_direction = -1
	else:
		dash_direction = 1
	dash_timer.start(0.2)
	dash_cooldown.start()
	anim.play("Dash")

func end_dash():
	is_dashing = false
	velocity.x = 0

func reset_dash_cooldown():
	pass
