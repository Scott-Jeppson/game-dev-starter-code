extends RigidBody2D

@onready var groundDetector = $groundDetector
@export var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("running")
		linear_velocity.x -= speed * delta
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("running")
		linear_velocity.x += speed * delta
	if groundDetector.is_colliding() and Input.is_action_pressed("jump"):
		linear_velocity.y -= 400
	if not Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("default")
