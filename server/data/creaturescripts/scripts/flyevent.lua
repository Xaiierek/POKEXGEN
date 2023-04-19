function onMove(creature, toPosition, fromPosition)
    local player = Player(creature:getId())
    if player:isOnFly() then

        --print(creature)
        local pose =
        {
            {x=fromPosition.x-1,y=fromPosition.y-1,z=fromPosition.z},
            {x=fromPosition.x,y=fromPosition.y-1,z=fromPosition.z},
            {x=fromPosition.x+1,y=fromPosition.y-1,z=fromPosition.z},
            {x=fromPosition.x-1,y=fromPosition.y,z=fromPosition.z},
            {x=fromPosition.x,y=fromPosition.y,z=fromPosition.z},
            {x=fromPosition.x+1,y=fromPosition.y,z=fromPosition.z},
            {x=fromPosition.x-1,y=fromPosition.y+1,z=fromPosition.z},
            {x=fromPosition.x,y=fromPosition.y+1,z=fromPosition.z},
            {x=fromPosition.x+1,y=fromPosition.y+1,z=fromPosition.z}	
        }
        
        for i = 1,9 do
        
            local fromTile = Tile(pose[i])
            if fromTile then
                local fromItem = fromTile:getItemById(flyFloor)
                if fromItem then
                    fromItem:remove()
                end
            end
        end
        toPosition:createFlyFloor()
    end
    return true
end