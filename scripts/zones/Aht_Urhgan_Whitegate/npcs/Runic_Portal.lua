-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Runic Portal
-- Aht Urhgan Teleporter to Other Areas
-----------------------------------
local ID = zones[xi.zone.AHT_URHGAN_WHITEGATE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    printf('[Runic Portal:onTrigger] player=%s currentAssault=%d hasOrders=%s hasPermit=%s imperialStanding=%d runicPortals=%d',
        player:getName(),
        player:getCurrentAssault(),
        tostring(xi.assault.hasOrders(player)),
        tostring(player:hasKeyItem(xi.ki.RUNIC_PORTAL_USE_PERMIT)),
        player:getCurrency('imperial_standing'),
        player:getTeleport(xi.teleport.type.RUNIC_PORTAL))

    local runicPortals  = player:getTeleport(xi.teleport.type.RUNIC_PORTAL)
    local assaultOrders =
    {
        [0] = { KI = xi.ki.LEUJAOAM_ASSAULT_ORDERS,   tele = 0x02, valid = 2,  event = 120 },
        [1] = { KI = xi.ki.MAMOOL_JA_ASSAULT_ORDERS,  tele = 0x08, valid = 8,  event = 121 },
        [2] = { KI = xi.ki.LEBROS_ASSAULT_ORDERS,     tele = 0x10, valid = 16, event = 122 },
        [3] = { KI = xi.ki.PERIQIA_ASSAULT_ORDERS,    tele = 0x04, valid = 4,  event = 123 },
        [4] = { KI = xi.ki.ILRUSI_ASSAULT_ORDERS,     tele = 0x20, valid = 32, event = 124 },
        [5] = { KI = xi.ki.NYZUL_ISLE_ASSAULT_ORDERS, tele = 0x40, valid = 64, event = 125 },
    }

    if xi.assault.hasOrders(player) then
        for k, v in pairs(assaultOrders) do
            if player:hasKeyItem(v.KI) then
                local validTeleport = bit.band(runicPortals, v.tele)
                printf('[Runic Portal:onTrigger] matchedAssault=%d event=%d tele=%d valid=%d runicPortals=%d validTeleport=%d',
                    k,
                    v.event,
                    v.tele,
                    v.valid,
                    runicPortals,
                    validTeleport)
                player:messageSpecial(ID.text.CONFIRMING, v.KI)

                if validTeleport == v.valid then
                    player:startEvent(v.event)
                else
                    printf('[Runic Portal:onTrigger] deniedAssault=%d expectedBit=%d actual=%d', k, v.valid, validTeleport)
                    player:messageSpecial(ID.text.RUNIC_DENIED_ASSAULT_OFFSET + k)
                end

                break
            end
        end
    else
        local hasPermit = player:hasKeyItem(xi.ki.RUNIC_PORTAL_USE_PERMIT)
        local mercRank  = xi.besieged.getMercenaryRank(player)
        local points    = player:getCurrency('imperial_standing')
        local hasAstral = xi.besieged.getAstralCandescence()
        local isCaptain = player:hasKeyItem(xi.ki.CAPTAIN_WILDCAT_BADGE)

        if isCaptain then
            player:messageSpecial(ID.text.IMPERIAL_AUTHORIZATION) -- TODO: This may show in other cases
            hasPermit = false -- #1 and  #7 are always set to 0 for Captains
        end

        player:startEvent(101, hasPermit and xi.ki.RUNIC_PORTAL_USE_PERMIT or 0, runicPortals, mercRank, points, isCaptain and 1 or 0, hasAstral, hasPermit and 1 or 0, 0)
    end
end

entity.onEventFinish = function(player, csid, option, npc)
    local confirmOption = bit.band(option, 0xFFFF)
    local packedOption = bit.rshift(option, 16)
    local eventOption = packedOption > 0 and packedOption or confirmOption

    printf('[Runic Portal:onEventFinish] player=%s csid=%d option=%d confirm=%d packed=%d event=%d currentAssault=%d hasOrders=%s hasPermit=%s imperialStanding=%d runicPortals=%d',
        player:getName(),
        csid,
        option,
        confirmOption,
        packedOption,
        eventOption,
        player:getCurrentAssault(),
        tostring(xi.assault.hasOrders(player)),
        tostring(player:hasKeyItem(xi.ki.RUNIC_PORTAL_USE_PERMIT)),
        player:getCurrency('imperial_standing'),
        player:getTeleport(xi.teleport.type.RUNIC_PORTAL))

    local portalPick =
    {
        [1]    = xi.teleport.id.AZOUPH_SP,
        [2]    = xi.teleport.id.DVUCCA_SP,
        [3]    = xi.teleport.id.MAMOOL_SP,
        [4]    = xi.teleport.id.HALVUNG_SP,
        [5]    = xi.teleport.id.ILRUSI_SP,
        [6]    = xi.teleport.id.NYZUL_SP,
        [101]  = xi.teleport.id.AZOUPH_SP,
        [102]  = xi.teleport.id.DVUCCA_SP,
        [103]  = xi.teleport.id.MAMOOL_SP,
        [104]  = xi.teleport.id.HALVUNG_SP,
        [105]  = xi.teleport.id.ILRUSI_SP,
        [106]  = xi.teleport.id.NYZUL_SP,
        [120]  = xi.teleport.id.AZOUPH_SP,
        [121]  = xi.teleport.id.MAMOOL_SP,
        [122]  = xi.teleport.id.HALVUNG_SP,
        [123]  = xi.teleport.id.DVUCCA_SP,
        [124]  = xi.teleport.id.ILRUSI_SP,
        [125]  = xi.teleport.id.NYZUL_SP,
        [1001] = xi.teleport.id.AZOUPH_SP,
        [1002] = xi.teleport.id.DVUCCA_SP,
        [1003] = xi.teleport.id.MAMOOL_SP,
        [1004] = xi.teleport.id.HALVUNG_SP,
        [1005] = xi.teleport.id.ILRUSI_SP,
        [1006] = xi.teleport.id.NYZUL_SP,
    }

    local runicPortals = player:getTeleport(xi.teleport.type.RUNIC_PORTAL)
    local portalBits =
    {
        [1] = 0x02, -- Azouph
        [2] = 0x04, -- Dvucca
        [3] = 0x08, -- Mamool
        [4] = 0x10, -- Halvung
        [5] = 0x20, -- Ilrusi
        [6] = 0x40, -- Nyzul
    }

    if csid == 101 and eventOption > 100 and eventOption < 1007 and confirmOption == 1 then
        -- Map option back to portal index for bitmask check
        local portalIndex
        if eventOption >= 101 and eventOption <= 106 then
            portalIndex = eventOption - 100
        elseif eventOption >= 1001 and eventOption <= 1006 then
            portalIndex = eventOption - 1000
        end

        if
            portalIndex == nil or
            bit.band(runicPortals, portalBits[portalIndex]) == 0
        then
            return
        end

        if eventOption >= 101 and eventOption <= 106 then
            if not player:hasKeyItem(xi.ki.RUNIC_PORTAL_USE_PERMIT) then
                return
            end

            player:delKeyItem(xi.ki.RUNIC_PORTAL_USE_PERMIT)
            xi.teleport.to(player, portalPick[eventOption])
        elseif eventOption >= 1001 and eventOption <= 1006 then
            if player:getCurrency('imperial_standing') >= 200 then
                player:delCurrency('imperial_standing', 200)
                xi.teleport.to(player, portalPick[eventOption])
            else
                player:messageSpecial(ID.text.SUFFICIENT_IMPERIAL_STANDING)
            end
        end
    elseif csid == 101 and eventOption >= 1 and eventOption <= 6 and confirmOption == 1 then
        if not player:hasKeyItem(xi.ki.CAPTAIN_WILDCAT_BADGE) then
            return
        end

        if bit.band(runicPortals, portalBits[eventOption]) == 0 then
            return
        end

        xi.teleport.to(player, portalPick[eventOption])
    elseif csid >= 120 and csid <= 125 and confirmOption == 1 then
        xi.teleport.to(player, portalPick[csid])
    end
end

return entity
