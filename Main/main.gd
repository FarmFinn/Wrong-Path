extends Node2D


func _ready() -> void:
	$Buttons.modulate.a = 0
	
	$Logo.play("Emerging")
	await get_tree().create_timer(5.5).timeout
	$AnimationPlayer.play("Intro")
	await get_tree().create_timer(4).timeout
	$AnimationPlayer.play("Loop")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
