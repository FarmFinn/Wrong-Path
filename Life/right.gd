extends Area2D

var Righted = false

func _process(_delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "THEY"):
		Righter.Righted = true
