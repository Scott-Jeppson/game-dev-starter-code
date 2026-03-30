extends RigidBody2D

@onready var groundDetector = $groundDetector
@export var speed = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("move_left"):
		position.x -= speed * delta
	if Input.is_action_pressed("move_right"):
		position.x += speed * delta
	if groundDetector.is_colliding() and Input.is_action_pressed("jump"):
		linear_velocity.y -= 200
