extends Control

export (int) var TOLERANCE
var bar1 
var bar2
var bar3
var bar4

func _ready():
	randomize()
	bar1 = new_value()
	bar2 = new_value()
	bar3 = new_value()
	bar4 = new_value()
	print(bar1)
	print(bar2)
	print(bar3)
	print(bar4)
	
	$Node.BAR_SPEED = 2.0/2
	$Node2.BAR_SPEED = 1.0/2
	$Node3.BAR_SPEED = 2.5/2
	$Node4.BAR_SPEED = 4.0/2
	
	$IcePart.position = Vector2($IcePart.get_transform().x.x + 44, 275 - int(bar1/20)*50-31)
	$FallPart.position = Vector2($FallPart.get_transform().x.x + 185+48, 275 - int(bar4/20)*50-31)
	$GreenPart.position = Vector2($GreenPart.get_transform().x.x + 44, 580 - int(bar3/20)*50+10)
	$RedPart.position = Vector2($RedPart.get_transform().x.x + 185+44, 580 - int(bar2/20)*50+10)
	
	if $Indicator.current_color == 1:
		$"Background Music/Ice Background".play()
	if $Indicator.current_color == 2:
		$"Background Music/Lava Background".play()
	if $Indicator.current_color == 3:
		$"Background Music/Nice Background".play()
	if $Indicator.current_color == 4:
		$"Background Music/Fall Background".play()
	
	set_process(true)

func _process(delta):
	
	$TimeLeft.text = str(round($Timer.time_left))
	
	if Input.is_action_just_pressed("ui_bar1"):
		if $Node.progress >= (bar1 - TOLERANCE) && $Node.progress <= (bar1 + TOLERANCE) && $Indicator.current_color == 1:
			print("hit!" + str($Node.progress))
			increment_score()
			bar1 = new_value()
			$IcePart.position = Vector2($IcePart.get_transform().x.x + 44, 275 - int(bar1/20)*50-31)
			#$Indicator.random_color()
			$Particles2D.set("position", Vector2($Node.get_transform().x.x + 72.0, $Node/HBoxContainer/TextureProgress.get_transform().y.y + 250))
			$Particles2D.set("emitting", true)
			#Node/Tween.stop_all()
			$"SFX/Ice Score".play()
		if $Node2.progress >= (bar2 - TOLERANCE) && $Node2.progress <= (bar2 + TOLERANCE) && $Indicator.current_color == 2:
			print("hit!" + str($Node2.progress))
			increment_score()
			bar2 = new_value()
			$RedPart.position = Vector2($RedPart.get_transform().x.x + 185+48, 580 - int(bar2/20)*50+10)
			$Particles2D.set("position", Vector2($Node2.get_transform().x.x + 175+ 72.0, $Node2/HBoxContainer/TextureProgress.get_transform().y.y+400))
			$Particles2D.set("emitting", true)
			#$Indicator.random_color()
			$"SFX/Lava Score".play()
		if $Node3.progress >= (bar3 - TOLERANCE) && $Node3.progress <= (bar3 + TOLERANCE) && $Indicator.current_color == 3:
			print("hit!" + str($Node3.progress))
			increment_score()
			bar3= new_value()
			$GreenPart.position = Vector2($GreenPart.get_transform().x.x + 44, 580 - int(bar3/20)*50+10)
			$Particles2D.set("position", Vector2($Node.get_transform().x.x + 72.0, $Node/HBoxContainer/TextureProgress.get_transform().y.y+400))
			$Particles2D.set("emitting", true)
			#$Indicator.random_color()
			$"SFX/Nice Score".play()
		if $Node4.progress >= (bar4 - TOLERANCE) && $Node4.progress <= (bar4 + TOLERANCE) && $Indicator.current_color == 4:
			print("hit!" + str($Node4.progress))
			increment_score()
			bar4= new_value()
			$FallPart.position = Vector2($FallPart.get_transform().x.x + 185+48, 275 - int(bar4/20)*50-31)
			$Particles2D.set("position", Vector2($Node4.get_transform().x.x + 175 + 72.0, $Node4/HBoxContainer/TextureProgress.get_transform().y.y+250))
			$Particles2D.set("emitting", true)
			#$Indicator.random_color()
			$"SFX/Fall Score".play()
		else:
			#$Indicator.random_color()
			#decrement_score()
			print(str($Node.progress))
		#Timer and switch
		$Indicator.random_color()
		$"Background Music/Ice Background".stop()
		$"Background Music/Lava Background".stop()
		$"Background Music/Nice Background".stop()
		$"Background Music/Fall Background".stop()
		
		if $Indicator.current_color == 1:
			$"Background Music/Ice Background".play()
		if $Indicator.current_color == 2:
			$"Background Music/Lava Background".play()
		if $Indicator.current_color == 3:
			$"Background Music/Nice Background".play()
		if $Indicator.current_color == 4:
			$"Background Music/Fall Background".play()
		
func increment_score():
	$Score.text = "Score: " + str($Score.text.to_int() + 1)
	
func decrement_score():
	$Score.text = "Score: " + str($Score.text.to_int() - 1)
	
func new_value():
	randomize()
	var newval = range(20,83)[randi()%range(20,83).size()]
	print("New val: " + str(newval))
	
	return newval

func _on_Timer_timeout():
	$Node/Tween.stop_all()
	$Node2/Tween.stop_all()
	$Node3/Tween.stop_all()
	$Node4/Tween.stop_all()
	$ColorRect.visible = true
	$Message.text = "Game over!\n " + str($Score.text) + "!"
	$GameOvertime.start()


func _on_GameOvertime_timeout():
	get_tree().reload_current_scene()
