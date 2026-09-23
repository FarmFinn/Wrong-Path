extends Node

var stop = true
var opened = true
var room = 0
var light = 0

func _process(_delta: float) -> void:
	if (needed() and not V.opened):
		V.opened = true
	if (not needed() and V.opened):
		V.opened = false

		
func needed():
	if (V.room == 0 and V.light == 0):
		return true
	elif (V.room == 1 and V.light == 22):
		return true
	elif (V.room == 2 and V.light == 36):
		return true
	elif (V.room == 3 and V.light == 28):
		return true
	elif (V.room == 4 and V.light == 30):
		return true
	elif (V.room == 5 and V.light == 32):
		return true
	elif (V.room == 6 and V.light == 32):
		return true
	elif (V.room == 7 and V.light == 26):
		return true
	elif (V.room == 8 and V.light == 39):
		return true
	elif (V.room == 9 and V.light == 10):
		return true
	elif (V.room == 10 and V.light == 12):
		return true
	elif (V.room == 11 and V.light == 0):
		return true
	elif (V.room >= 100):
		return true
	else:
		return false
	#죽었을 때 light를 0으로 초기화
