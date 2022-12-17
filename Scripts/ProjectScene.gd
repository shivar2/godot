extends Spatial

var effect
var recording = null

func _ready():
	var index = AudioServer.get_bus_index("Record")
	effect = AudioServer.get_bus_effect(index, 0)
	
func _input(delta):
	if Input.is_key_pressed(KEY_R):
		if effect.is_recording_active():
			recording = effect.get_recording()
			effect.set_recording_active(false)
			print("Play or Record Again")
	
		else:
			effect.set_recording_active(true)
			print("Is Recording..")
			
	elif Input.is_key_pressed(KEY_P):
		if recording:
			$AudioStreamPlay.stream = recording
			$AudioStreamPlay.play()
			recording = null
		else:
			print("Record Audio, Then Press P to Play!")
