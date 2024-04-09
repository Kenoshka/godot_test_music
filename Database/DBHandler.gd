extends Node

var db = SQLite.new()
var selected_id : int

func _ready():
	db.foreign_keys = true
	if FileAccess.file_exists("user://SongsDatabase.db"):
		DirAccess.remove_absolute("user://SongsDatabase.db")
	db.path = "user://SongsDatabase.db"
	db.open_db()
	database_setup()

func database_setup():
	var Singers = {
		"SingerId": {
			"data_type": "int",
			"primary_key": true,
			"auto_increment": true
		},
		"SingerName":  {
			"data_type": "text"
		}
	}
	var Songs = {
		"SongId":{
			"data_type":"int",
			"primary_key": true,
			"auto_increment": true
		},
		"SongSinger":{
			"data_type": "int",
			"foreign_key": "Singers.SingerId"
		},
		"SongName": {
			"data_type":"text",
		},
		"SongText":{
			"data_type": "text"
		}
	}
	db.create_table("Singers", Singers)
	db.create_table("Songs", Songs)
	db.query("INSERT INTO Singers (SingerName) values
	('Arctic Monkeys'),
	('Fools Garden'),
	('Машина Времени'),
	('Metallica'),
	('The Score'),
	('Green Day'),
	('Smash Into Pieces'),
	('Metal Gear Rising Revengeance')
	")
	var file = FileAccess
	var str = file.get_file_as_string('res://Database/1.txt')# Также возможна реализация через хранение названия файла с текстом в БД
	db.query('INSERT INTO Songs (SongSinger, SongName, SongText) values (1, "Do i wanna know", "{0}")'.format([str]))
	db.query("select * from Singers")
	str = file.get_file_as_string('res://Database/2.txt')
	db.query('INSERT INTO Songs (SongSinger, SongName, SongText) values (2, "Lemon Tree", "{0}")'.format([str]))
	str = file.get_file_as_string('res://Database/3.txt')
	db.query('INSERT INTO Songs (SongSinger, SongName, SongText) values (1, "Snap out of it", "{0}")'.format([str]))
	str = file.get_file_as_string('res://Database/4.txt')
	db.query('INSERT INTO Songs (SongSinger, SongName, SongText) values (3, "Однажды мир прогнется под нас", "{0}")'.format([str]))
	str = file.get_file_as_string('res://Database/5.txt')
	db.query('INSERT INTO Songs (SongSinger, SongName, SongText) values (4, "Turn The Page", "{0}")'.format([str]))
	str = file.get_file_as_string('res://Database/6.txt')
	db.query('INSERT INTO Songs (SongSinger, SongName, SongText) values (5, "Enemies", "{0}")'.format([str]))
	str = file.get_file_as_string('res://Database/7.txt')
	db.query('INSERT INTO Songs (SongSinger, SongName, SongText) values (5, "Born for this", "{0}")'.format([str]))
	str = file.get_file_as_string('res://Database/8.txt')
	db.query('INSERT INTO Songs (SongSinger, SongName, SongText) values (6, "Boulevard Of Broken Dreams", "{0}")'.format([str]))
	str = file.get_file_as_string('res://Database/9.txt')
	db.query('INSERT INTO Songs (SongSinger, SongName, SongText) values (7, "Wake Up", "{0}")'.format([str]))
	str = file.get_file_as_string('res://Database/10.txt')
	db.query('INSERT INTO Songs (SongSinger, SongName, SongText) values (8, "The Only Thing I Know For Real", "{0}")'.format([str]))
