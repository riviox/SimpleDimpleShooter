extends Node3D

var speed = 10  # Prędkość pocisku

func _process(delta):
	# Przesuń pocisk w przód w każdej klatce
	translation.z += speed * delta

	# Usuń pocisk, jeśli przekroczy określoną odległość
	if translation.z > 100:  # Możesz dostosować odległość do własnych potrzeb
		queue_free()  # Usuń pocisk
