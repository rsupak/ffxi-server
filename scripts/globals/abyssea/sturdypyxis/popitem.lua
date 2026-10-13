-----------------------------------
-- Abyssea Sturdy Pyxis - Pop Item
-----------------------------------
xi = xi or {}
xi.pyxis = xi.pyxis or {}

xi.pyxis.popitem = {}

-----------------------------------
-- drop id's for pop item
-----------------------------------
local popitemDrops =
{
    [xi.zone.ABYSSEA_LA_THEINE ] =
    {
        xi.item.DRIED_CHIGOE,
        xi.item.RAW_MUTTON_CHOP,
        xi.item.GARGANTUAN_BLACK_TIGER_FANG,
        xi.item.TROPHY_SHIELD,
        xi.item.OVERSIZED_SOCK,
        xi.item.MASSIVE_ARMBAND,
        xi.item.TRANSPARENT_INSECT_WING,
        xi.item.PICEOUS_SCALE,
        xi.item.WINTER_PUK_EGG,
        xi.item.BUG_EATEN_HAT,
        xi.item.GIANT_AGARICUS_MUSHROOM,
        xi.item.FILTHY_GNOLE_CLAW,
    },
    [xi.zone.ABYSSEA_TAHRONGI  ] =
    {
        xi.item.HIGH_QUALITY_CLIONID_WING,
        xi.item.HIGH_QUALITY_LIMULE_PINCER,
        xi.item.BLOODSHOT_HECTEYE,
        xi.item.BALEFUL_SKULL,
        xi.item.BLOODY_FANG,
        xi.item.CLUMP_OF_ALKALINE_HUMUS,
        xi.item.VENOMOUS_SCORPION_STINGER,
        xi.item.EFT_EGG,
        xi.item.CHUNK_OF_COCKATRICE_TAILMEAT,
        xi.item.SHOCKING_WHISKER,
        xi.item.RESILIENT_MANE,
        xi.item.MOANING_VESTIGE,
        xi.item.SHRIVELED_WING,
        xi.item.TARNISHED_PINCER,
        xi.item.EXORCISED_SKULL,
        xi.item.CLUMP_OF_ACIDIC_HUMUS,
        xi.item.QUIVERING_EFT_EGG,
        xi.item.SMOOTH_WHISKER,
    },
    [xi.zone.ABYSSEA_KONSCHTAT ] =
    {
        xi.item.VIAL_OF_EFT_BLOOD,
        xi.item.GIANT_SLUG_EYESTALK,
        xi.item.SQUARE_OF_MOONGLOW_CLOTH,
        xi.item.ROTTING_EYEBALL,
        xi.item.TINY_MORBOL_VINE,
        xi.item.OBLIVISPORE_MUSHROOM,
        xi.item.CLUMP_OF_SNAKESKIN_MOSS,
        xi.item.ARMORED_DRAGONHORN,
        xi.item.RIPPED_EFT_SKIN,
        xi.item.GIANT_BUGARD_TUSK,
        xi.item.CLOUDED_LENS,
        xi.item.MURMURING_GLOBULE,
    },
    [xi.zone.ABYSSEA_MISAREAUX ] =
    {
        xi.item.BEWITCHING_TUSK,
        xi.item.HANDFUL_OF_MOLT_SCRAPS,
        xi.item.HANDFUL_OF_APKALLU_DOWN,
        xi.item.AVIAN_REMEX,
        xi.item.CHUNK_OF_OROBON_CHEEKMEAT,
        xi.item.SPHEROID_PLATE,
        xi.item.HARDENED_RAPTOR_SKIN,
        xi.item.MOCKING_BEAK,
        xi.item.SLICE_OF_HIGH_QUALITY_CRAB_MEAT,
        xi.item.CHUNK_OF_HIGH_QUALITY_ROCK_SALT,
        xi.item.WORM_EATEN_BUD,
        xi.item.SPOTTED_FLYFROND,
        xi.item.BLACK_RABBIT_TAIL,
    },
    [xi.zone.ABYSSEA_VUNKERL   ] =
    {
        xi.item.GNARLED_TAURUS_HORN,
        xi.item.GARGOUILLE_STONE,
        xi.item.MOONBEAM_CLAM,
        xi.item.DENTED_SKULL,
        xi.item.STIFFENED_TENTACLE,
        xi.item.BLACK_WHISKER,
        xi.item.OPAQUE_WING,
        xi.item.FORTUNE_WING,
        xi.item.VIAL_OF_DJINN_ASHES,
        xi.item.SHOCKSHROOM,
        xi.item.CRAWLER_FLOATSTONE,
        xi.item.HIGH_QUALITY_RABBIT_HIDE,
    },
    [xi.zone.ABYSSEA_ATTOHWA   ] =
    {
        xi.item.WITHERED_COCOON,
        xi.item.ERUCA_EGG,
        xi.item.LUMP_OF_BLANCHED_SILVER,
        xi.item.VIAL_OF_UNDYING_OOZE,
        xi.item.HANDFUL_OF_BONE_CHIPS,
        xi.item.SET_OF_WAILING_RAGS,
        xi.item.CRACKED_DRAGONSCALE,
        xi.item.GORY_PINCER,
        xi.item.EXTENDED_EYESTALK,
        xi.item.COEURL_ROUND,
        xi.item.WITHERED_BUD,
        xi.item.MANGLED_COCKATRICE_SKIN,
        xi.item.GREAT_ROOT,
    },
    [xi.zone.ABYSSEA_ALTEPA    ] =
    {
        xi.item.VIAL_OF_TABLILLA_MERCURY,
        xi.item.SHARABHA_HIDE,
        xi.item.TIGER_KINGS_HIDE,
        xi.item.VIAL_OF_VADLEANY_FLUID,
        xi.item.BOTTLE_OF_OASIS_WATER,
        xi.item.SANDY_SHARD,
        xi.item.SMOLDERING_ARM,
        xi.item.SAND_CAKED_FANG,
        xi.item.HIGH_QUALITY_DHALMEL_HIDE,
        xi.item.VIAL_OF_PUPPETS_BLOOD,
        xi.item.HIGH_QUALITY_COCKATRICE_SKIN,
        xi.item.LADYBIRD_LEAF,
        xi.item.HIGH_QUALITY_SCORPION_CLAW,
        xi.item.HANDFUL_OF_SABULOUS_CLAY,
        xi.item.SPRIG_OF_GIANT_MISTLETOE,
    },
    [xi.zone.ABYSSEA_ULEGUERAND] =
    {
        xi.item.BEVEL_GEAR,
        xi.item.SNOW_GOD_CORE,
        xi.item.SISYPHUS_FRAGMENT,
        xi.item.RIMED_WING,
        xi.item.AUDUMBLA_HIDE,
        xi.item.HELICAL_GEAR,
        xi.item.VIAL_OF_GEAR_FLUID,
        xi.item.GELID_ARM,
        xi.item.HIGH_QUALITY_MARID_HIDE,
        xi.item.ICE_WYVERN_SCALE,
        xi.item.HANDFUL_OF_WHITEWORM_CLAY,
        xi.item.IMP_SENTRYS_HORN,
        xi.item.BENUMBED_EYE,
        xi.item.HIGH_QUALITY_BUFFALO_HORN,
        xi.item.HIGH_QUALITY_BLACK_TIGER_HIDE,
    },
    [xi.zone.ABYSSEA_GRAUBERG  ] =
    {
        xi.item.TEEKESSELCHEN_FRAGMENT,
        xi.item.MINARUJA_SKULL,
        xi.item.JACULUS_WING,
        xi.item.NAIADS_LOCK,
        xi.item.JAR_OF_GOBLIN_GUNPOWDER,
        xi.item.FLASK_OF_BUBBLING_OIL,
        xi.item.DARKFLAME_ARM,
        xi.item.PURSUERS_WING,
        xi.item.HIGH_QUALITY_WIVRE_HIDE,
        xi.item.DECAYING_MOLAR,
        xi.item.HIGH_QUALITY_PUGIL_SCALE,
        xi.item.FAY_TEARDROP,
        xi.item.UNSEELIE_EYE,
        xi.item.LENGTH_OF_GOBLIN_ROPE,
        xi.item.JAR_OF_GOBLIN_OIL,
    },
}

