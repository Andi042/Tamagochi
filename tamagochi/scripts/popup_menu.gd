extends Control

@onready var games=$games
@onready var control=$food
@onready var popup_menu=$popup_menu
func _ready() -> void:
	$VBoxContainer/Button.grab_focus()#hibás

#func hideall():
	#games.hide()

func resume():
	get_tree().paused=false
	

func pause():
	get_tree().paused=true

func _on_button_pressed() -> void:
	pass # Replace with function body.
	print("fed")
	control.show()
	hide()
	#ifes rész toddler/adult snack

func _on_button_2_pressed() -> void:
	pass # Replace with function body.
	#print("game")
	#hide()
	#games.show()
	
