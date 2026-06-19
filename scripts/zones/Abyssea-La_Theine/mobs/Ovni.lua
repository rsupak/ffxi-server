-----------------------------------
-- Area: Abyssea - La Theine
--   NM: Ovni
-----------------------------------
---@type TMobEntity
local entity = {}

entity.onMobInitialize = function(mob)
    mob:setMobMod(xi.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(xi.mobMod.NO_STANDBACK, 1)
end

entity.onMobSpawn = function(mob)
    -- Mirror Yovra behavior: airborne/hidden at spawn.
    mob:setMod(xi.mod.REGEN, 50)
    mob:setMobMod(xi.mobMod.WEAPON_BONUS, mob:getMainLvl() - 2) -- Base damage is level * 2
    mob:addMod(xi.mod.DEF, mob:getStat(xi.mod.DEF) * 0.5)       -- +50% defense while in this form
    mob:hideName(true)
    mob:setUntargetable(true)
    mob:setAnimationSub(5)
    mob:wait(2000)
end

entity.onMobEngage = function(mob, target)
    -- Descend and become targetable when combat starts.
    mob:setLocalVar('disengageTimerActive', 0)
    mob:hideName(false)
    mob:setUntargetable(false)
    mob:setAnimationSub(6)
    mob:wait(2000)
end

entity.onMobFight = function(mob, target)
    -- Safety net: keep Ovni descended while actively fighting.
    if mob:getAnimationSub() == 5 then
        mob:hideName(false)
        mob:setUntargetable(false)
        mob:setAnimationSub(6)
    end
end

entity.onMobDisengage = function(mob)
    -- Return to airborne state shortly after losing aggro.
    mob:setLocalVar('disengageTimerActive', 1)
    mob:timer(15000, function(mobArg)
        if
            mobArg and
            mobArg:getLocalVar('disengageTimerActive') == 1 and
            not mobArg:isEngaged()
        then
            mobArg:hideName(true)
            mobArg:setUntargetable(true)
            mobArg:setAnimationSub(5)
        end
    end)
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
