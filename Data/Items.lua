-- Data/Items.lua
-- https://github.com/ticstyle/WoW-OpenIt

-- luacheck: globals

local _, addon = ...

-- Database of item IDs that can be opened or used as containers
addon.knownItems = {
    -- Caches, Satchels & Containers
    [207002] = true, -- Heavy Dragonscale Chest
    [211413] = true, -- Radiant Cache
    [202081] = true, -- Dreamsurge Crate

    -- Lockboxes & Geodes
    [168853] = true, -- Barnacled Lockbox
    [202091] = true, -- Unexplored Geode

    -- Add new openable item IDs here:
    -- [itemID] = true,
}
