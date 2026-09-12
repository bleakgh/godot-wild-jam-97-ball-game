extends Node3D

#rendering
@onready var ball: MeshInstance3D = %ball

#physics
@onready var area: Area3D = $area
var colliding: bool = false

#movement control
var left_key_down: bool
var right_key_down: bool
var start_facing: Vector2 = Vector2(0,1)
var facing: Vector2 = Vector2(0,1)
var rotation_speed: float = deg_to_rad(30.0)
var velocity: Vector3 = Vector3.ZERO
var speed_cap: float = 4.
var scrolled: bool = false

#INPUT KEYS
var right_input_key: int = KEY_D
var left_input_key: int = KEY_A
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func _physics_process(delta: float) -> void:
	if left_key_down < right_key_down:
		facing = facing.rotated(rotation_speed*delta*-1.0)
	elif right_key_down < left_key_down:
		facing = facing.rotated(rotation_speed*delta)
	if scrolled:
		self.velocity += delta*Vector3.FORWARD.rotated(Vector3.UP,start_facing.angle_to(facing))
	else:
		self.velocity -= self.velocity*delta*0.05
	if self.velocity.length()>speed_cap: self.velocity*=0.9
	if not scrolled and self.velocity.length()<0.001: self.velocity = Vector3.ZERO
	if self.area.has_overlapping_bodies() and not colliding:
		facing.x = self.velocity.x*-1.0
		facing.y = self.velocity.z
		colliding = true
		self.velocity*=-1.0
	elif not self.area.has_overlapping_bodies():
		colliding = false
	self.global_position+=self.velocity*delta
	scrolled = false
	rotate_ball_mesh(delta)

func rotate_ball_mesh(delta: float):
	var rv = self.velocity.normalized().cross(Vector3.DOWN)
	var phi = self.velocity.length()*delta/(ball.mesh.radius*self.scale.x)
	ball.rotate(rv,phi)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed: scrolled = true
	if event is InputEventKey:
		if event.keycode == right_input_key: right_key_down = event.pressed
		if event.keycode == left_input_key: left_key_down = event.pressed
