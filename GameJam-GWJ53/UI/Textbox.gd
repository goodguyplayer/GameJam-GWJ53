extends CanvasLayer

# Thanks to https://www.youtube.com/watch?v=QEHOiORnXIk for the guide
# To add in credits - https://www.pentacom.jp/pentacom/bitfontmaker2/gallery/?id=125

onready var textbox_container = $TextboxContainer
onready var start_symbol = $TextboxContainer/Panel/MarginContainer/HBoxContainer/Start
onready var end_symbol = $TextboxContainer/Panel/MarginContainer/HBoxContainer/End
onready var body = $TextboxContainer/Panel/MarginContainer/HBoxContainer/Body


const CHAR_READ_RATE = 0.0125

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_textbox()
	queue_text("While Lorem ipsum text is neat to use, I wanted to try and test with my own type of text.")
	queue_text("So far it's meant to be about 3 lines long, so let's type until we reach the limit.")
	queue_text("Yay free font site and guide, thank you!")
	

func _process(delta):
	match current_state:
		State.READY:
			if !text_queue.empty():
				display_text()
		State.READING:
			if Input.is_action_just_pressed("ui_textbutton"):
				change_state(State.FINISHED)
				body.percent_visible = 1.0
				$Tween.stop_all()
				end_symbol.text = "v"
		State.FINISHED:
			if Input.is_action_just_pressed("ui_textbutton"):
				change_state(State.READY)
				hide_textbox()


func queue_text(next_text):
	text_queue.push_back(next_text)


func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	body.text = ""
	textbox_container.hide()
	
	
func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()
	

func display_text():
	var next_text = text_queue.pop_front()
	body.text = next_text
	body.percent_visible = 0.0
	change_state(State.READING)
	show_textbox()
	$Tween.interpolate_property(body, "percent_visible", 0.0, 1.0, len(next_text) * CHAR_READ_RATE, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT )
	$Tween.start()


func change_state(next_state):
	current_state = next_state
	

func _on_Tween_tween_all_completed():
	end_symbol.text = "v"
	change_state(State.FINISHED)
