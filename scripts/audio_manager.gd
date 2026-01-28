extends Node

# Este script deve ser configurado como um Autoload (Singleton) nas definições do projeto
# Nome sugerido: AudioManager

var music_player: AudioStreamPlayer

func _ready():
	# Criamos o player de áudio dinamicamente para que persista entre cenas
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	
	# Na Godot 4, garantimos que o áudio continue processando mesmo em pausa se necessário
	process_mode = Node.PROCESS_MODE_ALWAYS
	
	# Carrega o arquivo de música
	# Dica: Verifique se a pasta assets/audio existe ou ajuste o caminho abaixo
	var music_path = "res://assets/sounds/main - theme.mp3"
	if FileAccess.file_exists(music_path):
		var music_file = load(music_path) 
		music_player.stream = music_file
		music_player.bus = &"Music" # O prefixo & cria um StringName, mais eficiente na Godot 4
	else:
		print("Aviso: Arquivo de música não encontrado em: ", music_path)

func play_menu_music():
	if music_player and not music_player.playing:
		# Reseta o volume para o padrão caso tenha vindo de um fade_out anteriormente
		music_player.volume_db = 0.0
		music_player.play()

func stop_music():
	if music_player:
		music_player.stop()

func fade_out_music(duration: float = 1.0):
	if music_player and music_player.playing:
		var tween = create_tween()
		# Transição suave de volume usando o novo sistema de Tween da Godot 4
		tween.tween_property(music_player, "volume_db", -80.0, duration).set_trans(Tween.TRANS_SINE)
		tween.finished.connect(stop_music)
