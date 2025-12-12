extends Node3D

@export var destination: Vector3
@export var duration: float = 6

func _ready() -> void:
	var tween: Tween = create_tween()
	tween.set_loops(0)
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "global_position", global_position + Vector3(1,1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(2,-1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(3,1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(4,-1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(5,1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(6,-1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(5,1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(4,-1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(3,1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(2,-1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(1,1,0), duration / 6)
	tween.tween_property(self, "global_position", global_position + Vector3(0,-1,0), duration / 6)
