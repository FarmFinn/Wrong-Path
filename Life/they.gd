extends CharacterBody2D

const SPEED = 400.0
const JUMP_VELOCITY = -800.0

signal stepped
var previous = null

func _physics_process(delta):
	
	if (not V.stop):
		
		modulate.h += 0.5/360
		
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
			previous = null
		
		else:
			var tile_coord = get_parent().get_child(5).local_to_map(get_parent().get_child(5).to_local(global_position))
			tile_coord = Vector2i(tile_coord.x, tile_coord.y+1)
			var tile_data = get_parent().get_child(5).get_cell_tile_data(tile_coord)
			if (tile_data and (tile_coord != previous)):
				if (tile_data.get_custom_data('test')):
					previous = tile_coord
					stepped.emit(tile_coord)
	
		# Handle jump.
		if Input.is_action_just_pressed("ui_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
	
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED*0.5)
	
		move_and_slide()
