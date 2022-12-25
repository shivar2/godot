extends Control

onready var go_button = $"Button-title-go"


func _on_Username_Field_text_entered(username):
	$TitleUsername.text = username


func _process(delta):
	go_button.connect('pressed', self, 'change_scene')
	
func change_scene():
	$TransitionScreen.transition()
	
func _on_TransitionScreen_transitioned():
	get_tree().change_scene("res://ProjectScene.tscn")
