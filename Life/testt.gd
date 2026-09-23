extends TileMapLayer

var tobright = []

func _ready() -> void:
	notify_runtime_tile_data_update()
	
#func _process(delta: float) -> void:
#	notify_runtime_tile_data_update()

func _use_tile_data_runtime_update(_coords: Vector2i) -> bool:
#	return ((coords in tobright) or (coords in todark))
	return true

func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	if ((coords not in tobright) and (tile_data.get_custom_data("test"))):
		tile_data.modulate.v = 0.5
	else:
		tile_data.modulate.v = 1

func _on_they_stepped(coord: Vector2i) -> void:
	if (not (coord in tobright)):
		tobright.append(coord)
		V.light += 1
	else:
		tobright.erase(coord)
		V.light -= 1
	#print("Light" + str(V.light))
	notify_runtime_tile_data_update()


func _on_life_right():
	V.light = 0
	tobright = []
	notify_runtime_tile_data_update()
	print("Right")
