extends CharacterBody2D

var run_speed = 400.0
var walk_speed = 200.0
var big_jump = -500
var small_jump = -400
var run = walk_speed
var jump

@onready var pick_up = $UI/CanvasLayer/pick_up
@onready var inventory_ui = $inventory_UI

func _ready():
	Global.set_player_reference(self)


func _physics_process(delta):
	# Добавление гравитации
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Обработка прыжка
	if Input.is_action_pressed("ui_accept") and is_on_floor():
		if Input.is_action_pressed("shift") and Global.stamina >= 10:
			velocity.y = big_jump
			Global.stamina -= 10 
		else:
			velocity.y = small_jump

	# Получение направления ввода и обработка движения/замедления
	var direction = Input.get_axis("A", "D")
	if direction:
		velocity.x = direction * run
	else:
		velocity.x = move_toward(velocity.x, 0, run)

	# Проверка на бег
	if Input.is_action_pressed("shift") and Global.stamina > 0 and velocity.x != 0:
		run = run_speed
		Global.stamina -= 10 * delta  # Уменьшаем выносливость во время бега
	else:
		run = walk_speed

	# Проверка здоровья
	if Global.health <= 0:
		$CollisionShape2D.disabled = true
		$".".velocity.y = 0
		$".".velocity.x = 0
		$".".hide()
		$UI/CanvasLayer/dead_menu.visible = true
		$UI/AnimationPlayer.play("show_die_menu")

	# Движение
	move_and_slide()

func _input(event):
	if event.is_action_pressed("inventory"):
		inventory_ui.visible = !inventory_ui.visible
		
