class_name Character

extends Node

@export var profession : String
@export var health : int

#create instance of equipment class
var chest := Equipment.new()
var legs := Equipment.new()

#inner class
class Equipment:
	var armor := 10
	var weight := 5

func die() :
	health = 0
	print (profession + " died.")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	chest.armor = 20
	print(chest.armor)
	print(legs.weight)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
