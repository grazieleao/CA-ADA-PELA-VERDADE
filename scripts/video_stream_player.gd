extends Control

# Este script vai no VideoStreamPlayer da tua cena de intro
@onready var video_player = $VideoStreamPlayer
@export var next_scene = "res://cenas/menu/menu_main.tscn"

func _ready():
	# 1. Garante que a música do menu começa a tocar JA na intro
	AudioManager.play_menu_music()
	
	# 2. Configura e toca o vídeo
	if video_player:
		video_player.expand = true # Ajusta ao tamanho da janela
		video_player.play()
		video_player.finished.connect(_on_video_finished)

func _input(event):
	# Permite saltar a intro com qualquer tecla ou clique
	if event is InputEventKey or event is InputEventMouseButton:
		if event.is_pressed():
			_on_video_finished()

func _on_video_finished():
	# Muda para o menu principal sem parar a música (graças ao Autoload)
	get_tree().change_scene_to_file(next_scene)


func _on_finished() -> void:
	get_tree().change_scene_to_file(next_scene)
