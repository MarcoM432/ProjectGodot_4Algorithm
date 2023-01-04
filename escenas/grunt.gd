extends Area2D
onready var muros = get_parent().get_node("muros")
onready var pos_oraculo = get_parent().get_node("oraculo")
var cells
var pos_grunt = Vector2(0,0)
var depth = 3
var checkChild = Vector2(0,0)
var candidate = Vector2(0,0) 
var checker = Vector2(0,0)
var checkX
var checkY
var usedCells = []
var timer

func _ready():
	position = muros.get_grunt_pos()
	pass
func chargeFreeCells():
	cells = muros.freeCells()
	
func findPositions(): #Ubicar la posicion en una variable
	pos_grunt = get_parent().get_node("grunt")
	
#Algoritmo BPA

func RightChild():
	checkChild = pos_grunt
	checkX = checkChild.x + 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
	   usedCells.append(candidate)
	   checker = usedCellss(candidate)
	   if checker == true:
		   pos_grunt = candidate
		   return pos_grunt   
	else:
		return 0
		
func LeftChild():
	checkChild = pos_grunt
	checkX = checkChild.x - 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
	   usedCells.append(candidate)
	   checker = usedCellss(candidate)
	   if checker == true:
		   pos_grunt = candidate 
		   return pos_grunt  
	else:
		return 0

func UpChild():
	checkChild = pos_grunt
	checkX = checkChild.x 
	checkY = checkChild.y - 1
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
	   usedCells.append(candidate)
	   checker = usedCellss(candidate)
	   if checker == true:
		   pos_grunt = candidate 
		   return pos_grunt  
	else:
		return 0
		
func DownChild():
	checkChild = pos_grunt
	checkX = checkChild.x 
	checkY = checkChild.y + 1
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
	   usedCells.append(candidate)
	   checker = usedCellss(candidate)
	   if checker == true:
		   pos_grunt = candidate 
		   return pos_grunt   
	else:
		return 0
		
func usedCellss(candidate):
	for i in range (len(usedCells)):
		if usedCells[i] == candidate:
		   return true
func bpa():
	RightChild()
	if pos_grunt != pos_oraculo:
		print("finding")
	else:
		return pos_grunt
	LeftChild()
	if pos_grunt != pos_oraculo:
		print("finding")
	else:
		return pos_grunt
	UpChild()
	if pos_grunt != pos_oraculo:
		print("finding")
	else:
		return pos_grunt
	DownChild()
	if pos_grunt != pos_oraculo:
		print("finding")
	else:
		return pos_grunt
	set_global_position(pos_grunt)
	

func _process(delta):
	while timer == true:
		chargeFreeCells()
		findPositions()
		while(pos_grunt != pos_oraculo):
			bpa()
		timer = false
