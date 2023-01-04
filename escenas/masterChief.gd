extends Area2D
onready var muros = get_parent().get_node("muros")
var pos_oraculo = Vector2(0,0)
var pos_master = Vector2(0,0)
var realDistance
var value
var checkChild = Vector2(0,0)
var checkX 
var checkY
var cells = []
var candidate
var operation 
var realDistanceH
var ChildList = []
var CostList = []
var minimum
var cost = 0
var ondex 
var timer = true



func _ready():
	position = muros.get_master_pos()
	pass
 
func chargeFreeCells():
	cells = muros.freeCells()

func findPositions(): #Ubicar la posicion en una variable
	pos_master = get_parent().get_node("masterChief")
	pos_oraculo = get_parent().get_node("oraculo")
	
#A* algoritmo

func manhattanDistance(pos_master): #Obteniendo la distancia real que hay entre el objetivo y el buscador para generar la heuristica de A*
	var DistanceX = pos_oraculo.x - pos_master.x
	var DistanceY = pos_oraculo.y - pos_master.y
	realDistance = sqrt((DistanceX * DistanceX) + (DistanceY * DistanceY))
	return realDistance

	
func heuristica(candidate): #Valor de la distancia que tiene el objeto con respecto a la meta al moverse 
	var DistanceXH = candidate.x - pos_master.x
	var DistanceYH = candidate.y - pos_master.y
	realDistanceH = sqrt((DistanceXH * DistanceXH) + (DistanceYH * DistanceYH))
	return realDistanceH
	

#Empieza la verificacion de casillas

func RightChild():
	checkChild = pos_master
	checkX = checkChild.x + 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
		operation = manhattanDistance(candidate) + heuristica(candidate)
		ChildList.append(candidate)
		CostList.append(candidate)
		
func LeftChild():
	checkChild = pos_master
	checkX = checkChild.x + 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
		operation = manhattanDistance(candidate) + heuristica(candidate)
		ChildList.append(candidate)
		CostList.append(candidate)

func UpChild():
	checkChild = pos_master
	checkX = checkChild.x + 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
		operation = manhattanDistance(candidate) + heuristica(candidate)
		ChildList.append(candidate)
		CostList.append(operation)
		
func DownChild():
	checkChild = pos_master
	checkX = checkChild.x + 1
	checkY = checkChild.y
	candidate.x = checkX
	candidate.y = checkY
	if candidate in cells:
		operation = manhattanDistance(candidate) + heuristica(candidate)
		ChildList.append(candidate)
		CostList.append(candidate)
		
func lowCost():
	for i in range(len(CostList)):
		if CostList[i] < cost:
			cost = CostList[i]
			ondex = i 
			return ondex
		else:
			cost = CostList[i]

func Astar():
	RightChild()
	LeftChild()
	UpChild()
	DownChild()
	lowCost()
	pos_master = ChildList[ondex]
	set_global_position(pos_master)
	
func _process(delta):
	while timer == true:
		chargeFreeCells()
		findPositions()
		while (pos_master != pos_oraculo):
			Astar()
			ChildList = []
			CostList = []
		timer = false
		
	
			
			
	
	
	
		
	
	
