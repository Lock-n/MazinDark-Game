extends Spatial

onready var start_button = $CanvasLayer/Fader/Control/VBoxContainer/CenterContainer/VBoxContainer/StartButton
onready var quit_button = $CanvasLayer/Fader/Control/VBoxContainer/CenterContainer/VBoxContainer/QuitButton
onready var fader = $CanvasLayer/Fader

export (PackedScene) var game_scene = null

# Called when the node enters the scene tree for the first time.
func _ready():
	start_button.connect("pressed", self, "on_start_pressed")
	quit_button.connect("pressed", self, "on_quit_pressed")
	fader.connect("fade_finished", self, "on_fade_finished")
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func on_fade_finished():
	get_tree().change_scene_to(game_scene)

func on_start_pressed():
	fader.fade_out()
	$AudioFade.play("fade_out")
	
func on_quit_pressed():
	get_tree().quit(0)
