-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm23 (???)
-- Spawns Durinn
-- !pos -571 -47 -570 217
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_VUNKERL]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, ID.mob.DURINN_3, { xi.ki.DECAYED_DVERGR_TOOTH, xi.ki.PULSATING_SOULFLAYER_BEARD, xi.ki.CHIPPED_IMPS_OLIFANT })
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.abyssea.qmOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.abyssea.qmOnEventFinish(player, csid, option, npc)
end

return entity
