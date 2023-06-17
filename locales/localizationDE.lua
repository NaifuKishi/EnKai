local addonInfo, privateVars = ...

---------- init namespace ---------

if not privateVars.langTexts then privateVars.langTexts = {} end

local lang = nil

---------- init language texts ---------

if ( Inspect.System.Language() == "German"  ) then

	lang = {	addonUpdate     = '<font color="#FF6A00">Neue Version <font color="#FFFFFF">%s</font> des Addons <font color="#FFFFFF">%s</font> verfügbar. Bitte aktualisiere das Addon.</font>',
						tooltips        = { moveToggle = 'Aktivieren Sie diese Box um das Fenster verschieben zu können',
						hideToggle		= 'Klicken Sie hier um das Fenster zu verstecken',
						managerButton	= 'Links Klick um Menü zu öffnen\nKlick mit mittlerer Maustaste zum Sperren\nRechts Klick und Drag zum Verschieben'},
						requiredFaction = 'Benötigt %s:\n%s',
						factionList     = {"Verbündet", "Dekoriert", "Geschätzt", "Verehrt", "Verherrlicht", "Hochgeachtet"},
						yes             = 'Ja',
						no              = 'Nein',
						ok 			        = 'Ok',
						cancel		      = 'Abbrechen',
						msgReload		= 'Das UI muss neu geladen werden',
						reloadButton		= 'Neu laden',
						bop 		        = 'Binden beim Aufheben',
						account		      = 'An Account gebunden',
						bound		        = 'Seelengebunden',
						copy		        = 'Kopieren',
						paste		        = 'Einfügen',
						color		        = 'Farbe',
						isEquipped		= 'Aktuell ausgerüstet %s',
						boundText       = { equip = 'Binden beim Ausrüsten', use = "Binden beim Benutzen", pickup = "Binden beim Aufheben", account = "An Account binden"},
						dps             = "Schaden pro Sekunde: %.1f\n%d-%d Schaden alle %.1f Sekunden",
						stats           = { armor 		    = "Rüstung", 
            										block 	      = "Blocken",
            										critAttack    = "Körperl. Krit",
            										critPower     = "Kritische Kraft",
            										critSpell     = "Zaubertreffer",
            										deflect       = "Abwehren",
            										dexterity     = "Geschicklichkeit",
            										dodge         = "Ausweichen",
            										endurance     = "Ausdauer",
            										hit           = "Treffer",
            										intelligence  = "Intelligenz",
            										parry         = "Parieren",
            										powerAttack   = "Angriffskraft",
            										powerSpell    = "Zauberkraft",
            										resistAir     = "Luftwiderstand",
            										resistAll     = "Allem widerstehen",
            										resistDeath   = "Todeswiderstand",
            										resistEarth   = "Erdwiderstand",
            										resistFire    = "Feuerwiderstand",
            										resistLife    = "Lebenswiderstand",
            										resistWater   = "Wasserwiderstand",
            										strength      = "Stärke",
            										wisdom        = "Weisheit",
            										valor         = "Heldenmut",
            										toughness     = "Zähigkeit",
            										vengeance     = "Vergeltung" },
						equip           = "Ausrüsten: %s",
						use             = "Benutzen: %s",
						requiredLevel   = "Erfordert Stufe %d",
						requiredCalling = "Berufung: %s",	
						callings        = { mage = "Magier", rogue = "Schurke", warrior = "Krieger", cleric = "Kleriker", primalist = "Primalist"}		,
						cost		= 'Kosten: ',
						upgrade		= 'Wurde aufgewertet mit ',
  }
						
	lang.items = {txtCape           = 'Umhang',
            		txtStaff          = 'Stab',
            		txtTwoHand        = '2h Waffe',
            		txtHammer         = 'Hammer',
            		txtPolearm        = 'Stangenwaffe',
            		txtSword          = 'Schwert',
            		txtAxe            = 'Axt',
            		txtMace           = 'Streitkolben',
            		txtDagger         = 'Dolch',
            		txtEssenceLesser  = 'Geringe Essenz',
            		txtEssenceGreater = 'Grosse Essenz',
            		txtMainhand       = 'Haupthand',
					txtRanged		  = 'Fernkampf',
            		txtOneHand        = '1h Waffe',
            		txtWand           = 'Zauberstab',
            		txtGun            = 'Schusswaffe',
            		txtBow            = 'Bogen',
            		txtHelmet         = 'Helm',
            		txtPlate          = 'Platte',
            		txtLeather        = 'Leder',
            		txtChain          = 'Kette',
            		txtCloth          = 'Stoff',
            		txtShoulders      = 'Schultern',
            		txtChest          = 'Brust',
            		txtGloves         = 'Handschuhe',
            		txtBelt           = 'Gürtel',
            		txtLegs           = 'Beine',
            		txtFeet           = 'Füsse',
            		txtRing           = 'Ring',
					txtEarring		  = 'Ohrring',
            		txtOffhand        = 'Nebenhand',
            		txtNeck           = 'Hals',
            		txtShield         = 'Schild',
            		txtTrinket        = 'Zubehör',
            		txtPet            = 'Weggefährte',
            		txtCurrency       = 'Währung',
            		txtMount          = 'Reittier',
            		txtOther          = 'Anderes',
            		txtSynergyCrystal = 'Synergie-Kristall',
            		txtFocus          = 'Ebenenfokus',
            		txtRecipe         = 'Rezept',
            		txtLure           = 'Köder',
            		txtHusk           = 'Schale',
            		txtRune           = 'Rune',
            		txtConsumable     = 'Verbrauchbar',
            		txtCostume        = 'Kostüm',
            		txtTitle          = 'Titel',
            		txtContainer      = 'Behälter',
            		txtSeal           = 'Siegel',
            		txtDimension      = 'Dimensionsgegenstand',
            		txtItemUpgrade    = 'Gegenstandsupgrade',
            		txtReagent        = 'Handswerkszutat'
	}		
		
	lang.profession = { txtApothecary  = 'Apotheker',
                  		txtArtificer   = 'Kunsthandwerker',
                  		txtRunecrafter = 'Runenwerk',
                  		txtWeaponsmith = 'Waffenschmied',
                  		txtOutfitter   = 'Ausstatter',
                  		txtArmorsmith  = 'Rüstungsschmid'
	}
	
	lang.factionNames = { ["Arcane Hand"]= "Arkane Hand",
                        ["Atragarians"]= "Atragarianer",
                        ["Caretakers"]= "Wärter",
                        ["Cerulean Rhenke"]= "Himmelblaue Rhenke",
                        ["Defiants"]= "Skeptiker",
                        ["Dragonslayer Covenant"]= "Drachentöterbund",
                        ["Dragonslayer Covenant"]= "Drachentöter",
                        ["Eldritch Seekers"]= "Unheimliche Suchende",
                        ["Eldritch Vanguard"]= "Unheimliche Vorhut",
                        ["Ember Scholars"]= "Glut-Gelehrte",
                        ["Empyreal Alliance"]= "Empyreische Allianz",
                        ["Eternal City Survivors"]= "Überlebende der Ewigen Stadt",
                        ["Freemarch Wardens"]= "Freimark-Bewahrer",
                        ["Gloamwood Waykeepers"]= "Dämmerwald-Weghüter",
                        ["Granite Falls"]= "Granitsturz",
                        ["Guardians"]= "Wächter",
                        ["Hailol"]= "Hailol",
                        ["Icewatch"]= "Eiswacht",
                        ["Iron Claw Trappers"]= "Eiswacht",
                        ["Kelari Expedition"]= "Kelari-Expedition",
                        ["Manugo League"]= "Manugo-Liga",
                        ["Mendicant Order"]= "Bettelmönchsorden",
                        ["Mercurial Savants"]= "Sprunghafte Gelehrte",
                        ["Necropolis Caretakers"]= "Nekropolis-Wärter",
                        ["Noble Guard"]= "Edelwacht",
                        ["Order of Life Serene"]= "Orden des Heiteren Lebens",
                        ["Order of Mathos"]= "Orden von Mathos",
                        ["Order of Purity"]= "Orden der Reinheit",
                        ["Order of the Death Serpent"]= "Orden der Todesschlange",
                        ["Order of the Flame"]= "Orden der Flamme",
                        ["Pelagic Order"]= "Pelagischer Orden",
                        ["Quarry Rats"]= "Grubenratte",
                        ["Quicksilver Scholars"]= "Quecksilber-Gelehrte",
                        ["Red Scar Trackers"]= "Rotnarbenaufspürer",
                        ["Ridgerunner Mercenaries"]= "Gradrenner-Söldner",
                        ["Runic Sages"]= "Runenweise",
                        ["Students of the Vale"]= "Schüler des Tals",
                        ["The Achyati"]= "Die Achyati",
                        ["The Farclan"]= "Die Farclan",
                        ["The Ghar"]= "Die Ghar",
                        ["The Grim Disciples"]= "Die grimmigen Jünger",
                        ["The Keepers"]= "Die Hüter",
                        ["The Lycini"]= "Die Lycini",
                        ["The Moribund"]= "Die Sterbenden",
                        ["The Onir"]= "Die Onir",
                        ["The Order of the Eye"]=  "Der Orden des Auges",
                        ["The Qaijiri"]= "Die Qaijiri",
                        ["The Runeguard"]= "Die Runengarde",
                        ["The Seekers"]= "Die Sucher",
                        ["The Shale Collegiate"]= "Die Shale-Akademie",
                        ["The Storm Guard"]= "Die Sturmwache",
                        ["The Storm Inquisition"]= "Die Sturminquisition",
                        ["The Unseen"]= "Die Ungesehenen",
                        ["The Unspoken"]= "Die Unaussprechlichen",
                        ["Torvan Hunters"]= "Torvan-Jäger",
                        ["Whitefall Brigade"]= "Weißfall-Brigade",
                        ["Zephyrian Collective"]= "Zephirischer Verband",
						["Shal Korva"]= "Shal Korva"
  } 
  
  lang.mapPatterns = {
    RIFT = {Empyreal = "EMPYREAL", Feuer = "FIRE",  Erde = "EARTH", Luft = "AIR", Leben = "LIFE", Albtraum = "NIGHTMARE", Erde = "EARTH", Tod = "DEATH", Wasser = "WATER", ["Wächter"] = "GUARDIAN", ["Skeptiker"] = "DEFIANT", Neutral = "NEUTRAL"},
    FOOTHOLD = { Architekten = "ARCHITECT", Achyati = "ACHYATI"},
    PROFESSIONS = { Runenfertigungs = "RUNECRAFTER", Runenfertiger = "RUNECRAFTER", Ausstatter = "OUTFITTER", ["Rüstungsschmiede?"] = "ARMORSMITH", Waffenschmied = "WEAPONSMITH", 
                    Kunsthandwerk = "ARTIFICER", Handwerker = "ARTIFICER", 
                    Schlachter = "BUTCHERING", Metzger = "BUTCHERING", 
                    Angel = "FISHING", Fischer = "FISHING", Minenarbeiter = "MINING", Bergbau = "MINING", Bergarbeiter = "MINING", Sammelkunde = "FORAGING", Sammler = "FORAGING", Apotheker = "ALPOTHECARY", Traumweber = "DREAMWEAVER",
                    ["Überlebenskünstler"] = "SURVIVAL", ["Überlebenskunst"] = "SURVIVAL"},
    RESOURCEORE = { Platin = "PLATINUM", Gantimit = "GANTIMITE", Orichalcum = "ORICHALCUM", Gold = "GOLD", Silber="SILVER", Eisen = "IRON", Kobalt = "COBALT", Chromit = "CHROMITE", Zinn = "TIN", Kupfer = "COPPER", Thalasit = "THALASIT", Rhenium = "RHENIUM", Tuthony = "KARTHITE", Carmintium = "CARMINTIUM", Titan = "TITANIUM", Atramentium = "ATRAMENTIUM", Bolidium = "BOLIDIUM" },
    RESOURCEWOOD = { Linden = "LINDEN", Ulmen = "ELM", Birke = "BIRCH", Eichen = "OAK", Mahagoni = "MAHOGANY", Eschenholz = "ASHWOOD", ["Königsholz"] = "KINGSWOOD", Eiben = "YEWLOG", Salbei = "SAGEBRUSH", Runenbirken = "RUNEBIRCH", Madros = "MADROSA", Schattendorn = "SHADETHORN"},
    RESOURCEPLANTS = { Klingen = "RAZORBRUSH", ["Dämmerruhm"] = "DUSKGLORY", ["Chimeras Mantel"] = "CHIMERASCLOAK", Fransen = "FRAZZLE", Zwielicht = "TWILIGHT", Rokh = "ROCORCHID", Lindwurmstachel = "WYVERNSPURR",  Kraken = "KRAKENWEED", Goldnessel = "GOLDENNETTLE", ["Küstenpracht"] = "COASTALGLORY", Kreuch = "CREEPER", Fledderflechte = "TATTERTWIST", Trauer = "GRIEVEBLOSSOM", Basilisken = "BASILISKWEED", Blutschatten = "BLOODSHADE", ["Drakenfuß"] = "DRAKEFOOT", Sturm = "TEMPESTFLOWER", Leucht = "LUCIDFLOWER", Funkelblatt = "SARLEAF"},
    CLASSES = { Schurken = "ROGUE", Krieger = "WARRIOR", Magier = "MAGE", Kleriker = "CLERIC", Primalist = "PRIMALIST"},
    FACTIONS = { ["Wächter"] = "GUARDIANS", Skeptiker = "DEFIANTS", Neutral = "NEUTRAL"},
    BASE = { ["Abenddämerung"] = "NIGHTFALL", Schwur = "OATHSWORN", Herrschaft = "DOMINION"}
  }
  
  lang.mapIdentifiers = {
    {pattern = "Handwerk Riss (Aktiv)", type = "RIFT.CRAFTING" },
	{pattern = "Handwerk Riss (Instabil)", type = "RIFT.CRAFTING" },
	{pattern = "Schlachtzug Riss (Spalt)", type = "RIFT.RAID.UNOPENED" },
    {pattern = "Geringer Riss (Spalt)", type = "RIFT.MINOR.UNOPENED", level = "DESC1" },    
    {pattern = "Geringer Riss: (%a+) %(Aktiv%)", type = "RIFT.MINOR.ACTIVE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    {pattern = "Geringer Riss: (%a+) %(Instabil%)", type = "RIFT.MINOR.UNSTABLE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    {pattern = "Großer Riss (Spalt)", type = "RIFT.MAJOR.UNOPENED", level = "DESC1" },    
    {pattern = "Großer Riss: (%a+) %(Aktiv%)", type = "RIFT.MAJOR.ACTIVE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    {pattern = "Großer Riss: (%a+) %(Instabil%)", type = "RIFT.MAJOR.UNSTABLE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    {pattern = "Schlachtzug Riss: (%a+) %(Aktiv%)", type = "RIFT.RAID.ACTIVE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    {pattern = "Schlachtzug Riss: (%a+) %(Instabil%)", type = "RIFT.RAID.UNSTABLE", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    {pattern = "Stützpunkt (%a+)", type = "RIFT.STRONGHOLD", level = "DESC1", regExValues = lang.mapPatterns.RIFT },
    {pattern = "Kontrollierte Grenzfeste: (%a+)", type = "RIFT.FOOTHOLD", level = "DESC1", regExValues = lang.mapPatterns.FOOTHOLD },
	{pattern = "Lebender Ebenenanker", type = "RIFT.PLANE.ANCHOR", level = "DESC1" },
	
    {pattern = "Invasion[:]? (%a+)", type = "RIFT.INVASION", name="DESC1", level = "DESC2", regExValues = lang.mapPatterns.RIFT },
    {pattern = "Stellung[:]? ([%aäüöÜÖÄ]+)", type = "RIFT.POST", name="DESC1", level = "DESC2", regExValues = lang.mapPatterns.RIFT },
    
    {pattern = "Verteidigt diesen Schutzstein", type = "RIFT.EVENT.WARDSTONE.PROTECT", name="DESC1"},
    {pattern = "Schutzstein zerstört", type = "RIFT.EVENT.WARDSTONE.DESTROYED", name="DESC1"},
  
    {pattern = "([%aäüöÜÖÄ]+)-Energiekern", type = "PVP.CONTROLPOINT", name = "DESC1", regExValues = lang.mapPatterns.FACTIONS},
    {pattern = "Antapo-Extraktor", type = "PVP.CONQUEST.STEPPES.EXTRACTOR.ANTAPO", name = "DESC1", level = "DESC3"},
    {pattern = "Brevo-Extraktor", type = "PVP.CONQUEST.STEPPES.EXTRACTOR.BREVO", name = "DESC1", level = "DESC3"},
    {pattern = "Abenddämmer-Extraktor", type = "PVP.CONQUEST.EXTRACTOR.NIGHTFALL", name = "DESC1", level = "DESC3"},
    {pattern = "Herrschaftsextraktor", type = "PVP.CONQUEST.EXTRACTOR.DOMINION", name = "DESC1", level = "DESC3"},
    {pattern = "Schwur-Extraktor", type = "PVP.CONQUEST.EXTRACTOR.OATH", name = "DESC1", level = "DESC3"},
    {pattern = "Umkämpfter Extraktor", type = "PVP.CONQUEST.EXTRACTOR.FIGHT", name = "DESC1", level = "DESC3"},
    {pattern = "Eroberungs-Extraktor", type = "PVP.CONQUEST.EXTRACTOR.NEUTRAL", name = "DESC1", level = "DESC3"},
    {pattern = "([%aäüöÜÖÄ]+)-Basis", type = "PVP.CONQUEST.BASE", regExValues = lang.mapPatterns.BASE, level = "DESC2"},
    {pattern = "Zuletzt besiegt: %d", type = "PVP.CONQUEST.FIGHT", regExCompute = {pattern = "info"} },
    {pattern = "Antapo-Angreifer", type = "PVP.CONQUEST.STEPPES.PICKUP.ANTAPO" },
    {pattern = "Brevo-Angreifer", type = "PVP.CONQUEST.STEPPES.PICKUP.BREVO" },
    {pattern = "Traumgenerator", type = "PVP.CONQUEST.STEPPES.DREAMGENERATOR", level = "DESC2" },
    {pattern = "Schwur", type = "PVP.CONQUEST.CARRIER.OATH", name = "DESC1", level = "DESC2" },
    {pattern = "Abenddämmerung", type = "PVP.CONQUEST.CARRIER.NIGHTFALL", name = "DESC1", level = "DESC2"},
    {pattern = "Herrschaft", type = "PVP.CONQUEST.CARRIER.DOMINION", name = "DESC1", level = "DESC2" },
    {pattern = "Quellstein", type = "PVP.CONQUEST.CARRIER.SOURCESTONE" },
	{pattern = "Uraltes Relikt", type = "PVP.RELICT" },
	
    {pattern = "Verbündeter: (%a+)", type = "PVP.INVASION", regExValues = lang.mapPatterns.FACTIONS },
    
    {pattern = "Gelehrter ([%aäüöÜÖÄ]+)", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS }, 
    --{pattern = "Gelehrte ([%aäüöÜÖÄ]+)", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    {pattern = "([%aäüöÜÖÄ]+)[-]?[G|g]roßmeister[i]?[n]?", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    {pattern = "([%aäüöÜÖÄ]+)-Anfänger[i]?[n]?", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    {pattern = "([%aäüöÜÖÄ]+)[-]?[M|m]eister[i]?[n]?", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    {pattern = "([%aäüöÜÖÄ]+)-Expert[i]?[n]?", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    {pattern = "([%aäüöÜÖÄ]+)-Fachkraft", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    {pattern = "([%aäüöÜÖÄ]+)-Ausbilder", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    {pattern = "Geschickter ([%aäüöÜÖÄ]+)", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    {pattern = "Ausbilder für Runenaufwertungsanleitungen", type = "PROFESSION.RECIPESELLER.RUNECRAFTER", name = "DESC1" },
    {pattern = "([%aäüöÜÖÄ]+)%-Anleitungen", type = "PROFESSION.RECIPESELLER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS },
    {pattern = "Dimensionshandwerksanleitungen", type = "PROFESSION.RECIPESELLER.DREAMWEAVER", name = "DESC1" },
    {pattern = "Rezepte des Fischers und des Überlebenskünstlers", type = "PROFESSION.RECIPESELLER.OTHER", name = "DESC1" },
    {pattern = "Laden des Künstlers", type = "PROFESSION.RECIPESELLER.GENERIC", name = "DESC1" },
    {pattern = "Meisterfischer[i]?[n]?", type = "PROFESSION.TEACHER.FISHING", name = "DESC1", exact = false},
    {pattern = "Überlebenskünstler", type = "PROFESSION.TEACHER.SURVIVAL", name = "DESC1" },
    
    {pattern = "Briefkasten", type = "VARIA.LETTERBOX" },
    {pattern = "Bankier", type = "VARIA.BANK", name = "DESC1" },
    {pattern = "Gilden-Bankier", type = "VARIA.GUILDBANK", name = "DESC1" },
    {pattern = "Gilden-Questmeister", type = "VARIA.GUILDQUESTGIVER", name = "DESC1" },
    {pattern = "Auktionator", type = "VARIA.AUCTIONHOUSE", name ="DESC1" },
    {pattern = "Heiler", type = "VARIA.HEALER", name = "DESC1" },
    {pattern = "Heilbot", type = "VARIA.HEALER", name = "DESC1" },
	{pattern = "Seelenheiler", type = "VARIA.HEALER", name = "DESC1" },
    {pattern = "Ebenengutscheine", type = "VARIA.PLANEVOUCHERS", name = "DESC1" },
    {pattern = "Stylist", type = "VARIA.STYLIST", name = "DESC1"},
	{pattern = "Kriegsfront-Schlachtmeister&gt;$", type = "VARIA.NPC.PVP" },
	{pattern = "Bekanntheits-Ausgeberin", type = "VARIA.NPC.REP", name = "DESC1"},
    
    {pattern = "Quartiermeisterin der Söldner", type = "QUARTERMASTER.PVP", name = "DESC1" },
    {pattern = "Verbrauchsgüter-Quartiermeister", type = "QUARTERMASTER.CONSUMABLE", name = "DESC1" },
    {pattern = "Quartiermeisterin des Instituts für Ebenenforschung", type = "QUARTERMASTER.PLANES", name = "DESC1" },
    {pattern = "Quartiermeister[i]?[n]? (%a+)", type = "QUARTERMASTER.PLANES",  regExCompute = {pattern = "name"}, faction = "DESC2"},

    {pattern = "([%aäüöÜÖÄ]+)[-mM]+eister&gt;$", type = "PROFESSION.TEACHER", name = "DESC1", regExValues = lang.mapPatterns.PROFESSIONS }, -- must be behind 'Quartiermeister check
    
    {pattern = "Spezielle Handwerkswaren", type = "VENDOR.PROFESSION", name = "DESC1" },
    {pattern = "Kopfgeldjäger-Vorräte", type = "VENDOR.HUNT", name = "DESC1" },
    {pattern = "Händler für Schergenkarten", type = "VENDOR.MINIONS", name = "DESC1" },
    {pattern = "Farben", type = "VENDOR.DYES", name = "DESC1" },
    {pattern = "Reittier[e]?", type = "VENDOR.MOUNTS", name = "DESC1", exact = false},
    {pattern = "Dimensionswaren", type = "VENDOR.DIMENSIONS", name = "DESC1"},
    {pattern = "Dimensionsingenieur", type = "VENDOR.DIMENSIONS", name = "DESC1"},
    
    {pattern = "(%a+)%-Ausbilder", type = "TEACHER", name = "DESC1", regExValues = lang.mapPatterns.CLASSES },
    {pattern = "Porticulum", type = "PORTAL", name = "DESC1"},
    
    {pattern = "(%a+)[-]?[A|a]der", type = "RESOURCE.ORE", regExValues = lang.mapPatterns.RESOURCEORE},
    {pattern = "(%a+)-Lager", type = "RESOURCE.ORE", regExValues = lang.mapPatterns.RESOURCEORE},
    {pattern = "Orichalcum", type = "RESOURCE.ORE", regExValues = lang.mapPatterns.RESOURCEORE},
	{pattern = "(%a+)[-]?[V|v]orkommen", type = "RESOURCE.ORE", regExValues = lang.mapPatterns.RESOURCEORE},
    
    {pattern = "([%aäüöÜÖÄ]+)[-]?[A|a]st", type = "RESOURCE.WOOD", regExValues = lang.mapPatterns.RESOURCEWOOD},
    {pattern = "([%aäüöÜÖÄ]+)[-]?[S|s]tamm", type = "RESOURCE.WOOD", regExValues = lang.mapPatterns.RESOURCEWOOD},
    {pattern = "([%aäüöÜÖÄ]+)holz", type = "RESOURCE.WOOD", regExValues = lang.mapPatterns.RESOURCEWOOD},
    {pattern = "Birke", type = "RESOURCE.WOOD", regExValues = lang.mapPatterns.RESOURCEORE},
    
    {pattern = "(%a+)kraut", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "Blutschatten", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "Drakenfuß", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "(%a+)blume", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "(%a+)blüte", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "Funkelblatt", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "Fledderflechte", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "(%a+)strauch", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "Küstenpracht", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "Goldnessel", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "Lindwurmstachel", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "(%a+)-Orchidee", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "Chimeras Mantel", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},
    {pattern = "Dämmerruhm", type = "RESOURCE.PLANTS", regExValues = lang.mapPatterns.RESOURCEPLANTS},   
	{pattern = "Feenkappen-Pilze", type = "RESOURCE.PLANTS.FAECAPMUSHROOMS"},
	{ pattern = "Xarthianische Ranke", type = "RESOURCE.PLANTS.XARTHIANTENDRIL"}, 
    
    {pattern = "Artefakt$", type = "RESOURCE.ARTIFACT", name = "DESC1", exact = false},
	{pattern = "Zerschelltes Boot", type = "RESOURCE.BOAT", name = "DESC1"},
	    
    {pattern = "Schwarm seltener Fische", type = "RESOURCE.FISH", name = "DESC1"},
    {pattern = "Schwarm kluger Fische", type = "RESOURCE.FISH", name = "DESC1"},
    {pattern = "Fischschwarm", type = "RESOURCE.FISH", name = "DESC1"},
    
    {pattern = "Kehrt zu ([%aäüöÜÖÄ]+ [%aäüöÜÖÄ]+) auf der ([%aäüöÜÖÄ-]+) zurück", type = "QUEST.PROGRESS", regExCompute = {pattern = "npc", "scene"}},
	{pattern = "Kehrt zu ([%aäüöÜÖÄ]+ [%aäüöÜÖÄ]+) in der ([%aäüöÜÖÄ-]+) zurück", type = "QUEST.PROGRESS", regExCompute = {pattern = "npc", "scene"}},
	{pattern = "Kehrt zu ([%aäüöÜÖÄ]+ [%aäüöÜÖÄ]+) in den ([%aäüöÜÖÄ-]+) zurück", type = "QUEST.PROGRESS", regExCompute = {pattern = "npc", "scene"}},
    {pattern = "Kehrt zu ([%aäüöÜÖÄ]+ [%aäüöÜÖÄ]+) zurück", type = "QUEST.PROGRESS", regExCompute = {pattern = "npc"}},
    {pattern = "Bringt .+ zu ([%aäüöÜÖÄ]+ [%aäüöÜÖÄ]+)", type = "QUEST.PROGRESS", regExCompute = {pattern = "npc"}},
    
    --{pattern = "Albtraum%-(%a+)%-Gelehrte", type = "QUEST.START", regExCompute = {pattern = "info"}, name = "DESC1"},
    {pattern = "Drachen-Pinata", type = "EVENT.CARNIVAL", name = "DESC1"},
    {pattern = "Drachenparade", type = "EVENT.CARNIVAL", name = "DESC1"},
	{pattern = "Sommer-Sonnenfisch", type = "EVENT.SUMMER", name = "DESC1"},
	{pattern = "Sommersonnenpflanze", type = "EVENT.SUMMER", name = "DESC1"},
    {pattern = "Artefaktpinata", type = "EVENT.CARNIVAL", name = "DESC1"},
	{pattern = "Feenring", type = "EVENT.AUTUMN", name = "DESC1"},
	    
    --{pattern = "Leiche von (.+)", type = "UNIT.BODY",  regExCompute = {pattern = "name"} }, 
	
  }
  
  lang.mapIdentifiersGeneric = {
      VENDORGENERIC = {type = "VENDOR.OTHER", name = "DESC1"}, 
      FACTION       = {type = "VARIA.NPC", name = "DESC1"},
      UNKNOWN       = {type = "UNKNOWN", name = "DESC1", info = "DESC2"},
  }
  
  lang.mapIdentifiersExcludeLevel = "Stufe "
  
  lang.mapIdentifiersVendors = {
    "Albtraumrisshändler", "[Tt]ränke&gt;$", "Ebenenwaren", "Gebrauchswaren", "(.+)[-]?[Hh]ändler[i]?[n]?&gt;$", "Laden der (%a+)", "Rüstung", "PvP Güter", "Nahkampfwaffen", "Fischhändlerin",
    "Fernkampfwaffen", "Gastwirt[i]?[n]?", "Quartiermeister", "Seltene Waren", "Rissköder", "Reagenzien", "Ebenenanleitungen", "(.+)[Aa]usrüstung", "Schankwirt[i]?[n]?", "Visionäre Anleitungen",
    "Battle Pass Merchant", "Artefaktsammlerin"
  }
  
  privateVars.langTexts = lang

end