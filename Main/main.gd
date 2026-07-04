extends Node2D


func _ready() -> void:
	$Logo.play("Emerging")
	await get_tree().create_timer(5.5).timeout
	for i in range(60):
		$Logo/Light.modulate.a = (i+1)/60.0
		$Logo.position.y -= (25/6.0)*(sin((TAU/60)*(i-14))+1)
		await get_tree().create_timer(1.0/60).timeout


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
