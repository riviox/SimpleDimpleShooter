extends MeshInstance3D

func _ready():
	generate_terrain()

func generate_terrain():
	var terrain_mesh = Mesh.new()
	var surface_tool = SurfaceTool.new()

	var terrain_size = Vector2(10, 10)  # Rozmiar terenu
	var num_segments = 100  # Ilość segmentów terenu

	var rand = Random.new()  # Nowy generator liczb losowych

	for i in range(num_segments + 1):
		for j in range(num_segments + 1):
			var x = i / num_segments * terrain_size.x
			var z = j / num_segments * terrain_size.y
			var y = rand.randf() * 2.0  # Losowa wysokość terenu

			surface_tool.add_vertex(Vector3(x, y, z))

	for i in range(num_segments):
		for j in range(num_segments):
			var a = i * (num_segments + 1) + j
			var b = a + num_segments + 1

			surface_tool.add_index(a)
			surface_tool.add_index(b)
			surface_tool.add_index(a + 1)

			surface_tool.add_index(b)
			surface_tool.add_index(b + 1)
			surface_tool.add_index(a + 1)

	surface_tool.index()
	terrain_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_tool.arrays())
	self.mesh = terrain_mesh
