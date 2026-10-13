-----------------------------------
-- Zone: Abyssea-Misareaux
--  NPC: qm23 (???)
-- Spawns Sobek
-- !pos 388.810 21.489 -418.133 216
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_MISAREAUX]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.SOBEK_3, { xi.ki.BLOODSTAINED_BUGARD_FANG, xi.ki.GNARLED_LIZARD_NAIL, xi.ki.MOLTED_PEISTE_SKIN })
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