local function GetChestItemTable(npc)
    local maxItem = npc:getLocalVar('NB_ITEM')
    local itemTable = {}

    for i = 1, maxItem do
        itemTable[i] = npc:getLocalVar('POPITEM' .. i)
    end

    return itemTable
end

local function GetRandItem(zoneId)
    if not popitemDrops[zoneId] or #popitemDrops[zoneId] == 0 then
        return nil
    end
    local rand = math.random(1, #popitemDrops[zoneId])
    return popitemDrops[zoneId][rand]
end

local function GetLootTable(player, npc)
    local maxItem = npc:getLocalVar('NB_ITEM')
    local loot = {}

    for i = 1, maxItem do
        table.insert(loot, npc:getLocalVar('POPITEM' ..i))
    end

    return loot
end

local function GiveItem(player, npc, itemnum)
    local zoneId  = player:getZoneID()
    local ID      = zones[zoneId]
    local chestid = npc:getLocalVar('CHESTID')
    local chest   = GetNPCByID(chestid)
    local itemList = GetChestItemTable(npc)

    if itemList[itemnum] == 0 then
        player:messageSpecial(ID.text.ITEM_DISAPPEARED)
        return
    else
        if player:getFreeSlotsCount() == 0 then -- NOTE: check a var or somthing for the item
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, itemList[itemnum])
            return
        else
            player:addItem(itemList[itemnum], 1, 0, 0, 0, 0)
            xi.pyxis.messageChest(player, ID.text.OBTAINS_ITEM, itemList[itemnum], 0, 0, 0, npc)

            if chest then
                chest:setLocalVar('POPITEM' .. itemnum, 0)
            end

            itemList[itemnum] = 0
        end
    end

    if xi.pyxis.isChestEmpty(itemList) then
        xi.pyxis.removeChest(player, npc, 0, 3)
    end
end

xi.pyxis.popitem.setPopItems = function(npc)
    local itemcount = npc:getLocalVar('NB_ITEM')

    for i = 1, itemcount do
        local item = GetRandItem(npc:getZoneID())
        if item then
            npc:setLocalVar('POPITEM' .. i, item)
        end
    end
end

xi.pyxis.popitem.updateEvent = function(player, npc)
    player:updateEvent(unpack(GetChestItemTable(npc)))
end

xi.pyxis.popitem.givePopItem = function(player, npc, option)
    local ID = zones[npc:getZoneID()]
    local loottable = GetLootTable(player, npc)
    local itemSelected = bit.rshift(option, 16)

    if itemSelected > 0 and itemSelected <= 8 then
        GiveItem(player, npc, itemSelected)
    elseif itemSelected == 9 then
        for _, v in ipairs(loottable) do
            player:addTreasure(v)
        end

        xi.pyxis.messageChest(player, ID.text.ADD_SPOILS_TO_TREASURE, 0, 0, 0, 0, npc)
        xi.pyxis.removeChest(player, npc, 0, 1)
    end
end
