extends RigidBody3D

@export var thrust: float = 1000.0
@export  var rotation_speed: float = 100.0

@onready var explosion_audio: AudioStreamPlayer = $ExplosionAudio
@onready var succes_audio: AudioStreamPlayer = $SuccesAudio
@onready var rocket_audio: AudioStreamPlayer3D = $RocketAudio

var _is_transitioning: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("boost"):
		apply_central_force(basis.y * delta * thrust)
		if rocket_audio.playing == false:
			rocket_audio.play()
	else:
		rocket_audio.stop()
		
	if Input.is_action_pressed("left"):
		apply_torque(Vector3(0.0, 0.0 , rotation_speed * delta))
		
	if Input.is_action_pressed("right"):
		apply_torque(Vector3(0.0, 0.0 , -rotation_speed * delta))

func _on_body_entered(body: Node) -> void:
	if _is_transitioning == false: 
		if "Goal" in body.get_groups():
			_complete_level(body.file_path)
			
		if "Hazard" in body.get_groups():
			_crash_sequence()
	
func _crash_sequence() -> void:
	explosion_audio.play()
	set_process(false)
	_is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(get_tree().reload_current_scene)

func _complete_level(next_level_file: String) -> void:
	succes_audio.play()
	set_process(false)
	_is_transitioning = true
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file))
