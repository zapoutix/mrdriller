class_name Tile
extends Node2D

@onready var sprites: AnimatedSprite2D = $BlueSprites
@onready var type: Type = Type.NO_BORDER

enum Type {
	NO_BORDER, 
	FOUR_BORDER, 
	ONE_BORDER_LEFT = 3,
	ONE_BORDER_TOP,
	ONE_BORDER_RIGHT,
	ONE_BORDER_BOTTOM,
	TWO_BORDERS_TOP_LEFT,
	TWO_BORDERS_TOP_RIGHT,
	TWO_BORDERS_BOTTOM_RIGHT,
	TWO_BORDERS_BOTTOM_LEFT,
	THREE_BORDERS_BOTTOM_LEFT_RIGHT,
	THREE_BORDERS_TOP_BOTTOM_LEFT,
	THREE_BORDERS_TOP_LEFT_RIGHT,
	THREE_BORDERS_TOP_BOTTOM_RIGHT,
	ONE_CORNER_TOP_LEFT,
	ONE_CORNER_TOP_RIGHT,
	ONE_CORNER_BOTTOM_RIGHT,
	ONE_CORNER_BOTTOM_LEFT,
	TWO_CORNERS_TOP,
	TWO_CORNERS_RIGHT,
	TWO_CORNERS_BOTTOM,
	TWO_CORNERS_LEFT,
	THREE_CORNERS_TOP_LEFT,
	THREE_CORNERS_TOP_RIGHT,
	THREE_CORNERS_BOTTOM_RIGHT,
	THREE_CORNERS_BOTTOM_LEFT,
	FOUR_CORNERS
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_type(type: Type) -> void:
	self.type = type
