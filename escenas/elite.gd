extends Area2D
onready var muros = get_parent().get_node("muros")
onready var pos_oraculo = get_parent().get_node("oraculo")
var cells
var pos_elite = Vector2(0,0)
var depth = 3
var checkChild = Vector2(0,0)
var candidate = Vector2(0,0) 
var checker = Vector2(0,0)
var checkX
var checkY
var usedCells = []
var timer

func _ready():
	position = muros.get_elite_pos()
	pass

func chargeFreeCells():
	cells = muros.freeCells()
	
func findPositions(): #Ubicar la posicion en una variable
	pos_elite = get_parent().get_node("elite")

#Algoritmo BPP

func RightChild():
	checkChild = pos_elite
	checkX = checkChild.x + 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
	   usedCells.append(candidate)
	   checker = usedCellss(candidate)
	   if checker == true:
		   pos_elite = candidate 
		   return pos_elite
	else:
		return 0
		
func LeftChild():
	checkChild = pos_elite
	checkX = checkChild.x - 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
	   usedCells.append(candidate)
	   checker = usedCellss(candidate)
	   if checker == true:
		   pos_elite = candidate
		   return pos_elite
	else:
		return 0

func UpChild():
	checkChild = pos_elite
	checkX = checkChild.x 
	checkY = checkChild.y - 1
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
	   usedCells.append(candidate)
	   checker = usedCellss(candidate)
	   if checker == true:
		   pos_elite = candidate 
		   return pos_elite 
	else:
		return 0
		
func DownChild():
	checkChild = pos_elite
	checkX = checkChild.x 
	checkY = checkChild.y + 1
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
	   usedCells.append(candidate)
	   checker = usedCellss(candidate)
	   if checker == true:
		   pos_elite = candidate 
		   return pos_elite 
	else:
		return 0
		
func usedCellss(candidate):
	for i in range (len(usedCells)):
		if usedCells[i] == candidate:
		   return true
		
func bpp():
	for i in range(depth):
		RightChild()
		if pos_elite != pos_oraculo:
			print("finding")
		else:
			return pos_elite
			
	for i in range(depth):
		LeftChild()
		if pos_elite == pos_oraculo:
			print("finding")
		else:
			return pos_elite
			
	for i in range(depth):
		UpChild()
		if pos_elite == pos_oraculo:
			print("finding")
		else:
			return pos_elite
			
	for i in range(depth):
		DownChild()
		if pos_elite == pos_oraculo:
			print("finding")
		else:
			return pos_elite
	set_global_position(pos_elite)
			
func _process(delta):
	while timer == true:
		chargeFreeCells()
		findPositions()
		while(pos_elite != pos_oraculo):
			bpp()
		timer = false
			
			
	
	
	
	
	
	
