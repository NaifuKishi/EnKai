local addonInfo, privateVars = ...

---------- init namespace ---------

if not privateVars.langTexts then privateVars.langTexts = {} end

local lang = nil

---------- init language texts ---------

if Inspect.System.Language() == "English" then

	lang = {	addonUpdate	= '<font color="#FF6A00">New version <font color="#FFFFFF">%s</font> of addon <font color="#FFFFFF">%s</font> available. Please update the addon.</font>',
						tooltips = {moveToggle = 'Activate this box to move the window',
						hideToggle = 'Click here to hide the window',
						managerButton	= 'Left click to open menu\nMiddle click to toggle moveable\nRight click and drag to move'},
						requiredFaction = 'Requires %s:\n%s',
						factionList = {"Friendly", "Decorated", "Honored", "Revered", "Glorified", "Venerated"},
						yes  = 'Yes',
						no = 'No',
						ok = 'Ok',
						cancel = 'Cancel',
						bop = 'Bind on Pickup',
						msgReload		= 'The UI needs to be reloaded',
						reloadButton		= 'Reload',
						account = 'Account Bound',
						bound = 'Soldbound',
						copy		= 'copy',
						paste		= 'paste',
						color		= 'color',
						isEquipped		= 'Currently equipped %s',
						boundText		= { equip = 'Bin on equip', use = "Bind on use", pickup = "Bind on pickup", account = "Account bound"},
						dps = "Damage per second: %.1f\n%d-%d Damage all %1.f seconds",
						stats		= { armor 		= "Armor", 
    										block 		= "Block",
    										critAttack	= "Physical Crit",
    										critPower	= "Critical Power",
    										critSpell	= "Spell Hit",
    										deflect		= "Deflect",
    										dexterity	= "Dexterity",
    										dodge		= "Dodge",
    										endurance	= "Endurance",
    										hit			= "Hit",
    										intelligence= "Intelligence",
    										parry		= "Parry",
    										powerAttack = "Attackpower",
    										powerSpell	= "Spellpower",
    										resistAir	= "Resistance Air",
    										resistAll	= "Resistance All",
    										resistDeath	= "Resistance Death",
    										resistEarth	= "Resistance Earth",
    										resistFire	= "Resistance Fire",
    										resistLife	= "Resistance Life",
    										resistWater	= "Resistance Water",
    										strength	= "Strength",
    										wisdom		= "Wisdom",
    										valor		= "Valor",
    										toughness	= "Toughness",
    										vengeance	= "Vengeance" },
						equip		= "Equip: %s",
						use			= "Use: %s",
						requiredLevel = "Requires level %d",
						requiredCalling = "Calling: %s",				
						callings		= { mage = "Mage", rogue = "Rogue", warrior = "Warrior", cleric = "Cleric", primalist = "Primalist"},
						cost		= 'Costs: ',
						upgrade		= 'Upgrade result using ',
  }
  
	lang.items = {txtCape = 'Cape',
            		txtStaff = 'Staff',
            		txtTwoHand = '2h weapon',
            		txtHammer = 'Hammer',
            		txtPolearm = 'Polearm',
            		txtSword = 'Sword',
            		txtAxe = 'Axe',
            		txtMace = 'Mace',
            		txtDagger = 'Dagger',
            		txtEssenceLesser = 'Essence lesser',
            		txtEssenceGreater = 'Essence greater',
            		txtMainhand = 'Mainhand',
            		txtOneHand = '1h weapon',
					txtRanged		  = 'Ranged',
            		txtWand = 'Wand',
            		txtGun = 'Gun',
            		txtBow = 'Bow',
            		txtHelmet = 'Helmet',
            		txtPlate = 'Plate',
            		txtLeather = 'Leather',
            		txtChain = 'Chain',
            		txtCloth = 'Cloth',
            		txtShoulders = 'Shoulders',
            		txtChest = 'Chest',
            		txtGloves = 'Gloves',
            		txtBelt = 'Belt',
            		txtLegs = 'Legs',
            		txtFeet = 'Feet',
            		txtRing = 'Ring',
					txtEarring		  = 'Earring',
            		txtOffhand = 'Offhand',
            		txtNeck = 'Neck',
            		txtShield = 'Shield',
            		txtTrinket = 'Trinket',
            		txtPet = 'Companion',
            		txtCurrency = 'Currency',
            		txtMount = 'Mount',
            		txtOther = 'Other',
            		txtSynergyCrystal = 'Synergy Crystal',
            		txtFocus = 'Planar Focus',
            		txtRecipe = 'Recipe',
            		txtLure = 'Lure',
            		txtHusk = 'Husk',
            		txtRune = 'Rune',
            		txtConsumable = 'Consumable',
            		txtCostume = 'Costume',
            		txtTitle = 'Title',
            		txtContainer = 'Container',
            		txtSeal = 'Seal',
            		txtDimension = 'Dimension item',
            		txtItemUpgrade = 'Upgrade item',
            		txtReagent = 'Crafting ingredient'
	}
	
	lang.profession = { txtApothecary = 'Apothecary',
                  		txtArtificer = 'Artificer',
                  		txtRunecrafter = 'Runecrafter',
                  		txtWeaponsmith = 'Weaponsmith',
                  		txtOutfitter = 'Outfitter',
                  		txtArmorsmith = 'Armorsmith',
	}
	
	lang.factionNames = { ["Arcane Hand"]= "Arcane Hand",
                        ["Atragarians"]= "Atragarians",
                        ["Caretakers"]= "Caretakers",
                        ["Cerulean Rhenke"]= "Cerulean Rhenke",
                        ["Defiants"]= "Defiants",
                        ["Defiant"]= "Defiant",
                        ["Dragonslayer Covenant"]= "Dragonslayer Covenant",
                        ["Eldritch Seekers"]= "Eldritch Seekers",
                        ["Eldritch Vanguard"]= "Eldritch Vanguard",
                        ["Ember Scholars"]= "Ember Scholars",
                        ["Empyreal Alliance"]= "Empyreal Alliance",
                        ["Eternal City Survivors"]= "Eternal City Survivors",
                        ["Freemarch Wardens"]= "Freemarch Wardens",
                        ["Gloamwood Waykeepers"]= "Gloamwood Waykeepers",
                        ["Granite Falls"]= "Granite Falls",
                        ["Guardians"]= "Guardians",
                        ["Hailol"]= "Hailol",
                        ["Icewatch"]= "Icewatch",
                        ["Iron Claw Trappers"]= "Iron Claw Trappers",
                        ["Kelari Expedition"]= "Kelari Expedition",
                        ["Manugo League"]= "Manugo League",
                        ["Mendicant Order"]= "Mendicant Order",
                        ["Mercurial Savants"]= "Mercurial Savants",
                        ["Necropolis Caretakers"]= "Necropolis Caretakers",
                        ["Noble Guard"]= "Noble Guard",
                        ["Order of Life Serene"]= "Order of Life Serene",
                        ["Order of Mathos"]= "Order of Mathos",
                        ["Order of Purity"]= "Order of Purity",
                        ["Order of the Death Serpent"]= "Order of the Death Serpent",
                        ["Order of the Flame"]= "Order of the Flame",
                        ["Pelagic Order"]= "Pelagic Order",
                        ["Quarry Rats"]= "Quarry Rats",
                        ["Quicksilver Scholars"]= "Quicksilver Scholars",
                        ["Red Scar Trackers"]= "Red Scar Trackers",
                        ["Ridgerunner Mercenaries"]= "Ridgerunner Mercenaries",
                        ["Runic Sages"]= "Runic Sages",
                        ["Students of the Vale"]= "Students of the Vale",
                        ["The Achyati"]= "The Achyati",
                        ["The Farclan"]= "The Farclan",
                        ["The Ghar"]= "The Ghar",
                        ["The Grim Disciples"]= "The Grim Disciples",
                        ["The Keepers"]= "The Keepers",
                        ["The Lycini"]= "The Lycini",
                        ["The Moribund"]= "The Moribund",
                        ["The Onir"]= "The Onir",
                        ["The Order of the Eye"]=  "The Order of the Eye",
                        ["The Qaijiri"]= "The Qaijiri",
                        ["The Runeguard"]= "The Runeguard",
                        ["Runeguard"]= "Runeguard",
                        ["The Seekers"]= "The Seekers",
                        ["The Shale Collegiate"]= "The Shale Collegiate",
                        ["The Storm Guard"]= "The Storm Guard",
                        ["The Storm Inquisition"]= "The Storm Inquisition",
                        ["The Unseen"]= "The Unseen",
                        ["The Unspoken"]= "The Unspoken",
                        ["Torvan Hunters"]= "Torvan Hunters",
                        ["Whitefall Brigade"]= "Whitefall Brigade",
                        ["Zephyrian Collective"]= "Zephyrian Collective",
						["Shal Korva"]= "Shal Korva"
  } 
	
	lang.mapPatterns = {
    RIFT = {Empyreal = "EMPYREAL", Fire = "FIRE",  Earth = "EARTH", Air = "AIR", Life = "LIFE", Nightmare = "NIGHTMARE", Death = "DEATH", Water = "WATER", Guardian = "GUARDIAN", Defiant = "DEFIANT", Neutral = "NEUTRAL" },
    FOOTHOLD = { Architect = "ARCHITECT", Achyati = "ACHYATI"},
    RIFTEVENT = { Neutral = "NEUTRAL"},
    PROFESSIONS = { Runecrafting = "RUNECRAFTER", Runecrafter = "RUNECRAFTER", Outfitter = "OUTFITTER", Armorsmith = "ARMORSMITH", Weaponsmith = "WEAPONSMITH", 
                    Artificer = "ARTIFICER", Handwerker = "ARTIFICER", 
                    Butcher = "BUTCHERING", Metzger = "BUTCHERING", 
                    Fisher = "FISHING", Miner = "MINING", Forager = "FORAGING", Apothecary = "ALPOTHECARY", ["Dream Weaver"] = "DREAMWEAVER",
                    Survivalist = "SURVIVAL", ["Überlebenskunst"] = "SURVIVAL"},
    RESOURCEORE = { Platinum = "PLATINUM", Gantimit = "GANTIMITE", Gold = "GOLD", Silver ="SILVER", Iron = "IRON", Cobalt = "COBALT", Chromit = "CHROMITE", Tin = "TIN", Copper = "COPPER", Thalasit = "THALASIT", Rhenium = "RHENIUM", Karthite = "KARTHITE", Carmintium = "CARMINTIUM", Titanium = "TITANIUM", Atramentium = "ATRAMENTIUM", Bolidium = "BOLIDIUM" },
    RESOURCEWOOD = { Linden = "LINDEN", Elm = "ELM", Birke = "BIRCH", Oak = "OAK", Mahogany = "MAHOGANY", Ashwood = "ASHWOOD", Kingswood = "KINGSWOOD", Yew = "YEWLOG", Sagebrush = "SAGEBRUSH", Runebirch = "RUNEBIRCH", Madros = "MADROSA", Shadethorn = "SHADETHORN"},
    RESOURCEPLANTS = { Tempest = "TEMPESTFLOWER", Razor = "RAZORBRUSH", Dusk = "DUSKGLORY", Frazzle = "FRAZZLE", Kraken = "KRAKENWEED", Coastal = "COASTALGLORY", Creeper= "CREEPER", Basilisk = "BASILISKWEED", Lucid = "LUCIDFLOWER"},
    CLASSES = { Rogue = "ROGUE", Warrior = "WARRIOR", Mage = "MAGE", Cleric = "CLERIC", Primalist = "PRIMALIST"},
    FACTIONS = { ["Wächter"] = "GUARDIANS", Skeptiker = "DEFIANTS", Neutral = "NEUTRAL"},
    BASE = { Nightfall = "NIGHTFALL", Oathsworn = "OATHSWORN", Dominion = "DOMINION"}
  }
  
  lang.mapIdentifiers = {
  
    { pattern="[mM]aster ([%aäüöÜÖÄ%s]+)", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS }, 
    { pattern="Expert ([%aäüöÜÖÄ%s]+)", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    { pattern="Skilled ([%aäüöÜÖÄ%s]+)", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    { pattern="Savant ([%aäüöÜÖÄ%s]+)", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    { pattern="Rune Upgrade Recipe Trainer", type = "PROFESSION.RECIPESELLER.RUNECRAFTER", name = "DESC1" },
    { pattern="([%aäüöÜÖÄ]+)% Recipes", type = "PROFESSION.RECIPESELLER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    { pattern="Dimension Crafting Recipes", type = "PROFESSION.RECIPESELLER.DREAMWEAVER", name = "DESC1" },
    { pattern="Survivalist and Fisher Recipes", type = "PROFESSION.RECIPESELLER.OTHER", name = "DESC1" },
    { pattern="Artisan Store", type = "PROFESSION.RECIPESELLER.GENERIC", name = "DESC1" },
    
    { pattern="Mailbox", type = "VARIA.LETTERBOX" },
    { pattern="Banker", type = "VARIA.BANK", name = "DESC1" },
    { pattern="Guild Banker", type = "VARIA.GUILDBANK", name = "DESC1" },
    { pattern="Guild Questmaster", type = "VARIA.GUILDQUESTGIVER", name = "DESC1" },
    { pattern="Auctioneer", type = "VARIA.AUCTIONHOUSE", name ="DESC1" },
    { pattern="Healer", type = "VARIA.HEALER", name = "DESC1" },
	{ pattern = "Soul Mender", type = "VARIA.HEALER", name = "DESC1" },
    { pattern="Stylist", type = "VARIA.STYLIST", name = "DESC1"},
    
    { pattern="Antapo Extractor", type = "PVP.CONQUEST.STEPPES.EXTRACTOR.ANTAPO", name = "DESC1", level = "DESC3"},
    { pattern="Brevo Extractor", type = "PVP.CONQUEST.STEPPES.EXTRACTOR.BREVO", name = "DESC1", level = "DESC3"},
    { pattern="Antapo Charge", type = "PVP.CONQUEST.STEPPES.PICKUP.ANTAPO", name = "DESC1"},
    { pattern="Brevo Charge", type = "PVP.CONQUEST.STEPPES.PICKUP.BREVO", name = "DESC1"},
    { pattern="Nightfall Extractor", type = "PVP.CONQUEST.EXTRACTOR.NIGHTFALL", name = "DESC1", level = "DESC3"},
    { pattern="Dominion Extractor", type = "PVP.CONQUEST.EXTRACTOR.DOMINION", name = "DESC1", level = "DESC3"},
    { pattern="Oathsworn Extractor", type = "PVP.CONQUEST.EXTRACTOR.OATH", name = "DESC1", level = "DESC3"},
    { pattern="Contested Extractor", type = "PVP.CONQUEST.EXTRACTOR.FIGHT", name = "DESC1", level = "DESC3"},
    { pattern="Conquest Extractor", type = "PVP.CONQUEST.EXTRACTOR.NEUTRAL", name = "DESC1", level = "DESC3"},
    { pattern="(%a+) Base", type = "PVP.CONQUEST.BASE", regExValues = lang.mapPatterns.BASE, level = "DESC2"},
    { pattern="Recent Kills: %d", type = "PVP.CONQUEST.FIGHT", regExCompute = {"info"} },
--    { pattern="Traumgenerator", type = "PVP.CONQUEST.STEPPES.DREAMGENERATOR", level = "DESC2" },
    { pattern="Oathsworn $", type = "PVP.CONQUEST.CARRIER.OATH", name = "DESC1", level = "DESC2", regExCompute = {} },
    { pattern="Nightfall $", type = "PVP.CONQUEST.CARRIER.NIGHTFALL", name = "DESC1", level = "DESC2", regExCompute = {} },
    { pattern="Dominion $", type = "PVP.CONQUEST.CARRIER.DOMINION", name = "DESC1", level = "DESC2", regExCompute = {} },
    { pattern="Sourcestone", type = "PVP.CONQUEST.CARRIER.SOURCESTONE" },
    
	{ pattern = "Crafting Rift (Active)", type = "RIFT.CRAFTING" },
	{ pattern = "Crafting Rift (Unstable)", type = "RIFT.CRAFTING" },
    { pattern="Raid Rift (Tear)", type = "RIFT.RAID.UNOPENED" },
    { pattern="Minor Rift (Tear)", type = "RIFT.MINOR.UNOPENED", level = "DESC1" },    
    { pattern="Minor (%a+) Rift %(Active%)", type = "RIFT.MINOR.ACTIVE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    { pattern="Minor (%a+) Rift %(Unstable%)", type = "RIFT.MINOR.UNSTABLE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    { pattern="Major Rift (Tear)", type = "RIFT.MAJOR.UNOPENED", level = "DESC1" },    
    { pattern="Major (%a+) Rift %(Active%)", type = "RIFT.MAJOR.ACTIVE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    { pattern="Major (%a+) Rift %(Unstable%)", type = "RIFT.MAJOR.UNSTABLE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    { pattern="Raid (%a+) Rift %(Active%)", type = "RIFT.RAID.ACTIVE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    { pattern="Raid (%a+) Rift %(Unstable%)", type = "RIFT.RAID.UNSTABLE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    { pattern="Expert (%a+) Rift %(Active%)", type = "RIFT.EXPERT.ACTIVE", regExValues = lang.mapPatterns.RIFT },
    { pattern="Expert (%a+) Rift %(Unstable%)", type = "RIFT.EXPERT.UNSTABLE", regExValues = lang.mapPatterns.RIFT },
    { pattern="(%a+) Controlled Border Fort", type = "RIFT.FOOTHOLD", level = "DESC1", regExValues = lang.mapPatterns.FOOTHOLD },
    { pattern="(%a+) Stronghold", type = "RIFT.STRONGHOLD", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    
    --{ pattern="Verbündeter: (%a+)", type = "RIFT.EVENT.POINT", name = "DESC1", regExValues = lang.mapPatterns.RIFT },
    
    { pattern="(%a+) Invasion", type = "RIFT.INVASION", name="DESC1", level = "DESC2", regExValues = lang.mapPatterns.RIFT },
    { pattern="([%aäüöÜÖÄ]+) Foothold", type = "RIFT.POST", name="DESC1", level = "DESC2", regExValues = lang.mapPatterns.RIFT },
    { pattern="Defend this wardstone", type = "RIFT.EVENT.WARDSTONE.PROTECT", name="DESC1"},
    { pattern="Wardstone destroyed", type = "RIFT.EVENT.WARDSTONE.DESTROYED", name="DESC1"},
    
    { pattern="(%a+) Quartmaster", type = "QUARTERMASTER.PLANES",  regExCompute = {"name"}, faction = "DESC2"},
    { pattern="(%a+) Quartermaster", type = "QUARTERMASTER.PLANES",  regExCompute = {"name"}, faction = "DESC2"},
    { pattern="Quartermaster (%a+)", type = "QUARTERMASTER.PLANES",  regExCompute = {"name"}, faction = "DESC2"},
    { pattern="Specialty Crafting Goods", type = "VENDOR.PROFESSION", name = "DESC1" },
    { pattern="Bounty Hunter Supplies", type = "VENDOR.HUNT", name = "DESC1" },
    { pattern="Dyes", type = "VENDOR.DYES", name = "DESC1" },
    { pattern="Mounts", type = "VENDOR.MOUNTS", name = "DESC1"},
    { pattern="Dimension Engineer", type = "VENDOR.DIMENSIONS", name = "DESC1"},
    { pattern="Guild Charter", type = "VENDOR.OTHER", name = "DESC1"},
    { pattern="Marriage Coordinator", type = "VARIA.MARRIAGE", name = "DESC1"},
	{ pattern = "Warfront Battlemaster", type = "VARIA.NPC.PVP" },

    { pattern="(%a+)% Trainer", type = "TEACHER", name = "DESC1", regExValues = lang.mapPatterns.CLASSES },
    { pattern="Porticulum", type = "PORTAL", name = "DESC1"},
    
    { pattern="(%a+) Lode", type = "RESOURCE.ORE", regExValues = lang.mapPatterns.RESOURCEORE},
    { pattern="(%a+) Vein", type = "RESOURCE.ORE", regExValues = lang.mapPatterns.RESOURCEORE},
    { pattern="(%a+) Deposit", type = "RESOURCE.ORE", regExValues = lang.mapPatterns.RESOURCEORE},
    { pattern="Orichalcum", type = "RESOURCE.ORE.ORICHALCUM" },
        
    { pattern="(%a+) Log", type = "RESOURCE.WOOD", regExValues = lang.mapPatterns.RESOURCEWOOD},
    { pattern="(%a+) Branch", type = "RESOURCE.WOOD", regExValues = lang.mapPatterns.RESOURCEWOOD},
    { pattern="(%a+) Timber", type = "RESOURCE.WOOD", regExValues = lang.mapPatterns.RESOURCEWOOD},

    { pattern="(%a+)weed", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    { pattern="(%a+)brush", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    { pattern="(%a+)[ ]?[G|g]lory", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    { pattern="(%a+)[ ]?flower", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    { pattern="Golden Nettle", type = "RESOURCE.PLANTS.GOLDENNETTLE"},
    { pattern="Wyvernspurr", type = "RESOURCE.PLANTS.WYVERNSPURR" },    
    { pattern="Twilight Bloom", type = "RESOURCE.PLANTS.TWILIGHT" },
    { pattern="Chimera's Cloak", type = "RESOURCE.PLANTS.CHIMERASCLOAK" },
    { pattern="Roc Orchid", type = "RESOURCE.PLANTS.ROCORCHID" },
    { pattern="Tattertwist", type = "RESOURCE.PLANTS.TATTERTWIST"},
    { pattern="Drakefoot", type = "RESOURCE.PLANTS.DRAKEFOOT"},
    { pattern="Bloodshade", type = "RESOURCE.PLANTS.BLOODSHADE"},
    { pattern="Sarleaf", type = "RESOURCE.PLANTS.SARLEAF"},
    { pattern="Grieveblossom", type = "RESOURCE.PLANTS.GRIEVEBLOSSOM"},
	{ pattern = "Faecap Mushrooms", type = "RESOURCE.PLANTS.FAECAPMUSHROOMS"}, 
	{ pattern = "Xarthian Tendril", type = "RESOURCE.PLANTS.XARTHIANTENDRIL"}, 
            
    { pattern="School of Fish", type = "RESOURCE.FISH", name = "DESC1"},
    { pattern="School of Rare Fish", type = "RESOURCE.FISH", name = "DESC1"},
    { pattern="School of Clever Fish", type = "RESOURCE.FISH", name = "DESC1"},
    
    { pattern="Artifact", type = "RESOURCE.ARTIFACT", name = "DESC1"},
    { pattern = "Sunken Boat", type = "RESOURCE.BOAT", name = "DESC1"},
	
    { pattern="Return to ([%aäüöÜÖÄ]+ [%aäüöÜÖÄ]+) in ([%aäüöÜÖÄ-]+)", type = "QUEST.PROGRESS", regExCompute = {"npc", "scene"}},
    { pattern="Return to ([%aäüöÜÖÄ]+ [%aäüöÜÖÄ]+)", type = "QUEST.PROGRESS", regExCompute = {"npc"}},
    { pattern="Bring the ([%aäöüÄÖÜ-]+) to ([%aäüöÜÖÄ]+ [%aäüöÜÖÄ]+)", type = "QUEST.PROGRESS", regExCompute = {"info", "npc"}},
    { pattern="Deliver the (.+) to ([%aäüöÜÖÄ]+ [%aäüöÜÖÄ]+)", type = "QUEST.PROGRESS", regExCompute = {"info", "npc"}},

    --{ pattern="Nightmare (%a+) Scholar", type = "VARIA.NPC", regExCompute = {"info"}, name = "DESC1"},
    { pattern="Dragon Pinata", type = "EVENT.CARNIVAL", name = "DESC1"},
    { pattern="Dragon Parade", type = "EVENT.CARNIVAL", name = "DESC1"},
	{ pattern="Summer Sunfish", type = "EVENT.SUMMER", name = "DESC1"},
	{ pattern="Summer Sunplant", type = "EVENT.SUMMER", name = "DESC1"},
    { pattern = "Artifact Pinata", type = "EVENT.CARNIVAL", name = "DESC1"},
	{ pattern = "Faerie Ring", type = "EVENT.AUTUMN", name = "DESC1"},
	
    {pattern = "Body of (.+)", type = "UNIT.BODY",  regExCompute = {pattern = "name"} },	
	{pattern = "(.+) Corpse", type = "UNIT.BODY",  regExCompute = {pattern = "name"} },
  }
  
  lang.mapIdentifiersGeneric = {
      VENDORGENERIC = {type = "VENDOR.OTHER", name = "DESC1"}, 
      FACTION       = {type = "VARIA.NPC", name = "DESC1"},
      UNKNOWN       = {type = "UNKNOWN", name = "DESC1", info = "DESC2"},
  }
  
  lang.mapIdentifiersExcludeLevel = "Level "
  
  lang.mapIdentifiersVendors = {
    "Bartender", "[Dd]ealer", "Goods", "Drinks", "Merchant", "Vendor", "Dimension Engineer", "Weapons", "Planar Vouchers", "Clothier", "Synergy Crystals", "Notoriety Dispensary", "Reagents", "Rift Lures", "Reagents", "Planar Recipes"
  }
  
  privateVars.langTexts = lang
  
end