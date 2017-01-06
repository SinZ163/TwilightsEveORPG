-- TODO: Move to some util file

require("libs/timers")

function PrintTable(t, indent, done)
    --print ( string.format ('PrintTable type %s', type(keys)) )
    if type(t) ~= "table" then return end

    done = done or {}
    done[t] = true
    indent = indent or 0

    local l = {}
    for k, v in pairs(t) do
        table.insert(l, k)
    end

    table.sort(l)
    for k, v in ipairs(l) do
        -- Ignore FDesc
        if v ~= 'FDesc' then
            local value = t[v]

            if type(value) == "table" and not done[value] then
                done [value] = true
                print(string.rep ("\t", indent)..tostring(v)..":")
                PrintTable (value, indent + 2, done)
            elseif type(value) == "userdata" and not done[value] then
                done [value] = true
                print(string.rep ("\t", indent)..tostring(v)..": "..tostring(value))
                PrintTable ((getmetatable(value) and getmetatable(value).__index) or getmetatable(value), indent + 2, done)
            else
                if t.FDesc and t.FDesc[v] then
                    print(string.rep ("\t", indent)..tostring(t.FDesc[v]))
                else
                    print(string.rep ("\t", indent)..tostring(v)..": "..tostring(value))
                end
            end
        end
    end
end
--PrintTable(package.loaded)

if TwilightsEveORPG == nil then
    TwilightsEveORPG = class({})
end

function Precache( context )
    --[[
        Precache things we know we'll use.  Possible file types include (but not limited to):
        PrecacheResource( "model", "*.vmdl", context )
        PrecacheResource( "soundfile", "*.vsndevts", context )
        PrecacheResource( "particle", "*.vpcf", context )
        PrecacheResource( "particle_folder", "particles/folder", context )
    ]]
end

-- Create the game mode when we activate
function Activate()
    GameRules.TwilightsEveORPG = TwilightsEveORPG()
    GameRules.TwilightsEveORPG:InitGameMode()
end

function TwilightsEveORPG:InitGameMode()
    local levels = {}
    for i = 1, 300 do
        levels[i] = getExpForLevel(i)
    end
    GameRules:GetGameModeEntity():SetCustomXPRequiredToReachNextLevel(levels)
    GameRules:GetGameModeEntity():SetUseCustomHeroLevels(true)
    ListenToGameEvent("npc_spawned", Dynamic_Wrap(TwilightsEveORPG, "OnNPCSpawned"), self)
    ListenToGameEvent("dota_player_gained_level", Dynamic_Wrap(TwilightsEveORPG, "OnPlayerGainedLevel"), self)
end

function TwilightsEveORPG:OnNPCSpawned(keys)
    local npc = EntIndexToHScript(keys.entindex)

    -- when a hero first spawns
    if npc:IsRealHero() and npc.bFirstSpawned == nil then
        npc:AddItemByName("item_ring_of_protection")
        npc:AddItemByName("item_ring_of_protection")
        npc:AddItemByName("item_ring_of_protection")
        npc:SwapItems(DOTA_ITEM_SLOT_1, DOTA_ITEM_SLOT_7)
        npc:SwapItems(DOTA_ITEM_SLOT_2, DOTA_ITEM_SLOT_8)
        npc:SwapItems(DOTA_ITEM_SLOT_3, DOTA_ITEM_SLOT_9)
    end
end

function TwilightsEveORPG:OnPlayerGainedLevel( event )
    local player = EntIndexToHScript( event.player )
    local hero = player:GetAssignedHero()
        
    local currentCount = 0
    local maxCount = 0
    for i = 0, 5 do
        local ability = hero:GetAbilityByIndex(i)
        if (ability ~= nil) then
            currentCount = currentCount + ability:GetLevel()
            maxCount = maxCount + ability:GetMaxLevel()
        end
    end
    if maxCount > hero:GetLevel() then
        maxCount = hero:GetLevel()
    end
    hero:SetAbilityPoints(maxCount - currentCount)
end

function getExpForLevel(level)
    if level <= 1 then
        return 0
    elseif level == 2 then
        return 100
    elseif level == 3 then
        return 450
    else
        local base = 450
        local exp = 450
        for i = 0, level - 3 do
            exp = exp + (base+100*i)
        end

        return exp
    end
end