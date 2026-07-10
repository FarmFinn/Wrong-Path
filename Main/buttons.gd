extends Control

func disable():
	$STARt.disabled = true
	$Exit.disabled = true
	$Setting.disabled = true

func _on_start_mouse_entered():
	$STARt.self_modulate.v += 0.1
	$STARt/LIGHT.self_modulate.a += 0.1

func _on_start_mouse_exited():
	$STARt.self_modulate.v -= 0.1
	$STARt/LIGHT.self_modulate.a -= 0.1

func _on_start_button_down():
	$STARt.self_modulate.v -= 0.1
	$STARt/LIGHT.self_modulate.a -= 0.1

func _on_start_button_up():
	$STARt.self_modulate.v += 0.1
	$STARt/LIGHT.self_modulate.a += 0.1

func _on_start_pressed():
	disable()
	get_parent().get_child(3).pause()
	for i in range(120):
		if (i<60):
			modulate.v -= 1.0/60
			get_parent().get_child(0).get_child(1).self_modulate.v -= 1.0/60
			get_parent().get_child(1).get_child(0).self_modulate.v -= 1.0/60
		get_parent().get_child(1).self_modulate.v -= 1.0/120
		await get_tree().create_timer(1.0/60).timeout
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://Life/life.tscn")


func _on_exit_mouse_entered():
	$Exit.self_modulate.v += 0.1
	$Exit/Light.self_modulate.a += 0.1

func _on_exit_mouse_exited():
	$Exit.self_modulate.v -= 0.1
	$Exit/Light.self_modulate.a -= 0.1

func _on_exit_button_down():
	$Exit.self_modulate.v -= 0.1
	$Exit/Light.self_modulate.a -= 0.1

func _on_exit_button_up():
	$Exit.self_modulate.v += 0.1
	$Exit/Light.self_modulate.a += 0.1

func _on_exit_pressed():
	disable()
	get_parent().get_child(3).pause()
	for i in range(120):
		if (i<60):
			modulate.v -= 1.0/60
			get_parent().get_child(0).get_child(1).self_modulate.v -= 1.0/60
			get_parent().get_child(1).get_child(0).self_modulate.v -= 1.0/60
			get_parent().get_child(2).self_modulate.v -= 1.0/60
		get_parent().get_child(1).self_modulate.v -= 1.0/120
		await get_tree().create_timer(1.0/60).timeout
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()


func _on_setting_mouse_entered():
	$Setting.self_modulate.v += 0.1
	$Setting/Light.self_modulate.a += 0.1

func _on_setting_mouse_exited():
	$Setting.self_modulate.v -= 0.1
	$Setting/Light.self_modulate.a -= 0.1

func _on_setting_button_down():
	$Setting.self_modulate.v -= 0.1
	$Setting/Light.self_modulate.a -= 0.1

func _on_setting_button_up():
	$Setting.self_modulate.v += 0.1
	$Setting/Light.self_modulate.a += 0.1

func _on_setting_pressed():
	disable()
