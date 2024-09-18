extends RigidBody2D

@onready var game_manager: Node = %GameManager

func _on_area_2d_body_entered(body: Node2D) -> void:
	# Check if the entering body is the player
	if body.name == "Player":
		# Compute the difference in Y positions
		var y_delta = position.y - body.position.y
		var x_delta = body.position.x - position.x
		if y_delta > 30:
			print("Destroy enemy")
			queue_free()
			body.jump()
		else:
			print("decrease player health")
			game_manager.decrease_health()
			if x_delta > 0:
				body.jump_side(500)
			else:
				body.jump_side(-500)
