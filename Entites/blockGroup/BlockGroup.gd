class_name MrDrillerBlockGroup extends Node2D

class BlockInfo:
	var block:MrDrillerBlock
	var position:Vector2i

@export var blockPrefab =  preload("res://Entites/block/block.tscn");
@onready var _blocks: Array[BlockInfo] = []
@onready var _color: String = "blue"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	addBlock(Vector2i(0, 0))
	addBlock(Vector2i(1, 1))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func addBlock(pos: Vector2i) -> void:
	if (_blocks.any(func(i:BlockInfo): return i.position == pos)) :
		return
		
	var block:MrDrillerBlock = blockPrefab.instantiate()

	block.position = pos * 32
	var ins: BlockInfo = BlockInfo.new()
	ins.position = pos
	ins.block = block
	_blocks.push_back(ins)
	add_child(block)
	
func shape_blocks():
	pass
	
