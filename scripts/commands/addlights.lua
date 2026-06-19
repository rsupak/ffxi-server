-----------------------------------
-- func: addlights <light type> <amount> <target player>
-- desc: Adds the amount of specified light to the player
-----------------------------------
-- engine order: 1: pearl, 2: golden, 3: silvery, 4: ebon, 5: azure, 6: ruby, 7: amber
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 'sis'
}

local lightType =
{
    pearl   = xi.abyssea.lightType.PEARL,
    gold    = xi.abyssea.lightType.GOLDEN,
    golden  = xi.abyssea.lightType.GOLDEN,
    silver  = xi.abyssea.lightType.SILVERY,
    silvery = xi.abyssea.lightType.SILVERY,
    ebon    = xi.abyssea.lightType.EBON,
    azure   = xi.abyssea.lightType.AZURE,
    ruby    = xi.abyssea.lightType.RUBY,
    amber   = xi.abyssea.lightType.AMBER,
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!addlights <light type> <amount> (player)')
end

commandObj.onTrigger = function(player, light, amount, target)
    -- validate target
    local targ
    if target == nil then
        targ = player
    else
        targ = GetPlayerByName(target)
        if targ == nil then
            error(player, string.format('Player named "%s" not found!', target))
            return
        end
    end

    local selectedLight = tostring(light)

    if lightType[selectedLight] == nil or selectedLight == nil then
        error(player, 'Invalid light type.\nValid light types: pearl, azure, ruby, amber, gold, silver, ebon')
        return
    end

    local setLight = 0

    if lightType[selectedLight] ~= nil then
        setLight = lightType[selectedLight]
    end

    -- validate amount
    if amount == nil or amount < 1 then
        error(player, 'Invalid amount.')
        return
    end

    xi.abyssea.addPlayerLights(targ, setLight, amount)

    local lightValues = xi.abyssea.getLightsTable(targ)
    local newAmount = lightValues[setLight] or 0
    player:printToPlayer(string.format('%s was given %i %s light, for a total of %i.', targ:getName(), amount, selectedLight, newAmount))
end

return commandObj
