extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


var a = 0
func _integrate_forces(state):
	
	if get_contact_count() > 0:
		a += 0.08
	
	for i in range(get_contact_count()):
		#print("   " + str(i) + "--" + str(state.get_contact_local_shape(i)))
		
		var color = Color(
			sin(state.get_contact_local_shape(i)), 
			sin(state.get_contact_local_shape(i)+PI/3), 
			sin(state.get_contact_local_shape(i)+(PI/3)*2)
			)
		
		var label : Label3D = get_node("../Label3D").duplicate()
		label.position = state.get_contact_local_position(i) + Vector3(0,a,0)
		label.text = "   " + str(i) + "--" + str(state.get_contact_local_shape(i))
		get_parent().add_child(label)
