extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#print text in console
	print("Hello world")
	
	#print text in label
	$Label.text = "Hello world too"
	$Label.modulate = Color.RED

#change color if spacebar pressed
func _input(event):
	if event.is_action_pressed("my_action"):
		$Label.modulate = Color.BLUE
		
	if event.is_action_released("my_action"):
		$Label.modulate = Color.RED
