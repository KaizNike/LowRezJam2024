extends Node

var stage := 0
var stage_locks = [1]
var secret_actions = [2]
var stage_actions = {}
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	change_stage(stage)
	pass # Replace with function body.

func _unhandled_input(event):
	if event.is_action_pressed("advance_stage"):
		advance_stage()
	if event.is_action_pressed("action1"):
		if stage in stage_locks:
			var find = stage_locks.find(stage)
			stage_locks.remove(find)
			advance_stage()
		if stage in secret_actions:
			stage_actions(stage)
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func advance_stage():
	if stage in stage_locks:
		return
	stage += 1
	change_stage(stage)
	
func change_text(text):
	$"%RichTextLabel".text = text

func change_stage(s):
	s = int(s)
	match s:
		0:
			 change_text("""hello world,
this is kaiz.
press space,
to continue.
or bottom but
on controlle
>""")
		1:
			change_text("""awakening,
seeing bees,
forceful
heart (+)(lb),
act""")
		2:
			change_text("""rising,
flower field,
a bear speaks
"you came from a warred
place, relax.
" (+)(LB) >""")
		3:
			change_text("""bear,
"we are free
here, show me
your powers."
(+)(lb)""")
		_:
			change_text("And so,\nthe story ends...")

func stage_actions(s):
	match s:
		2:
			change_text("""responding,
"Recalling
little, where
are we?" > """)
	pass
