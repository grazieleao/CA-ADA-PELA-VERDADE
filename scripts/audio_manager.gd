extends Node

# Este script deve estar no Autoload como 'AudioManager' nas Configurações do Projeto
var music_player: AudioStreamPlayer

# Caminhos para os teus ficheiros de áudio (VERIFICA SE OS NOMES ESTÃO CORRETOS NA TUA PASTA ASSETS)
const MUSICA_MENU = "res://assets/sounds/main - theme.mp3"
const MUSICA_GAMEPLAY = "res://assets/sounds/intro_act01.mp3"

func _ready():
	# Configuração do Player de Áudio
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	music_player.bus = &"Music" # Garante que tens um Bus chamado 'Music' no Mixer, ou muda para 'Master'
	
	# Permite que o áudio continue mesmo se o jogo for pausado
	process_mode = Node.PROCESS_MODE_ALWAYS

func play_menu_music():
	print("[AudioManager] A tentar tocar música do MENU...")
	_change_track(MUSICA_MENU, false) # Sem fade para a intro/menu inicial

func play_game_music():
	print("[AudioManager] A mudar para música de GAMEPLAY...")
	_change_track(MUSICA_GAMEPLAY, true) # Com fade suave para a transição de jogo

func _change_track(path: String, use_fade: bool):
	# Verifica se o ficheiro existe antes de carregar
	if not FileAccess.file_exists(path):
		printerr("[AudioManager] ERRO: Ficheiro não encontrado em: ", path)
		return

	var nova_musica = load(path)
	
	# Se a música que queres tocar já for a que está a dar, não faz nada
	if music_player.stream == nova_musica and music_player.playing:
		return
	
	if use_fade and music_player.playing:
		var tween = create_tween()
		# Fade out: baixa o volume até ao silêncio em 1 segundo
		tween.tween_property(music_player, "volume_db", -80.0, 1.0).set_trans(Tween.TRANS_SINE)
		
		# Quando o silêncio chegar, troca a música e faz Fade In
		tween.finished.connect(func():
			music_player.stream = nova_musica
			music_player.play()
			
			var tween_in = create_tween()
			# Fade in: sobe do silêncio até ao volume normal (0 dB)
			tween_in.tween_property(music_player, "volume_db", 0.0, 1.0).set_trans(Tween.TRANS_SINE)
		)
	else:
		# Troca direta sem efeitos
		music_player.stop()
		music_player.stream = nova_musica
		music_player.volume_db = 0.0
		music_player.play()

# Função utilitária para parar tudo
func stop_all():
	if music_player:
		music_player.stop()
