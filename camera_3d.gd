extends Camera3D

@onready var base_offset: Vector3 = Vector3.UP*25
var offset:Vector3
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position = %Player.global_position+offset
	
