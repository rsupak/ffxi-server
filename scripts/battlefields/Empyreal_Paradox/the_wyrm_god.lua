-----------------------------------
-- Area: Abyssea-Empyreal_Paradox
-- Name: The Wyrm God
-----------------------------------

local content = BattlefieldQuest:new({
    zoneId        = xi.zone.ABYSSEA_EMPYREAL_PARADOX,
    battlefieldId = xi.battlefield.id.THE_WYRM_GOD,
    allowTrusts   = true,
    maxPlayers    = 18,
    levelCap      = xi.settings.main.MAX_LEVEL,
    timeLimit     = utils.minutes(30),
    index         = 0,
    entryNpc      = 'TR_Entrance',
    exitNpc       = 'Transcendental_Radiance',
    questArea     = xi.questLog.ABYSSEA,
    quest         = xi.quest.id.abyssea.THE_WYRM_GOD,
})

function content:checkRequirements(player, npc, isRegistrant, trade)
    if not Battlefield.checkRequirements(self, player, npc, isRegistrant, trade) then
        return false
    end

    local questStatus = player:getQuestStatus(self.questArea, self.quest)

    -- Repeatable after completion; for first clear require the quest to be at BC-ready step.
    if questStatus == xi.questStatus.QUEST_COMPLETED then
        return true
    end

    if questStatus ~= xi.questStatus.QUEST_ACCEPTED then
        return false
    end

    return player:getCharVar('Quest[8][184]Prog') >= 1
end

function content:onEventFinishWin(player, csid, option, npc)
    player:setPos(540, -500, -571, 64, xi.zone.ABYSSEA_EMPYREAL_PARADOX)
end

content.groups =
{
    {
        mobIds =
        {
            { 17821697 },
            { 17821698 },
            { 17821699 },
        },

        allDeath = function(battlefield, mob)
            battlefield:setStatus(xi.battlefield.status.WON)
        end,
    },
}

return content:register()
