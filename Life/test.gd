extends ColorRect

var repeat = 0

func _ready():
	if (name != "Wave"):
		#print("Appeared" in name)
		material = material.duplicate() # 유일하게 만들기
		
		var pos = get_parent().get_parent().get_child(4).position
		(material as ShaderMaterial).set_shader_parameter(
			"center",
			Vector2(720+(pos.x*0.75),405+(pos.y*0.75))
		)
		
		if ("Appeared" in name):
			(material as ShaderMaterial).set_shader_parameter(
				"ring_color",
				Color(1.0, 0.5, 0.5, 0.5)
			)
		elif ("Wrong" in name):
			(material as ShaderMaterial).set_shader_parameter(
				"ring_color",
				Color(1.0, 0.0, 0.0, 0.5)
			)
			(material as ShaderMaterial).set_shader_parameter(
			"center",
			Vector2(0,405+(pos.y*0.75))
			)
		else:
			(material as ShaderMaterial).set_shader_parameter(
				"ring_color",
				Color(0.5, 1.0, 0.75, 0.5)
			)
	else:
		(material as ShaderMaterial).set_shader_parameter(
			"ring_color",
			Color(0.0, 0.0, 0.0, 0.0)
		)
		
	
var r := 0.0
var a = 0

func _process(delta):
	if (name != "Wave"):
		r += 600.0 * delta

		(material as ShaderMaterial).set_shader_parameter(
			"radius",
			r
		)
		
		if (r >= 1700):
			queue_free()

func _on_life_appeared():
	if (name == "Wave"):
		repeat += 1
		var ripple = self.duplicate()
		ripple = clean(ripple)
		ripple.name = "Appeared" + str(repeat)
		add_child(ripple)
		
		const script = preload("res://Life/test.gd")
		ripple.set_script(script)

func _on_life_wrong():
	if (name == "Wave"):
		repeat += 1
		var ripple = self.duplicate()
		ripple = clean(ripple)
		ripple.name = "Wrong" + str(repeat)
		add_child(ripple)
		
		const script = preload("res://Life/test.gd")
		ripple.set_script(script)
		
func _on_life_right():
	if (name == "Wave"):
		repeat += 1
		var ripple = self.duplicate()
		ripple = clean(ripple)
		ripple.name = "Right" + str(repeat)
		add_child(ripple)
		
		const script = preload("res://Life/test.gd")
		ripple.set_script(script)
		
func clean(node):
	for i in node.get_children():
		i.free() # 왜.
	return node
