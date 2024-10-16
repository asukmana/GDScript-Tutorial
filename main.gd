extends Node

var health = 100

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
			$Label.text = str(health)
		else:
			$Label.text = "Game Over"
		
	if event.is_action_released("my_action"):
		$Label.modulate = Color.DARK_BLUE
