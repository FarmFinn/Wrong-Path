extends Node2D

var Ready = false
signal Appeared
signal Wrong
signal Right

func _ready():
	pass #They appears
	V.stop = false
	Appeared.emit()
		
func _process(_delta):
	if (V.opened and $TileMapLayer/StaticBody2D/Now.position.y == 88):
		$TileMapLayer/StaticBody2D/Now.modulate.s = 0
		$TileMapLayer/StaticBody2D/Now.modulate.v = 1
		for i in range (30):
			$TileMapLayer/StaticBody2D/Now.position.y = (-4.0/75)*((i+1)**2)+88
			await get_tree().create_timer(1.0/60).timeout
	
	if (not V.opened and $TileMapLayer/StaticBody2D/Now.position.y == 40):
		$TileMapLayer/StaticBody2D/Now.modulate.s = 0.25
		$TileMapLayer/StaticBody2D/Now.modulate.v = 0.75
		for i in range (30):
			$TileMapLayer/StaticBody2D/Now.position.y = (4.0/75)*((i+1)**2)+40
			await get_tree().create_timer(1.0/60).timeout
	
	if ($THEY.position.x > 928 and (not V.stop)):
		V.stop = true
		Wrong.emit()
		#$TileMapLayer.position.x -= 1920
		#$THEY.position.x -= 1920
		
		for i in range(60):
			if (i<40):
				$THEY.velocity.x = 400.0
				if not $THEY.is_on_floor():
					$THEY.velocity += $THEY.get_gravity() * 1.0/60
				$THEY.move_and_slide()
			$TileMapLayer.position.x -= 32*(sin((i-14)*2*PI/60)+1)
			if (i==29):
				V.room += 1
				V.light = 0
				V.opened = false
				print("Room" + str(V.room))
				$TileMapLayer/StaticBody2D/Past.position.y = 40
				$TileMapLayer/StaticBody2D.position.x += 480
				$TileMapLayer/StaticBody2D/Now.modulate.s = 0.25
				$TileMapLayer/StaticBody2D/Now.modulate.v = 0.75
				$TileMapLayer/StaticBody2D/Now.position.y = 88
			$THEY.position.x -= 32*(sin((i-14)*2*PI/60)+1)
			await get_tree().create_timer(1.0/60).timeout
		for i in range(30):
			$TileMapLayer/StaticBody2D/Past.position.y = (4.0/75)*((i+1)**2)+40
			if (i==9):
				V.stop = false
			await get_tree().create_timer(1.0/60).timeout
		
	if (Righter.Righted):
		Righter.Righted = false
		V.stop = true
		Right.emit()
		print("Right")
		
		pass #They disappears
		await get_tree().create_timer(0.1).timeout
		$THEY.position = Vector2(-736,320)
		$THEY.modulate.s = 0
		
		pass #They appears again
		await get_tree().create_timer(0.1).timeout
		Appeared.emit()
		V.stop = false

func _on_appeared():
	for i in range(240):
		if (i<60):
			$THEY.modulate.s = (i+1)/240.0
		#$Waves/Wave.scale.x = (i+1)/30.0
		#$Waves/Wave.scale.y = (i+1)/30.0
		#if (i>=120):
		#	$Waves/Wave.modulate.a = (239-i)/120.0
		await get_tree().create_timer(1.0/60).timeout
