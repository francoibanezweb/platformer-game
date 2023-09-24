extends CharacterBody2D

var SPEED = 50
var player
var animated_sprite
var chase

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	animated_sprite = $AnimatedSprite2D
	player = $"../../Player/Player"
	animated_sprite.play("Idle")
	
func _physics_process(delta):
	velocity.y += gravity * delta
	move_and_slide()

func _on_player_detection_body_entered(body):
	if body.name == "Player":
		if body.global_position.x > position.x:
			animated_sprite.flip_h = true
			animated_sprite.play("Jump")
			velocity.x = SPEED
		else:
			animated_sprite.flip_h = false
			animated_sprite.play("Jump")
			velocity.x = -SPEED

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		animated_sprite.play("Idle")
		velocity.x = 0


func _on_player_death_body_entered(body):
	if body.name == "Player":
		animated_sprite.play("Death")
		await animated_sprite.animation_finished
		self.queue_free()

