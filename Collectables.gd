extends Node2D


var Cherry = preload("res://Collectables/Cherry.tscn")


func _on_timer_timeout():
	var cherryTemp = Cherry.instantiate()
	var rng = RandomNumberGenerator.new()
	var ranint = rng.randi_range(20, 2125)
	cherryTemp.position = Vector2(ranint,296)
	get_node("Cherries_box").add_child(cherryTemp)
