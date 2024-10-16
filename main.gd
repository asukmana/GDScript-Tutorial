extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Hello world")
	$Label.text = "Hello world too"
	#$Label.horizontal_alignment = INLINE_ALIGNMENT_CENTER
	#$Label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	$Label.modulate = Color.ORANGE_RED
	#$Label.add_theme_font_size_override("16",90)
