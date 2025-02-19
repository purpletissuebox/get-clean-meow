extends Node

enum RoomID
{
	BASEMENT,
	BATHROOM,
	ENTRYWAY,
	GUEST_BEDROOM,
	KITCHEN,
	LIVING_ROOM,
	MASTER_BEDROOM,
	OUTSIDE,
	
	NUM_ROOMS,
}

const ROOM_PATHS:Array[String] = [
	"res://levels/basement/level.tscn",
	"res://levels/bathroom/level.tscn",
	"res://levels/entryway/level.tscn",
	"res://levels/guest_bed/level.tscn",
	"res://levels/kitchen/level.tscn",
	"res://levels/living_room/level.tscn",
	"res://levels/master_bed/level.tscn",
	"res://levels/outside/level.tscn",
]
