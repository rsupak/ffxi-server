-----------------------------------
-- Area: Abyssea - Tahrongi
--   NM: Myrmecoleon
-- Note: Emerges and becomes targetable when Lachrymater moves over it.
-----------------------------------
mixins = { require('scripts/mixins/families/antlion_ambush_no_rehide') }
-----------------------------------
---@type TMobEntity
local entity = {}

local revealDistance = 6

entity.onMobRoam = function(mob)
    if mob:getLocalVar('[Ambush]Triggered') ~= 0 then
        return
    end

    local ID = zones[xi.zone.ABYSSEA_TAHRONGI]
    local lachrymater = GetMobByID(ID.mob.LACHRYMATER)

    if
        lachrymater and
        lachrymater:isSpawned() and
        lachrymater:isAlive() and
        mob:checkDistance(lachrymater) <= revealDistance
    then
        mob:setLocalVar('[Ambush]Triggered', 1)
        mob:useMobAbility(xi.mobSkill.PIT_AMBUSH_1)

        -- Fallback in case the ambush weaponskill is interrupted.
        mob:timer(3000, function(mobArg)
            if mobArg and mobArg:getLocalVar('[Ambush]Done') == 0 then
                mobArg:hideName(false)
                mobArg:setUntargetable(false)
                mobArg:setAutoAttackEnabled(true)
                mobArg:setAnimationSub(1, false)
                mobArg:setMobMod(xi.mobMod.NO_MOVE, 0)
                mobArg:setLocalVar('[Ambush]Done', 1)
            end
        end)
    end
end

entity.onMobDeath = function(mob, player, optParams)
    if player then
        player:addTitle(xi.title.MYRMECOLEON_TAMER)
    end
end

return entity
