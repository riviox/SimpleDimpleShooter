extends RigidBody3D

# Właściwości gracza
var move_speed = 5  # Prędkość poruszania się gracza
var mouse_sensitivity = 0.1  # Czułość myszki

func _ready():
	# Ukryj kursor myszki w grze
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta):
	# Poruszanie gracza
	var motion = Vector3()
	
	if Input.is_action_pressed("move_forward"):
		motion += -transform.basis.z  # Przód
	if Input.is_action_pressed("move_backward"):
		motion += transform.basis.z  # Tył
	if Input.is_action_pressed("move_left"):
		motion += -transform.basis.x  # Lewo
	if Input.is_action_pressed("move_right"):
		motion += transform.basis.x  # Prawo
	
	# Normalizuj kierunek ruchu, aby zachować stałą prędkość
	motion = motion.normalized() * move_speed
	
	# Obracanie gracza za pomocą myszki
	var mouse_motion = Input.get_action_strength("look")  # Pobierz ruch myszki
	rotate_y(deg_to_rad(-mouse_motion.x * mouse_sensitivity))
	
	# Zaktualizuj prędkość gracza
	linear_velocity = motion
