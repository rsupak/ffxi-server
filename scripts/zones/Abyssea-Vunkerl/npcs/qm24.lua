-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm24 (???)
-- Spawns Karkadann
-- !pos -157 -31 88 217
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_VUNKERL]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.KARKADANN_3, { xi.ki.WARPED_SMILODON_CHOKER, xi.ki.MALODOROUS_MARID_FUR })
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
