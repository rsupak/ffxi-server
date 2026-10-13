-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm15 (???)
-- Spawns Pantokrator
-- !pos -198 -175 140 253
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_ULEGUERAND]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.PANTOKRATOR_2, { xi.ki.WARPED_IRON_GIANT_NAIL, xi.ki.DENTED_CHARIOT_SHIELD })
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
