extends Node2D

var Ready = false
signal Appeared
signal Wrong
signal Right

func _ready():
	pass #They appears
	V.stop = false
	Appeared.emit()
	for i in range(60):
		$Base/Background.modulate.v = (i+1)/120.0
		await get_tree().create_timer(1.0/60).timeout
		
func _process(_delta):
	if ($THEY.position.x > 928 and (not V.stop)):
		V.stop = true
		Wrong.emit()
		$TileMapLayer.position.x -= 1920
		$THEY.position.x -= 1920
		
		for i in range(45):
			$THEY.velocity.x = 400.0
			if not $THEY.is_on_floor():
				$THEY.velocity += $THEY.get_gravity() * 1.0/60
			$THEY.move_and_slide()
			await get_tree().create_timer(1.0/60).timeout
		V.stop = false

func _on_appeared():
	for i in range(240):
		if (i<60):
			$THEY.modulate.s = (i+59)/480.0
		#$Waves/Wave.scale.x = (i+1)/30.0
		#$Waves/Wave.scale.y = (i+1)/30.0
		#if (i>=120):
		#	$Waves/Wave.modulate.a = (239-i)/120.0
		await get_tree().create_timer(1.0/60).timeout
