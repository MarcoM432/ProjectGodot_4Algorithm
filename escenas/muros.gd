extends TileMap
onready var half_cell_size = get_cell_size()/2


func _ready():
	pass
func get_player_init_pos():  #Ubicacion del oraculo (goal position)
	var pos = map_to_world(Vector2(54,1))
	pos.y += half_cell_size.y
	return pos 

func freeCells():
	var freeCell = Vector2()
	freeCell = get_used_cells_by_id(0)
	var map_size = len(freeCell)
	return freeCell
	
func get_master_pos(): #Ubicacion de masterChief inicial (A*)
	var pos = map_to_world(Vector2(2,2))
	pos.y += half_cell_size.y
	return pos

func get_elite_pos(): #Ubicacion del elite inicial (greedy)
	var pos = map_to_world(Vector2(3,3))
	pos.y += half_cell_size.y
	return pos

func get_grunt_pos(): #Ubicacion del grunt inicial (bpp)
	var pos = map_to_world(Vector2(3,4))
	pos.y += half_cell_size.y
	return pos
	
func get_brute_pos(): #Ubicacion del brute inicial (bpa)
	var pos = map_to_world(Vector2(4,4))
	pos.y += half_cell_size.y
	return pos
