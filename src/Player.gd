extends Sprite3D

var move_speed = 10
var bullet_speed = 20
var bullet_scene = preload("res://Bullet.tscn")

func _process(delta):
	var motion = Vector3()
	
	if Input.is_action_pressed("W"):
		motion -= transform.basis.z
	if Input.is_action_pressed("S"):
		motion += transform.basis.z
	if Input.is_action_pressed("A"):
		motion -= transform.basis.x
	if Input.is_action_pressed("D"):
		motion += transform.basis.x
	
	motion = motion.normalized() * move_speed
	motion.y = -20  # Gravitational pull
	
	translate(motion)
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var bullet = bullet_scene.instance()
	var bullet_direction = -transform.basis.z
	bullet.global_transform.origin = global_transform.origin
	bullet.set_linear_velocity(bullet_direction * bullet_speed)
	get_parent().add_child(bullet)
