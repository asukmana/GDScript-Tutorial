extends Node

# script level variable
# explicit data type
var health: int = 100 #var health = 100 -> implicit data type 
var player_name: String = "John Doe"
var pi: float = 3.14
var is_active: bool = true

const GRAVITY = 9.8 #value cannot change at run time

# underscore in front of function name -> function for internal use
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print text in console
	print("Hello world")
	
	#print and center text in label
	$Label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	$Label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$Label.text = str(health)
	$Label.modulate = Color.DARK_BLUE

#change color if spacebar pressed
func _input(event):
	if event.is_action_pressed("my_action"):
		$Label.modulate = Color.DARK_RED
		if health > 0:
			health -= 10
			# function level variable 
			var sentence = reduce_health(player_name, str(health)) #str -> change integer to text
			$Label.text = sentence 
		else:
			$Label.text = "Game Over"
		
	if event.is_action_released("my_action"):
		$Label.modulate = Color.DARK_BLUE

func reduce_health(string1: String, string2: String) -> String:
	var sentence = string1 + " health is " + string2
	return sentence
