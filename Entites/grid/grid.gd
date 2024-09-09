class_name MrDrillerGrid
extends Node2D

class BlockGroupInfo:
	var blockGroup:MrDrillerBlockGroup
	var position:Vector2i

@onready var _blockGroups: Array[BlockGroupInfo] = []
@onready var gridWidth: int = 9
@onready var gridDeep: int = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	var colorGrid = _generate_grid()
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _add_blockgroup(blockGroup: MrDrillerBlockGroup, pos: Vector2i) -> void:
	var ins: BlockGroupInfo = BlockGroupInfo.new()
	ins.position = pos
	ins.blockGroup = blockGroup
	add_child(blockGroup)
	_blockGroups.push_back(ins)
	
func _generate_grid() -> Array[Array]:
	var ret: Array[Array] = []
	for i in range(self.gridDeep):
		ret.append([])
		
	for y in range(self.gridDeep):
		for x in range(self.gridWidth):
			ret[y].append(MrDrillerColors.Colors.BLUE)
			
			
	return ret
	
	
