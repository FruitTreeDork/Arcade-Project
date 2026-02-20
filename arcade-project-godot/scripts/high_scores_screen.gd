extends Node2D

@onready var fade_anim: AnimationPlayer = $fade_anim_node/fade_anim
@onready var scores_move: AnimationPlayer = $scores_move

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade_anim.play_backwards("fade_title_screen")
	scores_move.play("high_score_scroll")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("start") or Input.is_action_just_pressed("start2")) and !fade_anim.is_playing():
		fade_anim.play("fade_title_screen")
		await fade_anim.animation_finished
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")


func _on_timer_timeout() -> void:
	if !fade_anim.is_playing():
		fade_anim.play("fade_title_screen")
		await fade_anim.animation_finished
		get_tree().change_scene_to_file("res://scenes/title_screen.tscn")
