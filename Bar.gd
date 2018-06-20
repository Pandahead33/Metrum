extends Container

var BAR_SPEED
var progress
onready var effect = get_node("Tween")
onready var sprite = $HBoxContainer/TextureProgress

func _ready():
	progress = 10
	BAR_SPEED = 2.0
	effect.interpolate_property(sprite, 'value', 10, 83, BAR_SPEED, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#effect.interpolate_property(sprite, 'visibility/opacity', 1, 0, 10, Tween.TRANS_QUAD, Tween.EASE_OUT)
	#effect.interpolate_property($Sprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_SINE, Tween.EASE_IN)
	effect.start()
	set_process(true)
	
func _process(delta):
	progress = sprite.get("value")
	if(effect.is_active()):
		pass
		#print("Process: " + str(sprite.get("value")))
	
func _on_Tween_tween_completed(object, key):
	if sprite.get("value") == 83:
		effect.interpolate_property(sprite, 'value', 83, 10, BAR_SPEED, Tween.TRANS_LINEAR, Tween.EASE_IN)
	else:
		effect.interpolate_property(sprite, 'value', 10, 83, BAR_SPEED, Tween.TRANS_LINEAR, Tween.EASE_IN)
	effect.start()
	#print("tweened!" + str(sprite.get("value")))
