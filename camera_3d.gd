extends Camera3D

@onready var base_offset: Vector3 = Vector3.UP*25
var zoom: float = 0.0
var wait: float = 0.4
var bound: float = 20.0
var offset:Vector3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	offset = base_offset + Vector3.DOWN*zoom + delta*%Player.velocity*wait
	self.global_position = %Player.global_position+offset
	self.global_position.x = clamp(self.global_position.x, bound*-1.0, bound)
	self.global_position.y = clamp(self.global_position.y, bound*-1.0, bound)
	
