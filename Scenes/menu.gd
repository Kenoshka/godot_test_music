extends Control

var song_panel_scene = preload("res://Scenes/song_panel.tscn")


func _ready():
	DBHandler.db.query("SELECT SongId, Si.SingerName, SongName FROM Songs S join Singers Si where S.SongSinger = Si.SingerId")
	var result = DBHandler.db.query_result
	for res in result:
		var song_panel = song_panel_scene.instantiate()
		song_panel.song_id = res["SongId"]
		song_panel.song_data = [res["SingerName"], res["SongName"]]
		$ScrollContainer/SongsContainer.add_child(song_panel)
