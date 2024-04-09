extends Control

var song_id = null
var song_data = [null, null]


func _ready():
	$SongPageButton/SongName.text = "{0} - {1}".format([song_data[0], song_data[1]])


func _on_song_page_button_pressed():
	DBHandler.selected_id = song_id
	get_tree().change_scene_to_file("res://Scenes/song_scene.tscn")
