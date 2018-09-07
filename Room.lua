local Room = {
    tiles = {},
    IDX = nil,
    IDY = nil,
    up = nil,
    down = nil,
    left = nil,
    right = nil,
}

Tile = require 'Tile'

TILE_PX_SIZE = 32
ROOM_TILE_SIZE = 25
nextRoomID = 0

function Room:new(room, IDX, IDY, index)
    room = room or {}
    setmetatable(room, self)
    room.tiles = {}
    room.IDX = IDX
    room.IDY = IDY
    room.index = index
    self.__index = self
    return room
end


--[[ To Use in main.lua love.draw() ]]--
function Room:initTiles()
    for putY = 0, ROOM_TILE_SIZE do
        for putX = 0, ROOM_TILE_SIZE do
            table.insert(self.tiles, Tile:new(_, putX * TILE_PX_SIZE, putY * TILE_PX_SIZE))
        end
    end
end

function Room:renderTiles()
    for i = 1, #self.tiles do
        self.tiles[i]:render()
    end
end


return Room