extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var speed = 100
var chase = false

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += 0

	var player = get_tree().get_first_node_in_group("player") as Node2D
	var direction = (player.position - self.position).normalized()	

	move_and_slide()

	if direction.x < 0:
		$AnimatedSprite2D.flip_h = true
	else :
		$AnimatedSprite2D.flip_h = false

func _on_detector_body_entered(body: Node2D) -> void:
	if body.name == "player" :
		chase = true


func _on_detector_body_exited(body: Node2D) -> void:
	if body.name == "player" :
		chase= false


func _on_attack_body_entered(body: Node2D) -> void:
	if body.name == "player" :
		Global.health -= 25
