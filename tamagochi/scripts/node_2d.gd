extends Node2D
@onready var popup_menu=$popup_menu
@onready var player=$Player
@onready var games=$games
@onready var control=$food
var menulayer=0
var menuchosen=0
var maxmenu=0

func _ready() -> void:
	popup_menu.hide()
	games.hide()
	control.hide()
	#popup_menu.hideall()

func _process(delta) :
	if Input.is_action_just_pressed("a"):#doing this right now
		pass
		a()
	if Input.is_action_just_pressed("b"):#doing this right now
		pass
		b()
	if Input.is_action_just_pressed("c"):#doing this right now
		pass
		c()

func a():
	if(player.poopd==true):
		player.clean()
	elif(player.state=="egg"):
		print("pat")
	elif(menulayer<4&&menulayer>0):
		menuchosen+=1
		if(menuchosen==maxmenu):
			menuchosen=0
		print(menuchosen)
	elif(menulayer==0):
		print("menu")
		popup_menu.show()
		#color change
		menulayer=1
		menuchosen=0
		maxmenu=2
		#sas$StartButton.grab_focus()
	else:
		print("hiba \"a()\" ")

func b():
	if(menulayer==0):
		print("time")
	elif(menulayer==2):
		if(menuchosen==0):
			print("fed pizza")
			control.hide()
			player.hunger+=4
		
		else:
			print("snack")
			control.hide()
			player.happines+=3
		menulayer=0
	elif(menulayer==3):#games,idk how it will be
		if(menuchosen==0):
			print("game1")
			menulayer=4
		else:
			print("game2")
			menulayer=5
		menulayer=0
		games.hide()
	elif(menulayer==1):
		if(menuchosen==0):
			#food
			popup_menu.hide()
			control.show()
			menulayer=2
			print("foods menu")
		else:
			#games
			popup_menu.hide()
			games.show()
			menulayer=3
			print("games menu")
		menuchosen=0

func c():#asszem kész ez a rész
	#print("c")
	player.growup()
	if(menulayer==0):
		print(player.hunger)
		print(player.happines)
		player.check_condition()
	elif(menulayer==1):
		popup_menu.hide()
	elif(menulayer==3):
		games.hide()
	elif(menulayer==2):
		control.hide()
	menulayer=0
	menuchosen=0

func _on_button_button_down() -> void:
	a()
	pass # Replace with function body.
	#egg:pat
	#else:chose activity,feed,play,clean poop

func _on_button_2_button_down() -> void:
	pass # Replace with function body.
	#clock, choosing
	b()

func _on_button_3_button_down() -> void:
	pass # Replace with function body.
	#egg:look at it
	#else:back out/cancel, see status/get hug
	c()
