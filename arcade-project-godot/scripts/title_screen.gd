extends Node2D

@onready var fade_anim: AnimationPlayer = $fade_anim_node/fade_anim

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade_anim.play_backwards("fade_title_screen")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	fade_anim.play("fade_title_screen")
	await fade_anim.animation_finished
	get_tree().change_scene_to_file("res://scenes/high_scores_screen.tscn")
