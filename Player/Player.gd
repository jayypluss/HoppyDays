extends KinematicBody2D

const WORD_LIMIT = 13000

var motion = Vector2(0, 0)

const GRAVITY = 150
const WALK_SPEED = 1000
const JUMP_SPEED = 4000
const BOOST_MULTIPLIER = 1.5
const SPRINT_MULTIPLIER = 3

signal animate

func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, Vector2.UP)
	
func apply_gravity():
	if motion.y > WORD_LIMIT:
		get_tree().call_group('Gamestate', 'end_game')
	if is_on_floor() and motion.y > 0:
		motion.y = 0
	if is_on_ceiling():
		motion.y = 1
	else:
		motion.y += GRAVITY


func jump():
	if Input.is_action_pressed('space') and is_on_floor():
		motion.y -= JUMP_SPEED
		$JumpSFX.play()
		
func move():
	var walk_direction = 0
	var sprint_multiplier_helper = 1
	
	if pressing_left():
		walk_direction = -1
	elif pressing_right():
		walk_direction = 1
	else: 
		walk_direction = 0
		
	# TODO
	# Bunny stops moving to the direction it's moving when it jumps while sprinting
	if Input.is_action_pressed("shift"):
		sprint_multiplier_helper = SPRINT_MULTIPLIER
	elif !Input.is_action_pressed("shift"):
		sprint_multiplier_helper = 1
	else: 
		walk_direction = 0
	
	motion.x = walk_direction * WALK_SPEED * sprint_multiplier_helper

func pressing_left():
	return Input.is_action_pressed('left') and not Input.is_action_pressed('right')
		
func pressing_right():
	return Input.is_action_pressed('right') and not Input.is_action_pressed('left')
		
func animate():
	emit_signal('animate', motion)
	
func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = -JUMP_SPEED
	$PainSFX.play()

func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = -JUMP_SPEED * BOOST_MULTIPLIER
