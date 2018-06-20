extends Node

var current_color
var last_color
onready var effect = get_node("Tween")
onready var sprite = $icon

func _ready():
	last_color = 1
	random_color()
	pass

func random_color():
	randomize()
	current_color = range(1,5)[randi()%range(1,5).size()]
	
	while last_color == current_color:
		current_color = range(1,5)[randi()%range(1,5).size()]
		
	print(current_color)
	if current_color == 1:
		$ColorRect.color = Color("#ff00f9ff") #blue
		effect.interpolate_property(sprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if current_color == 3:
		$ColorRect.color = Color("ff10ca43") #green
		effect.interpolate_property(sprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if current_color == 2:
		$ColorRect.color = Color("ffca1019") #red
		effect.interpolate_property(sprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	if current_color == 4:
		$ColorRect.color = Color("#ffff8300") #orange
		effect.interpolate_property(sprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	last_color = current_color