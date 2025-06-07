extends CharacterBody2D


var player = CharacterBody2D
@export var state="egg"
@export var hunger=20
@export var happines=20
var current_time
var awaken=true
@export var poopd=false
@export var sleeptime="00:00:01"
@export var awaketime="00:00:00"
var daysfromstart=0
@export var growupdays=1
var starttime= Time.get_time_string_from_system()
var startmsec=Time.get_ticks_usec()
var tick_counter=0
var onetickhour=5184000

func poop():
	if(hunger>15&&awaken==true&&poopd==false):
		print("Az élet szééép")
		poopd=true

func clean():
	poopd=false
	print("cleaned")

func _ready() :
	current_time =  Time.get_time_string_from_system()
	print("start")
	state="egg"
	egg()
	happines=20
	hunger=20

func _process(delta):
	tick_counter=+1
	var current_time = Time.get_time_string_from_system()
	if(current_time==starttime&&tick_counter==19):#growup ,tikkre át írni---------------------
		daysfromstart=+1
		growup_time(current_time)
		tick_counter=0
	var timearray=current_time.split(":",false,2)
	
	if(Time.get_ticks_usec()%(onetickhour*4)==0):#hunger
		hungry()
	if(Time.get_ticks_usec()%(onetickhour*3)==0):#sadness
		sad()
	if(Time.get_ticks_usec()%(onetickhour*5)==0):
		poop()
		
	_sleeptime(current_time)

func check_condition():
	
	ishungry()
	ishappy()

func ishappy():
	if(happines>20):
		print("u r drunk,go home")
	elif(happines<10&&happines>=1):
		print("sad")
	elif(happines==0):
		print(":'(")
		
		$Timer.start(3600)
	else:
		print("normal")

func sad():
	happines=happines-1

func ishungry():
	if(hunger<10&&hunger>=1):
		print("hungry")
	elif(hunger==0):
		print("Aaaghhh")
		if(true):#wtf akar ez lenni?!
			$Timer2.start(3600)
	else:
		print("normal")

func hungry():
	if(awaken):
		hunger=hunger-1

func growup_time(time):
	if(daysfromstart==growupdays):
		growup()

func _sleeptime( time):
	if(time==sleeptime&&awaken):
		sleep(true)
	if(time==awaketime&&awaken==false):
		sleep(false)
		#player.play("sad")

func sleep(isaslep):
	if(isaslep):
		awaken=false
		print("sleep")
	else:
		awaken=true 
		print("wake")

func _on_timer_timeout() :
	#died
	print("by by")

func growup():
	if(state=="teen"):
		state="adult"
		adult()
	
	if(state=="toddler"):
		state="teen"
		teen()
	
	if(state=="egg"):
		state="toddler"
		toddler()

func egg():
	sleeptime="20:00:00"
	awaketime="19:59:59"
	growupdays=1
	#strite change
	#no food
	#pat
	#shine

func toddler():
	print("toddler")
	sleeptime="20:00:00"
	awaketime="08:00:00"
	growupdays=3
	#strite change
	#no snack
	#pat

func teen():
	print("teen")
	sleeptime="19:00:00"
	awaketime="07:00:00"
	#strite change
	growupdays=6
	#pat
	#games
	#események

func adult():
	print("adult")
	sleeptime="23:00:00"#18
	awaketime="06:00:00"
	#strite change
	#no pat
	#more esemény
	#friends?
	growupdays=12

func _on_timer_2_timeout() :
	print("by by")
