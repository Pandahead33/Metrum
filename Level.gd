extends Area2D

onready var effect = get_node("Tween")
onready var sprite = get_node("Sprite")

func _ready():
	effect.interpolate_property($Sprite, 'position', $Sprite.get_position_in_parent(), Vector2(240, 300.0), 0.5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	#effect.interpolate_property(self, "position",
    #            Vector2(300, 600), Vector2(300, 240), 1,
     #           Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	effect.interpolate_property(self, "scale",
                Vector2(1, 1), Vector2(1.0, 10.0), 1,
                Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	#effect.interpolate_property(sprite, 'visibility/opacity', 1, 0, 10, Tween.TRANS_QUAD, Tween.EASE_OUT)
	effect.interpolate_property($Sprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_SINE, Tween.EASE_IN)
	effect.start()
	
func _on_Tween_tween_completed(object, key):
	effect.interpolate_property(self, "scale",
                Vector2(1.0, 10.0), Vector2(1.0, 1.0), 1,
                Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	effect.start()
	print("tweened!")
