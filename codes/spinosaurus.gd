extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 150
var chase = false



func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	var player = get_tree().get_first_node_in_group("player") as Node2D


	if player:
		
		if chase:
			var direction = (player.position - self.position).normalized()
			velocity.x = direction.x * speed
		else:
			velocity.x = 0



	move_and_slide()





func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		chase = true




func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		chase = false


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.health -= 20
