class_name MrDrillerBlock
extends Node2D

enum BorderPosition {
	LEFT, 
	RIGHT, 
	TOP,
	BOTTOM,
}

enum CornerPosition {
	TOP_LEFT, 
	TOP_RIGHT, 
	BOTTOM_LEFT,
	BOTTOM_RIGHT
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.reset()
	
func reset():
	$Main/BorderBottom.visible = false
	$Main/BorderLeft.visible = false
	$Main/BorderRight.visible = false
	$Main/BorderTop.visible = false
	$Main/CornerBottomLeft.visible = false
	$Main/CornerBottomRight.visible = false
	$Main/CornerTopLeft.visible = false
	$Main/CornerTopRight.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func add_border(pos: BorderPosition) -> void:
	if (pos == BorderPosition.LEFT):
		$Main/BorderLeft.visible = true
	if (pos == BorderPosition.RIGHT):
		$Main/BorderRight.visible = true
	if (pos == BorderPosition.TOP):
		$Main/BorderTop.visible = true
	if (pos == BorderPosition.BOTTOM):
		$Main/BorderBottom.visible = true

func add_corner(pos: CornerPosition) -> void:
	if (pos == CornerPosition.TOP_LEFT):
		$Main/CornerTopLeft.visible = true
	if (pos == CornerPosition.TOP_RIGHT):
		$Main/CornerTopRight.visible = true
	if (pos == CornerPosition.BOTTOM_LEFT):
		$Main/CornerBottomLeft.visible = true
	if (pos == CornerPosition.BOTTOM_RIGHT):
		$Main/CornerBottomRight.visible = true
