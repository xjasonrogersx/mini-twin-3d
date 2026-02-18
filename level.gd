extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	load_gltf_segments("res://e291f2784ca3_gltf/", 64)

func load_gltf_segments(path: String, count: int):
	var gltf_document = GLTFDocument.new()
	var gltf_state = GLTFState.new()
	
	for i in range(1, count + 1):
		var file_name = "e291f2784ca3_" + str(i) + ".gltf"
		var full_path = path + file_name
		print("loading " + file_name)
		
		var node = load( full_path ).instantiate()
		
		$World.add_child(node)
		
		# Force generation if -col suffix fails
		if node is MeshInstance3D:
			node.create_trimesh_collision() 
		else:
			# If the GLTF is a scene, find the meshes inside
			for child in node.find_children("*", "MeshInstance3D"):
				child.create_trimesh_collision()
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
