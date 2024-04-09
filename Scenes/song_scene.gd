extends Control

var autoscroll_state = 0
var autoscroll_timer_time = 0

func _ready():
	$SongTextContainer.set_deferred("scroll_vertical", 600)
	DBHandler.db.query("SELECT SongText, SongName FROM Songs WHERE SongId = {0}".format([DBHandler.selected_id]))
	$SongTextContainer/SongText.text = DBHandler.db.query_result[0]["SongText"]
	$SongName.text = DBHandler.db.query_result[0]["SongName"]


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_scroll_button_pressed():
	autoscroll_state += 1
	match(autoscroll_state):
		1:
			$ScrollTimer.start(0.15)
			$Header/ScrollButton.texture_normal = load("res://Assets/play.png")
		2:
			$ScrollTimer.start(0.05)
			$Header/ScrollButton.texture_normal = load("res://Assets/fast.png")
		3:
			autoscroll_state = 0
			$ScrollTimer.stop()
			$Header/ScrollButton.texture_normal = load("res://Assets/pause.png")

func _on_scroll_timer_timeout():
	$SongTextContainer.scroll_vertical += 2
