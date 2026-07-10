extends Node2D

var Ready = false

func _ready():
	pass #They appears
	V.stop = false
	for i in range(60):
		$Base/Background.modulate.v = (i+1)/120.0
		await get_tree().create_timer(1.0/60).timeout
