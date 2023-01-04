extends Area2D
onready var muros = get_parent().get_node("muros")
onready var oraculo = get_parent().get_node("oraculo")
var cells = []
var pos_brute = Vector2(0,0)
var pos_oraculo = Vector2(0,0)
var checkChild = Vector2(0,0)
var checkX
var checkY
var candidate = Vector2(0,0)


func _ready():
	position = muros.get_brute_pos()
	pass

func chargeFreeCells():
	cells = muros.freeCells()

func findPositions(): #Ubicar la posicion en una variable
	pos_brute = get_parent().get_node("brute")
	pos_oraculo = get_parent().get_node("oraculo")

 #Greedy algoritmo

func RightChild():
	checkChild = pos_brute
	checkX = checkChild.x + 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
		
		
func LeftChild():
	checkChild = pos_brute
	checkX = checkChild.x + 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
		

func UpChild():
	checkChild = pos_brute
	checkX = checkChild.x + 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
		
		
func DownChild():
	checkChild = pos_brute
	checkX = checkChild.x + 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
		
