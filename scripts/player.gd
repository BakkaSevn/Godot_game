extends CharacterBody2D

const speed = 100
var current_dir="none"

func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):#Delta implica que no depende de la tasa de fps impuesta
	player_movement(delta)#Se define la fisica del player moment

func player_movement(delta):  #Se define el movimiento del jugador con todas sus condiciones

	if Input.is_action_pressed("ui_right"):
		current_dir ="right" #Direccion Actual del jugador
		play_anim(1) 
		velocity.x = speed #Velocidad correspondiente segun eje
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir ="left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir ="down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir ="up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
	else:
		play_anim(0)
		velocity.y = 0
		velocity.x = 0
		
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D #Libreria utilizada para las animaciones
	
	if dir == "right":
		anim.flip_h= false #Si gira hacia x direccion
		if movement == 1: #si esta en movimiento va a ejecutar la animacion
			anim.play("right_idle")
		elif movement == 0:
			anim.play("stop_right")
			
	if dir == "left":
		anim.flip_h= false
		if movement == 1:
			anim.play("left_idle")
		elif movement == 0:
			anim.play("stop_left")
			
	if dir == "down":
		anim.flip_h= false
		if movement == 1:
			anim.play("front_idle")
		elif movement == 0:
			anim.play("stop_down")
	if dir == "up":
		anim.flip_h= false
		if movement == 1:
			anim.play("back_idle")
		elif movement == 0:
			anim.play("stop_up")
