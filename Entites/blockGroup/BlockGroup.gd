class_name MrDrillerBlockGroup extends Node2D

class BlockInfo:
	var block:MrDrillerBlock
	var position:Vector2i

@export var blockPrefab =  preload("res://Entites/block/block.tscn");
@onready var _blocks: Array[BlockInfo] = []
@onready var _color: String = "blue"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_block(Vector2i(0, 3))
	
	add_block(Vector2i(1, 3))
	add_block(Vector2i(2, 3))	
	add_block(Vector2i(3, 3))	
	add_block(Vector2i(4, 3))	
	add_block(Vector2i(1, 2))
	add_block(Vector2i(2, 2))	
	add_block(Vector2i(3, 2))	
	add_block(Vector2i(2, 1))	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_block(pos: Vector2i) -> void:
	if (_blocks.any(func(i:BlockInfo): return i.position == pos)) :
		return
		
	var block:MrDrillerBlock = blockPrefab.instantiate()

	block.position = pos * 32
	var ins: BlockInfo = BlockInfo.new()
	ins.position = pos
	ins.block = block
	_blocks.push_back(ins)
	add_child(block)
	self.shape_blocks()
	
func shape_blocks():
	for block in _blocks:
		block.block.reset()
		if (!_check_close_block_exists(block, Vector2i(-1, 0))):
			block.block.add_border(MrDrillerBlock.BorderPosition.LEFT)
		if (!_check_close_block_exists(block, Vector2i(1, 0))):
			block.block.add_border(MrDrillerBlock.BorderPosition.RIGHT)
		if (!_check_close_block_exists(block, Vector2i(0, -1))):
			block.block.add_border(MrDrillerBlock.BorderPosition.TOP)
		if (!_check_close_block_exists(block, Vector2i(0, 1))):
			block.block.add_border(MrDrillerBlock.BorderPosition.BOTTOM)
		#borders
		
		if (_check_close_block_exists(block, Vector2i(-1, 0)) 
		and _check_close_block_exists(block, Vector2i(0, -1))
		and !_check_close_block_exists(block, Vector2i(-1, -1))):
			block.block.add_corner(MrDrillerBlock.CornerPosition.TOP_LEFT)
			
		if (_check_close_block_exists(block, Vector2i(1, 0)) 
		and _check_close_block_exists(block, Vector2i(0, -1))
		and !_check_close_block_exists(block, Vector2i(1, -1))):
			block.block.add_corner(MrDrillerBlock.CornerPosition.TOP_RIGHT)

		if (_check_close_block_exists(block, Vector2i(-1, 0)) 
		and _check_close_block_exists(block, Vector2i(0, 1))
		and !_check_close_block_exists(block, Vector2i(-1, 1))):
			block.block.add_corner(MrDrillerBlock.CornerPosition.BOTTOM_LEFT)

		if (_check_close_block_exists(block, Vector2i(1, 0)) 
		and _check_close_block_exists(block, Vector2i(0, 1))
		and !_check_close_block_exists(block, Vector2i(1, 1))):
			block.block.add_corner(MrDrillerBlock.CornerPosition.BOTTOM_RIGHT)
	pass
	
func _get_blockInfo(pos:Vector2i) -> BlockInfo:
	var found = _blocks.filter(func(i:BlockInfo): return i.position == pos)
	if (!found.is_empty()):
		return found[0]
	
	return null
	
func _check_close_block_exists(from: BlockInfo, direction: Vector2i) -> bool:
	var pos = from.position
	var check_pos = pos + direction
	var close_blockInfo = self._get_blockInfo(check_pos)
	return close_blockInfo != null
