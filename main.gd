extends Node

# script level variable
# explicit data type
var health: int = 100 #var health = 100 -> implicit data type 
var player_name: String = "John Doe"
var pi: float = 3.14
var is_active: bool = true

# implied data type, this one must be integer
var xp := 0 

var random_integer = randi() # create integer random number
var random_float = randf() # create float random number

const GRAVITY = 9.8 #value cannot change at run time

#must be declared before function
enum PLAYER_STATES { IDLE, WALKING, RUNNING, JUMPING }

#expose a variable in the editor
@export var my_state : PLAYER_STATES
#use @export to put variable in inspector
#@export var my_node: Node

@onready var weapon: Sprite2D = $Player/Weapon
#same as @onready var weapon: get_node("Player/Weapon")

#declare signal with parameter
signal leveled_up(msg)

# underscore in front of function name -> function for internal use

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print text in console
	print("Hello world")
	
	#array
	var my_array: Array[String] = ["member 1", "member 2", "member 3"]
	my_array.append("member 4")
	my_array.remove_at(0)
	for array_member in my_array:
		print(array_member)
		
	for n in 3:
		print(n) # 0 1 2
	
	var ringing = 0	
	while ringing < 5:
		ringing += 1
		print(ringing)
		
	var my_dictionary = {
		"player 1": "kakak",
		"player 2": "mas",
		"player 3": "adik",
	}
	my_dictionary["player 4"] = "guest"
	
	for dictionary_member in my_dictionary:
		print(dictionary_member + " is " + my_dictionary[dictionary_member])
	
	# dictionary inside dictionary
	var another_dictionary = {
		"player 1": {"first name":"kakak","last name":"alya"},
		"player 2": {"first name":"mas","last name":"hamdan"},
		"player 3": {"first name":"adik","last name":"hamzah"},
	}
	print (another_dictionary["player 3"]["last name"])
	
	match my_state:
		PLAYER_STATES.IDLE:
			print("idle")
		PLAYER_STATES.RUNNING:
			print("running")
		PLAYER_STATES.WALKING:
			print("walking")
		PLAYER_STATES.JUMPING:
			print("jumping")
	
	#print and center text in label
	$Label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$Label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$Label.text = str(health)
	$Label.modulate = Color.DARK_BLUE
	
	$Button.text = "Cetak uang"
	
	#connecting signals using code instead of editor
	#leveled_up.connect(_on_leveled_up)

#change color if spacebar pressed
func _input(event):
	if event.is_action_pressed("my_action"):
		$Label.modulate = Color.DARK_RED
		if health > 0:
			health -= 10
			# function level variable 
			# does not have to be at the top, but it is recommended
			var sentence = reduce_health(player_name, str(health)) #str -> change integer to text
			$Label.text = sentence 
		else:
			$Label.text = "Game Over"
		
	if event.is_action_released("my_action"):
		$Label.modulate = Color.DARK_BLUE

func reduce_health(string1: String, string2: String) -> String:
	var sentence = string1 + " health is " + string2
	return sentence


func _on_button_pressed() -> void:
	print("uang")

func _on_timer_timeout() -> void:
	xp += 5
	print (xp)
	if xp >= 20:
		xp = 0
		leveled_up.emit("ting tong")


func _on_leveled_up(msg) -> void:
	print (msg)
