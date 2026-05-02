local addonName, addonTable = ...
local Utils = {}
addonTable.Utils = Utils

function Utils:GetCharacterProfile()
    local level = UnitLevel("player")
    local _, classFilename = UnitClass("player")
    
    local role = "Unknown"
    if level < 5 then
        role = "Banker"
    elseif level < 70 then
        role = "Leveling Legend"
    else
        role = "Champion"
    end
    
    local archetype = "Adventurer"
    local a = {
        WARRIOR = "Phys DPS", ROGUE = "Phys DPS", HUNTER = "Phys DPS",
        MAGE = "Caster", WARLOCK = "Caster",
        PRIEST = "Healer", SHAMAN = "Healer",
        PALADIN = "Tank", DRUID = "Tank"
    }
    archetype = a[classFilename] or "Adventurer"
    
    return role, archetype, classFilename
end

function Utils:Random(...)
    local n = select("#", ...)
    if n == 0 then return nil end
    return select(math.random(n), ...)
end
