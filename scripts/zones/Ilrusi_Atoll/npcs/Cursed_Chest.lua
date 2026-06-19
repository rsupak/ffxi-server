-----------------------------------
-- Area: Ilrusi Atoll
--  NPC: Cursed Chest
-----------------------------------
-- Interaction is handled by mobs/Cursed_Chest.lua onTrigger.
-- The mob entity (same targid, TYPE_MOB < TYPE_NPC in GetEntity lookup) is
-- returned first by CZoneEntities::GetEntity, so this onTrigger is unreachable
-- as long as the mob is spawned. Kept as a fallback.
-----------------------------------
local ID = zones[xi.zone.ILRUSI_ATOLL]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    player:messageSpecial(ID.text.CHEST)

    local npcID    = npc:getID()
    local instance = npc:getInstance()
    if not instance then
        return
    end

    local figureheadChest = instance:getProgress()

    if npcID == figureheadChest then
        player:messageSpecial(ID.text.GOLDEN)
        instance:complete()
        for _, v in pairs(ID.mob[2]) do
            DespawnMob(v, instance)
        end
    else
        local mob = SpawnMob(npcID, instance)
        if mob then
            mob:updateClaim(player)
        end
    end
end

return entity
