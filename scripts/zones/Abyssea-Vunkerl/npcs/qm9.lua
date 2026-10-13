-----------------------------------
-- Zone: Abyssea-Vunkerl
--  NPC: qm9 (???)
-- Spawns Chhir Batti
-- !pos -395.665 -31.565 358.085 217
-----------------------------------
local ID = zones[xi.zone.ABYSSEA_VUNKERL]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    xi.abyssea.qmOnTrade(player, npc, trade, ID.mob.CHHIR_BATTI, { xi.item.VIAL_OF_DJINN_ASHES })
end

entity.onTrigger = function(player, npc)
    xi.abyssea.qmOnTrigger(player, npc, 0, 0, { xi.item.VIAL_OF_DJINN_ASHES })
end

return entity
