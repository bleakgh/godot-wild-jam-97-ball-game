extends Node2D


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var sf:Vector2 = %Player.start_facing
	var f:Vector2 = %Player.facing
	self.rotation = -1.0*sf.angle_to(f)
