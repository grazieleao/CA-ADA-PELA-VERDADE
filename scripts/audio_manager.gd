extends Node

# Este script deve estar no Autoload como 'AudioManager'
var music_player: AudioStreamPlayer

# Caminhos para os seus arquivos de áudio
const MUSICA_MENU = "res://assets/sounds/main - theme.mp3"
const MUSICA_GAMEPLAY = "res://assets/audio/game_music.mp3"

func _ready():
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	music_player.bus = &"Music"
	process_mode = Node.PROCESS_MODE_ALWAYS

func play_menu_music():
	_change_track(MUSICA_MENU, false) # Sem fade na entrada da intro

func play_game_music():
	_change_track(MUSICA_GAMEPLAY, true) # Com fade suave ao começar o jogo

func _change_track(path: String, use_fade: bool):
	var nova_musica = load(path)
	
	# Se a música já for a mesma e estiver tocando, não faz nada
	if music_player.stream == nova_musica and music_player.playing:
		return
	
	if use_fade:
		var tween = create_tween()
		# Fade out da música atual
		tween.tween_property(music_player, "volume_db", -80.0, 1.0).set_trans(Tween.TRANS_SINE)
		tween.finished.connect(func():
			music_player.stream = nova_musica
			music_player.volume_db = -80.0
			music_player.play()
			# Fade in da nova música
			var tween_in = create_tween()
			tween_in.tween_property(music_player, "volume_db", 0.0, 1.0).set_trans(Tween.TRANS_SINE)
		)
	else:
		music_player.stream = nova_musica
		music_player.volume_db = 0.0
		music_player.play()
