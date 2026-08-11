-- Data/Blacklist.lua
-- https://github.com/ticstyle/WoW-OpenIt

-- luacheck: globals

local _, addon = ...

-- Permanent blacklist for items that should never trigger the addon (Hearthstones, teleports, etc.)
-- These will NOT show up in the user options panel blacklist.
addon.hardcodedBlacklist = {
    -- Hearthstones & Teleport Toys/Items
    [6948] = true, -- Hearthstone
    [110560] = true, -- Garrison Hearthstone
    [140192] = true, -- Dalaran Hearthstone
    [128353] = true, -- Admiral's Compass
    [141605] = true, -- Flight Master's Whistle
    [200613] = true, -- Wyrmhole Generator

    -- Add permanent blacklisted item IDs here:
    -- [itemID] = true,
}
