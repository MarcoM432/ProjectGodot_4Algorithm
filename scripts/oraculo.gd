extends Area2D
var direction = Vector2(0,0)
onready var muros = get_parent().get_node("muros")

func _ready():
	position = muros.get_player_init_pos()



