-- Utils/preclean.lua
-- https://github.com/ticstyle/WoW-OpenIt

-- World of Warcraft Retail Item database for the addon OpenIt, created 2026-08-14 12:18:34
-- Number of items 6467

-- Included Groups:
--   Consumable > Other
--   Death Knight
--   Druid
--   Housing > Decor
--   Housing > Service Item
--   Hunter, Priest, Shaman, Mage, Warlock, Monk, Druid, Evoker
--   Hunter, Shaman, Evoker
--   Mage
--   Miscellaneous > Companion Pets
--   Miscellaneous > Holiday
--   Miscellaneous > Mount
--   Miscellaneous > Other
--   Monk
--   Paladin, Priest, Shaman, Monk, Druid, Evoker
--   Priest
--   Priest, Mage, Warlock
--   Priest, Mage, Warlock, Monk, Druid, Evoker
--   Profession > Alchemy
--   Profession > Blacksmithing
--   Profession > Cooking
--   Profession > Enchanting
--   Profession > Engineering
--   Profession > Fishing
--   Profession > Herbalism
--   Profession > Inscription
--   Profession > Jewelcrafting
--   Profession > Leatherworking
--   Profession > Mining
--   Profession > Skinning
--   Profession > Tailoring
--   Recipe > Alchemy
--   Recipe > Book
--   Recipe > Cooking
--   Recipe > Enchanting
--   Recipe > Inscription
--   Recipe > Jewelcrafting
--   Recipe > Tailoring
--   Rogue
--   Rogue, Monk, Druid
--   Rogue, Priest, Shaman, Mage, Warlock, Druid, Evoker
--   Shaman
--   Unknown > Unknown
--   Warlock
--   Warrior
--   Warrior, Paladin, Death Knight
--   Warrior, Paladin, Death Knight, Evoker
--   Warrior, Paladin, Death Knight, Monk, Druid, Demon Hunter
--   Warrior, Paladin, Death Knight, Monk, Druid, Evoker
--   Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Monk
--   Warrior, Paladin, Rogue, Death Knight, Mage, Warlock, Monk, Demon Hunter, Evoker
--   Warrior, Paladin, Rogue, Death Knight, Shaman, Monk, Demon Hunter, Evoker
--   Warrior, Paladin, Rogue, Priest, Death Knight, Shaman, Monk, Druid, Evoker
--   Warrior, Paladin, Shaman

-- luacheck: globals

local _, addon = ...

local itemIDs = {
	-- Consumable > Other
	954, -- Scroll of Strength
	955, -- Scroll of Intellect
	1180, -- Scroll of Stamina
	1181, -- Scroll of Versatility
	1262, -- Keg of Thunderbrew Lager
	1322, -- Fishliver Oil
	1477, -- Scroll of Agility II
	1711, -- Scroll of Stamina II
	2289, -- Scroll of Strength II
	2290, -- Scroll of Intellect II
	2862, -- Rough Sharpening Stone
	3239, -- Rough Weightstone
	3434, -- Slumber Sand
	4419, -- Scroll of Intellect III
	4421, -- Scroll of Protection III
	4422, -- Scroll of Stamina III
	4424, -- Scroll of Versatility III
	4425, -- Scroll of Agility III
	4426, -- Scroll of Strength III
	4479, -- Burning Charm
	4480, -- Thundering Charm
	4481, -- Cresting Charm
	4598, -- Goblin Fishing Pole
	5042, -- Red Ribboned Wrapping Paper
	5043, -- Red Ribboned Gift
	5044, -- Blue Ribboned Gift
	5048, -- Blue Ribboned Wrapping Paper
	5232, -- Soulstone
	5509, -- Healthstone
	5510, -- Greater Healthstone
	5511, -- Lesser Healthstone
	5859, -- Party Grenade
	5951, -- Moist Towelette
	6452, -- Anti-Venom
	6636, -- Fire Sapta
	6637, -- Water Sapta
	7516, -- Tabetha's Instructions
	7964, -- Solid Sharpening Stone
	7965, -- Solid Weightstone
	7970, -- E.C.A.C.
	8095, -- Hinott's Oil
	8410, -- R.O.I.D.S.
	8411, -- Lung Juice Cocktail
	8412, -- Ground Scorpok Assay
	8444, -- Executioner's Key
	9311, -- Default Stationery
	10621, -- Runed Scroll
	10684, -- Colossal Parachute
	10687, -- Empty Vial Labeled #1
	10688, -- Empty Vial Labeled #2
	10689, -- Empty Vial Labeled #3
	10690, -- Empty Vial Labeled #4
	10830, -- M73 Frag Grenade
	11953, -- Empty Pure Sample Jar
	12533, -- Roughshod Pike
	12643, -- Dense Weightstone
	13367, -- Wrapped Gift
	16895, -- Greater Soulstone
	16896, -- Major Soulstone
	17048, -- Rumsey Rum
	17305, -- Green Ribboned Holiday Gift
	17308, -- Purple Ribboned Holiday Gift
	19006, -- Lesser Healthstone
	19009, -- Healthstone
	19010, -- Greater Healthstone
	19026, -- Snake Burst Firework
	19150, -- Sentinel Basic Care Package
	19151, -- Sentinel Standard Care Package
	19152, -- Sentinel Advanced Care Package
	19153, -- Outrider Advanced Care Package
	19154, -- Outrider Basic Care Package
	19155, -- Outrider Standard Care Package
	19182, -- Tattered Darkmoon Faire Prize Ticket
	19183, -- Hourglass Sand
	20228, -- Defiler's Advanced Care Package
	20229, -- Defiler's Basic Care Package
	20230, -- Defiler's Standard Care Package
	20231, -- Arathor Advanced Care Package
	20233, -- Arathor Basic Care Package
	20236, -- Arathor Standard Care Package
	20744, -- Minor Wizard Oil
	20745, -- Minor Mana Oil
	21140, -- Auction Stationery
	21744, -- Lucky Rocket Cluster
	21745, -- Elder's Moonstone
	21746, -- Lucky Red Envelope
	22103, -- Master Healthstone
	22104, -- Master Healthstone
	22105, -- Master Healthstone
	22116, -- Master Soulstone
	22192, -- Bloodkelp Elixir of Dodging
	22193, -- Bloodkelp Elixir of Resistance
	22260, -- Friendship Bracelet
	22521, -- Superior Mana Oil
	23194, -- Lesser Mark of the Dawn
	23195, -- Mark of the Dawn
	23196, -- Greater Mark of the Dawn
	23224, -- Summer Gift Package
	23492, -- Suntouched Special Reserve
	23528, -- Fel Sharpening Stone
	23584, -- Loch Modan Lager
	23768, -- White Smoke Flare
	23769, -- Red Smoke Flare
	23770, -- Blue Smoke Flare
	23771, -- Green Smoke Flare
	23857, -- Legacy of the Mountain King
	23862, -- Redemption of the Fallen
	23864, -- Torment of the Worgen
	23865, -- Wrath of the Titans
	23985, -- Crystal of Vitality
	23986, -- Crystal of Insight
	24289, -- Chrono-Beacon
	24330, -- Drain Schematics
	24407, -- Uncatalogued Species
	24408, -- Edible Stalks
	24421, -- Nagrand Cherry
	24520, -- Honor Hold Favor
	24522, -- Thrallmar Favor
	24538, -- Fire Bomb
	24540, -- Edible Fern
	24579, -- Mark of Honor Hold
	24581, -- Mark of Thrallmar
	25521, -- Greater Rune of Warding
	25679, -- Comfortable Insoles
	25886, -- Purple Smoke Flare
	27317, -- Elemental Sapta
	27498, -- Scroll of Agility V
	27500, -- Scroll of Protection V
	27501, -- Scroll of Versatility V
	27503, -- Scroll of Strength V
	28420, -- Fel Weightstone
	29443, -- Bloodmaul Brutebane Brew
	29735, -- Holy Dust
	29736, -- Arcane Rune
	29796, -- Socrethar's Teleportation Stone
	29868, -- QAEnchant Gloves +26 Attack Power
	30260, -- Voren'thal's Package
	30615, -- Halaani Whiskey
	30858, -- Peon Sleep Potion
	31121, -- Costume Scraps
	31337, -- Orb of the Blackwhelp
	32542, -- Imp in a Ball
	32563, -- Grilled Picnic Treat
	32576, -- Depleted Crystal Focus
	32602, -- Crystalforged Darkrune
	32971, -- Water Bucket
	33028, -- Barleybrew Light
	33030, -- Barleybrew Clear
	33032, -- Thunderbrew Ale
	33033, -- Thunderbrew Stout
	33036, -- Mudder's Milk
	33079, -- Murloc Costume
	33219, -- Goblin Gumbo Kettle
	33457, -- Scroll of Agility VI
	33458, -- Scroll of Intellect VI
	33459, -- Scroll of Protection VI
	33460, -- Scroll of Versatility VI
	33461, -- Scroll of Stamina VI
	33462, -- Scroll of Strength VI
	33797, -- Portable Brewfest Keg
	33926, -- Sealed Scroll Case
	33929, -- Brewfest Brew
	34017, -- Small Step Brew
	34018, -- Long Stride Brew
	34019, -- Path of Brew
	34020, -- Jungle River Water
	34021, -- Brewdoo Magic
	34022, -- Stout Shrunken Head
	34068, -- Weighted Jack-o'-Lantern
	34076, -- Fish Bladder
	34077, -- Crudely Wrapped Gift
	34538, -- Blessed Weapon Coating
	34539, -- Righteous Weapon Coating
	34583, -- Aldor Supplies Package
	34584, -- Scryer Supplies Package
	34585, -- Scryer Supplies Package
	34587, -- Aldor Supplies Package
	34592, -- Aldor Supplies Package
	34593, -- Scryer Supplies Package
	34594, -- Scryer Supplies Package
	34595, -- Aldor Supplies Package
	34686, -- Brazier of Dancing Flames
	35232, -- Shattered Sun Supplies
	35396, -- Enchant 2H Weapon - Major Agility
	35397, -- Enchant 2H Weapon - Savagery
	35398, -- Enchant Boots - Boar's Speed
	35399, -- Enchant Boots - Cat's Swiftness
	35400, -- Enchant Boots - Dexterity
	35417, -- Enchant Boots - Fortitude
	35418, -- Enchant Boots - Surefooted
	35419, -- Enchant Boots - Vitality
	35420, -- Enchant Bracer - Brawn
	35421, -- Enchant Bracer - Fortitude
	35422, -- Enchant Bracer - Greater Dodge
	35423, -- Enchant Bracer - Major Intellect
	35424, -- Enchant Bracer - Restore Mana Prime
	35425, -- Enchant Bracer - Spellpower
	35426, -- Enchant Bracer - Stats
	35427, -- Enchant Bracer - Superior Healing
	35428, -- Enchant Chest - Exceptional Health
	35429, -- Enchant Chest - Exceptional Stats
	35430, -- Enchant Chest - Major Resilience
	35431, -- Enchant Chest - Major Spirit
	35432, -- Enchant Cloak - Greater Agility
	35436, -- Enchant Cloak - PvP Power
	35437, -- Enchant Cloak - Major Armor
	35438, -- Enchant Gloves - Assault
	35440, -- Enchant Gloves - Major Healing
	35441, -- Enchant Gloves - Major Spellpower
	35442, -- Enchant Gloves - Major Strength
	35443, -- Enchant Gloves - Spell Strike
	35445, -- Enchant Ring - Minor Intellect
	35446, -- Enchant Ring - Stats
	35447, -- Enchant Ring - Striking
	35448, -- Enchant Shield - Intellect
	35449, -- Enchant Shield - Major Stamina
	35451, -- Enchant Shield - Parry
	35452, -- Enchant Weapon - Battlemaster
	35453, -- Enchant Weapon - Greater Agility
	35454, -- Enchant Weapon - Major Healing
	35455, -- Enchant Weapon - Major Intellect
	35456, -- Enchant Weapon - Major Spellpower
	35457, -- Enchant Weapon - Major Striking
	35458, -- Enchant Weapon - Mongoose
	35459, -- Enchant Weapon - Potency
	35460, -- Enchant Weapon - Soulfrost
	35461, -- Enchant Weapon - Spellsurge
	35462, -- Enchant Weapon - Sunfire
	35512, -- Pocket Full of Snow
	35728, -- Greater Inscription of the Blade
	35729, -- Greater Inscription of the Knight
	35730, -- Greater Inscription of the Oracle
	35731, -- Greater Inscription of the Orb
	35945, -- Brilliant Glass
	36877, -- Folded Letter
	36889, -- Demonic Healthstone
	36892, -- Fel Healthstone
	36893, -- Fel Healthstone
	36894, -- Fel Healthstone
	36895, -- Demonic Soulstone
	36899, -- Exceptional Mana Oil
	37265, -- Tua'kea's Breathing Bladder
	38587, -- Empty Brewfest Stein
	39883, -- Cracked Egg
	40390, -- Vic's Emergency Air Tank
	42342, -- Bag of Popcorn
	42350, -- Bag of Peanuts
	43467, -- Scroll of Protection VII
	43468, -- Scroll of Protection VIII
	44481, -- Grindgear Toy Gorilla
	44599, -- Zippy Copper Racer
	44601, -- Heavy Copper Racer
	44621, -- Bottle of Dalaran White
	44623, -- Bottle of Dalaran Red
	44627, -- Bottle of Peaked Dalaran Red
	44718, -- Ripe Disgusting Jar
	46319, -- Tournament Brew
	46399, -- Thunder's Plunder
	46400, -- Barleybrew Gold
	46401, -- Crimson Stripe
	46402, -- Promise of the Pandaren
	46403, -- Chuganpug's Delight
	52974, -- Mack's Deep Sea Grog
	54455, -- Paint Bomb
	54822, -- Sen'jin Overcloak
	54962, -- Elemental Air Shard
	57135, -- Sandbag
	57190, -- Barricade
	58142, -- Deathblood Venom
	58156, -- Wind Break
	58170, -- Wall Fortification
	62237, -- Adventurer's Journal
	62238, -- Origami Rock
	62239, -- Origami Slime
	62251, -- Runescroll of Fortitude II
	63246, -- Origami Beetle
	63269, -- Loaded Gnomish Dice
	63303, -- Scroll of Agility IX
	63304, -- Scroll of Strength IX
	63305, -- Scroll of Intellect IX
	63306, -- Scroll of Stamina IX
	63307, -- Scroll of Versatility IX
	63308, -- Scroll of Protection IX
	67231, -- Runescroll of Might
	67413, -- War of the Satyr
	71134, -- Celebration Package
	79102, -- Green Cabbage Seeds
	79338, -- Bucket of Meaty Dog Food
	80590, -- Juicycrunch Carrot Seeds
	80591, -- Scallion Seeds
	80592, -- Mogu Pumpkin Seeds
	80593, -- Red Blossom Leek Seeds
	80594, -- Pink Turnip Seeds
	80595, -- White Turnip Seeds
	80809, -- Bag of Green Cabbage Seeds
	81901, -- Brilliant Mana Gem
	82392, -- Gumweed
	83137, -- Hozen Remedy Pouch
	84686, -- Mug of Dreadbrew
	84782, -- Bag of Juicycrunch Carrot Seeds
	84783, -- Bag of Scallion Seeds
	85153, -- Bag of Mogu Pumpkin Seeds
	85158, -- Bag of Red Blossom Leek Seeds
	85162, -- Bag of Pink Turnip Seeds
	85163, -- Bag of White Turnip Seeds
	85215, -- Snakeroot Seed
	85216, -- Enigma Seed
	85217, -- Magebulb Seed
	85219, -- Ominous Seed
	85580, -- Empty Polyformic Acid Vial
	85589, -- Nearly Full Vial of Polyformic Acid
	85592, -- Half Full Vial of Polyformic Acid
	85593, -- Nearly Empty Vial of Polyformic Acid
	86592, -- Hozen Peace Pipe
	87257, -- Arcane Familiar Stone
	87258, -- Fiery Familiar Stone
	87259, -- Icy Familiar Stone
	89125, -- Sack of Pet Supplies
	89197, -- Windshear Cactus Seed
	89202, -- Raptorleaf Seed
	89233, -- Songbell Seed
	89326, -- Witchberry Seeds
	89328, -- Jade Squash Seeds
	89329, -- Striped Melon Seeds
	89640, -- Life Spirit
	89641, -- Water Spirit
	89847, -- Bag of Witchberry Seeds
	89848, -- Bag of Jade Squash Seeds
	89849, -- Bag of Striped Melon Seeds
	89911, -- Alliance Firework
	89912, -- Horde Firework
	89999, -- Everlasting Alliance Firework
	90000, -- Everlasting Horde Firework
	90174, -- Troubles From Without
	90428, -- Pandaren Brew
	90638, -- Ball of Sunshine
	90815, -- Relic of Guo-Lai
	90918, -- Celebration Package
	91086, -- Darkmoon Pet Supplies
	91806, -- Unstable Portal Shard
	91850, -- Orgrimmar Portal Shard
	91860, -- Stormwind Portal Shard
	91861, -- Thunder Bluff Portal Shard
	91862, -- Undercity Portal Shard
	91863, -- Silvermoon Portal Shard
	91864, -- Ironforge Portal Shard
	91865, -- Darnassus Portal Shard
	91866, -- Exodar Portal Shard
	92049, -- Mercenary Contract: Mage
	92050, -- Mercenary Contract: Paladin
	92051, -- Mercenary Contract: Priest
	92052, -- Mercenary Contract: Druid
	92053, -- Mercenary Contract: Warrior
	92054, -- Mercenary Contract: Rogue
	92055, -- Mercenary Contract: Shaman
	92056, -- Portal Fuel: Sparkrocket Outpost
	92057, -- Portal Fuel: Orgrimmar
	92058, -- Portal Fuel: Shrine of Two Moons
	92059, -- Domination Point Banquet
	92421, -- Guard Contract: Graveyard
	92422, -- Guard Contract: Tower
	92427, -- Guard Contract: Tower
	92428, -- Guard Contract: Graveyard
	92429, -- Lion's Landing Banquet
	92430, -- Portal Reagents: Shrine of Seven Stars
	92431, -- Portal Reagents: Stormwind
	92432, -- Portal Reagents: Skyfire
	92433, -- Mercenary Contract: Shaman
	92434, -- Mercenary Contract: Rogue
	92435, -- Mercenary Contract: Warrior
	92436, -- Mercenary Contract: Druid
	92437, -- Mercenary Contract: Priest
	92438, -- Mercenary Contract: Paladin
	92439, -- Mercenary Contract: Mage
	92442, -- Horde Banner
	92443, -- Alliance Banner
	92526, -- Crate of Horde Banners
	92527, -- Rodent Crate
	92528, -- Obelisk of Deception
	92530, -- Box of Overridden Excavationbots
	92531, -- Crate of Alliance Banners
	92532, -- Rodent Crate
	92533, -- Obelisk of Deception
	92535, -- Box of Overridden Excavationbots
	92663, -- Guard Contract: Outpost
	92664, -- Guard Contract: Outpost
	92718, -- Brawler's Purse
	92719, -- Bulging Brawler's Purse
	93146, -- Pandaren Spirit Pet Supplies
	93147, -- Pandaren Spirit Pet Supplies
	93148, -- Pandaren Spirit Pet Supplies
	93149, -- Pandaren Spirit Pet Supplies
	93730, -- Darkmoon Top Hat
	93823, -- Challenge Card: Bruce
	93824, -- Challenge Card: Vian
	94160, -- Challenge Card: Goredome
	94161, -- Challenge Card: Vishas
	94162, -- Challenge Card: Dippy
	94163, -- Challenge Card: Kirrawk
	94164, -- Challenge Card: Fran & Riddoh
	94165, -- Challenge Card: King Kulaka
	94166, -- Challenge Card: Blat
	94167, -- Challenge Card: Sanoriak
	94168, -- Challenge Card: Ixx
	94169, -- Challenge Card: Mazhareen
	94170, -- Challenge Card: Crush
	94171, -- Challenge Card: Leona
	94172, -- Challenge Card: Dominika
	94173, -- Challenge Card: Deeken
	94174, -- Challenge Card: Millie Watt
	94175, -- Challenge Card: Fjoll
	94176, -- Challenge Card: Proboskus
	94177, -- Challenge Card: Leper Gnomes
	94178, -- Challenge Card: G.G. Engineering
	94179, -- Challenge Card: Dark Summoner
	94180, -- Challenge Card: Battletron
	94181, -- Challenge Card: Meatball
	94182, -- Challenge Card: Epicus Maximus
	94183, -- Challenge Card: Yikkan Izu
	94184, -- Challenge Card: Akama
	94185, -- Challenge Card: Smash Hoofstomp
	94186, -- Challenge Card: Unguloxx
	94187, -- Challenge Card: Disruptron
	94188, -- Challenge Card: Millhouse Manastorm
	94189, -- Challenge Card: Zen'shar
	94207, -- Fabled Pandaren Pet Supplies
	94296, -- Cracked Primal Egg
	95434, -- Bag of Green Cabbage Seeds
	95436, -- Bag of Juicycrunch Carrot Seeds
	95437, -- Bag of Jade Squash Seeds
	95438, -- Bag of Mogu Pumpkin Seeds
	95439, -- Bag of Pink Turnip Seeds
	95440, -- Bag of Red Blossom Leek Seeds
	95441, -- Bag of Scallion Seeds
	95442, -- Bag of Striped Melon Seeds
	95443, -- Bag of White Turnip Seeds
	95444, -- Bag of Witchberry Seeds
	95445, -- Bag of Songbell Seeds
	95446, -- Bag of Songbell Seeds
	95447, -- Bag of Snakeroot Seeds
	95448, -- Bag of Snakeroot Seeds
	95449, -- Bag of Enigma Seeds
	95450, -- Bag of Enigma Seeds
	95451, -- Bag of Magebulb Seeds
	95452, -- Bag of Magebulb Seeds
	95454, -- Bag of Windshear Cactus Seeds
	95456, -- Bag of Windshear Cactus Seeds
	95457, -- Bag of Raptorleaf Seeds
	95458, -- Bag of Raptorleaf Seeds
	97278, -- Challenge Card: Ahoo'ru
	97279, -- Challenge Card: Mingus Diggs
	97280, -- Challenge Card: Dippy & Doopy
	97281, -- Challenge Card: Hexos
	97282, -- Challenge Card: Ty'thar
	97283, -- Challenge Card: Nibbleh
	97284, -- Challenge Card: Master Boom Boom
	97285, -- Challenge Card: Grandpa Grumplefloot
	97286, -- Challenge Card: Big Badda Boom
	97287, -- Challenge Card: The Bear and the Lady Fair
	97288, -- Challenge Card: Doctor FIST
	97289, -- Challenge Card: Splat
	97321, -- Challenge Card: Blind Hero
	97445, -- Challenge Card: Blingtron 3000
	97450, -- Challenge Card: Tyson Sanders
	97559, -- Challenge Card: T440 Dual-Mode Robot
	97560, -- Challenge Card: Ro-Shambo
	97561, -- Challenge Card: Bao'za
	97563, -- Challenge Card: Mecha-Bruce
	97566, -- Challenge Card: Razorgrin
	97972, -- Challenge Card: Anthracite
	98095, -- Brawler's Pet Supplies
	98563, -- Rainstick
	101571, -- Moonfang Shroud
	101675, -- Shimmering Moonstone
	104112, -- Curious Ticking Parcel
	104114, -- Curious Ticking Parcel
	107224, -- Celebration Package
	107272, -- Frostwolf First-Fang
	107273, -- Snow Hare's Foot
	107499, -- Mulled Alterac Brandy
	107799, -- Racing Regs
	110238, -- Oath of Shadow Hunter Rala
	110431, -- Leather Beach Ball
	110433, -- Dragonfly Ambusher
	110724, -- Mulverick's Offer of Service
	110905, -- Defection of Gronnstalker Rokash
	110907, -- Iron Explorer Notes
	111407, -- Waterlogged Journal
	112087, -- Obsidian Frostwolf Petroglyph
	112108, -- Cracked Egg
	112737, -- Contract: Ka'la of the Frostwolves
	112848, -- Contract: Daleera Moonfang
	113274, -- Plume of Celerity
	113275, -- Ravenlord's Talon
	113276, -- Pridehunter's Fang
	113277, -- Ogreblood Potion
	113278, -- Scavenger's Eyepiece
	113545, -- Carved Drinking Horn
	114015, -- Lavastone Pale
	114016, -- Lavastone Jack
	114116, -- Bag of Salvaged Goods
	114244, -- GG-117 Micro-Jetpack
	114246, -- \"Skyterror\" Personal Delivery System
	114633, -- XD-57 \"Bullseye\" Guided Rocket Kit
	114744, -- Sentry Turret Dispenser
	114825, -- Contract: Ulna Thresher
	114826, -- Contract: Bruma Swiftstone
	114835, -- Rooby Reat
	114850, -- Bubblefizz Bubbly
	114924, -- Prototype Mekgineer's Chopper
	114925, -- Prototype Mechano-Hog
	114926, -- Restorative Goldcap
	114942, -- Cracked Draenic Mortar
	114974, -- Pneumatic Power Gauntlet
	114975, -- Pneumatic Power Gauntlet
	114983, -- Sticky Grenade Launcher
	115519, -- Flask of the Honorbound
	115793, -- S.O.S. Relief Flare
	115795, -- S.O.S. Relief Flare
	116062, -- Greater Darkmoon Pet Supplies
	116414, -- Pet Supplies
	116915, -- Inactive Apexis Guardian
	116979, -- Blackwater Anti-Venom
	116981, -- Fire Ammonite Oil
	117398, -- Everbloom Seed Pouch
	117492, -- Relic of Rukhmar
	118226, -- Pattern: Miniature Flying Carpet
	118414, -- Awesomefish
	118415, -- Grieferfish
	118473, -- Small Sack of Salvaged Goods
	118511, -- Tyfish
	118630, -- Hyper Augment Rune
	118631, -- Stout Augment Rune
	118632, -- Focus Augment Rune
	118697, -- Big Bag of Pet Supplies
	118706, -- Cracked Goren Egg
	118727, -- Frostfire Treasure Map
	118728, -- Shadowmoon Valley Treasure Map
	118729, -- Gorgrond Treasure Map
	118730, -- Talador Treasure Map
	118731, -- Spires of Arak Treasure Map
	118732, -- Nagrand Treasure Map
	119158, -- Robo-Rooster
	119164, -- Contract: Arakkoa Outcasts Follower
	119168, -- Contract: Vol'jin's Spear Follower
	119169, -- Contract: Wrynn's Vanguard Follower
	119209, -- Angry Brewfest Letter
	119213, -- Unnecessary Spike
	119348, -- Admiral Taylor's Garrison Log
	119436, -- Overcharged Siege Engine
	119437, -- Overcharged Demolisher
	119809, -- Caged Boar
	119811, -- Caged Talbuk
	119812, -- Caged Elekk
	119816, -- Caged Mighty Talbuk
	119818, -- Caged Mighty Elekk
	119820, -- Caged Mighty Boar
	119821, -- Contract: Dawnseeker Rukaryx
	120142, -- Coliseum Champion's Spoils
	120170, -- Partially-Digested Bag
	120183, -- Excess Potion of Accumulated Power
	120204, -- Forged Weapons and Armor
	120205, -- XP
	120321, -- Mystery Bag
	120323, -- Bulging Stacked Card Deck
	120325, -- Overflowing Stacked Card Deck
	120347, -- Enchanted Crystal of Replenishment
	120348, -- Enchanted Crystal of Freezing
	120349, -- Enduring Vial of Swiftness
	122338, -- Ancient Heirloom Armor Casing
	122339, -- Ancient Heirloom Scabbard
	122460, -- Drained Blood Crystal
	122535, -- Traveler's Pet Supplies
	122589, -- Ogre Waystone Conversions
	122610, -- Storm Drake Scale
	123956, -- Leystone Hoofplates
	124037, -- Storm Drake Scale
	124045, -- Smelly Musk Gland
	124093, -- Minor Blackfang Challenge Totem
	124094, -- Major Blackfang Challenge Totem
	124095, -- Prime Blackfang Challenge Totem
	124640, -- Inky Black Potion
	126939, -- Improvised Flight System
	126950, -- Equipment Blueprint: Bilge Pump
	126952, -- Ship: Destroyer
	126983, -- Ship: Submarine
	126986, -- Ship: Carrier
	127003, -- Liadrin's Scouting Report
	127029, -- Scoutmaster's Orders
	127040, -- New Recruit
	127122, -- Legion Presence
	127134, -- Ship: Battleship
	127135, -- Ship: Transport
	127395, -- Ripened Strange Fruit
	127408, -- Adventuring Journal
	127690, -- Demon Hunt: Felwrought Destructor
	127691, -- Shrine: Glory of the Lightbringer
	127692, -- Invasion: Kirin Tor Shore
	127751, -- Fel-Touched Pet Supplies
	127768, -- Fel Petal
	127770, -- Brazier of Awakening
	127837, -- Draught of Raw Magic
	127838, -- Sylvan Elixir
	127839, -- Avalanche Elixir
	127840, -- Skaggldrynk
	127841, -- Skystep Potion
	127882, -- Blast Furnace
	127885, -- Salty Crew
	127887, -- Food Storage Bay
	127893, -- Wreckage Recovery Module
	127896, -- Nitro Fuel Tanks
	127916, -- Altruis' Findings
	127987, -- Celebration Package
	127992, -- New Recruit
	128207, -- Reconnaissance: Legion Gateway
	128231, -- Equipment Blueprint: Trained Shark Tank
	128252, -- Equipment Blueprint: True Iron Rudder
	128253, -- Equipment Blueprint: Sonic Amplification Field
	128254, -- Equipment Blueprint: Q-43 Noisemaker Mines
	128255, -- Equipment Blueprint: Ice Cutter
	128256, -- Equipment Blueprint: Gyroscopic Internal Stabilizer
	128257, -- Equipment Blueprint: Ghostly Spyglass
	128258, -- Equipment Blueprint: Felsmoke Launchers
	128259, -- Equipment Blueprint: Extra Quarters
	128260, -- Equipment Blueprint: Blast Furnace
	128261, -- Equipment Blueprint: Automated Sky Scanner
	128262, -- Equipment Blueprint: Ammo Reserves
	128301, -- Ship: Submarine
	128302, -- Ship: Battleship
	128303, -- Ship: Destroyer
	128315, -- Medallion of the Legion
	128320, -- Corrupted Primal Obelisk
	128324, -- Ashilvara, Verse 1
	128634, -- Mysterious Brew
	128707, -- Azsuna Scouting Report
	128747, -- Val'Sharah Scouting Report
	128748, -- Highmountain Scouting Report
	128749, -- Stormheim Scouting Report
	128793, -- Sack of Spiders
	128966, -- Demon Hunt: Wingterror Ikzil
	128967, -- Recon: Titan Relic
	128968, -- Invasion: The Priestess' Moonwell
	128969, -- Demon Hunt: Lord Malus
	128970, -- Shrine: Glory of the Lightbringer
	128971, -- Invasion: The Stormtide
	128972, -- Demon Hunt: Emissary Azathar
	128973, -- Shrine: Glory of the Lightbringer
	128975, -- Invasion: Wheathoof Village
	129094, -- Nightwell Ambrosia
	129099, -- Gem Chip
	129940, -- Commendation of the Kirin Tor
	129941, -- Commendation of the Ebon Blade
	129942, -- Commendation of the Argent Crusade
	129943, -- Commendation of the Sons of Hodir
	129944, -- Commendation of the Wyrmrest Accord
	129945, -- Commendation of The Consortium
	129946, -- Commendation of The Sha'tar
	129947, -- Commendation of Thrallmar
	129948, -- Commendation of Honor Hold
	129949, -- Commendation of the Cenarion Expedition
	129950, -- Commendation of the Keepers of Time
	129951, -- Commendation of Lower City
	129954, -- Commendation of the Horde Expedition
	129955, -- Commendation of the Alliance Vanguard
	130144, -- Crystallized Fey Darter Egg
	130152, -- Condensed Light of Elune
	130153, -- Godafoss Essence
	130159, -- Ravencrest Shield
	130165, -- Heathrow Keepsake
	130184, -- Leylight Binder
	130193, -- Disarmed Treasure Chest Trap
	130200, -- Gem Chip
	130201, -- Gem Chip
	130202, -- Gem Chip
	130203, -- Gem Chip
	130204, -- Gem Chip
	130257, -- Pocket Friend
	130936, -- Silver Squire Horn
	131728, -- Urn of Malgalor's Blood
	131732, -- Purple Hills of Eredath
	131746, -- Stonehide Leather Barding
	131751, -- Fractured Portal Shard
	131753, -- Prayers to the Earthmother
	131758, -- Oversized Acorn
	131763, -- Bundle of Trueshot Arrows
	131778, -- Woodcarved Rabbit
	131784, -- Left Half of a Locket
	131785, -- Right Half of a Locket
	131789, -- Handmade Mobile
	131795, -- Nar'thalasian Corsage
	131802, -- Offering to Ram'Pag
	131808, -- Engraved Bloodtotem Armlet
	132182, -- Curved Fin Edge
	132183, -- Razor Tooth
	132186, -- Hardened Molars
	132190, -- Pointed Tail Tip
	132192, -- Pitted Bone
	132197, -- Fel Paw
	132200, -- Ashen Ring
	132202, -- Corrupt Figurine
	132205, -- Lingering Ember
	132206, -- Scrap of Ebonwing
	132207, -- Pulsing Scales
	132211, -- Collection of Dust
	132216, -- Charged Dust
	132217, -- Elemental Pebbles
	132218, -- Glob of Elemental Goo
	132219, -- Opposable Leaf
	132223, -- Elemental Droplet
	132225, -- Hardened Beak
	132227, -- Feathered Necklace
	132229, -- Cold-Resistant Hide
	132230, -- Mana-Charged Hide
	132232, -- Coalesced Extoplasm
	132234, -- Spectral Dust
	132235, -- Intact Eyeball
	132238, -- Disjointed Jaw
	132239, -- Bone Splinters
	132262, -- Design: Deadly Deep Amber
	132268, -- Design: Quick Azsunite
	132269, -- Design: Masterful Queen's Opal
	132274, -- New Recruit
	132331, -- Design: Skystone Loop
	132332, -- Design: Deep Amber Loop
	132333, -- Design: Azsunite Loop
	132361, -- Petrified Arkhana
	132897, -- Mandate of the Watchers
	132923, -- Hrydshal Etching
	132950, -- Petrified Snake
	133150, -- Commendation of the Dragonmaw Clan
	133151, -- Commendation of the Wildhammer Clan
	133152, -- Commendation of the Guardians of Hyjal
	133154, -- Commendation of the Ramkahen
	133159, -- Commendation of The Earthen Ring
	133160, -- Commendation of Therazane
	133329, -- New Recruit
	133552, -- New Recruit
	133555, -- Ritssyn Flamescowl
	133556, -- Lulubelle Fizzlebang
	133701, -- Skrog Toenail
	133702, -- Aromatic Murloc Slime
	133703, -- Pearlescent Conch
	133704, -- Rusty Queenfish Brooch
	133705, -- Rotten Fishbone
	133706, -- Mossgill Bait
	133707, -- Nightmare Nightcrawler
	133708, -- Drowned Thistleleaf
	133709, -- Funky Sea Snail
	133710, -- Salmon Lure
	133711, -- Swollen Murloc Egg
	133712, -- Frost Worm
	133713, -- Moosehorn Hook
	133714, -- Silverscale Minnow
	133715, -- Ancient Vrykul Ring
	133716, -- Soggy Drakescale
	133717, -- Enchanted Lure
	133719, -- Sleeping Murloc
	133720, -- Demonic Detritus
	133721, -- Message in a Beer Bottle
	133722, -- Axefish Lure
	133724, -- Decayed Whale Blubber
	133795, -- Ravenous Fly
	133888, -- Shortstalk Mushroom
	133889, -- Giantcap Mushroom
	133890, -- Stoneshroom
	133891, -- Wormstalk Mushroom
	133892, -- Floaty Fungus
	133937, -- New Recruit
	133985, -- Heavy Drog
	133987, -- Blue Drog
	133990, -- Drinking Buddy
	133992, -- DrogLite
	133993, -- Jug of Drog
	134033, -- Lady S'theno's Reconnaissance
	134062, -- Mog'dorg the Wizened
	134063, -- New Recruit
	134064, -- The Great Akazamzarak
	136269, -- Kel'danath's Manaflask
	136394, -- Squad of Ox Initiates
	136404, -- Squad of Tiger Initiates
	136405, -- Student of Chi-Ji - Crane Initiate
	136708, -- Demonsteel Stirrups
	136810, -- New Recruit
	136843, -- Black Harvest Acolytes
	136844, -- Pack of Imps
	136845, -- Felguard Demons
	136936, -- Water Elementals
	136939, -- Apprentice
	136940, -- Troop C
	136941, -- Ghouls
	136942, -- Ebon Knights
	136943, -- Troop C
	136944, -- Ashtongue Warriors
	136945, -- Illidari Adept
	136946, -- Troop C
	136947, -- Dryads
	136948, -- Druid of the Claw
	136949, -- Keepers of the Grove
	136950, -- Archers
	136951, -- Trackers
	136952, -- Troop C
	136953, -- Silver Hand Squires
	136954, -- Silver Hand Knights
	136955, -- Troop C
	136956, -- Paragons
	136957, -- Zealots
	136958, -- Troop C
	136959, -- Thieves
	136960, -- Duelists
	136961, -- Troop C
	136962, -- Earthcallers
	136963, -- Lesser Elementals
	136964, -- Ascendants
	136965, -- Valarjar Aspirant
	136966, -- Shieldmaidens
	136967, -- Troop C
	136984, -- Celestial
	137173, -- Recruiter Tianji
	137198, -- Brewers Kit
	137207, -- Fortified Armor Set
	137226, -- Squad of Ox Adepts
	137247, -- Squad of Tiger Adepts
	137248, -- Hiro Brew
	137251, -- Number Nine Jia
	137296, -- Banner of Power
	137297, -- Banner of Power
	137374, -- Journeyman Goldmine
	137376, -- Summoner Morn
	137414, -- Pet Tournament Purse
	137500, -- Banner of Protection
	137501, -- Banner of Rejuvenation
	137556, -- Clothes Chest: Dalaran Citizens
	137557, -- Clothes Chest: Karazhan Opera House
	137558, -- Clothes Chest: Molten Core
	138026, -- Empowered Charging Device
	138027, -- Portal Key: Sewer Guard Station
	138028, -- Portal Key: Black Market
	138029, -- Portal Key: Inn Entrance
	138030, -- Portal Key: Alchemists' Lair
	138031, -- Portal Key: Abandoned Shack
	138032, -- Portal Key: Rear Entrance
	138120, -- Sister Lilith
	138121, -- Inscribed Leaf of Wisdom
	138137, -- Captain Hjalmar Stahlstrom
	138138, -- Einar the Runecaster
	138196, -- Barely Legible Page
	138231, -- Battlelord Gaardoun
	138232, -- Loramus Thalipedes
	138252, -- Chronicler Elrianne
	138388, -- Pack of Wild Imps
	138390, -- Fel Wrathguard Demons
	138400, -- Petey
	138413, -- Boots of Efficiency
	138480, -- Black Harvest Tome
	138487, -- Shinfel's Staff of Torment
	138761, -- Sir Alamande Graythorn
	138787, -- Tome of Illusions: Azeroth
	138791, -- Tome of Illusions: Cataclysm
	138802, -- Illusion: Power Torrent
	138827, -- Illusion: Nightmare
	138828, -- Illusion: Chronos
	138838, -- Illusion: Deathfrost
	138867, -- Shimmer Stout
	138868, -- Mannoroth's Blood Red Ale
	138869, -- Gordok Bock
	138870, -- Spirit Spirits
	138871, -- Storming Saison
	138872, -- Black Harvest Invokers
	138956, -- Hypermagnetic Lure
	138957, -- Auriphagic Sardine
	138958, -- Glob of Really Sticky Glue
	138959, -- Micro-Vortex Generator
	138960, -- Wish Crystal
	138961, -- Alchemical Bonding Agent
	138962, -- Starfish on a String
	138963, -- Tiny Little Grabbing Apparatus
	139001, -- Recruiter [RECRUITER A]
	139010, -- Petrified Silkweave
	139017, -- Soothing Leystone Shard
	139018, -- Box of Calming Whispers
	139038, -- Greater Elementals
	139039, -- Geomancers
	139137, -- Hag's Belongings
	139138, -- Marksmen
	139139, -- Rangers
	139140, -- Recruiter Lenara
	139141, -- Dark Summoner Marogh
	139142, -- Grand Anchorite Gesslar
	139143, -- Archivist Zubashi
	139144, -- Archon Torias
	139145, -- Arcane Golem
	139146, -- Conjurer
	139147, -- Treant
	139148, -- Silver Hand Phalanx
	139149, -- Silver Hand Champions
	139150, -- Stormforged Valarjar
	139151, -- Valkyra Shieldmaiden
	139175, -- Arcane Lure
	139178, -- Coded Message
	139179, -- Naga Myrmidon
	139180, -- Illidari Fury
	139285, -- Celebration Package
	139286, -- Geists
	139287, -- Ebon Champions
	139306, -- Defias Bandits
	139307, -- Pirates
	139308, -- Champion Armaments
	139361, -- Hasty Lesser Elementals
	139363, -- Hasty Squad of Ox Initiates
	139365, -- Hasty Valarjar Aspirant
	139367, -- Hasty Silver Hand Squires
	139369, -- Hasty Water Elementals
	139371, -- Hasty Treant
	139373, -- Hasty Ghouls
	139377, -- Acolytes
	139379, -- Dark Zealots
	139390, -- Artifact Research Notes
	139423, -- Croc Mojo
	139424, -- Screecher Whistle
	139427, -- Wild Mana Wand
	139500, -- Hippogryph Feather
	139593, -- Sack of Salvaged Goods
	139777, -- Strange Crate
	139801, -- Lucky Doodad
	139808, -- Curio of Abundant Happiness
	139811, -- Necklace of Endless Memories
	139888, -- Exhausted Frost Crux
	139892, -- Inactive Demonic Phylactery
	140038, -- Dusty Focusing Crystal
	140136, -- Archmage Omniara
	140157, -- Cracked Horn of War
	140158, -- Depleted Rift Core
	140234, -- Selentia's Mana-Infused Brooch
	140236, -- A Mrglrmrl Mlrglr
	140240, -- Enchanted Moonwell Waters
	140246, -- Arc of Snow
	140248, -- Master Jeweler's Gem
	140260, -- Arcane Remnant of Falanaar
	140308, -- Rescued Valarjar
	140326, -- Enchanted Burial Urn
	140327, -- Kyrtos's Research Notes
	140328, -- Volatile Leyline Crystal
	140329, -- Infinite Stone
	140336, -- Brulfist Idol
	140357, -- Fel Lava Rock
	140358, -- Eredar Armor Clasp
	140359, -- Darkened Eyeball
	140361, -- Pulsating Runestone
	140364, -- Frostwyrm Bone Fragment
	140365, -- Dried Stratholme Lily
	140366, -- Scarlet Hymnal
	140367, -- Tattered Sheet Music
	140368, -- Tarnished Engagement Ring
	140369, -- Scrawled Recipe
	140370, -- Amber Shard
	140371, -- Letter from Exarch Maladaar
	140373, -- Ornamented Boot Strap
	140374, -- Jagged Worgen Fang
	140377, -- Broken Medallion of Karabor
	140379, -- Broken Warden Glaive Blade
	140380, -- Swiftflight's Tail Feather
	140382, -- Tiny War Drum
	140383, -- Glowing Cave Mushroom
	140385, -- Legion Pamphlet
	140387, -- Bracer Gemstone
	140389, -- Petrified Flame
	140391, -- Argussian Diamond
	140392, -- Safety Valve
	140393, -- Repentia's Whip
	140399, -- Yellow Or'ligai Egg
	140401, -- Blue Or'ligai Egg
	140403, -- Lylandre's Fel Crystal
	140405, -- Illusion Matrix Crystal
	140406, -- Primed Arcane Charge
	140447, -- Vintage Quietwine
	140449, -- Elixir-Soaked Wrappings
	140460, -- Thisalee's Fighting Claws
	140462, -- Draketaming Spurs
	140463, -- Broken Eredar Blade
	140466, -- Corroded Eternium Rose
	140467, -- Fel-Infused Shell
	140468, -- Eagle Eggshell Fragment
	140469, -- Felslate Arrowhead
	140470, -- Ancient Gilnean Locket
	140471, -- Lord Shalzaru's Relic
	140473, -- Night-forged Halberd
	140474, -- Nar'thalas Pottery Fragment
	140475, -- Morning Glory Vine
	140476, -- Astranaar Globe
	140477, -- Inert Ashes
	140478, -- Painted Bark
	140479, -- Broken Legion Communicator
	140480, -- Drained Construct Core
	140481, -- Shimmering Hourglass
	140482, -- Storm Drake Fang
	140484, -- Well-Used Drinking Horn
	140485, -- Duskpelt Fang
	140486, -- Storm Drake Scale
	140487, -- War-Damaged Vrykul Helmet
	140488, -- Huge Blacksmith's Hammer
	140489, -- Ettin Toe Ring
	140490, -- Wooden Snow Shoes
	140491, -- Stolen Pearl Ring
	140492, -- Gleaming Glacial Pebble
	140494, -- Eredar Tail-Cuff
	140497, -- Bundle of Tiny Spears
	140498, -- Legion Admirer's Note
	140503, -- Blank To-Do List
	140504, -- Kvaldir Anchor Line
	140505, -- Sweaty Bandanna
	140507, -- Unlabeled Potion
	140508, -- Nightborne Artificer's Ring
	140509, -- Demon-Scrawled Drawing
	140511, -- Soul Shackle
	140513, -- Dreadlord's Commendation
	140518, -- Bottled Lightning
	140520, -- Amethyst Geode
	140521, -- Fire Turtle Shell Fragment
	140522, -- Petrified Spiderweb
	140523, -- Crimson Cavern Mushroom
	140524, -- Sharp Twilight Tooth
	140525, -- Obsidian Mirror
	140528, -- Dalaran Wine Glass
	140529, -- Felstalker's Ring
	140530, -- Opalescent Shell
	140531, -- Ravencrest Family Seal
	140532, -- Inscribed Vrykul Runestone
	140571, -- Potion of Energy
	140582, -- Bottomless Flask
	140584, -- Player Experience
	140587, -- Defiled Augment Rune
	140588, -- Survivalist Bahn
	140589, -- Archivist Melinda
	141018, -- Sargerei Blood Vessel
	141154, -- Improved Quality
	141318, -- Angry Post
	141319, -- Happy Post
	141320, -- Thoughtful Post
	141335, -- Lost Research Notes
	141344, -- Tribute of the Broken Isles
	141870, -- Arcane Tablet of Falanaar
	141891, -- Branch of Shaladrassil
	141892, -- Gilbert's Finest
	141896, -- Nashal's Spyglass
	141920, -- Access to the Ruins of Falanaar
	142026, -- Challenge Card: Blackmange
	142028, -- Challenge Card: Thwack U
	142029, -- Challenge Card: Ogrewatch
	142030, -- Challenge Card: Burnstachio
	142031, -- Challenge Card: Ray D. Tear
	142032, -- Challenge Card: Johnny Awesome
	142033, -- Challenge Card: Carl
	142034, -- Challenge Card: Beat Box
	142035, -- Challenge Card: Warhammer Council
	142036, -- Challenge Card: Master Paku
	142037, -- Challenge Card: Topps
	142038, -- Challenge Card: Serpent of Old
	142039, -- Challenge Card: Shadowmaster Aameen
	142040, -- Challenge Card: Ash'katzuum
	142041, -- Challenge Card: Bill the Janitor
	142042, -- Challenge Card: Ooliss
	142043, -- Challenge Card: Doomflipper
	142044, -- Challenge Card: Strange Thing
	142045, -- Challenge Card: Stitches
	142049, -- Legacy of the Mountain King
	142051, -- Torment of the Worgen
	142052, -- Redemption of the Fallen
	142073, -- Wrath of the Titans
	142074, -- Player Experience
	142156, -- Order Resources Cache
	142288, -- Rumble Card: Grief Warden
	142289, -- Rumble Card: Penguin Stampede
	142290, -- Rumble Card: Battle of the Brew
	142291, -- Rumble Card: Senya
	142292, -- Rumble Card: Stranglethorn Streak
	142293, -- Rumble Card: Mindbreaker Gzzaj
	142294, -- Rumble Card: Mazhareen
	142295, -- Rumble Card: Rumble 08
	142311, -- Free Drinks Voucher
	142313, -- Zeppelin Rental Form
	142314, -- Brawler's Potion Dispenser
	142317, -- Blood-Soaked Angel Figurine
	142318, -- High Roller's Contract
	142319, -- Bag of Chipped Dice
	142350, -- Challenger's Purse
	142381, -- Oath of Fealty
	142528, -- Crate of Bobbers: Can of Worms
	142529, -- Crate of Bobbers: Cat Head
	142530, -- Crate of Bobbers: Tugboat
	142543, -- Scroll of Town Portal
	143618, -- Oversized Page
	143619, -- Pile of Dust
	143662, -- Crate of Bobbers: Wooden Pepe
	143733, -- Ancient Mana Shards
	143734, -- Ancient Mana Crystal Cluster
	143753, -- Damp Pet Supplies
	143758, -- Free Drinks Voucher
	143759, -- VIP Room Rental Form
	143760, -- Brawler's Potion Dispenser
	143761, -- Blood-Soaked Angel Figurine
	143762, -- High Roller's Contract
	143763, -- Bag of Chipped Dice
	143772, -- Challenge Card: Oolis
	143786, -- Player Experience
	143794, -- Challenge Card: A Seagull
	143843, -- Horde War Effort Credit
	143899, -- Challenge Card: Oso the Betrayer
	144227, -- Soul of Frost
	144261, -- Sporeggium
	144262, -- Fungal Lifestalk
	144263, -- Pungent Truffle
	144264, -- Pungent Truffle
	144265, -- Rimecap
	144276, -- Sack of Healing Spores
	144373, -- Claw-Marked Brawler's Purse
	144374, -- Groovy Brawler's Purse
	144375, -- Feathered Brawler's Purse
	144376, -- Agile Brawler's Purse
	144377, -- Beginning Brawler's Purse
	144378, -- Gorestained Brawler's Purse
	144379, -- Murderous Brawler's Purse
	144395, -- Artifact Research Synopsis
	144431, -- Artifact Research Compendium: Volumes I-III
	144433, -- Artifact Research Compendium: Volume I
	144434, -- Artifact Research Compendium: Volumes I & II
	144435, -- Artifact Research Compendium: Volumes I-IV
	144436, -- Lost Legend of Odyn
	144437, -- Lost Legend of the Valarjar
	144439, -- Challenge Card: Klunk
	146309, -- Expended Spell Reagents
	146313, -- Highborne Pottery Shards
	146314, -- Marble Arrowhead
	146315, -- Moon-Rune of Elune
	146316, -- Ancient Suramar Silver
	146317, -- Mr. Smite's Supplies
	146318, -- Imp's Femur
	146319, -- Doom Dust
	146320, -- Faded Green Gem
	146321, -- Fossilized Succubus Horn
	146322, -- Fel Toast
	146323, -- Cracked Kobold Skull
	146324, -- Ossified Roc Feather
	146325, -- Worm-Eaten Grain Pouch
	146326, -- Scorched Pyrestone
	146327, -- Petrified Air Totem
	146329, -- Jar of Ashes
	146745, -- Artifact Research Notes
	146910, -- Sentinax Beacon of Greater Domination
	146911, -- Sentinax Beacon of the Greater Firestorm
	146912, -- Sentinax Beacon of Greater Carnage
	146913, -- Sentinax Beacon of Greater Warbeasts
	146914, -- Sentinax Beacon of Greater Engineering
	146915, -- Sentinax Beacon of Greater Torment
	146922, -- Sentinax Beacon of Fel Growth
	146923, -- Sentinax Beacon of Petrification
	146948, -- Tribute of the Broken Isles
	147212, -- Dauntless Bracers
	147213, -- Dauntless Tunic
	147214, -- Dauntless Treads
	147215, -- Dauntless Gauntlets
	147216, -- Dauntless Hood
	147217, -- Dauntless Leggings
	147218, -- Dauntless Spaulders
	147219, -- Dauntless Girdle
	147220, -- Dauntless Ring
	147221, -- Dauntless Choker
	147222, -- Dauntless Cloak
	147223, -- Dauntless Trinket
	147307, -- Crate of Bobbers: Carved Wooden Helm
	147308, -- Crate of Bobbers: Enchanted Bobber
	147309, -- Crate of Bobbers: Face of the Forest
	147310, -- Crate of Bobbers: Floating Totem
	147311, -- Crate of Bobbers: Replica Gondola
	147312, -- Crate of Bobbers: Demon Noggin
	147349, -- Spiked Armor Set
	147355, -- Sentinax Beacon of the Bloodstrike
	147416, -- Arcane Tablet of Falanaar
	147418, -- Arcane Remnant of Falanaar
	147434, -- Player Experience
	147574, -- Trial of Style Reward: Second Place
	147726, -- Nethercluster
	147729, -- Netherchunk
	147852, -- Artifact Research Compendium: Volumes I-V
	147853, -- Artifact Research Compendium: Volumes I-VI
	147854, -- Artifact Research Compendium: Volumes I-VII
	147855, -- Artifact Research Compendium: Volumes I-VIII
	147856, -- Artifact Research Compendium: Volumes I-IX
	147860, -- Empowered Elven Tome
	147877, -- Celebration Package
	147888, -- Portal: Forward Command
	150734, -- Air Stike
	150737, -- Abundant Order Resources Cache
	150924, -- Greater Tribute of the Broken Isles
	150955, -- Slippery Peel
	151117, -- Ensemble: Mana-Etched Regalia
	151118, -- Ensemble: Obsidian Prowler's Garb
	151119, -- Ensemble: Der'izu Armor
	151120, -- Ensemble: Righteous Battleplate
	151221, -- Gooey Brawler's Purse
	151222, -- Leather Brawler's Purse
	151223, -- Booming Brawler's Purse
	151224, -- Bitten Brawler's Purse
	151225, -- Wet Brawler's Purse
	151229, -- Brawler's Music Box
	151230, -- Croc-Skin Brawler's Purse
	151231, -- Brawler's Egg
	151232, -- Brawler's Package
	151233, -- Blingin' Brawler's Bag
	151235, -- Filthy Brawler's Purse
	151238, -- Dark Brawler's Purse
	151239, -- Felslate Anchor
	151264, -- Clunky Brawler's Purse
	151482, -- Time-Lost Wallet
	151483, -- Timewarped Badge
	151484, -- Reputation
	151485, -- Reputation
	151486, -- Reputation
	151487, -- Fangs of the Bronze
	151488, -- Hide of the Bronze
	151489, -- Wings of the Bronze
	151490, -- Stolen Time
	151491, -- Favor of the Bronze
	151492, -- Bronze Drake
	151493, -- Sands of Time
	151544, -- Stolen Time
	151545, -- Stolen Time
	151750, -- Pepper's Bridle
	151843, -- Eredath Armor Set
	152396, -- Arsenal: Weapons of the Lightforged
	152440, -- Void-Touched Arinor Blossom
	152441, -- Satchel of Lucidity
	152442, -- Impervious Shadoweave Hood
	152496, -- Demitri's Draught of Deception
	152556, -- Trawler Totem
	152574, -- Corbyn's Beacon
	152587, -- Levae's Missive
	152655, -- Restored Eye of Obsidian
	152733, -- Unsullied Trinket
	152735, -- Unsullied Ring
	152736, -- Unsullied Necklace
	152740, -- Unsullied Cloak
	152799, -- Unsullied Relic
	152812, -- Monel-Hardened Hoofplates
	152813, -- Monel-Hardened Stirrups
	152933, -- Shadowguard Void Effusion
	152934, -- Shadow-Soaked Stalker Heart
	152935, -- Wakener's Bauble
	152936, -- Azurelight Sapphire
	153001, -- Faintly Glowing Phoenix Down
	153005, -- Relinquished Armor Set
	153113, -- Demon's Soulstone
	153134, -- Cracked Matrix Core
	153191, -- Cracked Fel-Spotted Egg
	153251, -- Fresh Talbuk Meat
	154166, -- Coarse Leather Barding
	154168, -- Shimmerscale Diving Suit
	154169, -- Shimmerscale Diving Helmet
	154705, -- Battle Flag: Rallying Swiftness
	154706, -- Battle Flag: Phalanx Defense
	154707, -- Battle Flag: Spirit of Freedom
	155831, -- Pantheon's Blessing
	156508, -- Blessed Bandage
	156517, -- Hastily Drawn Map
	156529, -- Blood Orb
	156630, -- Relinquished Armor Set
	157542, -- Portal Scroll of Specificity
	157573, -- Ensemble: Mindwrack Raiment
	157574, -- Ensemble: Tundraspite Armor
	157576, -- Ensemble: Crimson Sentinel Garb
	157577, -- Ensemble: Goldspine Plate
	158144, -- Mysterious Scroll
	158201, -- War-Scroll of Intellect
	158202, -- War-Scroll of Battle Shout
	158204, -- War-Scroll of Fortitude
	159681, -- Set Keystone Map: Darkheart Thicket
	159683, -- Set Keystone Map: Black Rook Hold
	159684, -- Set Keystone Map: Cathedral of Eternal Night
	159685, -- Set Keystone Map: Court of Stars
	159686, -- Set Keystone Map: Eye of Azshara
	159687, -- Set Keystone Map: Halls of Valor
	159688, -- Set Keystone Map: Maw of Souls
	159689, -- Set Keystone Map: Lower Karazhan
	159690, -- Set Keystone Map: Upper Karazhan
	159691, -- Set Keystone Map: Seat of the Triumvirate
	159692, -- Set Keystone Map: The Arcway
	159693, -- Set Keystone Map: Vault of the Wardens
	159694, -- Set Keystone Level: 15
	159695, -- Set Keystone Level: 16
	159696, -- Set Keystone Level: 17
	159697, -- Set Keystone Level: 18
	159698, -- Set Keystone Level: 19
	159699, -- Set Keystone Level: 20
	159700, -- Set Keystone Level: 21
	159701, -- Set Keystone Level: 22
	159702, -- Set Keystone Level: 23
	159703, -- Set Keystone Level: 24
	159704, -- Set Keystone Level: 25
	159705, -- Set Keystone Level: 26
	159706, -- Set Keystone Level: 27
	159707, -- Set Keystone Level: 28
	159708, -- Set Keystone Level: 29
	159709, -- Set Keystone Level: 30
	159730, -- Add Keystone Affix: Tyrannical
	159731, -- Add Keystone Affix: Bolstering
	159732, -- Add Keystone Affix: Bursting
	159733, -- Add Keystone Affix: Explosive
	159734, -- Add Keystone Affix: Fortified
	159735, -- Add Keystone Affix: Grievous
	159736, -- Add Keystone Affix: Necrotic
	159737, -- Add Keystone Affix: Quaking
	159738, -- Add Keystone Affix: Raging
	159739, -- Add Keystone Affix: Sanguine
	159740, -- Add Keystone Affix: Skittish
	159741, -- Add Keystone Affix: Teeming
	159742, -- Add Keystone Affix: Volcanic
	159748, -- Rune-Etched Bone
	159961, -- Set Keystone Map: Neltharion's Lair
	159962, -- Set Keystone: Time Trial 3
	159963, -- Set Keystone: Time Trial 2
	159964, -- Set Keystone: Time Trial 1
	160053, -- Battle-Scarred Augment Rune
	160114, -- Thornberry
	160831, -- Cracking Cobra Egg
	160982, -- Recruitment Orders
	160983, -- Recruitment Orders
	161121, -- The Wolf's Den
	161138, -- Azerite Inspir-A-Geneering Elixir
	161385, -- Stonefist Watch
	161449, -- Swiftwind Post
	161482, -- Mudfisher Cove
	161487, -- Windfall Cavern
	162119, -- Hillcrest Pasture
	162511, -- Stonetusk Watch
	162543, -- Veiled Grotto
	162576, -- Mugamba Overlook
	162603, -- Verdant Hollow
	162636, -- Celebration Package
	162645, -- Mistvine Ledge
	162975, -- Grimwatt's Crash
	163038, -- Vulture's Nest
	163040, -- Storm Glider
	163059, -- Spoils of Jani
	163184, -- Outpost Upgrade
	163190, -- Outpost Upgrade
	163193, -- Outpost Upgrade
	163334, -- Outpost Upgrade
	163507, -- Outpost Upgrade
	163535, -- Outpost Upgrade
	163570, -- Outpost Upgrade
	163571, -- Outpost Upgrade
	163594, -- Outpost Upgrade
	163600, -- Outpost Upgrade
	163610, -- Outpost Upgrade
	163713, -- Brazier Cap
	163735, -- Foul Belly
	163736, -- Spectral Visage
	163738, -- Syndicate Mask
	163744, -- Coldrage's Cooler
	163745, -- Witherbark Gong
	163750, -- Kovork Kostume
	163761, -- Ratwhisker Luckydo
	163765, -- Flashfire Brew
	163775, -- Molok Morion
	163828, -- Toy Siege Tower
	163829, -- Toy War Machine
	163830, -- Gale Rider
	164638, -- Challenge Card: Phillip Carter Tracey
	164639, -- Challenge Card: Farmer Xiang-Su
	164640, -- Challenge Card: Tidemistress Shellbreaker
	164645, -- Challenge Card: Zaxx Dreadslice
	164647, -- Challenge Card: Marcus
	164721, -- Challenge Card: Robe-Robber Robert
	164931, -- Rumbler's Purse
	164935, -- Challenge Card: Lord Sylysthrel
	164936, -- Mysterious Challenge Card
	164938, -- G.G. Gearbox
	164939, -- Overstuffed Silkweave Purse
	164940, -- Mysterious Satchel
	165430, -- S.O.S. Relief Flare
	165606, -- Player Experience
	165699, -- Scarlet Herring Lure
	165709, -- Challenge Card: Mama Stormstout
	165727, -- Outpost Upgrade
	165751, -- Outpost Upgrade
	165805, -- Outpost Upgrade
	165837, -- Outpost Upgrade
	165839, -- Unopened Gnomeregan Supply Box
	165850, -- Kvaldir Anchor Line
	165874, -- Outpost Upgrade
	165881, -- Outpost Upgrade
	165945, -- Investigation Results
	166231, -- Player Experience
	166243, -- Investigation Results
	166270, -- Potion of the Unveiling Eye
	166377, -- Set Keystone Level: 14
	166378, -- Set Keystone Level: 13
	166379, -- Set Keystone Level: 12
	166380, -- Set Keystone Level: 11
	166381, -- Set Keystone Level: 10
	166382, -- Add Keystone Affix: Infested
	166383, -- Set Keystone Map: Atal'dazar
	166390, -- Set Keystone Map: Freehold
	166391, -- Set Keystone Map: Kings' Rest
	166392, -- Set Keystone Map: Shrine of the Storm
	166393, -- Set Keystone Map: Siege of Boralus
	166394, -- Set Keystone Map: Temple of Sethraliss
	166395, -- Set Keystone Map: The MOTHERLODE!!
	166396, -- Set Keystone Map: The Underrot
	166397, -- Set Keystone Map: Tol Dagor
	166398, -- Set Keystone Map: Waycrest Manor
	166399, -- Add Keystone Affix: Infested
	166525, -- Nightwreathed Egg
	166792, -- Taste of Victory
	166809, -- Challenge Card: Thog Hammerspace
	166810, -- Challenge Card: Antaen
	167017, -- Brinestone Shard
	167022, -- Challenge Card: Hyper Mega-Mecha Seagull x9000
	167024, -- Challenge Card: Spymaster
	167029, -- Challenge Card: Ouroboros
	167060, -- Chum
	167797, -- Jolt Jerky
	167799, -- Ironspine Protocol
	167800, -- Charged Sparkstone
	167801, -- Voltweave Fez
	167848, -- Island Expedition Bracers
	167850, -- Island Expedition Boots
	167851, -- Island Expedition Gloves
	167853, -- Island Expedition Legwear
	167855, -- Island Expedition Belt
	167858, -- Island Expedition Cloak
	167891, -- Ensemble: Brawler's Garb
	167892, -- Ensemble: Brawler's Garb
	167893, -- Prismatic Crystal
	168003, -- Unstable Manapearl
	168035, -- Mawrat Harness
	168058, -- Ensemble: Tranquil Spiritbind Regalia
	168059, -- Ensemble: Restless Dreambound Battlegear
	168060, -- Ensemble: Chainmail of the Timeless Hunt
	168061, -- Ensemble: Amaranthine Path Armor
	168098, -- Hati Wipe
	168099, -- Deepcoral Pod
	168124, -- Cache of War Resources
	168263, -- Mundane Recycling Requisition
	168328, -- Hardened Azerite Formation
	168394, -- Box of Assorted Parts
	168399, -- Fetish of the Dark Caverns
	168400, -- Null Force Containment Unit
	168436, -- Focused Star Point
	168439, -- Swirling Star Dust
	168440, -- Gleaming Star Shard
	168442, -- Roiling Blood of the Vanquished
	168443, -- Agitated Blood of the Dominated
	168444, -- Churning Blood of the Conquered
	168536, -- Recrystallizing Azerite Formation
	168537, -- Tempered Azerite Formation
	168543, -- Add Keystone Affix: Reaping
	168558, -- Fetish of the Deep Dungeons
	168559, -- Fetish of the Hidden Labyrinths
	168560, -- Fetish of the Gilded Catacombs
	168566, -- Null Force Cooling Unit
	168568, -- Null Force Nullifier
	168569, -- Null Force Visualizer
	168573, -- Death-Resistant Leaf
	168574, -- Petrified Living Bark
	168575, -- Branch of Rejuvenating Rings
	168576, -- Roots of Magnificent Revival
	168578, -- Sphere of Suppressed Force
	168579, -- Sphere of Unrestrained Fury
	168580, -- Sphere of Leeched Mobility
	168581, -- Sphere of Incandescent Neutralization
	168612, -- Dreamglow Dragonscale
	168613, -- Tempered Scale of the Scarlet Broodmother
	168614, -- Charged Scale of the Blue Aspect
	168615, -- Volatile Worldvein
	168616, -- Stalwart Worldvein
	168617, -- Fluctuating Worldvein
	168618, -- Brilliant Worldvein
	168620, -- Converging Lens of the Focusing Iris
	168621, -- Magnifying Lens of the Focusing Iris
	168622, -- Stabilizing Lens of the Focusing Iris
	168623, -- Biconcavic Lens of the Focusing Iris
	168814, -- Animated Blood of the Decimated
	168816, -- Pulsing Star Heart
	168837, -- Depth Forged Aegis
	168838, -- Enduring Bulwark of the Depths
	168839, -- Regenerating Barrier of the Depths
	168840, -- Resplendent Bastion of the Depths
	168842, -- Engine of Mecha-Perfection
	168843, -- Perfectly Timed Differential
	168844, -- Perfection-Enhancing Gearbox
	168845, -- Mecha-Perfection Turbo
	168846, -- Pearl of Lucid Dreams
	168847, -- Pearl of Manifest Ambitions
	168848, -- Pearl of Perspicuous Intentions
	168849, -- Pearl of Luminous Designs
	168850, -- Time-Lost Battlefield Memento
	168851, -- Enduring Battlefield Memento
	168852, -- Stalwart Battlefield Memento
	168853, -- Glinting Battlefield Memento
	168854, -- Animated Elemental Heart
	168855, -- Pulsing Elemental Heart
	168856, -- Resonating Elemental Heart
	168857, -- Sparkling Elemental Heart
	168858, -- Titan Purification Protocols
	168859, -- Targeted Purification Protocols
	168860, -- Enhanced Purification Protocols
	168861, -- Ultimate Purification Protocols
	168863, -- Unbound Azerite Slivershards
	168864, -- Sharpened Azerite Slivershards
	168865, -- Polarized Azerite Slivershards
	168866, -- Incandescent Azerite Slivershards
	168920, -- Azerite-Encrusted Timequartz
	168921, -- Azerite-Infused Timequartz
	168922, -- Azerite-Fueled Timequartz
	168923, -- Unburdened Azerite Timequartz
	168924, -- Bursting Seed of Life
	168925, -- Replicating Seed of Abundance
	168926, -- Lingering Seed of Renewal
	168927, -- Seed of Vibrant Blooms
	168928, -- Tablet of the Balancing Tides
	168929, -- Codex of the Never-Ending Tides
	168930, -- Tome of the Quickening Tides
	168931, -- Vellum of Illuminating Tides
	168932, -- Reactive Existence Battery
	168933, -- Enhanced Existence Capacitor
	168934, -- Calibrated Existence Gauge
	168935, -- Existence Vibrancy Display
	168936, -- Ward of Unwavering Hope
	168937, -- Ward of Reciprocation
	168938, -- Ward of Mutual Aid
	168940, -- Ward of Unimaginable Brilliance
	168941, -- Vitality Redistribution Lattice
	168942, -- Mesh of Expanding Vitality
	168943, -- Grid of Bursting Vitality
	169152, -- Empty Beehive
	169303, -- Hell-Bent Bracers
	169445, -- Dredged Leather Bladder
	169456, -- Seabreeze Saddle Blanket
	169490, -- Relic of the Black Empire
	169590, -- Burgeoning Battlefield Furor
	169614, -- Call to Arms Distinction
	169666, -- Unopened Stratholme Supply Crate
	169687, -- Fragment of Zem'lan's Lost Treasure Map
	169860, -- Tiny Dapper Hat
	169899, -- Polished Skull Trophy
	169900, -- Rib-Bone Choker of Dominance
	169901, -- Etched Bone Trophy of the Vanquished
	169902, -- Finger-Bone Trophy of Battle
	169903, -- Nazjatar Survival Pack
	169904, -- Ankoan Commendation Crate
	169905, -- Faintly Glowing Supplies
	169908, -- Cleverly Concealed Supplies
	169909, -- Poen's Neat Things
	169910, -- Vim's Scavenged Supplies
	169911, -- Liberated Naga Cache
	169914, -- Neri's Smart Supplies
	169915, -- Poen's Stashed Supplies
	169916, -- Brew-Soaked Supplies
	169917, -- Mysterious Azshari Chest
	169919, -- Unshackled Commendation Crate
	169920, -- Neri's Spare Supplies
	169921, -- Spine Guarded Supplies
	169922, -- Vim's Gift of Appreciation
	169941, -- Ceremonial Ankoan Scabbard
	169942, -- Vibrant Sea Blossom
	169943, -- Little Princess Cap
	169944, -- Minuscule Fez
	169945, -- Naga Deployment Orders
	170079, -- Abyssal Conch
	170081, -- Abyssal Conch
	170085, -- Naga Deployment Orders
	170260, -- Funeral Prayer Beads
	170261, -- Tome of Natural Balance
	170263, -- Watertight Kafa-Flask
	170264, -- Seasbane Spyglass
	170265, -- Enhanced Mining Drill
	170266, -- Fight-or-Flight Amplifier
	170267, -- Bloodscent Muscle Infuser
	170268, -- Primal Lightstone
	170269, -- Elemental Chargestone
	170272, -- War-Torn Memento
	170498, -- Deadsoul Hound Harness
	170499, -- Maw Seeker Harness
	171364, -- Darkmoon Top Hat
	172015, -- Celebration Package
	172017, -- Sharpened Pin
	172018, -- Red Anniversary Balloons
	172019, -- Blue Anniversary Balloons
	172021, -- Marks of Sanctification Purse
	172204, -- Add Keystone Affix: Beguiling
	172496, -- Conduit Keystone
	173000, -- High Inquisitor Gabi's Sinstone
	173001, -- High Inquisitor Radu's Sinstone
	173005, -- High Inquisitor Magda's Sinstone
	173006, -- High Inquisitor Dacian's Sinstone
	173040, -- Silvergill Pike Bait
	173041, -- Pocked Bonefish Bait
	173042, -- Spinefin Piranha Bait
	173043, -- Elysian Thade Bait
	173063, -- [DNT] REUSE ME
	173064, -- [DNT] REUSE ME
	173280, -- Token of Death's Door
	173281, -- Token of Death's Mark
	173282, -- Token of Death's Glee
	173283, -- Token of a Brilliant Death
	173288, -- Overflowing Azerite Geode
	173289, -- Pulsing Azerite Geode
	173290, -- Quickening Azerite Geode
	173291, -- Luminous Azerite Geode
	173308, -- Mark of Boistrous Duty
	173309, -- Water Dancer's Technique
	173310, -- Manual of Unbalanced Tactics
	173311, -- Resplendent Warden's Badge
	173372, -- Cache of the Black Empire
	173736, -- Layered Information Kernel of E-steam
	173794, -- High Inquisitor Sinstone
	173883, -- Replicating Void Droplets
	173884, -- Burgeoning Void Droplet
	173885, -- Volatile Void Droplet
	173886, -- Bursting Void Droplet
	173947, -- Glittering Abyssal Conch
	173948, -- Glittering Abyssal Conch
	173990, -- Molten Cay Salvage
	173994, -- Un'gol Ruins Salvage
	173996, -- Verdant Wilds Salvage
	173997, -- Whispering Reef Salvage
	174007, -- Purifying Draught
	174039, -- Crate of Cursed Mementos
	174071, -- Sanguifang's Pulsating Canine
	174358, -- Unopened Blackrock Supply Crate
	174378, -- Mortegore Scroll
	174455, -- Add Keystone Affix: Awakened
	174464, -- Spectral Bridle
	174521, -- Transferable Kernel of E-steam
	174522, -- Waveswept Abyssal Conch
	174523, -- Waveswept Abyssal Conch
	174529, -- Crate of Coalescing Visions
	174663, -- Set Keystone Map: Operation: Mechagon - Junkyard
	174664, -- Set Keystone Map: Operation: Mechagon - Workshop
	174875, -- Obelisk of the Sun
	174932, -- Illusion: Void Edge
	174958, -- Cache of the Fallen Mogu
	174959, -- Cache of the Mantid Swarm
	174960, -- Cache of the Aqir Swarm
	174961, -- Cache of the Amathet
	175069, -- Theater Ticket
	176922, -- Wild Nightbloom
	177699, -- Greater Untamed Spirit
	177946, -- Desolate Leather Barding
	177955, -- Spoiled Contaminant
	177964, -- Enchant Weapon - Force Multiplier
	177965, -- Spoiled Contaminant
	177966, -- Spoiled Contaminant
	177967, -- Spoiled Contaminant
	177968, -- Spoiled Contaminant
	177969, -- Spoiled Contaminant
	177970, -- Spoiled Contaminant
	177971, -- Spoiled Contaminant
	177972, -- Spoiled Contaminant
	177973, -- Spoiled Contaminant
	177974, -- Spoiled Contaminant
	177975, -- Spoiled Contaminant
	177976, -- Spoiled Contaminant
	177977, -- Spoiled Contaminant
	177978, -- Spoiled Contaminant
	177979, -- Spoiled Contaminant
	177980, -- Spoiled Contaminant
	177981, -- Spoiled Contaminant
	177982, -- Spoiled Contaminant
	177983, -- Spoiled Contaminant
	177984, -- Spoiled Contaminant
	177985, -- Spoiled Contaminant
	177986, -- Spoiled Contaminant
	177987, -- Spoiled Contaminant
	177988, -- Spoiled Contaminant
	177989, -- Spoiled Contaminant
	177990, -- Spoiled Contaminant
	177991, -- Spoiled Contaminant
	177992, -- Spoiled Contaminant
	177993, -- Spoiled Contaminant
	177994, -- Spoiled Contaminant
	177995, -- Spoiled Contaminant
	177996, -- Spoiled Contaminant
	177997, -- Spoiled Contaminant
	177998, -- Spoiled Contaminant
	177999, -- Spoiled Contaminant
	178000, -- Spoiled Contaminant
	178001, -- Spoiled Contaminant
	178002, -- Spoiled Contaminant
	178003, -- Spoiled Contaminant
	178004, -- Spoiled Contaminant
	178005, -- Spoiled Contaminant
	178006, -- Spoiled Contaminant
	178007, -- Spoiled Contaminant
	178008, -- Spoiled Contaminant
	178009, -- Spoiled Contaminant
	178010, -- Spoiled Contaminant
	178011, -- Spoiled Contaminant
	178012, -- Spoiled Contaminant
	178013, -- Spoiled Contaminant
	178014, -- Spoiled Contaminant
	178015, -- Spoiled Contaminant
	178512, -- Celebration Package
	178590, -- Storied Maldraxxian Boneblade
	178591, -- Ancient Venthyr Relic
	178592, -- Venerable Kyrian Defender
	178593, -- Intricate Fae Groveweave
	178659, -- Abominable Backup
	178675, -- Dream Catcher
	178877, -- Greater Martial Spirit
	178880, -- Greater Dutiful Spirit
	178883, -- Greater Prideful Spirit
	178893, -- Decree: Baroness Vashj's Esteem
	178896, -- Stalwart Gloves of Resolve
	179380, -- Redelev Purse
	180128, -- Harvester's Elite Bounty Purse
	180292, -- Faerie Dust
	180454, -- Anti-Doom Broom
	180579, -- Herald's Footpads
	180677, -- Discarded Medal of Valor
	180682, -- Noble's Wardrobe
	180684, -- Sentinel Stonewing
	180686, -- \"Borrowed\" Soulstone
	180688, -- Infused Remnant of Light
	180690, -- Bottled Ash Cloud
	180694, -- Tome of Power
	180697, -- Wing Commander's Insignia
	180707, -- Sticky Muck
	180708, -- Mirror of Despair
	180713, -- Shrieker's Voicebox
	180718, -- Ordinary Crystal
	180735, -- Innert Accolade
	180769, -- Fractured Stonewing
	180786, -- Empty Binding
	180874, -- Gargon Whistle
	180950, -- The Maw - Pet Cosmetic - NYI
	180951, -- The Maw - POI Unlock - NYI
	180993, -- Bat Visage Bobber
	181298, -- Banewood Survival Kit
	181299, -- Wornthrough Bag
	181318, -- Enchanted Mirror Dust
	181337, -- Stonefiend's Wings
	181564, -- Decree: Mikanikos's Esteem
	181567, -- Decree: The Countess's Esteem
	181607, -- Decree: Lady Moonberry's Esteem
	181617, -- Command the Field
	181622, -- Slightly Irradiated Slime Sample
	181739, -- Bag of Soul Ash
	181771, -- Stonehead's Best Bud Bracelet
	181849, -- Set Keystone Map: The Necrotic Wake
	181850, -- Set Keystone Map: Plaguefall
	181851, -- Set Keystone Map: Mists of Tirna Scithe
	181852, -- Set Keystone Map: Halls of Atonement
	181853, -- Set Keystone Map: Spires of Ascension
	181854, -- Set Keystone Map: Theater of Pain
	181855, -- Set Keystone Map: De Other Side
	181856, -- Set Keystone Map: Sanguine Depths
	181868, -- Murder Vacation
	182188, -- Lesser Phial of Serenity
	182200, -- Engorged Blood Burrower
	183517, -- Page 76 of the Necronom-i-nom
	183520, -- Wild Nightbloom Seeds
	183803, -- Add Keystone Affix: Prideful
	183860, -- The Death March: An Introduction to Maldraxxi Etiquette
	183861, -- The Winter Cycle: A Collection of Ardenweald Etiquettes and Parables
	183862, -- A Proper Soiree: A detailed account of Venthyr Etiquette by Theotar
	183863, -- The Proper Path and Etiquette for Aspirants
	183883, -- Bulging Collection of Random Bits
	183885, -- Sika's Spare Ore Pouch
	183947, -- Add Keystone Affix: Storming
	183948, -- Add Keystone Affix: Spiteful
	183949, -- Add Keystone Affix: Inspiring
	184103, -- Cracked Blight-Touched Egg
	184119, -- Spare Heart
	184121, -- Spare Eye
	184122, -- Spare Foot
	184124, -- Spare Stomach
	184395, -- Fallen Adventurer's Cache
	184606, -- Tighter Stitching
	185717, -- Slumbering Spirit
	185764, -- Tome of Town Portal
	185765, -- Shipment of Heavy Callous Hide
	185832, -- Shipment of Elethium Ore
	185833, -- Shipment of Lightless Silk
	185834, -- Orboreal Distinguishment
	185909, -- Dull Opal
	185932, -- Damaged Flask
	185933, -- Cheap Spices
	185934, -- Cracked Warhammer
	185935, -- Dusty Skull
	185936, -- Common Drum
	185937, -- Stale Bread
	185938, -- Threadbare Cloth
	185939, -- Worn Journal
	185990, -- Harvester's War Chest
	185991, -- War Chest of the Wild Hunt
	185992, -- War Chest of the Undying Army
	185993, -- Ascended War Chest
	186189, -- Cache of Armaments
	186525, -- The Mad Duke's Tea
	186526, -- The Mad Duke's Tea of Haste
	186527, -- The Mad Duke's Tea of Precision
	186528, -- The Mad Duke's Tea of Versatility
	186605, -- Nilganihmaht's Runed Band
	186606, -- Nilganihmaht's Signet Ring
	186607, -- Nilganihmaht's Silver Ring
	186686, -- Pallid Oracle Bones
	186975, -- Shrouded Hand Towel
	187186, -- Orb of Deception
	187220, -- Coalesced Power
	187234, -- Coalesced Power
	187551, -- Small Korthian Supply Chest
	187603, -- The Mad Duke's Tea
	187610, -- Court of Farondis Insignia
	187709, -- Celebration Package
	187712, -- Precursor Placoderm Bait
	187820, -- Piece of Goop
	187917, -- The Mad Duke's Tea
	188949, -- Mysterious Object
	188950, -- Mysterious Object
	188951, -- Key
	189524, -- Set Keystone Level: 31
	189525, -- Set Keystone Level: 32
	189526, -- Set Keystone Level: 33
	189527, -- Set Keystone Level: 34
	189528, -- Set Keystone Level: 35
	189534, -- Add Keystone Affix: Infernal
	189545, -- Set Keystone Map: Tazavesh: Streets of Wonder
	189546, -- Set Keystone Map: Tazavesh: So'leah's Gambit
	189561, -- Tame Prime: Orixal
	189572, -- Tame Prime: Hadeon the Stonebreaker
	189573, -- Tame Prime: Garudeon
	190540, -- Ensemble: Trapper's Munitions
	190799, -- Ensemble: Swashbuckling Buccaneer's Slops
	190923, -- Ensemble: Dashing Buccaneer's Slops
	190938, -- Add Keystone Affix: Encrypted
	191087, -- Treasure Map: Ohn'ahran Plains
	193263, -- Add Keystone Affix: Shrouded
	193264, -- Set Keystone Map: Iron Docks
	193265, -- Set Keystone Map: Grimrail Depot
	193849, -- Emptied Satchel
	193860, -- Snapped Wand
	193893, -- Scalebelly Mackerel Lure
	193894, -- Thousandbite Piranha Lure
	193895, -- Temporal Dragonhead Lure
	193896, -- Cerulean Spinefish Lure
	194023, -- Treasure Map: The Waking Shores
	194026, -- Treasure Map: The Azure Span
	194029, -- Treasure Map: Thaldraszus
	194083, -- Crushed Stone
	194721, -- Cracked Hourglass
	194742, -- Worn Book
	194885, -- Ohuna Perch
	194886, -- Tazenrath's Torn Wing
	194889, -- XD-57 \"Bullseye\" Guided Rocket Kit
	194890, -- GG-117 Micro-Jetpack
	195542, -- Slumber Incense
	195572, -- Empty Elixir
	197738, -- Flameslinger Rum
	197739, -- Happy Trigger Sour
	198047, -- Kul Tiran Red
	198172, -- Bundle of Fireworks
	198222, -- Blue Fireflight
	198223, -- Red Fireflight
	198224, -- Green Fireflight
	198247, -- Neural Silencer Mk3
	198401, -- Aileron Seamoth Lure
	198479, -- Gale Rider
	198486, -- Windscale Rider
	198549, -- Black Fireflight
	198550, -- Bronze Fireflight
	198775, -- Ensemble: Renowned Expeditioner's Cloth Armor
	198776, -- Ensemble: Renowned Expeditioner's Leather Armor
	198777, -- Ensemble: Renowned Expeditioner's Mail Armor
	198778, -- Ensemble: Renowned Expeditioner's Plate Armor
	198790, -- I.O.U.
	199215, -- Worldbreaker Membership
	199752, -- Ensemble: Crimson Valdrakken Clothing
	199753, -- Ensemble: Black Valdrakken Clothing
	199754, -- Ensemble: Azure Valdrakken Clothing
	199755, -- Ensemble: Green Valdrakken Clothing
	199756, -- Ensemble: Bronze Valdrakken Clothing
	199830, -- Tuskarr Training Dummy
	199877, -- Ensemble: Tuskarr Trader's Leather Armor
	200221, -- Gorloc Crystals
	200222, -- White Bell Pigment
	200476, -- Fallingwater Overlook VIP Entry Pass
	200553, -- Panthis Nectar
	200554, -- Dropcap Head
	200555, -- Inferno Seeds
	200588, -- Meaty Stem
	200589, -- Hydro Life Seed
	200655, -- Set Keystone Level: 36
	200656, -- Set Keystone Level: 37
	200657, -- Set Keystone Level: 38
	200658, -- Set Keystone Level: 39
	200659, -- Set Keystone Level: 40
	200685, -- Enchanted Compass
	200690, -- Ritherem Petals
	200691, -- Claw Thistle Barbs
	200692, -- Gift of the Grove
	200693, -- Terata Leaves
	200694, -- River Bell Bulbs
	200695, -- Fangtooth Petals
	200696, -- Winter Berries
	200697, -- Blightshroom
	200698, -- Ley Orb
	200699, -- Milkweed Fibers
	200700, -- Cuppressa Berries
	200701, -- Titian Extract
	200702, -- Magenta Titian Extract
	200703, -- Vine Flower Fibers
	200704, -- Gratona Seed
	200705, -- Thaldraszus Root
	200883, -- Illusion: Primal Air
	200905, -- Illusion: Primal Earth
	200906, -- Illusion: Primal Fire
	200907, -- Illusion: Primal Frost
	200925, -- Ensemble: Solemn Watchman's Garb
	200929, -- Everglow Nectar
	201092, -- Lava Spices
	201254, -- Cracked Medal of Honor
	201255, -- Cracked Medal of Honor
	201325, -- Draconic Augment Rune
	201328, -- Set Keystone Map: Upper Blackrock Spire
	201329, -- Set Keystone Map: The Everbloom
	201330, -- Set Keystone Map: Shadowmoon Burial Grounds
	201331, -- Set Keystone Map: Auchindoun
	201332, -- Set Keystone Map: Bloodmaul Slag Mines
	201333, -- Set Keystone Map: Skyreach
	201334, -- Set Keystone Map: Temple of the Jade Serpent
	201335, -- Set Keystone Map: Stormstout Brewery
	201336, -- Set Keystone Map: Gate of the Setting Sun
	201337, -- Set Keystone Map: Shado-Pan Monastery
	201338, -- Set Keystone Map: Siege of Niuzao Temple
	201339, -- Set Keystone Map: Mogu'shan Palace
	201340, -- Set Keystone Map: Scholomance
	201341, -- Set Keystone Map: Scarlet Halls
	201342, -- Set Keystone Map: Scarlet Monastery
	201344, -- Set Keystone Map: Algeth'ar Academy
	201345, -- Set Keystone Map: Halls of Infusion
	201346, -- Set Keystone Map: Brackenhide Hollow
	201347, -- Set Keystone Map: The Azure Vault
	201348, -- Set Keystone Map: The Nokhud Offensive
	201349, -- Set Keystone Map: Neltharus
	201350, -- Set Keystone Map: Ruby Life Pools
	201351, -- Set Keystone Map: Uldaman: Legacy of Tyr
	201791, -- How to Train a Dragonkin
	201815, -- Cloak of Many Faces
	201834, -- Add Keystone Affix: Thundering
	202207, -- Reusable Oversized Bobber
	202667, -- Sealed Artifact Scroll
	202668, -- Sealed Spirit Scroll
	202669, -- Sealed Fish Scroll
	202670, -- Sealed Knowledge Scroll
	203431, -- Ensemble: Burden of Unrelenting Justice
	203476, -- Primalist Cache
	203681, -- Stormed Primalist Cache
	204179, -- Cracked Medal of Honor
	204180, -- Cracked Medal of Honor
	204213, -- Short-Range Teleport
	204236, -- Sack of Stolen Dragon Glyphs
	204447, -- Ensemble: Black Dragonflight's Vestments
	204888, -- Ensemble: Waveborne Diplomat's Regalia
	204893, -- Three-Cheese Cake
	204992, -- Contract: Loamm Niffen
	204993, -- Contract: Loamm Niffen
	205289, -- Crimson Equipment Chest
	205363, -- Ensemble: Ornate Black Dragon Labwear
	205418, -- Blazing Shadowflame Cinder
	205933, -- Add Keystone Affix: Entangling
	205934, -- Add Keystone Affix: Afflicted
	205935, -- Add Keystone Affix: Incorporeal
	205958, -- Ensemble: Azure Renewal Finery
	205993, -- Set Keystone Map: The Vortex Pinnacle
	206009, -- Ouroboros Tablet
	206010, -- Designs of Flesh
	206011, -- Designs of Bone
	206012, -- Designs of Mind
	206013, -- Designs of Soul
	206014, -- Ouroboros Tablet
	206015, -- Ouroboros Tablet
	206016, -- Ouroboros Tablet
	206017, -- Ouroboros Tablet
	206021, -- Kob'rok's Luminescent Scale
	206158, -- Add Keystone Affix: Shielding
	206200, -- Obsidian Equipment Chest
	206270, -- Volcanic Equipment Chest
	206366, -- Cracked Trophy of Strife
	206367, -- Cracked Trophy of Strife
	206370, -- Blood of Innocents
	206670, -- Darkroot Grippers
	207002, -- Encapsulated Destiny
	207460, -- Dreadsquall Eggshell Fragment
	207591, -- Spare Harvest Torch
	208132, -- Stormwind Insignia
	208133, -- Orgrimmar Insignia
	208201, -- Paper Scraps
	208210, -- Celebration Package
	208415, -- Stasis Sand
	208475, -- Ensemble: Forsaken Champion's Attire
	208567, -- Cracked Medal of Conquest
	208879, -- Ensemble: Kaldorei Protector's Adornment
	209062, -- Ensemble: Chromatically Calibrated Holo-Gogs
	209063, -- Ensemble: Chromatically Calibrated Bio-Optic Killshades
	209064, -- Ensemble: Chromatically Calibrated Retinal Armor
	209066, -- Ensemble: Chromatically Calibrated Cranial Cannons
	209067, -- Ensemble: Chromatically Calibrated Ectoplasmic Specs
	209604, -- Ensemble: Raiment of Amirdrassil
	210024, -- Ensemble: Temporal Burdens
	210040, -- Set Keystone Map: Throne of the Tides
	210244, -- Contract: Dream Wardens
	210245, -- Contract: Dream Wardens
	210246, -- Contract: Dream Wardens
	210324, -- Cracked Medal of Honor
	210325, -- Cracked Medal of Honor
	210326, -- Cracked Medal of Conquest
	210550, -- Set Keystone Map: Dawn of the Infinite: Galakrond's Fall
	210551, -- Set Keystone Map: Dawn of the Infinite: Murozond's Rise
	210572, -- Verdant Equipment Chest
	210595, -- Dreaming Equipment Chest
	210695, -- Delightful Chocolate Sample
	210835, -- Empty Vial
	210836, -- Empty Vial
	210837, -- Empty Vial
	210838, -- Empty Vial
	210839, -- Empty Vial
	210840, -- Empty Vial
	210874, -- Filled Vial
	210875, -- Filled Vial
	210876, -- Filled Vial
	210877, -- Filled Vial
	210879, -- Filled Vial
	210880, -- Filled Vial
	210883, -- Ensemble: Scarlet Zealot's Trappings
	210977, -- Coalesced Moonlight
	210991, -- Small Box of Vials
	211122, -- Ensemble: Wastewander Tracker's Kit
	211126, -- Cracked Medal of Honor
	211165, -- Arsenal: Scalewarden's Gun
	211264, -- Rose of Romance
	211313, -- Ensemble: Heritage of the Draenei
	211351, -- Rose of Friendship
	211360, -- Rose of Purity
	211361, -- Rose of Joy
	211362, -- Rose of Independence
	211363, -- Rose of Dreams Fulfilled
	211364, -- Rose of Tragedy
	211446, -- Ensemble: Heritage of the Darkspear
	211770, -- Cracked Medal of Honor
	211771, -- Cracked Medal of Honor
	211772, -- Cracked Medal of Honor
	211773, -- Cracked Medal of Conquest
	212175, -- Draconic Commendation
	212554, -- Cracked Medal of Conquest
	213778, -- Forged Jeweler's Setting
	214240, -- Ensemble: Gleaming Burden of Unrelenting Justice
	214241, -- Ensemble: Moonlit Burden of Unrelenting Justice
	216708, -- Holy Candle
	217018, -- Draconic Equipment Chest
	217381, -- Ensemble: Fearless Buccaneer's Slops
	219009, -- Crystalline Creature Lure
	219010, -- Writhing Creature Lure
	219011, -- Sporefused Creature Lure
	219065, -- [DNT] Ensemble: CivilianScholar
	219066, -- [DNT] Ensemble: CivilianScholar
	219067, -- [DNT] Ensemble: CivilianScholar
	219068, -- [DNT] Ensemble: CivilianScholar
	219069, -- [DNT] Ensemble: CivilianScholar
	219070, -- [DNT] Ensemble: CivilianPeasant
	219071, -- [DNT] Ensemble: CivilianPeasant
	219072, -- [DNT] Ensemble: CivilianPeasant
	219073, -- [DNT] Ensemble: CivilianPeasant
	219074, -- [DNT] Ensemble: CivilianPeasant
	219075, -- [DNT] Ensemble: CivilianNoble
	219076, -- [DNT] Ensemble: CivilianNoble
	219077, -- [DNT] Ensemble: CivilianNoble
	219078, -- [DNT] Ensemble: CivilianNoble
	219079, -- [DNT] Ensemble: CivilianNoble
	219080, -- [DNT] Ensemble: CivilianMerchant
	219081, -- [DNT] Ensemble: CivilianMerchant
	219082, -- [DNT] Ensemble: CivilianMerchant
	219083, -- [DNT] Ensemble: CivilianMerchant
	219084, -- [DNT] Ensemble: CivilianMerchant
	219085, -- [DNT] Ensemble: CivilianLaborer
	219086, -- [DNT] Ensemble: CivilianLaborer
	219087, -- [DNT] Ensemble: CivilianLaborer
	219088, -- [DNT] Ensemble: CivilianLaborer
	219089, -- [DNT] Ensemble: CivilianLaborer
	219090, -- [DNT] Ensemble: CivilianCraftsperson
	219091, -- [DNT] Ensemble: CivilianCraftsperson
	219092, -- [DNT] Ensemble: CivilianCraftsperson
	219093, -- [DNT] Ensemble: CivilianCraftsperson
	219094, -- [DNT] Ensemble: CivilianCraftsperson
	219095, -- [DNT] Ensemble: CivilianAdventurer
	219096, -- [DNT] Ensemble: CivilianAdventurer
	219097, -- [DNT] Ensemble: CivilianAdventurer
	219098, -- [DNT] Ensemble: CivilianAdventurer
	219099, -- [DNT] Ensemble: CivilianAdventurer
	219100, -- Cardinal Educator's Knowledge
	219101, -- Lilac Educator's Knowledge
	219102, -- Leafy Educator's Knowledge
	219103, -- Cobalt Educator's Knowledge
	219104, -- Midnight Educator's Knowledge
	219105, -- Sandy Quotidian Wear
	219106, -- Maroon Quotidian Wear
	219107, -- Earthy Quotidian Wear
	219108, -- Umber Quotidian Wear
	219109, -- Taupe Quotidian Wear
	219110, -- Vermillion Patron's Elegance
	219111, -- Royal Patron's Elegance
	219112, -- Verdant Patron's Elegance
	219113, -- Celestial Patron's Elegance
	219114, -- Court Patron's Elegance
	219115, -- Versatile Peddler's Trinkets
	219116, -- Arcane Peddler's Trinkets
	219117, -- Curious Peddler's Trinkets
	219118, -- Peculiar Peddler's Trinkets
	219119, -- Occult Peddler's Trinkets
	219120, -- Toiler's Khaki Uniform
	219121, -- Toiler's Ochre Uniform
	219122, -- Toiler's Burgundy Uniform
	219123, -- Toiler's Beige Uniform
	219124, -- Toiler's Navy Uniform
	219125, -- Formed Artisan's Talent
	219126, -- Woven Artisan's Talent
	219127, -- Cast Artisan's Talent
	219128, -- Stained Artisan's Talent
	219129, -- Sooty Artisan's Talent
	219130, -- Saffron Cartographer's Orientation
	219131, -- Oceanic Cartographer's Orientation
	219132, -- Crimson Cartographer's Orientation
	219133, -- Deep Cartographer's Orientation
	219134, -- Mossy Cartographer's Orientation
	219139, -- Set Keystone Map: Priory of the Sacred Flame
	219140, -- Set Keystone Map: The Rookery
	219141, -- Set Keystone Map: City of Threads
	219142, -- Set Keystone Map: Ara-Kara, City of Echoes
	219143, -- Set Keystone Map: Darkflame Cleft
	219144, -- Set Keystone Map: The Dawnbreaker
	219145, -- Set Keystone Map: Cinderbrew Meadery
	219146, -- Set Keystone Map: Stonevault
	219148, -- Patrol Torch
	219390, -- Set Keystone Map: Grim Batol
	220378, -- Forged Equipment Chest
	220520, -- Radiant Echo
	221502, -- Adventurer's Warbound Battlegear Drop
	221812, -- Player Experience
	222597, -- Contract: Council of Dornogal
	222598, -- Contract: Council of Dornogal
	222599, -- Contract: Council of Dornogal
	222600, -- Contract: Assembly of the Deeps
	222601, -- Contract: Assembly of the Deeps
	222602, -- Contract: Assembly of the Deeps
	222603, -- Contract: Hallowfall Arathi
	222604, -- Contract: Hallowfall Arathi
	222605, -- Contract: Hallowfall Arathi
	222606, -- Contract: The Severed Threads
	222607, -- Contract: The Severed Threads
	222608, -- Contract: The Severed Threads
	222917, -- Player Experience
	223475, -- Set Keystone Level: 2
	223476, -- Set Keystone Level: 3
	223477, -- Set Keystone Level: 4
	223478, -- Set Keystone Level: 5
	223479, -- Set Keystone Level: 6
	223480, -- Set Keystone Level: 7
	223481, -- Set Keystone Level: 8
	223482, -- Set Keystone Level: 9
	223641, -- Essence of Northrend
	223642, -- Memory of Northrend
	223643, -- Essence of Kalimdor
	223644, -- Memory of Kalimdor
	223645, -- Essence of the Eastern Kingdoms
	223646, -- Memory of the Eastern Kingdoms
	223647, -- Lifeless Stone Ring
	224292, -- Radiant Fuel Shard
	224300, -- Gleeful Glamour - Blood Elf
	224301, -- Gleeful Glamour - Dark Iron Dwarf
	224302, -- Gleeful Glamour - Draenei
	224304, -- Gleeful Glamour - Earthen
	224305, -- Gleeful Glamour - Gnome
	224306, -- Gleeful Glamour - Goblin
	224307, -- Gleeful Glamour - Highmountain Tauren
	224308, -- Gleeful Glamour - Human
	224309, -- Gleeful Glamour - Kul Tiran
	224311, -- Gleeful Glamour - Mag'har Orc
	224312, -- Gleeful Glamour - Mechagnome
	224313, -- Gleeful Glamour - Night Elf
	224314, -- Gleeful Glamour - Nightborne
	224315, -- Gleeful Glamour - Orc
	224316, -- Gleeful Glamour - Pandaren
	224317, -- Gleeful Glamour - Tauren
	224318, -- Gleeful Glamour - Troll
	224319, -- Gleeful Glamour - Undead
	224320, -- Gleeful Glamour - Void Elf
	224321, -- Gleeful Glamour - Vulpera
	224322, -- Gleeful Glamour - Worgen
	224323, -- Gleeful Glamour - Zandalari Troll
	224324, -- Gleeful Glamour - Blood Elf
	224325, -- Gleeful Glamour - Dark Iron Dwarf
	224326, -- Gleeful Glamour - Draenei
	224327, -- Gleeful Glamour - Dwarf
	224328, -- Gleeful Glamour - Earthen
	224329, -- Gleeful Glamour - Gnome
	224330, -- Gleeful Glamour - Goblin
	224331, -- Gleeful Glamour - Highmountain Tauren
	224332, -- Gleeful Glamour - Human
	224333, -- Gleeful Glamour - Kul Tiran
	224334, -- Gleeful Glamour - Lightforged Draenei
	224335, -- Gleeful Glamour - Mag'har Orc
	224336, -- Gleeful Glamour - Mechagnome
	224337, -- Gleeful Glamour - Night Elf
	224338, -- Gleeful Glamour - Nightborne
	224339, -- Gleeful Glamour - Orc
	224340, -- Gleeful Glamour - Pandaren
	224341, -- Gleeful Glamour - Tauren
	224342, -- Gleeful Glamour - Troll
	224343, -- Gleeful Glamour - Undead
	224344, -- Gleeful Glamour - Void Elf
	224345, -- Gleeful Glamour - Vulpera
	224346, -- Gleeful Glamour - Worgen
	224347, -- Gleeful Glamour - Zandalari Troll
	224348, -- Gleeful Glamour - Blood Elf
	224349, -- Gleeful Glamour - Dark Iron Dwarf
	224350, -- Gleeful Glamour - Draenei
	224351, -- Gleeful Glamour - Dwarf
	224352, -- Gleeful Glamour - Earthen
	224353, -- Gleeful Glamour - Gnome
	224354, -- Gleeful Glamour - Goblin
	224355, -- Gleeful Glamour - Highmountain Tauren
	224356, -- Gleeful Glamour - Human
	224357, -- Gleeful Glamour - Kul Tiran
	224358, -- Gleeful Glamour - Lightforged Draenei
	224359, -- Gleeful Glamour - Mag'har Orc
	224360, -- Gleeful Glamour - Mechagnome
	224361, -- Gleeful Glamour - Night Elf
	224362, -- Gleeful Glamour - Nightborne
	224363, -- Gleeful Glamour - Orc
	224364, -- Gleeful Glamour - Pandaren
	224365, -- Gleeful Glamour - Tauren
	224366, -- Gleeful Glamour - Troll
	224367, -- Gleeful Glamour - Undead
	224368, -- Gleeful Glamour - Void Elf
	224369, -- Gleeful Glamour - Vulpera
	224370, -- Gleeful Glamour - Worgen
	224371, -- Gleeful Glamour - Zandalari Troll
	224411, -- Companion Experience
	224557, -- Field Medic's Hazard Payout
	224558, -- Commendation of the Brood of Nozdormu
	224559, -- Commendation of the Silverwing Sentinels
	224560, -- Commendation of the Warsong Outriders
	224561, -- Commendation of the Hydraxian Waterlords
	224562, -- Commendation of the Stormpike Guard
	224563, -- Commendation of the Frostwolf Clan
	224564, -- Commendation of the Ravasaur Trainers
	224565, -- Commendation of the Wintersaber Trainers
	224566, -- Commendation of the Timbermaw Hold
	224567, -- Commendation of the Argent Dawn
	224568, -- Commendation of the League of Arathor
	224569, -- Commendation of the Defilers
	224570, -- Commendation of the Zandalar Tribe
	224571, -- Commendation of the Thorium Brotherhood
	224572, -- Crystallized Augment Rune
	224580, -- Massive Sapphire Chunk
	224814, -- Adventurer's Warbound Boots
	224839, -- Adventurer's Warbound Wrists
	224840, -- Adventurer's Warbound Waist
	224841, -- Adventurer's Warbound Shoulders
	224842, -- Adventurer's Warbound Legs
	224843, -- Adventurer's Warbound Headpiece
	224844, -- Adventurer's Warbound Gloves
	224845, -- Adventurer's Warbound Chestpiece
	225335, -- Smuggler's Key
	225493, -- Cracked Medal of Conquest
	225739, -- Algari Distinguishment
	225930, -- Glimmering Crystal
	226037, -- Timeless Neural Silencer
	226147, -- Old Bunch of Brave Rocks
	226152, -- Wax-sealed Crests
	226508, -- Vizier's Influence
	226509, -- General's Insight
	226510, -- Weaver's Facade
	226520, -- Queen's Pheromone
	226524, -- Partially-Charged Hologem
	227668, -- Delver's Bounty
	227675, -- Satchel of Surplus Herbs
	227676, -- Satchel of Surplus Ore
	227681, -- Satchel of Surplus Leather
	227682, -- Satchel of Surplus Cloth
	227778, -- Delver's Bounty
	227779, -- Delver's Bounty
	227780, -- Delver's Bounty
	227781, -- Delver's Bounty
	227782, -- Delver's Bounty
	227783, -- Delver's Bounty
	227784, -- Delver's Bounty
	228072, -- Chunk of Companion Experience
	228337, -- Satchel of Surplus Dust
	228417, -- Emergency Healthstone
	228949, -- Rumor Map
	228950, -- Rumor Map Bundle
	228958, -- Radiant Echo
	229059, -- Arsenal: Crests of the Kingdom
	229193, -- Queen's Pheromone
	229194, -- Queen's Pheromone
	229195, -- Queen's Pheromone
	229351, -- Spiritual Incense
	229354, -- Algari Adventurer's Cache
	229370, -- Companion Experience
	229375, -- Neural Enlarger
	229822, -- Arsenal: Golden Crests of the Kingdom
	229828, -- 20th Anniversary Balloon Chest
	230202, -- Add Keystone Affix: Xal'atath's Bargain: Ascendant
	230204, -- Add Keystone Affix: Xal'atath's Bargain: Voidbound
	230205, -- Add Keystone Affix: Xal'atath's Bargain: Oblivion
	230206, -- Add Keystone Affix: Xal'atath's Bargain: Devour
	230208, -- Add Keystone Affix: Xal'atath's Guile
	230209, -- Add Keystone Affix: Challenger's Peril
	230425, -- Prized Jeweler's Setting
	230724, -- Astral Jeweler's Setting
	230869, -- Ensemble: Crimson Aspirant's Cloth Armor
	230870, -- Ensemble: Crimson Aspirant's Leather Armor
	230871, -- Ensemble: Crimson Aspirant's Mail Armor
	230872, -- Ensemble: Crimson Aspirant's Plate Armor
	230899, -- Arsenal: Crimson Aspirant's Weapons
	230951, -- Ensemble: Obsidian Aspirant's Cloth Armor
	230952, -- Ensemble: Obsidian Aspirant's Leather Armor
	230953, -- Ensemble: Obsidian Aspirant's Mail Armor
	230954, -- Ensemble: Obsidian Aspirant's Plate Armor
	230981, -- Arsenal: Obsidian Aspirant's Weapons
	230990, -- Set Keystone Map: Operation: Floodgate
	231120, -- Ensemble: Verdant Aspirant's Cloth Armor
	231121, -- Ensemble: Verdant Aspirant's Leather Armor
	231122, -- Ensemble: Verdant Aspirant's Mail Armor
	231123, -- Ensemble: Verdant Aspirant's Plate Armor
	231150, -- Arsenal: Verdant Aspirant's Weapons
	232046, -- Chunk of Companion Experience
	232049, -- Companion Experience
	232318, -- Ensemble: Shadowmoon Warlock's Vestments
	232319, -- Ensemble: Auchenai Priest's Raiment
	232320, -- Ensemble: Telhamat Anchorite's Raiment
	232321, -- Ensemble: Boulderfist Mystic's Battlegear
	232322, -- Ensemble: Cenarion Mender's Battlegear
	232371, -- Companion Experience
	232377, -- Pappy Thunderbrew's Cough Syrup
	232532, -- Contract: The Cartels of Undermine
	232533, -- Contract: The Cartels of Undermine
	232534, -- Contract: The Cartels of Undermine
	232569, -- Cyclonic Runekey
	232570, -- Turbulent Runekey
	232571, -- Whirling Runekey
	232572, -- Torrential Runekey
	232573, -- Thunderous Runekey
	232575, -- Tome of Town Portal
	232664, -- Ensemble: Forged Aspirant's Cloth Armor
	232665, -- Ensemble: Forged Aspirant's Leather Armor
	232666, -- Ensemble: Forged Aspirant's Mail Armor
	232667, -- Ensemble: Forged Aspirant's Plate Armor
	232695, -- Ensemble: Prized Aspirant's Cloth Armor
	232696, -- Ensemble: Prized Aspirant's Leather Armor
	232697, -- Ensemble: Prized Aspirant's Mail Armor
	232698, -- Ensemble: Prized Aspirant's Plate Armor
	232790, -- Cracked Medal of Conquest
	232791, -- Cracked Medal of Conquest
	232808, -- Ensemble: Astral Aspirant's Cloth Armor
	232809, -- Ensemble: Astral Aspirant's Leather Armor
	232810, -- Ensemble: Astral Aspirant's Mail Armor
	232811, -- Ensemble: Astral Aspirant's Plate Armor
	232864, -- Arsenal: Forged Aspirant's Weapons
	232867, -- Arsenal: Prized Aspirant's Weapons
	232870, -- Arsenal: Astral Aspirant's Weapons
	233071, -- Delver's Bounty
	233186, -- Wave Scrambler 2000
	233792, -- Delver's Disguise
	234287, -- Radiant Focus
	234313, -- [DNT] Item
	234466, -- Tattered Arathi Prayer Scroll
	234470, -- Forgemaster's Focus
	234471, -- Earthen Device
	234472, -- Earthen Crystal
	234473, -- Soweezi's Comfy Lawn Chair
	234526, -- Archivist's Codex
	234527, -- Sacredite's Ledger
	234855, -- Ensemble: Vestments of the Twisted Grove
	234856, -- Ensemble: Twilight Zealot's Battleplate
	234857, -- Ensemble: Twilight Hunter's Guise
	234859, -- Ensemble: Twilight Acolyte's Regalia
	234947, -- Ensemble: Drake Hunter's Kit
	234948, -- Ensemble: Drekirjar Warrior's Battlegear
	235037, -- Crumpled Schematic: Wormhole Generator: Undermine
	235038, -- Crumpled Schematic
	235050, -- Desk-in-a-Box
	235217, -- Ensemble: Ornaments of the Pearlescent Monarch
	235227, -- Ensemble: Ornaments of the Spring Butterfly
	235228, -- Ensemble: Ornaments of the Blood Monarch
	235274, -- Echo of N'zoth
	235284, -- Echo of N'zoth
	235285, -- Echo of N'zoth
	235503, -- Chunk of Companion Experience
	235593, -- Ensemble: Forest Dweller's Butterfly Attire
	235594, -- Ensemble: Forest Dweller's Blooming Attire
	235595, -- Ensemble: Forest Dweller's Rooted Attire
	235637, -- [NYI] Lockpick Power
	235644, -- Concealed Pistol
	235664, -- Ensemble: Topsy Turvy Mask Set
	235667, -- Add Keystone Affix: Xal'atath's Bargain: Pulsar
	235669, -- Steamwheedle Cartel Banner
	235670, -- Bilgewater Cartel Banner
	235671, -- Blackwater Cartel Banner
	235672, -- Venture Co. Banner
	235716, -- Ensemble: Cloak of Infinite Potential
	235818, -- Celestial Firework
	235896, -- Radiant Echo
	235897, -- Radiant Echo
	236332, -- Suntouched Special Reserve
	236959, -- Empty Mysterious Potion
	237102, -- Slickest in Town's Attire
	237112, -- Craftiest in Town's Attire
	237122, -- Toughest in Town's Attire
	237276, -- Refurbished Rocket Glider
	237314, -- Fighting Guide: Unarmed Combat
	237315, -- Fighting Guide: Armed Combat
	237316, -- Injury Guide: Stunned
	237317, -- Injury Guide: Play Dead
	237318, -- Injury Guide: Knockdown
	237319, -- Fighting Guide: Magical Combat
	237320, -- Fighting Guide: Grappling Combat
	237321, -- Scoring Guide: Start Counter
	237322, -- Scoring Guide: Remove Point
	237323, -- Scoring Guide: Add Point
	237330, -- Disposable Hamburger
	237331, -- Disposable Hotdog
	237332, -- Single-Use Grill
	237333, -- Undermine Crate
	237334, -- Half-Eaten Takeout
	237335, -- Collectible Pineappletini Mug
	237345, -- Limited Edition Rocket Bobber
	237346, -- Artisan Beverage Goblet Bobber
	237347, -- Organically-Sourced Wellington Bobber
	237763, -- Felstone
	237764, -- Exquisite Painting
	237765, -- Heartstop Blade
	237766, -- Felwyrm Egg
	238418, -- Ensemble: Coldflame Battlegear
	238428, -- Ensemble: Lavaborn Emerald Attire
	238438, -- Ensemble: Lavaborn Battleplate
	238447, -- Ensemble: Lavaborn Citrine Attire
	238803, -- Commendation of the Order of Embers
	238804, -- Commendation of Proudmoore Admiralty
	238805, -- Commendation of Storm's Wake
	238806, -- Commendation of the 7th Legion
	238809, -- Commendation of the Waveblade Ankoan
	238816, -- Commendation of Talanji's Expedition
	238817, -- Commendation of the Voldunai
	238818, -- Commendation of the Zandalari Empire
	238819, -- Commendation of the Honorbound
	238820, -- Commendation of the Unshackled
	238821, -- Commendation of the Champions of Azeroth
	238822, -- Commendation of the Tortollan Seekers
	238823, -- Commendation of the Rustbolt Resistance
	238826, -- Commendation of the Rajani
	238827, -- Commendation of the Uldum Accord
	239440, -- Dastardly Prize Purse
	240199, -- Podium Upgrade: Scrappiest
	240200, -- Podium Upgrade: Longest Survival Run
	240201, -- Podium Upgrade: Longest Time in Spotlights
	240202, -- Podium Upgrade: Most Yards Traveled
	240203, -- Podium Upgrade: Scrappy
	240204, -- Podium Upgrade: Survival Run
	240205, -- Podium Upgrade: Time in Spotlights
	240206, -- Podium Upgrade: Yards Traveled
	241141, -- Monologuer's Chalice
	242344, -- Ensemble: Squall Braced Attire
	242345, -- Ensemble: Girded Mist Attire
	242346, -- Ensemble: Rainy Day Attire
	242347, -- Ensemble: Waterproof Attire
	242503, -- Memento of Epoch Stories
	242506, -- Memento of Epoch Rituals
	242507, -- Memento of Epoch Power
	242509, -- Memento of Epoch Curiosity
	242510, -- Memento of Epoch Kindness
	242511, -- Memento of Epoch Nostalgia
	242512, -- Memento of Epoch Creatures
	242513, -- Memento of Epoch Collections
	242514, -- Memento of Epoch Fun
	242515, -- Memento of Epoch Strategies
	242711, -- Pungent Truffle
	243773, -- Gleeful Glamour - Blood Elf
	243774, -- Gleeful Glamour - Dark Iron Dwarf
	243775, -- Gleeful Glamour - Draenei
	243776, -- Gleeful Glamour - Dwarf
	243777, -- Gleeful Glamour - Earthen
	243778, -- Gleeful Glamour - Gnome
	243779, -- Gleeful Glamour - Goblin
	243780, -- Gleeful Glamour - Highmountain Tauren
	243781, -- Gleeful Glamour - Human
	243782, -- Gleeful Glamour - Kul Tiran
	243783, -- Gleeful Glamour - Lightforged Draenei
	243784, -- Gleeful Glamour - Mag'har Orc
	243785, -- Gleeful Glamour - Mechagnome
	243786, -- Gleeful Glamour - Night Elf
	243787, -- Gleeful Glamour - Nightborne
	243788, -- Gleeful Glamour - Orc
	243789, -- Gleeful Glamour - Pandaren
	243790, -- Gleeful Glamour - Tauren
	243791, -- Gleeful Glamour - Troll
	243792, -- Gleeful Glamour - Undead
	243793, -- Gleeful Glamour - Void Elf
	243794, -- Gleeful Glamour - Vulpera
	243795, -- Gleeful Glamour - Worgen
	243796, -- Gleeful Glamour - Zandalari Troll
	243797, -- Gleeful Glamour - Blood Elf
	243798, -- Gleeful Glamour - Dark Iron Dwarf
	243799, -- Gleeful Glamour - Draenei
	243800, -- Gleeful Glamour - Dwarf
	243801, -- Gleeful Glamour - Earthen
	243802, -- Gleeful Glamour - Gnome
	243803, -- Gleeful Glamour - Goblin
	243804, -- Gleeful Glamour - Highmountain Tauren
	243805, -- Gleeful Glamour - Human
	243806, -- Gleeful Glamour - Kul Tiran
	243807, -- Gleeful Glamour - Lightforged Draenei
	243808, -- Gleeful Glamour - Mag'har Orc
	243809, -- Gleeful Glamour - Mechagnome
	243810, -- Gleeful Glamour - Night Elf
	243811, -- Gleeful Glamour - Nightborne
	243812, -- Gleeful Glamour - Orc
	243813, -- Gleeful Glamour - Pandaren
	243814, -- Gleeful Glamour - Tauren
	243815, -- Gleeful Glamour - Troll
	243816, -- Gleeful Glamour - Undead
	243817, -- Gleeful Glamour - Void Elf
	243818, -- Gleeful Glamour - Vulpera
	243819, -- Gleeful Glamour - Worgen
	243820, -- Gleeful Glamour - Zandalari Troll
	243821, -- Contract: The K'aresh Trust
	243822, -- Contract: The K'aresh Trust
	243823, -- Contract: The K'aresh Trust
	244056, -- Gleeful Glamour - Haranir
	244057, -- Gleeful Glamour - Haranir
	244145, -- Ensemble: Ashvane Smuggler's Attire
	244193, -- L00T RAID-R Mini
	244224, -- Ensemble: Bloodsail Smuggler's Attire
	244306, -- Ensemble: Golden Fleet's Sailing Garb
	244327, -- Ensemble: Zocalo Merchant's Wear
	244335, -- Old K'aresh Box of Valorstones
	244421, -- Set Keystone Map: Eco-Dome Al'dani
	244449, -- Set Keystone Map: Black Rook Hold
	244458, -- Add Keystone Affix: Sands of Time
	245693, -- K'areshi Ribbon Stash
	245793, -- Contract: The Singularity
	245794, -- Contract: The Singularity
	245795, -- Contract: The Hara'ti
	245796, -- Contract: The Hara'ti
	245797, -- Contract: The Amani Tribe
	245798, -- Contract: The Amani Tribe
	245799, -- Contract: The Silvermoon Court
	245800, -- Contract: The Silvermoon Court
	245885, -- Lil Wheel of Cheese
	246889, -- Orb of Synchronized Power
	246907, -- Broker Supply Crate
	246965, -- Ensemble: Felrider's Azure Attire
	246973, -- Ensemble: Fashion of the Fanatic Felcyclist
	246981, -- Ensemble: Felreaver's Hellfire Attire
	246989, -- Ensemble: Felreaver's Arcane Attire
	247835, -- Memory of Illidan
	247864, -- Memory of Arthas
	247865, -- Memory of Garrosh
	247866, -- Memory of Gul'dan
	247867, -- Memory of Suramar
	247869, -- Memory of Putricide
	247870, -- Memory of Saurfang
	247871, -- Memory of Sylvanas
	247872, -- Memory of Theotar
	247873, -- Memory of Thrall
	247906, -- Ensemble: The Horseman's Chilling Collection
	247973, -- Ensemble: The Horseman's Ghoulish Collection
	247982, -- Ensemble: The Horseman's Burning Collection
	247991, -- Ensemble: The Horseman's Hallowed Collection
	248017, -- Shrieking Quartz
	248142, -- Delver's Bounty
	248218, -- Arsenal: Weathered Twilight's Hammer Armaments
	248299, -- Ensemble: Bronzebeard's Ceremonial Collection
	248309, -- Ensemble: The Speaker's Ceremonial Collection
	248318, -- Ensemble: Wildhammer's Ceremonial Collection
	249438, -- Ensemble: Well-Worn Twilight Cultist's Attire
	249700, -- Deal: Cartel Zo
	249702, -- Deal: Cartel Ba
	249704, -- Deal: Cartel Om
	249706, -- Gleeful Glamour - Ethereal
	249707, -- Gleeful Glamour - Ethereal
	249708, -- Gleeful Glamour - Ethereal
	249736, -- Ensemble: The Noble's Winter Collection
	249745, -- Ensemble: The Seafarer's Winter Collection
	249754, -- Ensemble: The Drustvar Winter Collection
	249763, -- Ensemble: Void-Touched Winter Collection
	249917, -- Ensemble: Villager's Forest Attire
	249932, -- Ensemble: Villager's Seaside Attire
	249939, -- Ensemble: Villager's Country Attire
	249946, -- Ensemble: Villager's City Attire
	250319, -- Researcher's Shadowgraft
	250320, -- Lightgraft
	250408, -- Add Keystone Affix: Dusk of the Infinite
	250409, -- Add Keystone Affix: Timeways Manifested
	250410, -- Add Keystone Affix: Twilight Reflections
	250722, -- Ethereal Stall
	250724, -- Add Keystone Affix: Tyrannically Fortified
	250888, -- Ensemble: Villager's Forest Collection
	250897, -- Ensemble: Villager's Seaside Collection
	250904, -- Ensemble: Villager's Country Collection
	250911, -- Ensemble: Villager's City Collection
	251016, -- Ensemble: Forged Warmonger's Cloth Armor
	251017, -- Ensemble: Forged Warmonger's Leather Armor
	251018, -- Ensemble: Forged Warmonger's Mail Armor
	251019, -- Ensemble: Forged Warmonger's Plate Armor
	251020, -- Arsenal: Forged Warmonger's Weapons
	251039, -- Toasting Brew
	251236, -- Ensemble: Prized Warmonger's Cloth Armor
	251237, -- Ensemble: Prized Warmonger's Leather Armor
	251238, -- Ensemble: Prized Warmonger's Mail Armor
	251239, -- Ensemble: Prized Warmonger's Plate Armor
	251240, -- Arsenal: Prized Warmonger's Weapons
	251243, -- Ensemble: Astral Warmonger's Cloth Armor
	251244, -- Ensemble: Astral Warmonger's Leather Armor
	251245, -- Ensemble: Astral Warmonger's Mail Armor
	251246, -- Ensemble: Astral Warmonger's Plate Armor
	251247, -- Arsenal: Astral Warmonger's Weapons
	251491, -- Magical Pet Clicker
	252300, -- Bronze Cluster
	252415, -- Trovehunter's Bounty
	252658, -- Set Keystone Map: Windrunner Spire
	252951, -- Set Keystone Map: Maisara Caverns
	253009, -- Set Keystone Map: Pit of Saron
	253010, -- Set Keystone Map: Nexus-Point Xenas
	253012, -- Set Keystone Map: Magisters' Terrace
	253342, -- Beacon of Hope
	253353, -- Illusion: Felshatter
	253358, -- Ensemble: Tideskorn Hunter's Munitions
	253515, -- Challenge Card: Glorp
	253521, -- Heron's Vision of Cloudwalking
	253575, -- Challenge Card: Renegade Swabbie
	253581, -- Challenge Card: Sunny
	253627, -- Depth Grease
	253868, -- Challenge Card: The Quacken
	254373, -- Areyn's Elrendar Red
	254384, -- Lady Marilin's Arcwine Reserve
	254385, -- Landraelanis' Muskmelon Draught
	254386, -- Limien's Arcane Infusion
	254387, -- Duskwither's Dancing Merlot
	254388, -- Nara's Essence of Butterfly
	254389, -- Quarelestra's Sanguine Affair
	254390, -- Sheri's Laughing Rose
	254391, -- Vehn's Shimmerveil Blanc
	254394, -- Zalene's Twilight Claret
	254673, -- Kreynna's Khadgar's Imitation
	254746, -- Commendation of the Court of Harvesters
	254757, -- Chunk of Companion Experience
	254758, -- Commendation of The Wild Hunt
	254759, -- Commendation of the Undying Army
	254760, -- Commendation of the Ascended
	254761, -- Commendation of Ve'nari
	254762, -- Commendation of the Avowed
	254763, -- Commendation of the Court of Night
	254764, -- Commendation of the Ember Court
	254765, -- Commendation of the Sitchmasters
	254768, -- Commendation of Marasmius
	254771, -- Commendation of the Death's Advance
	254774, -- Commendation of the Archivist's Codex
	254775, -- Commendation of the Enlightened
	254983, -- Assassin's Subtle Tea
	255676, -- Phase Diver's Cache
	257023, -- Preyseeker's Adventurer Chest
	257381, -- Player Experience
	257384, -- Companion Experience
	257535, -- Galactic Jeweler's Setting
	257970, -- Ensemble: Sorcerer's Midnight Garb
	257971, -- Ensemble: Sorcerer's Azure Garb
	257972, -- Ensemble: Sorcerer's Sepia Garb
	257974, -- Ensemble: Sorcerer's Grassy Garb
	257975, -- Ensemble: Sorcerer's Cloudy Garb
	257976, -- Ensemble: Sorcerer's Deep Garb
	257978, -- Ensemble: Sorcerer's Camo Garb
	257979, -- Ensemble: Sorcerer's Brick Garb
	257987, -- Ensemble: Sorcerer's Lively Garb
	257989, -- Ensemble: Sorcerer's Faded Garb
	257994, -- Ensemble: Sorcerer's Carrot Garb
	257997, -- Ensemble: Sorcerer's Rosy Garb
	258003, -- Ensemble: Sorcerer's Plum Garb
	258010, -- Ensemble: Hara'ti Rootdancer's Garb
	258012, -- Ensemble: Hara'ti Rootwarden's Wear
	258013, -- Ensemble: Hara'ti Scout's Outfit
	258014, -- Ensemble: Hara'ti Guardian's Armor
	258017, -- Ensemble: Sorcerer's Crimson Garb
	258018, -- Ensemble: Sorcerer's Violet Garb
	258019, -- Ensemble: Sorcerer's Aquatic Garb
	258020, -- Ensemble: Sorcerer's Snowy Garb
	258021, -- Ensemble: Sorcerer's Sunny Garb
	258146, -- Rotten Carrion
	258186, -- Ensemble: Corrupted Regalia of the Crusader
	258251, -- Ensemble: Twilight Regalia of the Crusader
	258266, -- Ensemble: Vengeful Regalia of the Crusader
	258317, -- Ensemble: Pious Regalia of the Crusader
	258422, -- Ensemble: Wooly Wendigo
	258622, -- Medal of Conquest
	258724, -- Ensemble: Elaborate Charcoal Mageweave
	258725, -- Ensemble: Elaborate Lavender Mageweave
	258727, -- Ensemble: Elaborate Ruby Mageweave
	258728, -- Ensemble: Elaborate Golden Mageweave
	258736, -- Scroll of Town Portal
	258763, -- Portable Void Zeal
	258784, -- Ensemble: South Guard's Silver Raiment
	258793, -- Ensemble: South Guard's Golden Raiment
	258802, -- Ensemble: South Guard's Copper Raiment
	258811, -- Ensemble: South Guard's Iron Raiment
	258841, -- Commendation of the Dragonscale Expedition
	258842, -- Commendation of the Maruuk Centaur
	258843, -- Commendation of the Iskaara Tuskarr
	258844, -- Commendation of the Valdrakken Accord
	258845, -- Commendation of the Loamm Niffen
	258846, -- Commendation of the Dream Wardens
	259027, -- Ensemble: Blood Knight's Elegant Regalia
	259028, -- Ensemble: Haven's Elegant Regalia
	259073, -- Arsenal: Arms of the Hara'ti
	259074, -- Ensemble: Magister's Elegant Regalia
	259075, -- Ensemble: Pilfered Elegant Regalia
	259076, -- Ensemble: Farstrider's Elegant Regalia
	259079, -- Ensemble: Farstrider Dignitary's Trappings
	259080, -- Ensemble: Magister Dignitary's Trappings
	259081, -- Ensemble: Blood Knight Dignitary's Trappings
	259082, -- Ensemble: Haven Dignitary's Trappings
	259083, -- Ensemble: Pilfered Dignitary's Trappings
	259085, -- Void-Touched Augment Rune
	259087, -- Ensemble: Pilfered Socialite's Attire
	259088, -- Ensemble: Blood Knight Socialite's Attire
	259089, -- Ensemble: Magister Socialite's Attire
	259090, -- Ensemble: Farstrider Socialite's Attire
	259091, -- Ensemble: Haven Socialite's Attire
	259361, -- Vile Essence
	260248, -- Mysterious Green Fluid
	260250, -- Mysterious Purple Fluid
	260251, -- Mysterious Red Fluid
	260266, -- Fizzing Fluid
	260534, -- Master Alchemist's Surplus Reagents
	260536, -- Master Smith's Surplus Reagents
	260537, -- Master Enchanter's Surplus Reagents
	260538, -- Master Engineer's Surplus Reagents
	260539, -- Master Herbalist's Surplus Reagents
	260540, -- Master Scribe's Surplus Reagents
	260541, -- Master Jewelcrafter's Surplus Reagents
	260542, -- Master Leatherworker's Surplus Reagents
	260543, -- Master Miner's Surplus Reagents
	260544, -- Master Skinner's Surplus Reagents
	260545, -- Master Tailor's Surplus Reagents
	260589, -- Flame-Blessed Beach Towel
	260914, -- Arsenal: Lost Plunder Key
	260915, -- Arsenal: Found Plunder Key
	260941, -- Ensemble: Winter's Dreaming Garb
	260944, -- Ensemble: Pristine Draconic Scholar's Finery
	260979, -- Victorious Stormarion Cache
	262662, -- Thalassian Distinguishment
	262724, -- Currency Wallet
	262786, -- Suntouched Special Reserve
	263185, -- Rotted Plank
	263208, -- Ensemble: Galactic Aspirant's Cloth Armor
	263210, -- Ensemble: Galactic Aspirant's Leather Armor
	263213, -- Ensemble: Galactic Aspirant's Mail Armor
	263214, -- Ensemble: Galactic Aspirant's Plate Armor
	263215, -- Arsenal: Galactic Aspirant's Weapons
	263520, -- Ensemble: Sprawling Garb
	263574, -- Ensemble: Osseoclad's Wear
	263575, -- Ensemble: Elder Moss Outfit
	263576, -- Ensemble: Rampant Thorn Armor
	263577, -- Arsenal: Rootlands Weaponry
	263975, -- Feeling Fielder Mk. 7
	-- Death Knight
	136796, -- Necrophile Tome: Corpse Exploder
	138955, -- Illusion: Rune of Razorice
	146164, -- Ensemble: Vindictive Combatant's Dreadplate Armor
	146165, -- Ensemble: Vindictive Combatant's Dreadplate Armor
	146423, -- Ensemble: Bloodthirsty Gladiator's Dreadplate Armor
	147677, -- Ensemble: Cruel Combatant's Dreadplate Armor
	147678, -- Ensemble: Cruel Combatant's Dreadplate Armor
	150252, -- Ensemble: Fierce Combatant's Dreadplate Armor
	150253, -- Ensemble: Fierce Combatant's Dreadplate Armor
	-- Druid
	17683, -- Book: Gift of the Wild
	21294, -- Book of Healing Touch
	21296, -- Book of Rejuvenation
	22146, -- Book: Gift of the Wild
	24101, -- Book of Ferocious Bite V
	24345, -- Book of Cower IV
	122304, -- Fandral's Seed Pouch
	136787, -- Tome of the Wilds: Treant Form
	136789, -- Tome of the Wilds: Mount Form
	136790, -- Tome of the Wilds: Track Beasts
	136794, -- Tome of the Wilds: Flap
	136795, -- Tome of the Wilds: Charm Woodland Creature
	139865, -- Glowing Token
	146168, -- Ensemble: Vindictive Combatant's Dragonhide Armor
	146169, -- Ensemble: Vindictive Combatant's Dragonhide Armor
	146421, -- Ensemble: Bloodthirsty Gladiator's Dragonhide Armor
	147675, -- Ensemble: Cruel Combatant's Dragonhide Armor
	147676, -- Ensemble: Cruel Combatant's Dragonhide Armor
	150250, -- Ensemble: Fierce Combatant's Dragonhide Armor
	150251, -- Ensemble: Fierce Combatant's Dragonhide Armor
	171976, -- Ensemble: Wildheart Raiment
	-- Housing > Decor
	235523, -- Sturdy Wooden Chair
	235633, -- Circular Woolen Rug
	235675, -- Three-Candle Wrought Iron Chandelier
	235677, -- Wrought Iron Floor Lamp
	235994, -- Ornate Stonework Fireplace
	236653, -- Orgrimmar Interior Narrow Wall
	236654, -- Orgrimmar Interior Doorway
	236655, -- Orgrimmar Interior Wall
	236666, -- Orgrimmar Round Interior Pillar
	236667, -- Orgrimmar Square Interior Pillar
	236675, -- Stormwind Interior Pillar
	236676, -- Stormwind Interior Narrow Wall
	236677, -- Stormwind Interior Wall
	236678, -- Stormwind Interior Doorway
	238975, -- Reliquary Telescope
	239075, -- Wrought Iron Chandelier
	239170, -- Dornic Mine and Cheese Platter
	241617, -- Elegant Padded Chair
	241618, -- Elegant Padded Footstool
	241620, -- Elegant Wooden Dresser
	241621, -- Small Elegant End Table
	241622, -- Ornate Weapon Rack
	241623, -- Elegant Elven Barrel
	242255, -- Stormwind Hall Rug
	242951, -- Sturdy Wooden Bench
	243088, -- Standing Ornate Weapon Rack
	243242, -- Circular Elven Floor Rug
	243243, -- Rectangular Elven Floor Rug
	243334, -- Reinforced Wooden Chest
	243337, -- Bound-Left Silvermoon Drapes
	243338, -- Bound-Right Silvermoon Drapes
	243495, -- Elegant Padded Divan
	244118, -- Rectangular Elegant Table
	244169, -- Elegant Almond Table
	244315, -- Orcish Warlord's Planning Table
	244343, -- Vessel of the Howling Ossuary
	244530, -- Sturdy Wall Rack
	244531, -- Sturdy Fireplace
	244532, -- Rugged Stool
	244533, -- Iron Chain Chandelier
	244534, -- Iron-Reinforced Door
	244535, -- Tusked Gazebo
	244661, -- Tied-Left Leather Curtains
	244662, -- Closed Leather Curtains
	244663, -- Leather Valance
	244664, -- Tied-Open Folk Curtains
	244665, -- Closed Folk Curtains
	244666, -- Durable Folk Valance
	244667, -- Restful Wooden Bench
	244668, -- Light-Infused Fountain
	244780, -- Circular Elven Table
	244781, -- Elegant Wall Drape
	244782, -- Elven Floral Window
	245264, -- Round Stitched Cushion
	245265, -- Stitched Pillow Roll
	245266, -- Iron-Studded Wooden Window
	245267, -- Charming Seat Cushion
	245268, -- Checkered Charming Seat Cushion
	245291, -- Replica Dark Iron Mole Machine
	245298, -- Wild Violet Bellflowers
	245299, -- Reaching Violet Bellflowers
	245300, -- Arched Violet Bellflowers
	245302, -- Gallagio L.U.C.K. Spinner
	245327, -- Creeping Corner Ivy
	245328, -- Small Boxwood Bush
	245329, -- Small Poppy Cluster
	245332, -- Tome of Silvermoon Intrigue
	245334, -- Wicker Basket
	245335, -- Empty Wicker Basket
	245336, -- Sturdy Wooden Bed
	245352, -- Sturdy Wooden Coffin
	245353, -- Open Wooden Coffin
	245354, -- Wooden Coffin Lid
	245355, -- Sturdy Wooden Interior Door
	245356, -- Goldshire Window
	245357, -- Gryphon Roost
	245358, -- Small Fruit Platter
	245359, -- Large Stonework Fountain
	245360, -- Small Stonework Fountain
	245365, -- Empty Stormwind Market Stand
	245366, -- Stormwind Bean Seller's Stand
	245367, -- Stormwind Produce Seller's Stand
	245368, -- Stormwind Spice Merchant's Stand
	245369, -- Gift of Gilneas
	245370, -- Secretive Bookcase Wall
	245371, -- Charming Laurel Tree
	245372, -- Covered Wooden Table
	245374, -- Sturdy Wooden Table
	245375, -- Sturdy Wooden Bookcase
	245376, -- Tall Sturdy Wooden Bookcase
	245377, -- Open-Air Sturdy Tent
	245378, -- Sturdy Sheltering Tent
	245379, -- Sturdy Roofed Wagon
	245380, -- Sturdy Open Wagon
	245382, -- Sturdy Covered Wagon
	245383, -- \"Sunrise Canyon\" Painting
	245384, -- Sturdy Wooden Shelf
	245385, -- Well-Built Well
	245386, -- Sturdy Wooden Wheelbarrow
	245392, -- Sturdy Wooden Interior Pillar
	245393, -- Plain Interior Wall
	245394, -- Plain Interior Doorway
	245395, -- Plain Interior Narrow Wall
	245398, -- Tusked Fireplace
	245400, -- Ceiling Cobweb
	245401, -- Tented Cobweb
	245402, -- Small Dangling Cobweb
	245403, -- Large Dangling Cobweb
	245404, -- Pillar Cobweb
	245411, -- Dark Ship's Lantern
	245429, -- Tirisgarde Book Tempest
	245444, -- Orcish Communal Stove
	245474, -- Forsaken War Planning Table
	245476, -- Large Forsaken War Tent
	245477, -- Small Forsaken War Tent
	245485, -- Golden Zandalari Bed
	245520, -- Gilnean Celebration Keg
	245522, -- Grand Mask of Bwonsamdi, Loa of Graves
	245532, -- Orgrimmar Chair
	245533, -- Rugged Brazier
	245545, -- Orgrimmar Nightstand
	245546, -- Durable Wooden Chest
	245547, -- Wide Charming Couch
	245548, -- Iron-Reinforced Cupboard
	245551, -- Worker's Wooden Desk
	245555, -- Orgrimmar Tusked Bed
	245556, -- Iron-Reinforced Standing Mirror
	245575, -- Bel'ameth Interior Wall
	245576, -- Bel'ameth Round Interior Pillar
	245578, -- Bel'ameth Interior Doorway
	245579, -- Bel'ameth Interior Narrow Wall
	245581, -- Silvermoon Round Interior Pillar
	245582, -- Silvermoon Interior Narrow Wall
	245583, -- Silvermoon Interior Wall
	245649, -- Silvermoon Interior Doorway
	245656, -- Wooden Gazebo
	245657, -- Stonework Fountain
	245658, -- Elwynn Cobblestone Round
	245659, -- Elwynn Cobblestone
	245660, -- Elwynn Cobblestone Pair
	245661, -- Elwynn Cobblestone Cluster
	245662, -- Carved Wooden Bar Table
	245680, -- Orgrimmar Bureaucrat's Desk
	245939, -- Void-Corrupted Fountain
	246036, -- High-Backed Orgrimmar Chair
	246037, -- Iron-Reinforced Wooden Rack
	246038, -- Stitched Leather Rug
	246101, -- Small Wooden Stool
	246102, -- Large Covered Wooden Table
	246103, -- Small Wooden Nightstand
	246104, -- Carved Wooden Crate
	246105, -- Sturdy Weapon Rack
	246106, -- Wooden Chamberstick
	246107, -- Large Sturdy Wooden Table
	246109, -- Open Carved Wooden Crate
	246217, -- Short Orgrimmar Bench
	246218, -- Iron-Reinforced Crate
	246219, -- Weather-Treated Wooden Table
	246220, -- Leather-Banded Wooden Bench
	246223, -- Cozy Hide-Covered Bench
	246224, -- Large Orgrimmar Bookcase
	246225, -- Small Leather Rug
	246241, -- Spiky Banded Barrel
	246243, -- Stormwind Beam Platform
	246245, -- Stormwind Round Platform
	246246, -- Stormwind Large Platform
	246247, -- Stormwind Small Platform
	246248, -- Stormwind Angled Platform
	246249, -- Silvermoon Beam Platform
	246250, -- Silvermoon Large Platform
	246251, -- Silvermoon Small Platform
	246252, -- Silvermoon Angled Platform
	246253, -- Silvermoon Round Platform
	246254, -- Bel'ameth Beam Platform
	246255, -- Bel'ameth Large Platform
	246256, -- Bel'ameth Small Platform
	246257, -- Bel'ameth Angled Platform
	246258, -- Bel'ameth Round Platform
	246259, -- Orgrimmar Beam Platform
	246260, -- Orgrimmar Round Platform
	246261, -- Orgrimmar Large Platform
	246262, -- Orgrimmar Small Platform
	246263, -- Orgrimmar Angled Platform
	246414, -- Light-Infused Rotunda
	246431, -- Elegant Tied Curtain
	246481, -- Retired Industrial Gnomegrabber
	246485, -- Mechagnome Sustenance Distributor
	246502, -- Charming Couch
	246587, -- Short Orgrimmar Bookcase
	246588, -- Sturdy Wooden Trellis
	246606, -- Mechagon Armory Rack
	246607, -- Durable Hex Table
	246608, -- Long Leather-Clad Table
	246609, -- Orgrimmar Open Dresser
	246610, -- Razorwind Standing Mirror
	246611, -- Razorwind Fountain
	246612, -- Logger's Picnic Table
	246613, -- Long Durable Table
	246614, -- Razorwind Bar Table
	246615, -- Open Spiky Banded Barrel
	246616, -- Open Iron-Reinforced Crate
	246687, -- Tusked Candleholder
	246691, -- Grand Elven Wall Curtain
	246711, -- Elegant Pillow Roll
	246742, -- Tall Sturdy Wooden Chair
	246803, -- Arched Wooden Bench
	246851, -- \"Raising Your Eyes\" Painting
	246867, -- Tome of Earthen Directives
	246868, -- Wide Hide-Covered Bench
	246869, -- Razorwind Wall Mirror
	246870, -- Farmer's Water Trough
	246871, -- Hay-Filled Sturdy Feeding Trough
	246872, -- Carved Stone Bench
	246874, -- Sturdy Brazier
	246875, -- Founder's Point Street Light
	246876, -- Founder's Point Lamppost
	246877, -- Sturdy Feeding Trough
	246879, -- Tusked Hanging Sconce
	246880, -- Horned Banded Barrel
	246881, -- Open Horned Banded Barrel
	246882, -- Long Orgrimmar Bench
	246883, -- Crude Banded Crate
	246884, -- Open Crude Banded Crate
	246934, -- Small Covered Wooden Table
	246935, -- Small Sturdy Wooden Table
	246961, -- Elegant Seat Cushion
	247221, -- Small Orgrimmar Chair
	247235, -- Luminous Rotshroom
	247501, -- Elegant Carved Door
	247502, -- Elven Woodvine Trellis
	247751, -- Deactivated K'areshi Warp Cannon
	248011, -- Trueshot Skeletal Dragon Head
	248246, -- Razorwind Storage Table
	248337, -- Round-Top Boulder
	248338, -- Flat Boulder
	248339, -- Hilltop Boulder
	248400, -- Founder's Point Signpost
	248401, -- Ornamental Kaldorei Glaive
	248402, -- Grummle Kafa Refinery
	248625, -- Razorwind Succulent Palm
	248626, -- Razorwind Fighting Cactus
	248627, -- Razorwind Tumbleweed
	248628, -- Razorwind Palm Tree
	248629, -- Nagrand Blueberry Bush
	248630, -- Barrens Hosta Bush
	248631, -- Azsharan Firespear Tree
	248632, -- Hardy Razorwind Grass Patch
	248633, -- Flowering Durotar Cactus
	248634, -- Razorwind Acacia Tree
	248635, -- Elwynn Whitebrush
	248636, -- Razorwind Gobtree
	248637, -- Sunset Aster Flowers
	248638, -- Pink Razorwind Paintbrush
	248639, -- Gloomrose
	248640, -- Duskberry Bush
	248641, -- Duskwood Shadebrush
	248642, -- Creeping Lattice Ivy
	248643, -- Duskwood Sycamore Shrub
	248644, -- Spiritbloom Flower
	248645, -- Pink Gilnean Rose
	248646, -- Silvermoon Sunrise Bush
	248647, -- Founder's Point Blooming Grass Patch
	248648, -- Autumn Leaf Pile
	248649, -- Young Chestnut Tree
	248650, -- Razorwind Flamebrush
	248658, -- Elven Wood Crate
	248760, -- Lovely Elven Shelf
	248800, -- Architect's Drafting Table
	248802, -- Elwynn Grass Patch
	248803, -- Elwynn Grass Spread
	248807, -- Nesingwary Mounted Shoveltusk Head
	248808, -- Nesingwary Mounted Elk Head
	248809, -- Void-Corrupted Rotunda
	248811, -- Elwynn Small Grass Patch
	248934, -- Golden Cloud Serpent Treasure Chest
	248940, -- Replica Felblood Altar
	248942, -- Five Dawns Planning Table
	248958, -- Monastery Gong
	248960, -- Dreadscar Dais
	248963, -- Spirit-Touched Amani Mask
	249457, -- Replica Cursed Forge of the Nathrezim
	249458, -- Replica Forge of Odyn
	249459, -- Illidari Glaiverest
	249461, -- Skyhold War Table
	249466, -- Valarjar Shield Wall
	249518, -- Fel Hammer Scouting Map
	249550, -- Wind Rider Roost
	249558, -- Elven Standing Mirror
	249690, -- Replica Tome of Fel Secrets
	249822, -- Founder's Point Street Sign
	249823, -- Founder's Point Navigation Sign
	250092, -- Small Wooden Footstool
	250093, -- Tusked Weapon Rack
	250094, -- Empty Orgrimmar Bathtub
	250095, -- Runed Stone Placard
	250111, -- Replica Tome of the Ancients
	250112, -- Ebon Blade Planning Map
	250115, -- Ebon Blade Weapon Rack
	250123, -- Replica Acherus Soul Forge
	250125, -- Replica Altar of the Eternal Hunt
	250126, -- Unseen Path Archer's Gallery
	250127, -- Replica Tales of the Hunt
	250131, -- Tirisgarde War Map
	250134, -- Seed of Ages Cutting
	250230, -- Replica Altar of Ancient Kings
	250233, -- Replica Libram of Ancient Kings
	250236, -- Silver Hand Weapon Rack
	250249, -- Founder's Point Gravestone
	250250, -- Small Founder's Point Gravestone
	250251, -- Tall Founder's Point Gravestone
	250252, -- Large Founder's Point Gravestone
	250306, -- Conjured Altar of the Guardian
	250403, -- Legion's Holo-Communicator
	250406, -- Corruption Pit
	250691, -- Tusked Leather Tapestry
	250692, -- Razorwind Banner Pelt
	250693, -- Altar of the Corrupted Flames
	250694, -- Draconic Metalshaper's Anvil
	250704, -- Ancient Weyrn Device
	250786, -- Uncrowned Planning Table
	250787, -- Replica Crucible of the Uncrowned
	250788, -- Stolen Copy of the Blood Ledger
	250790, -- Replica Altar of Light and Shadow
	250791, -- Replica Word of the Conclave
	250792, -- Scroll of the Conclave
	250868, -- Crimson Crystal Column
	250913, -- Small Razorwind Bar Table
	250914, -- Elemental Altar of the Maelstrom
	250915, -- Replica Words of Wind and Earth
	250920, -- Horned Hanging Sconce
	251011, -- Painted Wood Scraps
	251012, -- Painted Wood Scrap Pile
	251013, -- Cenarion Arch
	251014, -- Earthen Ring Scouting Map
	251545, -- Razorwind Cooking Grill
	251549, -- Emblem of the Naaru's Blessing
	251636, -- Netherlight Command Map
	251637, -- Tusked Weapon Stand
	251638, -- Jagged Orgrimmar Trellis
	251639, -- Hide-Covered Bench
	251778, -- Sentinel's Moonwing Gaze
	251779, -- Fel Fountain
	251973, -- Hide-Covered Wall Shelf
	251974, -- Tusked Chandelier
	251975, -- Tusked Sconce
	251976, -- Wolf Pelt Rug
	251981, -- Elegant Elven Chandelier
	251982, -- Gilded Silvermoon Candelabra
	252004, -- Wooden Planter Pot
	252005, -- Wooden Planter Row
	252006, -- Founder's Point Fence
	252007, -- Long Founder's Point Fence
	252008, -- Razorwind Wheelbarrow
	252037, -- Covered Wooden Desk
	252038, -- Sturdy Wooden Desk
	252041, -- Dalaran Espresso Machine
	252407, -- Founder's Point Framed Torch
	252408, -- Long Old Founder's Point Fence
	252409, -- Old Founder's Point Fence
	252410, -- Founder's Point Fencepost
	252412, -- Old Founder's Point Fencepost
	252414, -- Broken Founder's Point Fence
	252416, -- Old Broken Founder's Point Fence
	252417, -- Plush Cushioned Chair
	252657, -- Tied-Right Leather Curtains
	252659, -- Founder's Point Front Door
	252666, -- \"The High Exarch\" Painting
	252667, -- \"The Ranger of the Void\" Painting
	252668, -- \"The Harbinger\" Painting
	252669, -- \"The Redeemer\" Painting
	253018, -- Founder's Point Standing Torch
	253019, -- Razorwind Banded Planter
	253180, -- Elegant Elven Canopy Bed
	253181, -- Gemmed Elven Chest
	253437, -- Elegant Covered Bench
	253439, -- Elegant Carved Bench
	253441, -- Grand Elven Bookcase
	253479, -- Small Elegant Padded Chair
	253490, -- Elegant Elven Desk
	253493, -- Carved Elven Bookcase
	253495, -- Grand Elven Bench
	253589, -- Short Wooden Cabinet
	253590, -- Coal-Fired Stovetop
	253592, -- Sturdy Wooden Washbasin
	253593, -- Sturdy Wooden Bathtub
	253602, -- \"Silvermoon in Summer\" Painting
	253603, -- \"The Last Day of the Semester\" Painting
	253604, -- \"A Bridge Over Calm Waters\" Painting
	253605, -- \"Family Portrait\" Painting
	253606, -- \"Brunch and a Book\" Unframed Painting
	253607, -- \"Eversong in Bloom\" Painting
	253608, -- \"Nature's Strength\" Painting
	253609, -- \"River's Protectors\" Unframed Painting
	253610, -- \"Isolation\" Unframed Painting
	253611, -- \"The Fallen Protectors\" Unframed Painting
	253612, -- \"Autumnal Eversong\" Unframed Painting
	253613, -- \"Reclamation\" Unframed Painting
	253614, -- \"Brunch and a Book\" Painting
	253615, -- \"Autumnal Eversong\" Painting
	253616, -- \"Isolation\" Painting
	253617, -- \"Reclamation\" Painting
	253618, -- \"The Light Blooms\" Painting
	253619, -- \"The Fallen Protectors\" Painting
	253620, -- \"River's Protectors\" Painting
	253705, -- \"The Light Blooms\" Unframed Painting
	253707, -- Open Sturdy Wooden Crate
	254316, -- Small Orgrimmar Tusked Bed
	254395, -- Razorwind Smith's Hammer
	254396, -- Razorwind Miner's Pickaxe
	254397, -- Razorwind Woodworker's Hand Saw
	254398, -- Razorwind Crafter's Chisel
	254399, -- Razorwind Peon's Shovel
	254415, -- Miniature Charging Station
	254416, -- Galvanic Storage and Maintenance Device
	254560, -- Small Razorwind Square Table
	254678, -- Razorwind Logger's Axe
	254893, -- Large Razorwind Gazebo
	255644, -- Elwynn Apple Tree
	255646, -- Founder's Point Apple Tree
	255650, -- Elegant Table Lamp
	255706, -- Razorwind Iron Chandelier
	255707, -- Low-Hanging Razorwind Iron Chandelier
	255708, -- Small Jagged Orgrimmar Trellis
	255709, -- Razorwind Shores Canoe
	256050, -- Razorwind Shores Front Door
	256170, -- Draconic Scribe's Basin
	256329, -- Razorwind Standing Tusk
	256357, -- Razorwind Porch Chair
	256554, -- Definitely Real, Not At All Fake Head of the Broodmother
	256674, -- Conjured Archive of the Tirisgarde
	256679, -- Replica Chronicle of Ages
	256907, -- Replica Tome of Blighted Implements
	257099, -- Razorwind Covered Well
	257351, -- Tale of the Penultimate Lich King
	257354, -- Scroll of K'aresh's Fall
	257355, -- Tome of the Survivor
	257359, -- Slate Cobblestone Pair
	257388, -- Slate Cobblestone
	257389, -- Iron-Reinforced Wooden Window
	257390, -- Slate Cobblestone Path
	257392, -- Slate Cobblestone Trio
	257396, -- Replica Saga of the Valarjar
	257403, -- Maelstrom Lava Lamp
	257690, -- Elegant Padded Chaise
	257691, -- Open Elegant Elven Barrel
	257692, -- Elegant Curved Table
	258148, -- Orgrimmar Bathtub
	258300, -- Sparse Razorwind Fisher's Rack
	258307, -- Razorwind Fisher's Rack
	258565, -- Reinforced Wooden Barrel
	258566, -- Empty Reinforced Wooden Barrel
	258570, -- Refined Wooden Bed
	258658, -- Elwynn Autumn Apple Tree
	258659, -- Founder's Point Autumn Apple Tree
	258663, -- Razorwind River Paddle
	258664, -- Tusk-Adorned Stitched Rug
	258665, -- Small Stitched Rug
	258670, -- Empty Wooden Bathtub
	258740, -- Glorious Pendant of Rukhmar
	258818, -- Padded Wooden Bench
	258819, -- Sturdy Wooden Crate
	259464, -- Rolled Razorwind Leathers
	259465, -- Low-Hanging Razorwind Ropes
	259466, -- Knotted Hanging Razorwind Ropes
	259467, -- Tusked Hanging Razorwind Ropes
	259468, -- Plain Hanging Razorwind Ropes
	259469, -- Adorned Hanging Razorwind Ropes
	259470, -- Lightly Adorned Hanging Razorwind Ropes
	260486, -- Large Razorwind Farmer's Hay Pile
	260487, -- Razorwind Farmer's Hay Pile
	260488, -- Small Razorwind Farmer's Hay Pile
	260581, -- Brazier of Elune
	260584, -- Replica Libram of the Dead
	260701, -- Red Razorwind Paintbrush
	260702, -- Dry Razorwind Grass Patch
	260776, -- Uncrowned Market Stall
	260785, -- Miniature Replica Dark Portal
	262453, -- Hearthlight Armillary
	262470, -- Spellbound Tome of Thalassian Magics
	262619, -- Replica Forge of the Roaring Mountain
	262907, -- Tazaveshi Hookah
	262957, -- Tattered Vanguard Banner
	262962, -- Carved Wooden Chair
	263025, -- Sturdy Wine Press
	263031, -- Twisted Rope Coil
	263032, -- Razorwind Fishing Net
	263045, -- Consortium Energy Collector
	263581, -- Razorwind Roofer's Shingle
	263582, -- Razorwind Roofer's Shingle Pile
	263583, -- Tiny Clump of Hay
	263584, -- Razorwind Construction Crane
	263880, -- Cherished Pet's Rug
	263994, -- Fungal Chest
	263995, -- Delver's Bountiful Coffer
	263996, -- Twilight Tabernacle
	264007, -- Corewarden's Spoils
	264008, -- Root-Wrapped Reliquary
	264169, -- Homestone Doormat
	264170, -- Ancient Kaldorei Coffer
	264175, -- Amani Strongbox
	264187, -- Blessed Phoenix Egg
	264242, -- Dreadscar Battle Planning Map
	264246, -- Eerie Iridescent Riftshroom
	264259, -- On'ohia's Call
	264352, -- Elegant Elven Bathtub
	264353, -- Empty Elegant Elven Bathtub
	264491, -- Voidbound Holding Cell
	264492, -- Chaotic Void Maw
	264494, -- Banded Domanaar Storage Crate
	264497, -- Imperator's Torment Crystal
	264498, -- Voltaic Trigore Egg
	264716, -- Hexed Tomb Brazier
	264916, -- Loamm Bartering Stall
	264921, -- Zaralek Snail Cart
	265033, -- Zul'Aman Brazier Post
	265386, -- Fortified Amani Awning
	265653, -- Elegant Storage Table
	265654, -- Elegant Elven Washbasin
	265924, -- High-Mounted Razorwind Bowl Chandelier
	265925, -- Razorwind Bowl Chandelier
	265926, -- Low-Hanging Razorwind Bowl Chandelier
	266233, -- Short Hanging Tavern Lantern
	266234, -- Saltfang Shoals Large Garden Cluster
	266235, -- Razorwind Cactus Large Garden Cluster
	266236, -- Razorwind Blooms Large Garden Cluster
	266237, -- Runetotem's Bounty Large Garden Cluster
	266238, -- Cragthorn Highlands Large Garden Cluster
	266239, -- Outer Banks Large Garden Cluster
	266240, -- Founder's Point Large Garden Cluster
	266241, -- Brumewood Hollow Large Garden Cluster
	266242, -- Gilded Oaks Large Garden Cluster
	266243, -- Stoneveil Ridge Large Garden Cluster
	266244, -- Granite Cobblestone Path Corner
	266245, -- Granite Cobblestone Path Arc
	266249, -- Hanging Tavern Lantern
	266250, -- Long Hanging Tavern Lantern
	266443, -- Granite Cobblestone Long Path
	266444, -- Granite Cobblestone Path
	267075, -- Ornate Elven Stove
	267080, -- Amani Blueflame Chandelier
	267083, -- Razorwind Campfire Grill
	267084, -- Founder's Point Hay Bale
	267088, -- Iron Candlelight Lantern
	267202, -- Elegant Elven Water Well
	267207, -- Amani Territorial Totem
	267616, -- Loose Wisps of Hay
	268026, -- Scattered Wisps of Hay
	268027, -- Windblown Wisps of Hay
	268028, -- Trampled Wisps of Hay
	268029, -- Mounted Founder's Point Lantern
	268030, -- Mounted Tavern Lantern
	268038, -- Endless Codex of Blooming Light
	268039, -- Endless Codex of Nature's Grace
	268041, -- Endless Codex of the Voidtouched
	269269, -- Devouring Ritual Spire
	271158, -- Dark Obelisk
	271971, -- Tome of Kings
	272359, -- Square Woolen Rug
	272360, -- Ula'tek Ritual Stone
	272361, -- Venomous Pyre
	274505, -- Shrine of Akil'zon, Loa of Victory
	274535, -- Shrine of Nalorakk, Loa of War
	274537, -- Shrine of Jan'alai, Loa of Fire
	274539, -- Shrine of Halazzi, Loa of the Hunt
	275853, -- Zul'Aman Burning Pinecone
	275855, -- Zul'Aman Swamp Palm Sprout
	275857, -- Zul'Aman Creeping Pangoroot
	276083, -- Sunstrider Omnium Simulacrum
	276316, -- Lightveil's Transport Pad
	276429, -- Grand Artificer's Lightforged Console
	276432, -- De-Powered Lightforged Siegebreaker
	276873, -- Perch of the Dawnfire Phoenix
	277121, -- Cozy Bird Nest
	277138, -- Silvermoon Dragonhawk Incubator
	277142, -- Westfall Pet Cage
	277144, -- Crossroads Pet Cage
	277149, -- Crude Pet Cage
	277160, -- Cozy Lightbloom Lilypad
	277163, -- Loyal Companion's Plinth
	278151, -- Blood Knight's Decorative Shield
	279112, -- Clumped Asteroidea
	279115, -- Soulcoiler's Ritual Candle
	279118, -- Lost Explorers' Mailbox
	279122, -- Venom-Fanged Font
	279131, -- Pillar of the Coiled Isle
	279500, -- \"Rage of the Shackled\" Mural
	279508, -- \"The Hunger Awakens\" Mural
	279922, -- Altar of Corrosion
	280142, -- Small Wooden Floor Tile
	280144, -- Large Wooden Floor Tile
	280146, -- Small Triangular Wooden Tile
	280148, -- Large Triangular Wooden Tile
	280150, -- Tall Round Wooden Column
	280152, -- Short Round Wooden Column
	280154, -- Short Square Wooden Column
	280156, -- Tall Square Wooden Column
	280158, -- Small Wooden Wall Tile
	280160, -- Large Wooden Wall Tile
	280162, -- Wide Wooden Staircase
	280164, -- Spiral Wooden Stairs
	280513, -- Color-Curious Candle
	280846, -- Beguiling Memories of the Sea
	-- Housing > Service Item
	253580, -- Harvesting Hatchet
	-- Hunter, Priest, Shaman, Mage, Warlock, Monk, Druid, Evoker
	211154, -- Arsenal: Drakebreaker's Stave
	211168, -- Arsenal: Scalewarden's Stave
	-- Hunter, Shaman, Evoker
	152741, -- Unsullied Mail Chestguard
	152744, -- Unsullied Mail Girdle
	153137, -- Unsullied Mail Spaulders
	153138, -- Unsullied Mail Legguards
	153147, -- Unsullied Mail Coif
	153149, -- Unsullied Mail Gloves
	153152, -- Unsullied Mail Boots
	153158, -- Unsullied Mail Bracers
	180182, -- Ensemble: Dread Aspirant's Mail Armor
	180183, -- Ensemble: Dread Aspirant's Mail Armor
	180190, -- Ensemble: Sinister Aspirant's Mail Armor
	180191, -- Ensemble: Sinister Aspirant's Mail Armor
	180198, -- Ensemble: Notorious Aspirant's Mail Armor
	180199, -- Ensemble: Notorious Aspirant's Mail Armor
	180205, -- Ensemble: Corrupted Gladiator's Mail Armor
	184423, -- Ensemble: Dread Gladiator's Mail Armor
	184424, -- Ensemble: Dread Gladiator's Mail Armor
	184431, -- Ensemble: Sinister Gladiator's Mail Armor
	184432, -- Ensemble: Sinister Gladiator's Mail Armor
	184440, -- Ensemble: Notorious Gladiator's Mail Armor
	184441, -- Ensemble: Notorious Gladiator's Mail Armor
	200884, -- Ensemble: Glorious Dragonrider's Mail
	200917, -- Ensemble: Tidecaller's Chainmail
	203694, -- Ensemble: Cyclonic Battlegear
	211135, -- Ensemble: Drakebreaker's Mail Armor
	211136, -- Ensemble: Scalewarden's Mail Armor
	-- Mage
	21214, -- Tome of Frostbolt
	21279, -- Tome of Fireball
	21280, -- Tome of Arcane Missiles
	22153, -- Tome of Arcane Brilliance
	22739, -- Tome of Polymorph: Turtle
	22890, -- Tome of Frost Ward
	22897, -- Tome of Conjure Food
	29550, -- Tome of Conjure Water
	31501, -- Tome of Conjure Food
	33316, -- Tome of Arcane Brilliance
	82469, -- Ancient Tome of Teleport: Dalaran
	82470, -- Ancient Tome of Portal: Dalaran
	120137, -- Tome of Polymorph: Polar Bear Cub
	120138, -- Tome of Polymorph: Monkey
	120139, -- Tome of Polymorph: Penguin
	120140, -- Tome of Polymorph: Porcupine
	136797, -- Mystical Tome: Arcane Linguist
	136799, -- Mystical Tome: Illusion
	139845, -- Band of Primordial Strength
	146156, -- Ensemble: Vindictive Combatant's Silk Armor
	146157, -- Ensemble: Vindictive Combatant's Silk Armor
	146437, -- Ensemble: Bloodthirsty Gladiator's Silk Armor
	147695, -- Ensemble: Cruel Combatant's Silk Armor
	147696, -- Ensemble: Cruel Combatant's Silk Armor
	150270, -- Ensemble: Fierce Combatant's Silk Armor
	150271, -- Ensemble: Fierce Combatant's Silk Armor
	171978, -- Ensemble: Magister's Regalia
	227710, -- Tome of Polymorph: Mosswool
	-- Miscellaneous > Companion Pets
	8498, -- Emerald Whelpling
	8499, -- Tiny Crimson Whelpling
	10822, -- Dark Whelpling
	19462, -- Unhatched Jubling Egg
	20769, -- Disgusting Oozeling
	21168, -- Baby Shark
	23713, -- Hippogryph Hatchling
	25535, -- Netherwhelp's Collar
	32498, -- Fortune Coin
	33816, -- Toothy's Bucket
	33818, -- Muckbreath's Bucket
	33993, -- Mojo
	34535, -- Azure Whelpling
	35349, -- Snarly's Bucket
	35350, -- Chuck's Bucket
	35504, -- Phoenix Hatchling
	37297, -- Gold Medallion
	39286, -- Frosty's Collar
	48116, -- Gundrak Hatchling
	48126, -- Razzashi Hatchling
	64372, -- Clockwork Gnome
	68384, -- Moonkin Egg
	68385, -- Lil' Ragnaros
	68618, -- Moonkin Hatchling
	68619, -- Moonkin Hatchling
	70099, -- Cenarion Hatchling
	73797, -- Lump of Coal
	78916, -- Soul of the Aspects
	86562, -- Hopling
	86564, -- Imbued Jade Fragment
	91031, -- Darkmoon Glowfly
	92707, -- Cinder Kitten
	93031, -- Mr. Bigglesworth
	93032, -- Blighted Spore
	93035, -- Core of Hardened Ash
	93040, -- Anubisath Idol
	93041, -- Jewel of Maddening Whispers
	93669, -- Gusting Grimoire
	97548, -- Spiky Collar
	97549, -- Instant Arcane Sanctum Security Kit
	97550, -- Netherspace Portal-Stone
	97551, -- Satyr Charm
	97552, -- Shell of Tide-Calling
	97553, -- Tainted Core
	97554, -- Dripping Strider Egg
	97555, -- Tiny Fel Engine Key
	97556, -- Crystal of the Void
	97557, -- Brilliant Phoenix Hawk Feather
	97558, -- Tito's Basket
	97821, -- Gahz'rooki's Summoning Stone
	97960, -- Dark Quivering Blob
	97961, -- Half-Empty Food Container
	98550, -- Blossoming Ancient
	101426, -- Micronax Controller
	103637, -- Vengeful Porcupette
	106240, -- Alterac Brandy
	109014, -- Dread Hatchling
	111660, -- Iron Starlette
	111866, -- Royal Peacock
	113554, -- Zomstrok
	113558, -- Weebomination
	114919, -- Sea Calf
	114968, -- Deathwatch Hatchling
	115301, -- Molten Corgi
	115483, -- Sky-Bo
	116815, -- Netherspawn, Spawn of Netherspawn
	117354, -- Ancient Nest Guardian
	117380, -- Frostwolf Ghostpup
	118207, -- Hydraling
	118516, -- Argi
	118517, -- Grommloc
	118518, -- Graves
	118574, -- Hatespark the Tiny
	118577, -- Stormwing
	118578, -- Firewing
	118598, -- Sun Sproutling
	118675, -- Time-Locked Box
	118709, -- Doom Bloom
	118921, -- Everbloom Peachick
	118923, -- Sentinel's Companion
	119112, -- Son of Sethe
	119170, -- Eye of Observation
	119467, -- Puddle Terror
	119468, -- Sunfire Kaliri
	120121, -- Trunks
	120309, -- Glass of Warm Milk
	122104, -- Leviathan Egg
	122105, -- Grotesque Statue
	122106, -- Shard of Supremus
	122107, -- Fragment of Anger
	122108, -- Fragment of Suffering
	122109, -- Fragment of Desire
	122110, -- Sultry Grimoire
	122111, -- Smelly Gravestone
	122112, -- Hyjal Wisp
	122113, -- Sunblade Rune of Activation
	122114, -- Void Collar
	122115, -- Servant's Bell
	122116, -- Holy Chime
	122125, -- Race MiniZep Controller
	122532, -- Bone Serpent
	122533, -- Young Talbuk
	122534, -- Slithershock Elver
	123862, -- Hogs' Studded Collar
	126925, -- Blorp's Bubble
	126926, -- Translucent Shell
	127701, -- Glowing Sporebat
	127703, -- Dusty Sporewing
	127704, -- Bloodthorn Hatchling
	127705, -- Lost Netherpup
	127748, -- Cinder Pup
	127749, -- Corrupted Nest Guardian
	127753, -- Nightmare Bell
	127754, -- Periwinkle Calf
	127868, -- Crusher
	128309, -- Shard of Cyrukh
	128354, -- Grumpy's Leash
	128423, -- Zeradar
	128424, -- Brightpaw
	128426, -- Nibbles
	128427, -- Murkidan
	128690, -- Ashmaw Cub
	129108, -- Son of Goredome
	129175, -- Crispin
	129178, -- Emmigosa
	129188, -- Bleakwater Jelly
	129205, -- A Tiny Infernal Collar
	129208, -- Stormborne Whelpling
	129362, -- Broot
	129760, -- Fel Piglet
	129798, -- Plump Jelly
	129878, -- Nightwatch Swooper
	129960, -- Leather Pet Bed
	129961, -- Flaming Hoop
	130154, -- Pygmy Owl
	130166, -- Risen Saber Kitten
	130167, -- Thistleleaf Adventurer
	130168, -- Fetid Waveling
	134047, -- Baby Winston
	136897, -- Northern Hawk Owl
	136900, -- Hateful Eye
	136901, -- Eye of Inquisition
	136902, -- Toxic Whelpling
	136903, -- Nightmare Whelpling
	136904, -- Sewer-Pipe Jelly
	136906, -- Brown Piglet
	136907, -- Black Piglet
	136910, -- Alarm-o-Bot
	136911, -- Knockoff Blingtron
	136913, -- Red Broodling
	136914, -- Leyline Broodling
	136921, -- Trigger
	136922, -- Wyrmy Tunkins
	136923, -- Celestial Calf
	136924, -- Felbat Pup
	136925, -- Corgi Pup
	137298, -- Zoom
	139789, -- Transmutant
	139790, -- Untethered Wyrmling
	139791, -- Lurking Owl Kitten
	140261, -- Hungering Claw
	140274, -- River Calf
	140320, -- Corgnelius
	140741, -- Nightmare Lasher
	140761, -- Nightmare Treant
	140934, -- Benax
	141348, -- Wondrous Wisdomball
	141352, -- Rescued Fawn
	141532, -- Noblegarden Bunny
	141714, -- Igneous Flameling
	141893, -- Mischief
	141894, -- Knight-Captain Murky
	141895, -- Legionnaire Murky
	142083, -- Giant Worm Egg
	142084, -- Magnataur Hunting Horn
	142085, -- Nerubian Relic
	142086, -- Red-Hot Coal
	142087, -- Ironbound Collar
	142088, -- Stormforged Rune
	142089, -- Glittering Ball of Yarn
	142090, -- Ominous Pile of Snow
	142091, -- Blessed Seed
	142092, -- Overcomplicated Controller
	142093, -- Wriggling Darkness
	142094, -- Fragment of Frozen Bone
	142095, -- Remains of a Blood Beast
	142096, -- Putricide's Alchemy Supplies
	142097, -- Skull of a Frozen Whelp
	142098, -- Drudge Remains
	142099, -- Call of the Frozen Blade
	142100, -- Stardust
	142379, -- Dutiful Squire
	142380, -- Dutiful Gruntling
	142448, -- Albino Buzzard
	143679, -- Crackers
	143755, -- Young Venomfang
	143756, -- Everliving Spore
	143954, -- Paradox Spirit
	147539, -- Bloodbrood Whelpling
	147540, -- Frostbrood Whelpling
	147541, -- Vilebrood Whelpling
	147542, -- Ban-Fu, Cub of Ban-Lu
	147543, -- Son of Skum
	147841, -- Orphaned Felbat
	147900, -- Twilight
	150739, -- Pocket Cannon
	150742, -- Pet Reaper 0.9
	151234, -- Shadow
	151632, -- Mining Monkey
	151645, -- Model D1-BB-L3R
	152963, -- Amalgam of Destruction
	152966, -- Rough-Hewn Remote
	152967, -- Experiment-In-A-Jar
	152968, -- Shadowy Pile of Bones
	152969, -- Odd Twilight Egg
	152970, -- Lesser Circle of Binding
	152972, -- Twilight Summoning Portal
	152973, -- Zephyr's Call
	152974, -- Breezy Essence
	152975, -- Smoldering Treat
	152976, -- Cinderweb Egg
	152977, -- Vibrating Stone
	152978, -- Fandral's Pet Carrier
	152979, -- Puddle of Black Liquid
	152980, -- Elementium Back Plate
	152981, -- Severed Tentacle
	153026, -- Cross Gazer
	153040, -- Felclaw Marsuul
	153045, -- Fel Lasher
	153054, -- Docile Skyfin
	153055, -- Fel-Afflicted Skyfin
	153056, -- Grasping Manifestation
	153057, -- Fossorial Bile Larva
	153541, -- Tottle
	154902, -- Perculia's Peculiar Parrot
	156566, -- Dart
	156721, -- Mailemental
	156851, -- Silithid Mini-Tank
	158077, -- Faberge Egg
	160587, -- Whomper
	160588, -- Cap'n Crackers
	161089, -- Pile of Bones
	163648, -- Fuzzy Creepling
	163650, -- Aldrusian Sproutling
	163652, -- Tiny Grimoire
	163677, -- Teeny Titan Orb
	163684, -- Scabby
	163689, -- Angry Egg
	163690, -- Plagued Egg
	163711, -- Shard of Fozruk
	163712, -- Mana-Warped Egg
	163797, -- Scuttle
	163798, -- Captain Nibs
	163799, -- Barnaby
	163800, -- Poro
	163801, -- Octopode Fry
	163802, -- Inky
	163803, -- Sparkleshell Sandcrawler
	163804, -- Kindleweb Spiderling
	163805, -- Craghoof Kid
	163806, -- False Knucklebump
	163807, -- Tinder Pup
	163808, -- Sandshell Chitterer
	163810, -- Thistlebrush Bud
	163811, -- Giggling Flame
	163812, -- Laughing Stonekin
	163813, -- Playful Frostkin
	163814, -- Mischievous Zephyr
	163815, -- Littlehoof
	163816, -- Snapper
	163817, -- Sunscale Hatchling
	163818, -- Bloodstone Tunneler
	163819, -- Snort
	163820, -- Muskflank Calfling
	163821, -- Juvenile Brineshell
	163822, -- Kunchong Hatchling
	163823, -- Coldlight Surfrunner
	163824, -- Voru'kar Leecher
	165722, -- Redridge Tarantula Egg
	166486, -- Baby Stonehide
	166488, -- Rotting Ghoul
	166489, -- Needleback Pup
	166491, -- Albino Duskwatcher
	166492, -- Shadefeather Hatchling
	166493, -- Firesting Buzzer
	166494, -- Lord Woofington
	166495, -- Tonguelasher
	166498, -- Scritches
	166499, -- Thunderscale Whelpling
	166500, -- Crimson Octopode
	166528, -- Nightwreathed Watcher
	166714, -- Albatross Feather
	166715, -- Rebuilt Gorilla Bot
	166716, -- Pair of Tiny Bat Wings
	166718, -- Cobalt Raven Hatchling
	166719, -- Violet Abyssal Eel
	166723, -- Rebuilt Mechanical Spider
	167804, -- Slimy Sea Slug
	167805, -- Slimy Otter
	167806, -- Slimy Octopode
	167807, -- Slimy Fangtooth
	167808, -- Slimy Eel
	167809, -- Slimy Darkhunter
	167810, -- Slimy Hermit Crab
	169879, -- Melted Irradiated Undercoat
	170072, -- Armored Vaultbot
	170102, -- Burnout
	172016, -- Lil' Nefarian
	172491, -- Papi
	172493, -- Snarling Butterfly Crate
	173726, -- Box With Faintly Glowing 'Air' Holes
	174446, -- Fractured Obsidian Claw
	174448, -- Aqir Hivespawn
	174449, -- Ra'kim
	174452, -- Eye of Corruption
	174456, -- Bottle of Gloop
	174457, -- C'Thuffer
	174458, -- Void-Scarred Hare
	174459, -- Voidwoven Cat Collar
	174460, -- Box Labeled \"Danger: Void Rat Inside\"
	174461, -- Swirling Black Bottle
	174462, -- Void Cocoon
	174463, -- Reek
	174473, -- K'uddly
	174474, -- Corrupted Tentacle
	174475, -- Stinky Sack
	174476, -- Black Chitinous Plate
	174478, -- Wicked Lurker
	174479, -- Jade Defender
	174481, -- Cursed Dune Watcher
	174646, -- Void-Link Frostwolf Collar
	174827, -- Wailing Lasher
	174828, -- Experiment 13
	174829, -- Tinyclaw
	174925, -- Void Tendril Pet Leash
	175049, -- Shadowbarb Hatchling
	175114, -- Renny
	178533, -- Shaking Pet Carrier
	180591, -- Vial of Roiling Emotions
	181271, -- Sludge Feeler
	181282, -- Mu'dud
	181555, -- Sinheart
	182663, -- Trootie
	183412, -- Death Seeker
	183601, -- Jiggles
	183621, -- Putrid Geist
	183623, -- Spinemaw Gormling
	184350, -- Ruffle
	184400, -- Courage
	184509, -- Spriggan Trickster
	185919, -- Flawless Amethyst Baubleworm
	186556, -- Timeless Mechanical Dragonling
	188679, -- Lightless Tormentor
	191126, -- Obsidian Whelpling
	193071, -- Pistachio
	193908, -- Kobaldt
	194098, -- Lord Basilton
	198353, -- Shiverweb Egg
	200927, -- Petal
	201441, -- Scout
	201703, -- Pinkie
	206018, -- Baa'lial Soulstone
	206174, -- Blub
	208008, -- Doomrubble
	208446, -- Fyrn
	208543, -- Lil' Frostwing
	208751, -- Squally
	210347, -- Sergeant Quackers
	210409, -- Aura
	210505, -- Reverie
	210522, -- Blueloo
	210553, -- Dreamborne Scarab
	210555, -- Dreamhoof
	210556, -- Ivy
	210567, -- Memorie
	210570, -- Napps
	210571, -- Snoozles
	210633, -- Kal'andu
	210648, -- Seedle
	210651, -- Dustite
	210652, -- Somnolet
	210689, -- Snoots
	210690, -- Elmer
	210691, -- Spruce
	210692, -- Juniper
	210777, -- Drowsey
	210785, -- Snorr
	210870, -- Mitzy
	210964, -- Lil' Wrathion
	217043, -- Pokee
	218086, -- Remembered Riverpaw
	218245, -- Remembered Construct
	224259, -- Flash
	224260, -- Thundo
	224261, -- Gale
	224406, -- Misty
	224410, -- Craggles
	228740, -- Gizmo the Pure
	231294, -- Reven
	231356, -- Specter
	235794, -- Eye of Chaos
	235980, -- Scourge of the Aspects
	235988, -- Parley
	235989, -- Parley
	239019, -- Mean-Ball Ball Bag
	239699, -- Tidbit
	239705, -- Morsel
	240840, -- Niblet
	243158, -- Ixthal the Observling
	244467, -- Veridian Thorntail
	244468, -- Scrappy Thorntail
	244907, -- Dread Horrorling
	244909, -- Impartial Watcher
	244910, -- Penumbral Terror
	244911, -- Rhay'Dahr
	244913, -- Looker Gaz'kreth Jr.
	244914, -- Xanthous Siphonmite
	244915, -- Jimmy
	244916, -- Cyan Siphonmite
	245212, -- Vitriolic Inchshifter
	245214, -- Palek'ti, the Mouth of Nothingness
	245215, -- Shimmering Inchshifter
	245252, -- Graceful Cosmic Ray Pup
	245253, -- Inquisitive Cosmic Ray Pup
	245254, -- Duskthief
	245255, -- Starlight
	245256, -- Sao'rhon
	245269, -- Mr. Long-Legs
	245272, -- Heka'Tarnos, Bringer of Discord
	245273, -- Copper Lapbug
	245274, -- Cerulean Lapbug
	246694, -- Zo'ya
	250863, -- Naloki
	252301, -- Warden's Companion
	254876, -- P.O.S.T. Assistant
	255151, -- Scruffbeak
	258903, -- Percival
	259337, -- Munchy
	259991, -- Lil' Preyseeker
	260585, -- Linda the Lucky
	260730, -- Perturbed Sporebat
	262762, -- Grumpy Mandrake
	262763, -- Plump Mandrake
	262768, -- Sleepy Mandrake
	262769, -- Screechy Mandrake
	265030, -- Kai
	-- Miscellaneous > Holiday
	21267, -- Toasting Goblet
	21536, -- Elune Stone
	21558, -- Small Blue Rocket
	21561, -- Small White Rocket
	21562, -- Small Yellow Rocket
	21571, -- Blue Rocket Cluster
	21574, -- Green Rocket Cluster
	21578, -- Yellow Rocket Cluster
	21589, -- Large Blue Rocket
	21590, -- Large Green Rocket
	21592, -- Large Red Rocket
	21593, -- Large White Rocket
	21713, -- Elune's Candle
	21714, -- Large Blue Rocket Cluster
	21718, -- Large Red Rocket Cluster
	21747, -- Festival Firecracker
	21829, -- Perfume Bottle
	21830, -- Empty Wrapper
	21831, -- Wrappered Gift
	21833, -- Cologne Bottle
	21960, -- Handmade Woodcraft
	22117, -- Pledge of Loyalty: Stormwind
	22119, -- Pledge of Loyalty: Ironforge
	22120, -- Pledge of Loyalty: Darnassus
	22121, -- Pledge of Loyalty: Undercity
	22122, -- Pledge of Loyalty: Thunder Bluff
	22123, -- Pledge of Loyalty: Orgrimmar
	22131, -- Stormwind Gift Collection
	22132, -- Ironforge Gift Collection
	22133, -- Darnassus Gift Collection
	22134, -- Undercity Gift Collection
	22135, -- Thunder Bluff Gift Collection
	22136, -- Orgrimmar Gift Collection
	22140, -- Sentinel's Card
	22141, -- Ironforge Guard's Card
	22142, -- Grunt's Card
	22143, -- Stormwind Guard's Card
	22144, -- Bluffwatcher's Card
	22145, -- Guardian's Moldy Card
	22159, -- Pledge of Friendship: Darnassus
	22160, -- Pledge of Friendship: Ironforge
	22161, -- Pledge of Friendship: Orgrimmar
	22162, -- Pledge of Friendship: Thunder Bluff
	22163, -- Pledge of Friendship: Undercity
	22167, -- Gift of Friendship: Darnassus
	22168, -- Gift of Friendship: Ironforge
	22169, -- Gift of Friendship: Orgrimmar
	22170, -- Gift of Friendship: Stormwind
	22171, -- Gift of Friendship: Thunder Bluff
	22172, -- Gift of Friendship: Undercity
	22173, -- Dwarven Homebrew
	22174, -- Romantic Poem
	22175, -- Freshly Baked Pie
	22176, -- Homemade Bread
	22177, -- Freshly Picked Flowers
	22178, -- Pledge of Friendship: Stormwind
	22261, -- Love Fool
	22262, -- Alliance Gift Collection
	22263, -- Horde Gift Collection
	22283, -- Sack of Homemade Bread
	22284, -- Bundle of Cards
	22285, -- Stormwind Pledge Collection
	22286, -- Ironforge Pledge Collection
	22287, -- Parcel of Cards
	22288, -- Case of Homebrew
	22289, -- Stack of Cards
	22290, -- Darnassus Pledge Collection
	22291, -- Box of Woodcrafts
	22292, -- Box of Fresh Pies
	22293, -- Package of Cards
	22294, -- Orgrimmar Pledge Collection
	22295, -- Satchel of Cards
	22296, -- Basket of Flowers
	22297, -- Thunder Bluff Pledge Collection
	22298, -- Book of Romantic Poems
	22299, -- Sheaf of Cards
	22300, -- Undercity Pledge Collection
	34171, -- Winter Stationery
	34191, -- Handful of Snowflakes
	34684, -- Handful of Summer Petals
	53641, -- Ice Chip
	116648, -- Manufactured Love Prism
	116651, -- True Love Prism
	116856, -- \"Blooming Rose\" Contender's Costume
	116888, -- \"Night Demon\" Contender's Costume
	116889, -- \"Purple Phantom\" Contender's Costume
	116890, -- \"Santo's Sun\" Contender's Costume
	116891, -- \"Snowy Owl\" Contender's Costume
	129929, -- Ever-Shifting Mirror
	150740, -- Beanie Boomie
	165657, -- Free T-Shirt
	166746, -- Fire Eater's Hearthstone
	187422, -- Rockin' Rollin' Racer Customizer 19.9.3
	191925, -- Falling Star Flinger
	208825, -- Junior Timekeeper's Racing Belt
	210656, -- Winter Veil Socks
	210965, -- Single-Use Bouquet
	218308, -- Winter Veil Cracker
	218310, -- Box of Puntables
	255973, -- Sandbox Horse
	258129, -- Jade Monument
	258135, -- Gilded Coil Spire
	258136, -- Azure Thunder Coil Pillar
	-- Miscellaneous > Mount
	44221, -- Loaned Gryphon Reins
	44229, -- Loaned Wind Rider Reins
	-- Miscellaneous > Other
	1973, -- Orb of Deception
	2460, -- Elixir of Tongues
	6643, -- Bloated Smallfish
	6645, -- Bloated Mud Snapper
	6647, -- Bloated Catfish
	8366, -- Bloated Trout
	9279, -- White Punch Card
	9280, -- Yellow Punch Card
	9281, -- Red Punch Card
	9282, -- Blue Punch Card
	9316, -- Prismatic Punch Card
	13881, -- Bloated Redgill
	21162, -- Bloated Oily Blackmouth
	21164, -- Bloated Rockscale Cod
	32566, -- Picnic Basket
	33223, -- Fishing Chair
	35286, -- Bloated Giant Sunfish
	44680, -- Assorted Writings
	63109, -- Black Trilobite
	63110, -- Worn Hunting Knife
	63111, -- Wooden Whistle
	63112, -- Bone Gaming Dice
	63113, -- Belt Buckle with Anvilmar Crest
	63115, -- Zandalari Voodoo Doll
	63118, -- Lizard Foot Charm
	63120, -- Fetish of Hir'eek
	63121, -- Beautiful Preserved Fern
	63129, -- Highborne Pyxis
	63130, -- Inlaid Ivory Comb
	63131, -- Scandalous Silk Nightgown
	63407, -- Cloak Clasp with Antlers
	63408, -- Pewter Drinking Cup
	63409, -- Ceramic Funeral Urn
	63410, -- Stone Gryphon
	63411, -- Silver Neck Torc
	63412, -- Jade Asp with Ruby Eyes
	63413, -- Feathered Gold Earring
	63414, -- Moltenfist's Jeweled Goblet
	63523, -- Eerie Smolderthorn Idol
	63524, -- Cinnabar Bijou
	63525, -- Coin from Eldre'Thalas
	63526, -- Shattered Glaive
	63527, -- Twisted Ammonite Shell
	63528, -- Green Dragon Ring
	64337, -- Notched Sword of Tunadil the Redeemer
	64339, -- Bodacious Door Knocker
	64340, -- Boot Heel with Scrollwork
	64342, -- Golden Chamber Pot
	64343, -- Winged Helm of Corehammer
	64344, -- Ironstar's Petrified Shield
	64345, -- Skull-Shaped Planter
	64346, -- Bracelet of Jade and Coins
	64347, -- Gahz'rilla Figurine
	64348, -- Atal'ai Scepter
	64349, -- Devilsaur Tooth
	64350, -- Insect in Amber
	64354, -- Kaldorei Amphora
	64355, -- Ancient Shark Jaws
	64356, -- Hairpin of Silver and Malachite
	64357, -- Delicate Music Box
	64358, -- Highborne Soul Mirror
	64361, -- Druid and Priest Statue Set
	64362, -- Dented Shield of Horuz Killcrow
	64366, -- Scorched Staff of Shadow Priest Anund
	64367, -- Scepter of Charlga Razorflank
	64368, -- Mithril Chain of Angerforge
	64371, -- Skull Staff of Shadowforge
	64373, -- Chalice of the Mountain Kings
	64374, -- Tooth with Gold Filling
	64375, -- Drakkari Sacrificial Knife
	64378, -- String of Small Pink Pearls
	64379, -- Chest of Tiny Glass Animals
	64381, -- Cracked Crystal Vial
	64382, -- Scepter of Xavius
	64383, -- Kaldorei Wind Chimes
	64385, -- Feathered Raptor Arm
	64387, -- Vicious Ancient Fish
	64389, -- Tiny Bronze Scorpion
	64417, -- Maul of Stone Guard Mur'og
	64418, -- Gray Candle Stub
	64419, -- Rusted Steak Knife
	64420, -- Scepter of Nekros Skullcrusher
	64421, -- Fierce Wolf Figurine
	64436, -- Fiendish Whip
	64437, -- Tile of Glazed Clay
	64438, -- Skull Drinking Cup
	64440, -- Anklet with Golden Bells
	64442, -- Carved Harp of Exotic Wood
	64443, -- Strange Silver Paperweight
	64444, -- Scepter of the Nathrezim
	64453, -- Baroque Sword Scabbard
	64454, -- Fine Crystal Candelabra
	64455, -- Dignified Portrait
	64456, -- Arrival of the Naaru
	64457, -- The Last Relic of Argus
	64458, -- Plated Elekk Goad
	64459, -- Intricate Treasure Chest Key
	64461, -- Scramseax
	64462, -- Flint Striker
	64464, -- Fanged Cloak Pin
	64467, -- Thorned Necklace
	64468, -- Proto-Drake Skeleton
	64473, -- Imprint of a Kraken Tentacle
	64474, -- Spidery Sundial
	64475, -- Scepter of Nezar'Azret
	64476, -- Infested Ruby Ring
	64477, -- Gruesome Heart Box
	64478, -- Six-Clawed Cornice
	64479, -- Ewer of Jormungar Blood
	64480, -- Vizier's Scrawled Streamer
	64483, -- Silver Kris of Korl
	64484, -- Warmaul of Burningeye
	64485, -- Spiked Gauntlets of Anvilrage
	64486, -- Word of Empress Zoe
	64487, -- Scepter of Bronzebeard
	64647, -- Carcanet of the Hundred Magi
	64648, -- Silver Scroll Case
	64650, -- Umbra Crescent
	64652, -- Castle of Sand
	64653, -- Cat Statue with Emerald Eyes
	64654, -- Soapstone Scarab Necklace
	64655, -- Tiny Oasis Mosaic
	64656, -- Engraved Scimitar Hilt
	64657, -- Canopic Jar
	64658, -- Sketch of a Desert Palace
	64659, -- Pipe of Franclorn Forgewright
	66054, -- Dwarven Baby Socks
	66055, -- Necklace with Elune Pendant
	66056, -- Shard of Petrified Wood
	66057, -- Strange Velvet Worm
	66058, -- Fine Bloodscalp Dinnerware
	68806, -- Kalytha's Haunted Locket
	79104, -- Rusty Watering Can
	79896, -- Pandaren Tea Set
	79897, -- Pandaren Game Board
	79898, -- Twin Stein Set
	79899, -- Walking Cane
	79900, -- Empty Keg
	79901, -- Carved Bronze Mirror
	79902, -- Gold-Inlaid Figurine
	79903, -- Apothecary Tins
	79904, -- Pearl of Yu'lon
	79905, -- Standard of Niuzao
	79906, -- Umbrella of Chi-Ji
	79907, -- Spear of Xuen
	79908, -- Manacles of Rebellion
	79909, -- Cracked Mogu Runestone
	79910, -- Terracotta Arm
	79911, -- Petrified Bone Whip
	79912, -- Thunder King Insignia
	79913, -- Edicts of the Thunder King
	79914, -- Iron Amulet
	79915, -- Warlord's Branding Iron
	79916, -- Mogu Coin
	79917, -- Worn Monument Ledger
	80513, -- Vintage Bug Sprayer
	86591, -- Magic Banana
	87528, -- Honorary Brewmaster Keg
	88566, -- Krastinov's Bag of Horrors
	89183, -- Pristine Apothecary Tins
	89815, -- Master Plow
	89880, -- Dented Shovel
	92061, -- Laborer's Tool
	92472, -- Soggy Journal
	92584, -- Expensive Ruby
	92585, -- Expensive Ruby
	92586, -- Sparkling Sapphire
	92587, -- Sparkling Sapphire
	92588, -- Jade Kitten Figurine
	92589, -- Jade Kitten Figurine
	92608, -- Golden Potion
	92610, -- Golden Platter
	92612, -- Zena's Ridiculously Rich Yarnball
	92613, -- Zena's Ridiculously Rich Yarnball
	92614, -- Taric's Assorted Jewels
	92616, -- Golden Fruit Bowl
	92618, -- Ornate Portrait
	92620, -- A Frayed Knot
	92622, -- Ancient Orcish Shield
	92623, -- Ancient Orcish Shield
	92624, -- Theldren's Rusted Runeblade
	92625, -- Theldren's Rusted Runeblade
	92751, -- Spirit-Kissed Water
	93962, -- Heavy Explosives
	94130, -- Incantation of Haqin
	94233, -- Incantation of Deng
	95350, -- Incantation of Vu
	95375, -- Banner of the Mantid Empire
	95376, -- Ancient Sap Feeder
	95377, -- The Praying Mantid
	95378, -- Inert Sound Beacon
	95379, -- Remains of a Paragon
	95380, -- Mantid Lamp
	95381, -- Pollen Collector
	95382, -- Kypari Sap Container
	97919, -- Whole-Body Shrinka'
	97921, -- Bom'bay's Color-Seein' Sauce
	97948, -- Surplus Supplies
	97949, -- Surplus Supplies
	97950, -- Surplus Supplies
	97951, -- Surplus Supplies
	97952, -- Surplus Supplies
	97953, -- Surplus Supplies
	97954, -- Surplus Supplies
	97955, -- Surplus Supplies
	97956, -- Surplus Supplies
	97957, -- Surplus Supplies
	101529, -- Celestial Coin
	101537, -- Timeless Coin
	104328, -- Cauterizing Core
	107459, -- Black Iron Fragment
	107474, -- PH_6 Engorged Innards
	107694, -- Lunarfall Inn, Level 2
	108595, -- Recall Stone
	109062, -- Mage Tower, Level 2
	109063, -- Mage Tower, Level 3
	109065, -- Lunarfall Inn, Level 3
	109254, -- Lumber Mill, Level 2
	109255, -- Lumber Mill, Level 3
	109256, -- Engineering Works, Level 2
	109257, -- Engineering Works, Level 3
	109258, -- Engineering Works, Level 1
	109576, -- Lunarfall Excavation, Level 2
	109577, -- Herb Garden, Level 2
	109578, -- Fishing Shack
	111810, -- Barracks, Level 1
	111813, -- The Forge, Level 1
	111814, -- Gem Boutique, Level 1
	111815, -- Scribe's Quarters, Level 1
	111816, -- Tailoring Emporium, Level 1
	111817, -- Enchanter's Study, Level 1
	111818, -- The Tannery, Level 1
	111924, -- Gnomish Gearworks, Level 1
	111927, -- Fishing Shack, Level 2
	111928, -- Fishing Shack, Level 3
	111929, -- Alchemy Lab, Level 2
	111930, -- Alchemy Lab, Level 3
	111956, -- Barracks, Level 1
	111957, -- Salvage Yard, Level 1
	111958, -- Storehouse, Level 1
	111959, -- Barn, Level 1
	111960, -- Lunarfall Inn, Level 1
	111961, -- Lumber Mill, Level 1
	111962, -- Gladiator's Sanctum, Level 1
	111963, -- Trading Post, Level 1
	111964, -- Dwarven Bunker, Level 1
	111965, -- Mage Tower, Level 1
	111966, -- Dwarven Bunker, Level 2
	111967, -- Dwarven Bunker, Level 3
	111968, -- Barn, Level 2
	111969, -- Barn, Level 3
	111970, -- Barracks, Level 2
	111971, -- Barracks, Level 3
	111972, -- Enchanter's Study, Level 2
	111973, -- Enchanter's Study, Level 3
	111974, -- Gem Boutique, Level 2
	111975, -- Gem Boutique, Level 3
	111976, -- Salvage Yard, Level 2
	111977, -- Salvage Yard, Level 3
	111978, -- Scribe's Quarters, Level 2
	111979, -- Scribe's Quarters, Level 3
	111980, -- Gladiator's Sanctum, Level 2
	111981, -- Gladiator's Sanctum, Level 3
	111982, -- Storehouse, Level 2
	111983, -- Storehouse, Level 3
	111984, -- Gnomish Gearworks, Level 2
	111985, -- Gnomish Gearworks, Level 3
	111986, -- Trading Post, Level 2
	111987, -- Trading Post, Level 3
	111988, -- The Tannery, Level 2
	111989, -- The Tannery, Level 3
	111990, -- The Forge, Level 2
	111991, -- The Forge, Level 3
	111992, -- Tailoring Emporium, Level 2
	111993, -- Tailoring Emporium, Level 3
	111996, -- Lunarfall Excavation, Level 3
	111997, -- Herb Garden, Level 3
	111998, -- Menagerie, Level 2
	111999, -- Menagerie, Level 3
	112001, -- Stables, Level 1
	112002, -- Stables, Level 2
	112003, -- Stables, Level 3
	112186, -- Fish Shipment
	112571, -- Fishing for Bait
	112572, -- Cavedweller
	112995, -- Slimy Ring
	112996, -- Glistening Ring
	112998, -- Diamond Ring
	112999, -- Sapphire Ring
	113004, -- Locket of Dreams
	113005, -- Chain of Hopes
	113137, -- Mine Guards
	113138, -- Lunarfall Excavation
	113188, -- Mining Carts
	113265, -- Rock Crusher
	113478, -- Abandoned Medic Kit
	113991, -- Iron Trap
	114141, -- Fang-Scarred Frostwolf Axe
	114143, -- Frostwolf Ancestry Scrimshaw
	114145, -- Wolfskin Snowshoes
	114147, -- Warsinger's Drums
	114149, -- Screaming Bullroarer
	114151, -- Warsong Ceremonial Pike
	114153, -- Metalworker's Hammer
	114155, -- Elemental Bellows
	114157, -- Blackrock Razor
	114159, -- Weighted Chopping Axe
	114161, -- Hooked Dagger
	114163, -- Barbed Fishing Hook
	114165, -- Calcified Eye In a Jar
	114167, -- Ceremonial Tattoo Needles
	114169, -- Cracked Ivory Idol
	114171, -- Ancestral Talisman
	114173, -- Flask of Blazegrease
	114175, -- Gronn-Tooth Necklace
	114177, -- Doomsday Prophecy
	114181, -- Stonemaul Succession Stone
	114183, -- Stone Manacles
	114185, -- Ogre Figurine
	114187, -- Pictogram Carving
	114189, -- Gladiator's Shield
	114190, -- Mortar and Pestle
	114191, -- Eye of Har'gunn the Blind
	114192, -- Stone Dentures
	114193, -- Rylak Riding Harness
	114194, -- Imperial Decree Stele
	114195, -- Sorcerer-King Toe Ring
	114196, -- Warmaul of the Warmaul Chieftain
	114197, -- Dreamcatcher
	114198, -- Burial Urn
	114199, -- Decree Scrolls
	114200, -- Solar Orb
	114201, -- Sundial
	114202, -- Talonpriest Mask
	114203, -- Outcast Dreamcatcher
	114204, -- Apexis Crystal
	114205, -- Apexis Hieroglyph
	114206, -- Apexis Scroll
	114207, -- Beakbreaker of Terokk
	114629, -- Proximity Alarm-o-Bot 2000
	115009, -- Improved Iron Trap
	115010, -- Deadly Iron Trap
	115467, -- Barkskin Tome
	115471, -- NC-17 Sonic \"Boom\" Box
	115530, -- N.U.K.U.L.A.R. Target Painter
	116139, -- Haunting Memento
	116184, -- War Mill, Level 1
	116186, -- War Mill, Level 3
	116196, -- Spirit Lodge, Level 2
	116197, -- Spirit Lodge, Level 3
	116198, -- Spirit Lodge, Level 1
	116199, -- Goblin Workshop, Level 1
	116200, -- Goblin Workshop, Level 2
	116201, -- Goblin Workshop, Level 3
	116247, -- Frostwall Mines
	116248, -- Frostwall Mines, Level 2
	116415, -- Shiny Pet Charm
	116431, -- Frostwall Tavern, Level 2
	116432, -- Frostwall Tavern, Level 3
	116433, -- Frostwall Tavern, Level 1
	116441, -- Highly Enriched Blixtherium Shells
	118193, -- Mysterious Shining Lockbox
	118197, -- Auction Memory Socket
	118215, -- Book of Garrison Blueprints
	118265, -- Echoing Betrayal
	118331, -- Auction Connecting Valve
	118332, -- Auction A.D.D.O.N.S Installer
	118333, -- Universal Language Compensator
	118334, -- Universal Language Filter
	118335, -- Universal Language Repository
	118336, -- Super Cooling Regulator
	118337, -- Super Cooling Tubing
	118338, -- Super Cooling Coolant
	118339, -- Super Cooling Pump
	118340, -- Cyclical Power Converter
	118341, -- Cyclical Power Housing
	118342, -- Cyclical Power Framing
	118343, -- Cyclical Power Sequencer
	118344, -- Arcane Crystal Casing
	118345, -- Arcane Crystal Conduit
	118346, -- Arcane Crystal Amplifier
	118347, -- Arcane Crystal Focusing Lens
	118592, -- Partial Receipt: Gizmothingies
	119023, -- Merchant Order
	119027, -- Small Merchant Order
	119028, -- Large Merchant Order
	119032, -- Rusted Challenger's Strongbox
	119036, -- Box of Storied Treasures
	119037, -- Supply of Storied Rarities
	119040, -- Cache of Mingled Treasures
	119041, -- Strongbox of Mysterious Treasures
	119042, -- Crate of Valuable Treasures
	119043, -- Trove of Smoldering Treasures
	119094, -- Partial Receipt: Flask of Funk
	119095, -- Partial Receipt: Tailored Underwear
	119096, -- Partial Receipt: Book of Troll Poetry
	119097, -- Partial Receipt: Gently-Used Bandages
	119098, -- Partial Receipt: Druidskin Rug
	119099, -- Partial Receipt: Chainmail Socks
	119100, -- Partial Receipt: Pickled Red Herring
	119101, -- Partial Receipt: Invisible Dust
	119102, -- Partial Receipt: True Iron Door Handles
	119185, -- Expired Receipt
	119215, -- Robo-Gnomebulator
	119439, -- Personal Voodoo Doll
	119440, -- Training Shoes
	119447, -- Training Wheels
	122119, -- Everlasting Darkmoon Firework
	122120, -- Gaze of the Darkmoon
	122121, -- Darkmoon Gazer
	122123, -- Darkmoon Ring-Flinger
	122124, -- Darkmoon Cannon
	122128, -- Checkered Flag
	122129, -- Fire-Eater's Vial
	122191, -- Bloody Stack of Invitations
	122274, -- Tome of Knowledge
	122342, -- Auxiliary Scouting Report
	122579, -- Rush Orders Ledger
	122606, -- Explorer's Notebook
	122681, -- Sternfathom's Pet Journal
	123961, -- Recipe List: Leysmithing
	123962, -- Recipe List: Hardened Leystone
	123963, -- Recipe List: Masterwork Demonsteel
	124099, -- Blackfang Claw
	126900, -- Ship Blueprint: Destroyer
	126947, -- Nal'ryssa's Spare Mining Supplies
	127267, -- Ship Blueprint: Carrier
	127268, -- Ship Blueprint: Transport
	127270, -- Ship Blueprint: Submarine
	127693, -- Wraith Zapper Rifle
	127831, -- Challenger's Strongbox
	127861, -- Cave Mushroom Chair
	128025, -- Rattling Iron Cage
	128319, -- Void-Shrouded Satchel
	128322, -- Captain's Skiff
	128379, -- Piece of Meat
	128513, -- Anniversary Gift
	128636, -- Endothermic Blaster
	128650, -- \"Merry Munchkin\" Costume
	128658, -- Spooky Supplies
	128659, -- Merry Supplies
	128660, -- Ghoulish Guises
	128661, -- Hallow's Glow
	128662, -- Seer's Invitation
	128663, -- Witch's Brew
	128664, -- Creepy Crawlers
	128665, -- Ball of Tangled Lights
	128666, -- Imported Trees
	128667, -- Little Helpers
	128668, -- Festive Outfits
	128669, -- Old Box of Decorations
	128670, -- Savage Gift
	128794, -- Sack of Spectral Spiders
	129055, -- Shoe Shine Kit
	129057, -- Dalaran Disc
	129093, -- Ravenbear Disguise
	129113, -- Faintly Glowing Flagon of Mead
	129165, -- Barnacle-Encrusted Gem
	129190, -- Rope of Friendship
	129295, -- Spike-Toed Booterang
	130151, -- The \"Devilsaur\" Lunchbox
	130169, -- Tournament Favor
	130171, -- Cursed Orb
	130209, -- Never Ending Toy Chest
	130214, -- Worn Doll
	130249, -- Waywatcher's Boon
	130867, -- Tag Toy
	130906, -- Violetglass Vessel
	130907, -- Inert Leystone Charm
	130908, -- Quietwine Vial
	130909, -- Pre-War Highborne Tapestry
	130910, -- Nobleman's Letter Opener
	130911, -- Trailhead Drum
	130912, -- Moosebone Fish-Hook
	130913, -- Hand-Smoothed Pyrestone
	130914, -- Drogbar Gem-Roller
	130915, -- Stonewood Bow
	130916, -- Imp's Cup
	130917, -- Flayed-Skin Chronicle
	130918, -- Malformed Abyssal
	130919, -- Orb of Inner Chaos
	130920, -- Houndstooth Hauberk
	131717, -- Starlight Beacon
	131724, -- Crystalline Eye of Undravius
	131811, -- Rocfeather Skyhorn Kite
	131900, -- Majestic Elderhorn Hoof
	131933, -- Critter Hand Cannon
	132118, -- Aggramar's Blessing
	132132, -- Glowing Runestone
	133511, -- Gurboggle's Gleaming Bauble
	133804, -- Faded Bag of Loot
	133997, -- Black Ice
	134019, -- Don Carlos' Famous Hat
	134022, -- Burgy Blackheart's Handsome Hat
	134831, -- Doomsayer's Robes
	134860, -- Peddlefeet's Buffing Creme
	136360, -- Crystalline Demonic Eye
	136362, -- Ancient War Remnants
	136381, -- Elaborately-Carved Key
	136383, -- Ravencrest Cache
	136855, -- Hunter's Call
	137560, -- Dreamweaver Provisions
	137561, -- Highmountain Tribute
	137562, -- Valarjar Cache
	137563, -- Farondis Lockbox
	137564, -- Nightfallen Hoard
	137565, -- Warden's Field Kit
	137604, -- Unstable Riftstone
	137663, -- Soft Foam Sword
	138111, -- Stormforged Grapple Launcher
	138114, -- Gloaming Frenzy
	138393, -- Essence Swapper
	138873, -- Mystical Frosh Hat
	138878, -- Copy of Daglop's Contract
	139284, -- Anniversary Gift
	139337, -- Disposable Winter Veil Suits
	139467, -- Satchel of Spoils
	139590, -- Scroll of Teleport: Ravenholdt
	139591, -- Stolen Tome of Artifact Lore
	139773, -- Emerald Winds
	139781, -- Marin Noggenfogger's Lucky Coin
	140216, -- Eagle Feather
	140755, -- Life-Like Magistrix Doll
	140756, -- Baby's Doll
	140780, -- Fal'dorei Egg
	140786, -- Ley Spider Eggs
	141005, -- Vial of Hippogryph Pheromones
	141028, -- Grimoire of Knowledge
	141155, -- Challenger's Spoils
	141156, -- Haunted Ravencrest Keepsake
	141157, -- Nightborne Rucksack
	141158, -- Despoiled Keeper's Cache
	141159, -- Watertight Salvage Bag
	141160, -- Seaweed-Encrusted Satchel
	141161, -- Cache of the Black Dragon
	141162, -- Unmarked Suramar Vault Crate
	141163, -- Bag of Confiscated Materials
	141164, -- Violet Hold Contraband Locker
	141165, -- Challenger's Spoils
	141166, -- Haunted Ravencrest Keepsake
	141167, -- Nightborne Rucksack
	141168, -- Despoiled Keeper's Cache
	141169, -- Watertight Salvage Bag
	141170, -- Seaweed-Encrusted Satchel
	141171, -- Cache of the Black Dragon
	141172, -- Unmarked Suramar Vault Crate
	141173, -- Bag of Confiscated Materials
	141174, -- Violet Hold Contraband Locker
	141175, -- Challenger's Spoils
	141176, -- Haunted Ravencrest Keepsake
	141177, -- Nightborne Rucksack
	141178, -- Despoiled Keeper's Cache
	141179, -- Watertight Salvage Bag
	141180, -- Seaweed-Encrusted Satchel
	141181, -- Cache of the Black Dragon
	141182, -- Unmarked Suramar Vault Crate
	141183, -- Bag of Confiscated Materials
	141184, -- Violet Hold Contraband Locker
	141296, -- Ancient Mana Basin
	141297, -- Arcano-Shower
	141298, -- Displacer Meditation Stone
	141299, -- Kaldorei Light Globe
	141300, -- Magi Focusing Crystal
	141301, -- Unstable Powder Box
	141306, -- Wisp in a Bottle
	141331, -- Vial of Green Goo
	141350, -- Kirin Tor Chest
	141605, -- Flight Master's Whistle
	141649, -- Set of Matches
	141652, -- Mana Divining Stone
	141879, -- Berglrgl Perrgl Girggrlf
	142250, -- Aegwynn and the Dragon Hunt
	142262, -- Electrified Key
	142265, -- Big Red Raygun
	142342, -- Glittering Pack
	142361, -- Ivory Talon
	142452, -- Lingering Wyrmtongue Essence
	142494, -- Purple Blossom
	142495, -- Fake Teeth
	142496, -- Dirty Spoon
	142497, -- Tiny Pack
	142542, -- Tome of Town Portal
	142545, -- Small Charm of Life
	142546, -- Small Charm of Inertia
	142547, -- Large Charm of Strength
	142548, -- Large Charm of Dexterity
	142549, -- Serpent's Grand Charm
	142551, -- Stalwart's Grand Charm
	143326, -- Stone of Jordan
	143534, -- Wand of Simulated Life
	143606, -- Satchel of Battlefield Spoils
	143607, -- Soldier's Footlocker
	143628, -- Blank Diabolic Tome
	143827, -- Red Dragon Head Costume
	143828, -- Red Dragon Body Costume
	143829, -- Red Dragon Tail Costume
	144031, -- Hardened Shovel
	144339, -- Sturdy Love Fool
	145273, -- The Birth of the Lich King
	145275, -- Icecrown and the Frozen Throne
	145277, -- Aftermath of the Second War
	145278, -- Beyond the Dark Portal
	145279, -- The Kaldorei and the Well of Eternity
	145280, -- Sargeras and the Betrayal
	145281, -- The Old Gods and the Ordering of Azeroth
	145283, -- The War of the Ancients
	145284, -- Mount Hyjal and Illidan's Gift
	145286, -- Exile of the High Elves
	145287, -- The Sentinels and the Long Vigil
	145288, -- The Founding of Quel'Thalas
	145289, -- Arathor and the Troll Wars
	145290, -- The Guardians of Tirisfal
	145291, -- Ironforge - the Awakening of the Dwarves
	145292, -- The Seven Kingdoms
	145293, -- War of the Three Hammers
	145295, -- Kil'jaeden and the Shadow Pact
	145296, -- Rise of the Horde
	145297, -- The Dark Portal and the Fall of Stormwind
	145298, -- The Alliance of Lordaeron
	145299, -- The Invasion of Draenor
	145300, -- The Battle of Grim Batol
	145301, -- Lethargy of the Orcs
	145302, -- The New Horde
	145303, -- Kel'Thuzad and the Forming of the Scourge
	145304, -- The Scourge of Lordaeron
	145305, -- Sunwell - The Fall of Quel'Thalas
	145306, -- Archimonde's Return and the Flight to Kalimdor
	145307, -- The Betrayer Ascendant
	145308, -- Rise of the Blood Elves
	145309, -- Civil War in the Plaguelands
	145310, -- The Lich King Triumphant
	145311, -- Old Hatreds - The Colonization of Kalimdor
	145312, -- The Twin Empires
	145313, -- Empires' Fall
	145314, -- Wrath of Soulflayer
	146747, -- Dreamweaver Provisions
	146748, -- Highmountain Tribute
	146749, -- Valarjar Cache
	146750, -- Farondis Lockbox
	146751, -- Nightfallen Hoard
	146752, -- Warden's Field Kit
	146753, -- Kirin Tor Chest
	146897, -- Farondis Chest
	146898, -- Dreamweaver Cache
	146899, -- Highmountain Supplies
	146900, -- Nightfallen Cache
	146901, -- Valarjar Strongbox
	146902, -- Warden's Supply Kit
	147361, -- Legionfall Chest
	147384, -- Legionfall Recompense
	147446, -- Brawler's Footlocker
	147496, -- Fel Heart of Argus
	147717, -- Chipped Demonic Key Stone
	147832, -- Magical Saucer
	147867, -- Pilfered Sweeper
	151016, -- Fractured Necrolyte Skull
	151115, -- Mana-Cloaked Choker
	151146, -- Charmed Band
	151147, -- Charmed Pendant
	151148, -- Charmed Choker
	151149, -- Charmed Ring
	151150, -- Charmed Bracelet
	151151, -- Tacky Chronometer
	151158, -- Manaforged Worry-Chain
	151159, -- Managraphic Card
	151160, -- Elegant Manabraid
	151161, -- Subtle Chronometer
	151191, -- Old Bottle Cap
	151265, -- Blight Boar Microphone
	151270, -- Horse Tail Costume
	151271, -- Horse Head Costume
	151464, -- Dreamweaver Provisions
	151465, -- Highmountain Tribute
	151466, -- Valarjar Cache
	151467, -- Farondis Lockbox
	151468, -- Nightfallen Hoard
	151469, -- Warden's Field Kit
	151470, -- Kirin Tor Chest
	151471, -- Legionfall Recompense
	151473, -- Blighthead Fan Club Membership Card
	151756, -- Foil Blighthead Fan Club Card
	151830, -- Light's Judgment
	151875, -- Call to the Light
	151912, -- Shroud of Arcane Echoes
	151929, -- Vindicaar Teleport Beacon
	152098, -- Lightforged Warframe
	152102, -- Farondis Chest
	152103, -- Dreamweaver Cache
	152104, -- Highmountain Supplies
	152105, -- Nightfallen Cache
	152106, -- Valarjar Strongbox
	152107, -- Warden's Supply Kit
	152108, -- Legionfall Chest
	152469, -- Matrix Uplink
	152649, -- Legionfall Spoils
	152650, -- Scuffed Krokul Cache
	152652, -- Gilded Trunk
	152786, -- Call of the Devourer
	152890, -- Smashed Portal Generator
	152891, -- Power Cell
	152922, -- Brittle Krokul Chest
	152923, -- Gleaming Footlocker
	152940, -- Arc Circuit
	152941, -- Conductive Sheath
	152965, -- Vishax's Portal Generator
	152982, -- Vixx's Chest of Tricks
	152991, -- Fiend Bone
	152992, -- Imp Bone
	152993, -- Ur'zul Bone
	152999, -- Imp Meat
	153004, -- Unstable Portal Emitter
	153006, -- Grimoire of Lost Knowledge
	153013, -- Disgusting Feast
	153071, -- Gift of the All-Seer
	153124, -- Spire of Spite
	153126, -- Micro-Artillery Controller
	153179, -- Blue Conservatory Scroll
	153180, -- Yellow Conservatory Scroll
	153181, -- Red Conservatory Scroll
	153182, -- Holy Lightsphere
	153183, -- Barrier Generator
	153193, -- Baarut the Brisk
	153195, -- Uuna's Doll
	153204, -- All-Seer's Eye
	153226, -- Observer's Locus Resonator
	153253, -- S.F.E. Interceptor
	153293, -- Sightless Eye
	153574, -- Plain Hat Box
	154903, -- Dreamweaver Provisions
	154904, -- Highmountain Tribute
	154905, -- Valarjar Cache
	154906, -- Farondis Lockbox
	154907, -- Nightfallen Hoard
	154908, -- Warden's Field Kit
	154909, -- Kirin Tor Chest
	154910, -- Legionfall Spoils
	154911, -- Scuffed Krokul Cache
	154912, -- Gilded Trunk
	154913, -- Akun'Jar Vase
	154914, -- Urn of Passage
	154915, -- Rezan Idol
	154916, -- High Apothecary's Hood
	154917, -- Bwonsamdi Voodoo Mask
	154921, -- Ceremonial Bonesaw
	154922, -- Ancient Runebound Tome
	154923, -- Disembowling Sickle
	154924, -- Jagged Blade of the Drust
	154925, -- Ritual Fetish
	154926, -- Pristine Ceremonial Bonesaw
	154927, -- Pristine Ancient Runebound Tome
	154928, -- Pristine Disembowling Sickle
	154929, -- Pristine Jagged Blade of the Drust
	154930, -- Pristine Ritual Fetish
	154931, -- Pristine Akun'Jar Vase
	154932, -- Pristine Urn of Passage
	154933, -- Pristine Rezan Idol
	154934, -- Pristine High Apothecary's Hood
	154935, -- Pristine Bwonsamdi Voodoo Mask
	154991, -- Brawler's Footlocker
	156650, -- Much-Too-Hot Pepper
	156651, -- Golden Seeds
	156652, -- Centennial Blossom
	156655, -- Preserved Night Elf Head
	156836, -- Bulging Package
	156852, -- Ogmot's Dream Journal
	156871, -- Spitzy
	157772, -- A Royal Concern
	157775, -- A Royal Concern
	157776, -- Dire Missive
	157777, -- Report from Zuldazar
	157779, -- Infant Dino Kibble
	157780, -- Free-Range Dino Chow
	157781, -- Extra-Chunky Dino Food
	157822, -- Dreamweaver Provisions
	157823, -- Highmountain Tribute
	157824, -- Valarjar Cache
	157825, -- Farondis Lockbox
	157826, -- Nightfallen Hoard
	157827, -- Warden's Field Kit
	157828, -- Kirin Tor Chest
	157829, -- Gilded Trunk
	157830, -- Legionfall Spoils
	157831, -- Scuffed Krokul Cache
	158149, -- Overtuned Corgi Goggles
	158709, -- Refurbished Shredder
	158720, -- Staff of the Frosty Cavedweller
	158906, -- Shimmerfin Flesh
	158922, -- Zany Zombified Raptor
	158931, -- Ecto-dimensional Proton Beam
	159621, -- Personal Anchor
	159678, -- Century Sauce
	160109, -- The Fall of Corlain
	160408, -- Stormwake Pendant
	160438, -- Seafarer's Dubloon
	160485, -- An Unforgettable Luncheon
	160509, -- Echoes of Rezan
	160514, -- Maokka's Box
	160741, -- Soul Coffer
	160742, -- Pristine Soul Coffer
	160743, -- Blowgun of the Sethra
	160744, -- Pristine Blowgun of the Sethrak
	161129, -- Mecha-Mogul Mk1 Remote Activation Device
	161342, -- Gem of Acquiescence
	162025, -- Sermon of the High Exarch
	162126, -- River Clam Meat
	162513, -- Zenbaro's Empty Canteen
	162514, -- Zenbaro's Canteen
	162571, -- Soggy Treasure Map
	162580, -- Fading Treasure Map
	162581, -- Yellowed Treasure Map
	162584, -- Singed Treasure Map
	162637, -- Anniversary Gift
	163017, -- Pitch-Soaked Torch
	163035, -- Orders From Sylvanas
	163036, -- Polished Pet Charm
	163139, -- Carefully Wrapped Hat Box
	163141, -- Spooky Hat Box
	163142, -- Ironbound Hat Box
	163144, -- Striped Hat Box
	163146, -- Fancy Hat Box
	163148, -- Luxurious Hat Box
	163633, -- Captain Gulnaku's Treasure
	163714, -- Forbidden Sea Shanty of the Lively Men
	163715, -- Forbidden Sea Shanty of Fruit Counting
	163716, -- Forbidden Sea Shanty of Inebriation
	163717, -- Forbidden Sea Shanty of Josephus
	163718, -- Forbidden Sea Shanty of the Black Sphere
	163719, -- Forbidden Sea Shanty of the Horse
	163741, -- Magic Fun Rock
	163743, -- Drust Soulcatcher
	164373, -- Enchanted Soup Stone
	164374, -- Magic Monkey Banana
	164375, -- Bad Mojo Banana
	164774, -- Decrypted Message Module
	164942, -- Shadowscrawled Tome
	164983, -- Rhan'ka's Escape Plan
	165671, -- Blue Dragon Head Costume
	165672, -- Blue Dragon Body Costume
	165673, -- Blue Dragon Tail Costume
	165674, -- Green Dragon Head Costume
	165675, -- Green Dragon Body Costume
	165676, -- Green Dragon Tail Costume
	165791, -- Worn Cloak
	165835, -- Pristine Gizmo
	166308, -- For da Blood God!
	166544, -- Dark Ranger's Spare Cowl
	166702, -- Proudmoore Music Box
	166743, -- Blight Bomber
	166744, -- Glaive Tosser
	166777, -- Lion's Pride Firework
	166778, -- Horde's Might Firework
	166808, -- Bewitching Tea Set
	166880, -- Meerah's Jukebox
	166885, -- Mark of Azshara
	166890, -- The Traitor King
	166891, -- The Cursed Old Wolf
	166892, -- The Would-Be Queen
	166893, -- The Last Menethil
	167562, -- Ionized Minnow
	167737, -- Thrice-Folded Letter
	167860, -- Ancient Tauren Talisman
	167873, -- Remnant of the Void
	167931, -- Mechagonian Sawblades
	168016, -- Hyper-Compressed Ocean
	168021, -- Nullifier Transport Relay
	168023, -- DNT- Smashed Transport Relay
	168030, -- DNT - Hyperbolic Circuit
	168031, -- DNT-Transference Disc
	168123, -- Twitching Eyeball
	168160, -- Jeweled Scarab Figurine
	168630, -- Chitterspine Meat
	168824, -- Ocean Simulator
	168825, -- Rich Jelly
	168862, -- G.E.A.R. Tracking Beacon
	168867, -- Queen's Orders
	169295, -- Dormant Vision Stone
	169332, -- Strange Mineralized Water
	169333, -- Strange Volcanic Rock
	169334, -- Strange Oceanic Sediment
	169347, -- Judgment of Mechagon
	169665, -- Cleansed Remains
	169693, -- Zem'lan's Lost Treasure Map
	169764, -- Worldvein Intelligence Reports
	169765, -- Worldvein Intelligence Reports
	169865, -- Brewfest Chowdown Trophy
	170149, -- Map to the Last Worldvein
	170150, -- Map to the Last Worldvein
	170154, -- Book of the Unshackled
	170155, -- Carved Ankoan Charm
	170179, -- Snapdragon Scent Gland
	170182, -- Voltscale Shield
	170185, -- Intact Naga Skeleton
	170187, -- Shadescale
	170188, -- Barnacled Bag of Goods
	170189, -- Blind Eye
	170190, -- Mardivas' Bag of Containing
	170196, -- Shirakess Warning Sign
	170197, -- Swarthy Warning Sign
	170198, -- Eternal Palace Dining Set
	170199, -- Zanj'ir Weapon Rack
	170203, -- Flopping Fish
	170204, -- Symbol of Gral
	170380, -- Jar of Sunwarmed Sand
	170472, -- Encrusted Coin
	170473, -- Jingling Sack
	170476, -- Underlight Sealamp
	170484, -- [DNT] Torn Journal Page #14
	170487, -- [DNT] Torn Journal Page #23
	170488, -- [DNT] Torn Journal Page #7
	170491, -- Burnt Journal Page
	171206, -- Forgotten Weapon
	172013, -- Celebration Firework
	173301, -- Game Time
	173727, -- Nomi's Vintage
	173951, -- N'lyeth, Sliver of N'Zoth
	173984, -- Scroll of Aeons
	174038, -- Chime of Celerity
	174045, -- Orb of Dark Portents
	174047, -- Orb of Darkest Visions
	174360, -- Shadowy Gem
	174493, -- First Bell of Markos
	174495, -- Second Bell of Markos
	174496, -- Third Bell of Markos
	174837, -- Decaying Fusion Core
	174838, -- Collapsed Fusion Core
	174867, -- Shard of Corruption
	174873, -- Trans-mogu-rifier
	174874, -- Budget K'thir Disguise
	174890, -- Veteran Ramkahen Lancers Contract
	174891, -- Veteran Rajani Sparkcallers Contract
	174920, -- Coifcurl's Close Shave Kit
	174921, -- Void-Touched Skull
	174922, -- Void-Touched Skull
	174924, -- Void-Touched Souvenir Totem
	174926, -- Overly Sensitive Void Spectacles
	174928, -- Rotten Apple
	175056, -- Waterborne Veterans Contract
	175095, -- Book of Tickets
	175140, -- All-Seeing Eyes
	175246, -- N'lyeth, Sliver of N'Zoth
	178078, -- Reborn Spirit Cache
	178150, -- Tasty Purian
	178513, -- Anniversary Gift
	178560, -- Purity Contribution Progress
	178677, -- Prince Renathal
	178886, -- Baroness Vashj
	178887, -- Polemarch Adrestes
	178888, -- Choofa
	178889, -- Cryptkeeper Kassir
	178965, -- Small Gardener's Satchel
	178966, -- Gardener's Satchel
	178967, -- Large Gardener's Satchel
	178968, -- Weekly Gardener's Satchel
	179390, -- Tantalizingly Large Golden Plum
	179392, -- Orb of Burgeoning Ambition
	179393, -- Mirror of Envious Dreams
	179535, -- Crumbling Pride Extractors
	179613, -- Extra Sticky Spidey Webs
	179928, -- Cell Chain Pull
	179977, -- Benevolent Gong
	179982, -- Kyrian Bell
	180062, -- Heavenly Drum
	180063, -- Unearthly Chime
	180064, -- Ascended Flute
	180085, -- Kyrian Keepsake
	180210, -- Venthyr Tooth
	180211, -- Venthyr Eye
	180212, -- Venthyr Scabbard
	180213, -- Venthyr Nail
	180215, -- Venthyr Rib
	180216, -- Venthyr Heart
	180298, -- Amalgamation of Sin
	180299, -- Amalgamation of Sin
	180300, -- Amalgamation of Sin
	180301, -- Amalgamation of Sin
	180302, -- Amalgamation of Sin
	180303, -- Amalgamation of Sin
	180304, -- Amalgamation of Sin
	180305, -- Amalgamation of Sin
	180306, -- Amalgamation of Sin
	180357, -- Amalgamation of Sin
	180358, -- Amalgamation of Sin
	180360, -- Amalgamation of Sin
	180362, -- Amalgamation of Sin
	180363, -- Amalgamation of Sin
	180364, -- Amalgamation of Sin
	180366, -- Amalgamation of Sin
	180367, -- Amalgamation of Sin
	180368, -- Amalgamation of Sin
	180369, -- Amalgamation of Sin
	180370, -- Amalgamation of Sin
	180371, -- Amalgamation of Sin
	180372, -- Amalgamation of Sin
	180373, -- Amalgamation of Sin
	180374, -- Amalgamation of Sin
	180376, -- Amalgamation of Sin
	180477, -- Elysian Feathers
	180478, -- Champion's Pelt
	180569, -- Mercia's Legacy: Chapter Seven
	180595, -- Nightforged Steel
	180613, -- Fragile Humility Scroll
	180651, -- Discarded Phalynx Core
	180858, -- Crystal Mallet of Heralds
	180873, -- Smolderheart
	180974, -- Novice's Satchel
	180976, -- Artisan's Satchel
	180979, -- Artisan's Large Satchel
	180981, -- Novice's Large Satchel
	180983, -- Artisan's Stuffed Satchel
	180985, -- Novice's Stuffed Satchel
	180989, -- Novice's Overflowing Satchel
	181243, -- Broken Soulweb
	181338, -- Lady Moonberry
	181339, -- Mikanikos
	181340, -- The Countess
	181341, -- Alexandros Mograine
	181342, -- Hunt-Captain Korayn
	181343, -- Rendle and Cudgelface
	181344, -- Droman Aliothe
	181345, -- Grandmaster Vole
	181346, -- Kleia and Pelagos
	181347, -- Plague Deviser Marileth
	181348, -- Sika
	181349, -- Stonehead
	181371, -- Spare Head
	181390, -- Temel
	181391, -- Theotar
	181392, -- Watchmaster Boromod
	181765, -- Marcel Mullby's Marker
	181781, -- Almost Empty Amontillado Cask
	181825, -- Phial of Ravenous Slime
	182581, -- Handful of Oats
	182585, -- Grooming Brush
	182588, -- A Bloody Hand
	182593, -- Sinrunner Carving
	182594, -- A Sparkling Ruby Necklace
	182595, -- Sturdy Horseshoe
	182597, -- Comfortable Saddle Blanket
	182599, -- Bucket of Clean Water
	182620, -- Empty Water Bucket
	182696, -- The Countess's Parasol
	182697, -- Spare Stylish Parasol
	182729, -- Hearty Dragon Plume
	182732, -- The Necronom-i-nom
	182768, -- The Enchanted Dragon
	183200, -- Pitch Black Scourgestone
	183596, -- Broken Artifact
	183696, -- Sp-eye-glass
	183744, -- Superior Parts
	183847, -- Acolyte's Guise
	183856, -- Mystical Orb of Meditation
	183901, -- Bonestorm Top
	183902, -- A Faintly Glowing Seed
	183903, -- Smelly Jelly
	183964, -- Lavish Anima Items
	183986, -- Bondable Sinstone
	183987, -- Prisoner Cage Key
	183988, -- Bondable Val'kyr Diadem
	183989, -- Dredger Barrow Racer
	184043, -- Lost Scroll
	184075, -- Stonewrought Sentry
	184169, -- Vault Chain Pull
	184318, -- Battlecry of Krexus
	184354, -- Soul Harvester Key
	184396, -- Malfunctioning Goliath Gauntlet
	184412, -- Title Reward: Spirestalker
	184413, -- Mnemonic Attunement Pane
	184415, -- Soothing Vesper
	184447, -- Kevin's Party Supplies
	184449, -- Jiggles's Favorite Toy
	184476, -- Regenerating Slime Vial
	184489, -- Fae Harp
	184490, -- Fae Pipes
	184495, -- Infested Arachnid Casing
	184534, -- Entitled Guest
	184630, -- Adventurer's Tailoring Cache
	184631, -- Adventurer's Enchanting Cache
	184634, -- Adventurer's Herbalism Cache
	184635, -- Adventurer's Mining Cache
	184636, -- Adventurer's Skinning Cache
	184637, -- Hero's Meat Cache
	184638, -- Hero's Fish Cache
	184644, -- Hero's Tailoring Cache
	184645, -- Hero's Skinning Cache
	184647, -- Hero's Herbalism Cache
	184648, -- Hero's Enchanting Cache
	184684, -- Grimoire of Knowledge
	184685, -- Grimoire of Knowledge
	184686, -- Grimoire of Knowledge
	184687, -- Grimoire of Knowledge
	184688, -- Grimoire of Knowledge
	184718, -- Stolen Map of Infused Ruby Network
	184719, -- Enchanted Map of Infused Ruby Network
	184759, -- Tasty Purian
	184765, -- Vesper Strikehammer
	184766, -- Chronicles of the Paragons
	184767, -- Handheld Soul Mirror
	184768, -- Censer of Dried Gracepetals
	184772, -- Ritual Maldracite Crystal
	184774, -- Juvenile Sporespindle
	184775, -- Necromancy for the Practical Ritualist
	184776, -- Urn of Arena Soil
	184811, -- Artemede's Bounty
	184812, -- Apolon's Bounty
	185636, -- The Archivists' Codex
	185906, -- Anniversary Gift
	185940, -- Pristine Survival Kit
	185972, -- Tormentor's Cache
	186714, -- Research Report: All-Seeing Crystal
	186715, -- Research Report: Improved Alloys
	186716, -- Research Report: Ancient Shrines
	186717, -- Research Report: Adaptive Alloys
	186721, -- Treatise: Relics Abound in the Shadowlands
	186722, -- Treatise: The Study of Anima and Harnessing Every Drop
	186971, -- Feeder's Hand
	187054, -- Lost Razorwing Egg
	187077, -- Packaged Soul Ash
	187133, -- Bewitching Little Hat
	187136, -- Research Report: Relic Examination Techniques
	187137, -- Research Report: Relic Finding Techniques
	187138, -- Research Report: First Alloys
	187145, -- Treatise: Recognizing Stygia and its Uses
	187153, -- Tasty Mawshroom
	187176, -- Vesper of Harmony
	187181, -- Small Corpsefly Egg
	187182, -- Hatching Corpsefly Egg
	187184, -- Vesper of Clarity
	187185, -- Vesper of Faith
	187256, -- Hips' Spare Fedora
	187278, -- Talon-Pierced Mawsworn Lockbox
	187412, -- Shardhide Ka-Sha
	187414, -- Fractal Thoughtbinder
	187425, -- Ancient Maldraxxi Armament
	187427, -- Lost Meditation Bell
	187429, -- Petrified Sylvan Antlers
	187430, -- Harvester's Sinvyr Chalice
	187478, -- White Razorwing Talon
	187515, -- Theotar's Bottomless Teapot
	187569, -- Brokers' Tailoring Mote of Potentiation
	187570, -- Brokers' Skinning Mote of Potentiation
	187571, -- Brokers' Mining Mote of Potentiation
	187572, -- Brokers' Herbalism Mote of Potentiation
	187573, -- Brokers' Enchanting Mote of Potentiation
	187574, -- Brokers' Overflowing Bucket
	187575, -- Korthian Fishing Cache
	187576, -- Korthian Skinning Cache
	187577, -- Korthian Meat Cache
	187591, -- Nightborne Guard's Vigilance
	187621, -- Writ of Construction
	187637, -- Navarro's Backpack
	187705, -- Choofa's Call
	187706, -- Treatise: Bonds of Stygia in Mortals
	187710, -- Anniversary Gift
	187728, -- Ephemera Strands
	187789, -- Eidolic Particles
	187790, -- Trace Enigmet
	187833, -- Dapper Pocopoc
	187923, -- Aurelid Lure
	188152, -- Gateway Control Shard
	188217, -- De Purpose
	188218, -- Korthian Secret-Keeping Journal
	188219, -- Garlic Pendant of Fang-Warding
	188221, -- Eye of the Wailer
	188222, -- Steward Wings
	188223, -- Stain of Domination
	188224, -- Darling Maldraxxi Doll
	188225, -- Worneblade
	188226, -- Boots o' Maw Walkin
	188650, -- Grimoire of Knowledge
	188651, -- Grimoire of Knowledge
	188652, -- Grimoire of Knowledge
	188653, -- Grimoire of Knowledge
	188654, -- Grimoire of Knowledge
	188656, -- Fractal Thoughtbinder
	188673, -- Timebound Ruminations
	189451, -- Chef Pocopoc
	189707, -- Pocopoc's Bronze and Gold Body
	189708, -- Pocopoc's Beryllium and Silver Body
	189709, -- Pocopoc's Cobalt and Copper Body
	189710, -- Pocopoc's Ruby and Platinum Body
	189711, -- Pocopoc's Gold and Ruby Components
	189712, -- Pocopoc's Silver and Beryllium Components
	189713, -- Pocopoc's Copper and Cobalt Components
	189714, -- Pocopoc's Platinum and Emerald Components
	189715, -- Pocopoc's Diamond Vambraces
	189716, -- Pocopoc's Face Decoration
	189717, -- Pocopoc's Shielded Core
	189718, -- Pocopoc's Upgraded Core
	190058, -- Peaceful Pocopoc
	190059, -- Pirate Pocopoc
	190060, -- Adventurous Pocopoc
	190061, -- Admiral Pocopoc
	190062, -- Wicked Pocopoc
	190096, -- Pocobold
	190172, -- Title Reward: Gauntlet Runner
	190178, -- Pouch of Protogenic Provisions
	190182, -- Lovely Regal Pocopoc
	190196, -- Enlightened Hearthstone
	190340, -- Plainshunter's Supplies
	191031, -- Packaged Soul Cinders
	191032, -- Oily Fat
	191244, -- I.P.F. Mark 15
	191251, -- Key Fragments
	191282, -- Scouting Job: Azure Spawn Expedition Site
	191283, -- Requistion Job: Cold Weather Insulation
	191285, -- Requisition Job: BLACKSMITH - Tent Stakes
	191286, -- Recovery Job: Hopaway Thieves
	191294, -- Small Expedition Shovel
	191304, -- Sturdy Expedition Shovel
	191421, -- Rudimentary Magical Lockpick
	191422, -- Crystal Magical Lockpick
	191785, -- Overly Loud Pocketwatch
	191786, -- Elaborate Lace Cuff
	191848, -- Draconium Angle Iron
	191849, -- Serevite Angle Iron
	191850, -- Broken Serevite Blade Tip
	191851, -- Dull Draconium Weapon Head
	192099, -- Earpieces of Tranquil Focus
	192128, -- Reinforced Scale Sample
	192129, -- Azure Basilisk Belly
	192130, -- Sundered Flame Weapon Mold
	192476, -- Expedition Bullwhip
	192485, -- Stored Wisdom Device
	192495, -- Malfunctioning Stealthman 54
	193032, -- Jeweled Offering
	193033, -- Convergent Prism
	193201, -- Key Framing
	193476, -- Gnoll Tent
	194052, -- Forlorn Funeral Pall
	194056, -- Duck-Stuffed Duck Lovie
	194057, -- Cushion of Time Travel
	194058, -- Cold Cushion
	194059, -- Market Tent
	194060, -- Dragonscale Expedition's Expedition Tent
	194072, -- Sack of Gold
	194097, -- Hunter's Fabulous Treasure
	194426, -- Enriched Soil
	194442, -- Activity Map: Apex Canopy
	194679, -- BOOM-O-MATIC 9000
	194696, -- Recycled Crawler Mine
	194712, -- Empty Duck Trap
	194739, -- Trapped Duck
	194740, -- Duck Trap Kit
	197719, -- Artisan's Sign
	198039, -- Rock of Appreciation
	198139, -- Jeb's Underwear
	198166, -- Suspiciously Ticking Crate
	198167, -- Suspiciously Ticking Crate
	198168, -- Suspiciously Ticking Crate
	198169, -- Suspiciously Silent Crate
	198170, -- Suspiciously Silent Crate
	198171, -- Suspiciously Silent Crate
	198173, -- Atomic Recalibrator
	198206, -- Environmental Emulator
	198227, -- Giggle Goggles
	198264, -- Centralized Precipitation Emitter
	198409, -- Personal Shell
	198424, -- Refine Dragon Isles Hides
	198425, -- Refine Dragon Isles Leather
	198426, -- Refine Dragon Isles Scales
	198436, -- Hunting Horseshoe
	198437, -- Caravan Horseshoe
	198438, -- Draconic Recipe in a Bottle
	198452, -- Prototype F
	198537, -- Taivan's Trumpet
	198603, -- Arcane Rune
	198646, -- Ornate Dragon Statue
	198666, -- Milky Snapflower
	198668, -- Blooming Shallowlily
	198674, -- Filled Life Pools Vial
	198727, -- Expedition Explosives
	198815, -- Ash
	198816, -- Aerospace Grade Draconium
	198817, -- Durable Crystal
	198864, -- Large Maruuk Centaur Supply Satchel
	198865, -- Large Dragon Expedition Supply Pack
	198867, -- Large Iskaaran Supply Pack
	198869, -- Large Valdrakken Accord Supply Pack
	199108, -- Bag of Discount Goods
	199192, -- Dragon Racer's Purse
	199337, -- Bag of Furious Winds
	199554, -- S.E.A.T.
	199646, -- Imbu Tuskarr Bandages
	199894, -- Fisherman's Folly
	199900, -- Secondhand Survey Tools
	199902, -- Wayfinder's Compass
	200116, -- Everlasting Horn of Lavaswimming
	200160, -- Notfar's Favorite Food
	200178, -- Infected Ichor
	200198, -- Primalist Prison
	200201, -- Nokhud Battlegear
	200249, -- Mage's Chewed Wand
	200265, -- Lucky Dragon's Claw
	200268, -- Crumbling Elemental Stone
	200271, -- Infallible Hornswog Ward
	200295, -- Makko's Complete Journal
	200469, -- Khadgar's Disenchanting Rod
	200477, -- Stack of VIP Passes
	200631, -- Happy Tuskarr Palooza
	200635, -- Refine Dragon Isles Herbs
	200636, -- Primal Invocation Quintessence
	200638, -- Bubblefilled Flounder
	200647, -- Crystalline Shatter
	200675, -- Elemental Overflow Cluster
	200876, -- Yennu's Toy Boat
	200942, -- Vibrant Emulsion
	200943, -- Whispering Band
	200948, -- Obsidian Hunting Hook
	200949, -- Case of Fresh Gleamfish
	200950, -- Consortium Packaging String
	200951, -- Valdrakken Critter Snacks
	201091, -- Sharp Tooth
	201343, -- Bag of Cloth Armor Reagents
	201352, -- Bag of Leather Reagents
	201353, -- Bag of Mail Armor Reagents
	201354, -- Bag of Plate Armor Reagents
	201361, -- Primal Inspiration
	201411, -- Ancient Vault Artifact
	201412, -- Ancient Vault Artifact
	201435, -- Shuffling Sands
	201729, -- Spiked Horseshoe
	201730, -- Nokhud Centaur Spear
	201731, -- Nokhud Centaur Staff
	201836, -- Aspects' Token of Merit
	201930, -- H.E.L.P.
	202021, -- Breaker's Flag of Victory
	202046, -- Lucky Tortollan Charm
	202062, -- Ash Feather
	202073, -- Calamitous Carp
	202082, -- Petrified Dragon Egg
	202084, -- Eroded Fossil
	202087, -- Tinker Removal Kit
	202097, -- Bulging Box of Skins and Scales
	202098, -- Crowded Crate of Mined Materials
	202099, -- Stocked Sack of Hale Herbs
	202100, -- Populous Pack of Castoff Cloth
	202101, -- Topped Trunk of Disenchanted Detritus
	202107, -- Shadowscrawled Coin
	202122, -- Primal Chaos Cluster
	202206, -- Thumper Part
	202252, -- Recipe Rat
	202309, -- Defective Doomsday Device
	202310, -- Defective Doomsday Device
	202360, -- Dented Can
	202854, -- Wondrous Fish
	202870, -- Mysterious Writings
	202871, -- Draconic Artifact
	202872, -- Token of Blessing
	203220, -- Iskaara Surplus Bag
	203222, -- Maruuk Surplus Bundle
	203224, -- Valdrakken Surplus Chest
	203690, -- Pearlescent Bubble Key
	203701, -- Neltharion Gift Token
	203702, -- Experimental Melder
	203703, -- Prismatic Fragment
	203734, -- Snow Blanket
	203757, -- Brazier of Madness
	203774, -- Big Bag o' Bijous
	203852, -- Spore-Bound Essence
	203912, -- Penny Pouch o' Paragons
	203959, -- Gurubashi Tribute
	204075, -- Whelpling's Shadowflame Crest Fragment
	204076, -- Drake's Shadowflame Crest Fragment
	204077, -- Wyrm's Shadowflame Crest Fragment
	204078, -- Aspect's Shadowflame Crest Fragment
	204170, -- Clan Banner
	204181, -- Opera of the Aspects
	204193, -- Whelpling's Shadowflame Crest
	204195, -- Drake's Shadowflame Crest
	204196, -- Wyrm's Shadowflame Crest
	204199, -- Ley-Infused Crystal
	204220, -- Hraxian's Unbreakable Will
	204256, -- Holoviewer: The Scarlet Queen
	204257, -- Holoviewer: The Lady of Dreams
	204262, -- Holoviewer: The Timeless One
	204274, -- Ancient Memories
	204278, -- Neltharion's Toolkit
	204316, -- A Soldier's Journal
	204317, -- Words of the Wyrmslayer
	204321, -- Lost Expedition Notes
	204328, -- Return of the Nightsquall
	204335, -- A Song of the Depths
	204338, -- The Burden of Lapisagos
	204345, -- Note to Disposal Site
	204359, -- Reach Racer's Purse
	204383, -- Sack of Oddities
	204403, -- Sack of Sack of Oddities
	204405, -- Stuffed Bear
	204443, -- Blacksteel Hammer
	204633, -- Cauldron of Extracted Putrescence
	204686, -- Titan Containment Device
	204691, -- Living Book
	204721, -- Whelpling's Small Chest
	204722, -- Whelpling's Bountiful Chest
	204723, -- Whelpling's Hefty Chest
	204724, -- Drake's Small Chest
	204725, -- Drake's Hefty Chest
	204726, -- Drake's Bountiful Chest
	204727, -- Coveted Bauble
	204818, -- Mallard Mortar
	204871, -- Recipe Rat
	204883, -- Titan Mining Tool
	204884, -- Titan Control Card
	204885, -- Boulder Breakdown Mixture
	204886, -- Insulating Embershard
	204887, -- Unstable Embershard
	204889, -- Weak Elemental Binding Rings
	204890, -- Dampening Emitter
	204891, -- Tempered Embershard
	205045, -- B.B.F. Fist
	205188, -- Barter Boulder
	205225, -- Aspects' Token of Merit
	205226, -- Cavern Racer's Purse
	205247, -- Clinking Dirt-Covered Pouch
	205255, -- Niffen Diggin' Mitts
	205288, -- Buried Niffen Collection
	205346, -- Hidden Niffen Treasure
	205347, -- Gathered Niffen Resources
	205368, -- Thankful Researcher's Gift
	205370, -- Researcher's Gift
	205373, -- Researcher's Scrounged Goods
	205374, -- Thankful Researcher's Scrounged Goods
	205419, -- Dinn's Drum
	205463, -- Molten Lava Ball
	205686, -- Clacking Claw
	205688, -- Glutinous Glitterscale Glob
	205796, -- Molten Lava Pack
	205903, -- Barter Pebble
	205904, -- Vibrant Clacking Claw
	205908, -- Inherited Wisdom of Senegos
	205959, -- Letter from Kirygosa
	205962, -- Echoing Storm Flightstone
	205963, -- Sniffin' Salts
	206028, -- Chest of Gold
	206039, -- Enmity Bundle
	206043, -- Fyrakk's Frenzy
	206163, -- Temporal Gossamer
	206268, -- Ethereal Transmogrifier
	206274, -- Large Charm of Intelligence
	206348, -- Fragmented Flame
	206350, -- Radiant Remnant
	206354, -- Stinky Candle
	206355, -- Tobacco-Filled Candle
	206356, -- Ghost-Warding Candle
	206357, -- Authentic Andorhal Candle
	206358, -- Imported Candle
	206364, -- Eva's Femur
	206371, -- Viewing Room Key
	206372, -- Cracked Argent Dawn Commission
	206374, -- Invader's Scourgestone
	206450, -- Omarion's Notes - Pages 1 & 2
	206451, -- Omarion's Notes - Pages 3 & 4
	206452, -- Omarion's Notes - Pages 5 & 6
	206453, -- Omarion's Notes - Pages 7 & 8
	206454, -- Omarion's Notes - Pages 9 & 10
	206455, -- Omarion's Notes - Pages 11 & 12
	206456, -- Omarion's Notes - Pages 13 & 14
	206457, -- Omarion's Notes - Pages 15 & 16
	206458, -- Omarion's Notes - Pages 17 & 18
	206459, -- Omarion's Notes - Pages 19 & 20
	206460, -- Omarion's Notes - Pages 21 & 22
	206461, -- Omarion's Notes - Pages 23 & 24
	206462, -- Omarion's Notes - Pages 25 & 26
	206463, -- Omarion's Notes - Pages 27 & 28
	206464, -- Omarion's Notes - Pages 29 & 30
	206465, -- Omarion's Notes - Pages 31 & 32
	206473, -- Makeshift Grappling Hook
	206565, -- Plagued Grain
	206576, -- Death's Bargaining Chip
	207050, -- Warmonger's Plate Gear Bag
	207051, -- Warmonger's Plate Equipment Bag
	207052, -- Jingoist's Plate Equipment Bag
	207053, -- Jingoist's Plate Gear Bag
	207063, -- Jingoist's Mail Equipment Bag
	207064, -- Jingoist's Mail Gear Bag
	207065, -- Warmonger's Mail Gear Bag
	207066, -- Warmonger's Mail Equipment Bag
	207067, -- Jingoist's Leather Gear Bag
	207068, -- Jingoist's Leather Equipment Bag
	207069, -- Warmonger's Leather Equipment Bag
	207070, -- Warmonger's Leather Gear Bag
	207071, -- Jingoist's Cloth Gear Bag
	207072, -- Jingoist's Cloth Equipment Bag
	207073, -- Warmonger's Cloth Equipment Bag
	207074, -- Warmonger's Cloth Gear Bag
	207075, -- Jingoist's Plate Armor Bag
	207076, -- Warmonger's Plate Armor Bag
	207077, -- Warmonger's Mail Armor Bag
	207078, -- Jingoist's Mail Armor Bag
	207079, -- Warmonger's Leather Armor Bag
	207080, -- Jingoist's Leather Armor Bag
	207081, -- Warmonger's Cloth Armor Bag
	207082, -- Jingoist's Cloth Armor Bag
	207092, -- Portable Party Platter
	207093, -- Jingoist's Mail Suit Bag
	207094, -- Warmonger's Leather Suit Bag
	207096, -- Paracausal Chest
	207584, -- Box of Volatile Reality
	207730, -- Idol of Ohn'ahra
	207802, -- Bobby Carlisle's Thinking Cap Notes
	208067, -- Plump Dreamseed
	208068, -- Rotten Delicious
	208092, -- Torch of Pyrreth
	208096, -- Familiar Journal
	208211, -- Anniversary Gift
	208421, -- Compendium of the New Moon
	208433, -- Bronze Racer's Pennant
	208549, -- Canned Meat Product
	208597, -- Eadweard's Notes
	208619, -- The Tragedy of Erinethria
	208649, -- On the Nature of the Dream
	208658, -- Mirror of Humility
	208757, -- Ash's Recipes to Delight and Nourish Your Plant Pals
	208781, -- Symbiotic Glowspore Grip
	208821, -- Aspects' Token of Merit
	208839, -- Rune of Adaptive Binding
	208840, -- Concentrated Sophic Vellum
	208861, -- The First Clue
	208862, -- The Second Clue
	208863, -- The Fourth Clue
	208864, -- The Third Clue
	208865, -- The First Clue
	208866, -- The Second Clue
	208867, -- The Third Clue
	208869, -- The First Clue
	208870, -- The Second Clue
	208871, -- The Third Clue
	208872, -- The Fourth Clue
	208873, -- The FINAL Clue
	208887, -- Erden's Notes
	208932, -- A Partial Fourth Clue
	208933, -- A Partial Fourth Clue
	208934, -- A Partial Fourth Clue
	208935, -- A Partial Fourth Clue
	208984, -- First Booster Part
	208993, -- Clue Scrap
	208994, -- Clue Scrap
	208995, -- Clue Scrap
	208996, -- Clue Scrap
	208997, -- Clue Scrap
	208998, -- Clue Scrap
	208999, -- Clue Scrap
	209000, -- Clue Scrap
	209001, -- Clue Scrap
	209002, -- Clue Scrap
	209003, -- Clue Scrap
	209004, -- Clue Scrap
	209005, -- Clue Scrap
	209006, -- Clue Scrap
	209007, -- Clue Scrap
	209008, -- Clue Scrap
	209009, -- Clue Scrap
	209010, -- Clue Scrap
	209011, -- Clue Scrap
	209012, -- Clue Scrap
	209013, -- Clue Scrap
	209014, -- Clue Scrap
	209015, -- Clue Scrap
	209016, -- Clue Scrap
	209055, -- Third Booster Part
	209348, -- Lydiara's Notes
	209349, -- Lydiara's Notes on Rune Reagents
	209350, -- Shalasar's Notes on Sophic Magics
	209781, -- Second Booster Part
	209837, -- Faint Whispers of Dreaming
	209839, -- Tangible Whispers of Dreaming
	209858, -- Dreamsurge Remnant
	209860, -- Thorn-Laden Heart
	209861, -- Thorn-Laden Heart
	209862, -- Thorn-Laden Heart
	209863, -- Moontouched Thorns
	209864, -- Moontouched Thorns
	209865, -- Moontouched Thorns
	209866, -- Thornspeaker Ritual Knife
	209868, -- Thornspeaker Ritual Knife
	209944, -- Friendsurge Defenders
	209996, -- Tethercoil Rune
	209999, -- Lydiara's Rune of Shadowbinding
	210010, -- Erden's Notes on Symbiotic Spores
	210011, -- Shalasar's Notes on Sophic Magic
	210049, -- The Legend of Elun'Ahir
	210218, -- Plump Dreamy Bounty
	210223, -- Unstable Element
	210225, -- Medium Emerald Bloom
	210240, -- Stabilized Element
	210255, -- Alydrus' Research Notes
	210321, -- The Reforging of the Tyr's Guard
	210346, -- Self-Baking Herb Based Cookies
	210455, -- Draenic Hologem
	210549, -- Dream Racer's Purse
	210632, -- Auebry's Farshooter
	210737, -- Ashwood Research Binder
	210770, -- Satchel of Drake's Dreaming Crests
	210784, -- Xena, the Whimsical Whiskerfish
	210917, -- Pouch of Whelpling's Dreaming Crests
	210918, -- Adaptive Cooling Salve
	210923, -- Clutch of Wyrm's Dreaming Crests
	210974, -- Eyes For You Only
	210975, -- Date Simulation Modulator
	211303, -- Dryad's Supply Pouch
	211373, -- Bag of Many Wonders
	211374, -- Tangled Yarn of Secrets
	211377, -- Tangled Yarn of Secrets
	211378, -- Tangled Yarn of Secrets
	211379, -- Tangled Yarn of Secrets
	211380, -- Tangled Yarn of Secrets
	211395, -- Ashphodel Research Notes
	211413, -- Budding Dreamtrove
	211418, -- Q'onzu Edict of Change
	211474, -- Shadowblind Grouper
	211788, -- Tess's Peacebloom
	211927, -- Tattered Dreamleaf
	211947, -- Harvest Seed Supply
	211951, -- Pouch of Whelpling's Awakened Crests
	211952, -- Satchel of Drake's Awakened Crests
	212174, -- The Warband Map to Everywhere All At Once
	212367, -- Clutch of Wyrm's Awakened Crests
	212500, -- Delicate Silk Parasol
	212523, -- Delicate Jade Parasol
	212524, -- Delicate Crimson Parasol
	212525, -- Delicate Ebony Parasol
	212605, -- The Vizier's Invitation
	213176, -- Preserved Isles Tome
	213189, -- Preserved Dragonkin Tome
	213190, -- Preserved Djaradin Tome
	215145, -- Remembrance Stone
	215147, -- Beautification Iris
	215359, -- Very Large Valdrakken Accord Supply Pack
	217012, -- Novice Actor's Chest
	217105, -- Refine Khaz Algar Herbs
	217162, -- Necklace of Kobold Teeth
	217163, -- Well-Worn Doll
	217164, -- Royal Nailpicker
	217167, -- Crusty Chalice
	217168, -- Chocolate Coins
	217169, -- Cloak of Beards
	217170, -- Backup Candles
	217171, -- CANDLE KING DIARY
	217242, -- Awakening Stone Wing
	217243, -- Awakening Ruby Wing
	217344, -- Sentry Flare Launcher
	217409, -- Aspects' Token of Merit
	217419, -- Large Satchel of Drake's Dreaming Crests
	217420, -- Large Pouch of Whelpling's Awakened Crests
	217818, -- Refine Algari Hides
	217822, -- Refine Algari Leather
	217840, -- Refine Algari Chitin
	219403, -- Stonebound Lantern
	219522, -- Radiant Fuel Crystal
	219524, -- Tarnished Compass
	219809, -- Plush Lynx
	219810, -- Broken Bracelet
	220122, -- Offering of Pure Water
	220123, -- Ominous Offering
	220124, -- Jar of Mucus
	220203, -- Clutch of Wyrm's Dreaming Crests
	220204, -- Pouch of Whelpling's Dreaming Crests
	220205, -- Satchel of Drake's Dreaming Crests
	220206, -- Gleaming Satchel of Drake's Dreaming Crests
	220207, -- Shimmering Clutch of Wyrm's Dreaming Crests
	220208, -- Viridescent Bouquet of Aspect's Dreaming Crests
	220381, -- Shatter Essence
	220693, -- Coffer Key Shard
	220769, -- Algari Token of Merit
	220770, -- Void-Scarred Stormhammer
	221503, -- Explorer's Warbound Battlegear Drop
	221962, -- Defective Escape Pod
	221964, -- Filmless Camera
	222929, -- Carved Coin Coffer
	222977, -- Scorched Junk
	223619, -- Bronze Celebration Goodie Bag
	223869, -- DO NOT USE Prismatic Codex
	223878, -- Rough Deepruby Shard
	223879, -- Rough Deeptopaz Shard
	223880, -- Rough Deepamethyst Shard
	223881, -- Rough Deepemerald Shard
	223882, -- Rough Deepdiamond Shard
	223953, -- Timerunner's Parting Pack
	224172, -- Restored Coffer Key
	224192, -- Practice Ravager
	224240, -- Nerubian Tombstone
	224263, -- Infused Fire-Honey Milk
	224267, -- Dented Spearhead
	224268, -- Filigreed Cleric
	224272, -- Calcified Journal
	224273, -- Wooden Figure
	224274, -- Sturdy Locket
	224547, -- Timewarped Pouch
	224553, -- Beledar's Attunement
	224586, -- Box o' Booms
	224587, -- Box o' Booms
	224588, -- Box o' Booms
	224642, -- Firelight Ruby
	224646, -- Coppers the Kobold
	224650, -- Wax-Sealed Pouch
	224721, -- Wax-Sealed Box
	224722, -- Waxy Bundle of Resonance Crystals
	224723, -- Waxy Bundle of Leather
	224724, -- Waxy Bundle of Dust
	224725, -- Waxy Bundle of Herbs
	224726, -- Waxy Box of Rocks
	224760, -- Wobbles
	224765, -- Everburning Ignition
	224768, -- Delver's Dirigible Schematic: Wing-Mounted Propeller
	224769, -- Delver's Dirigible Schematic: Rotor Blades
	224770, -- Delver's Dirigible Schematic: Front-Mounted Propeller
	224771, -- Delver's Dirigible Schematic: Empennage
	224780, -- Toughened Tempest Pelt
	224782, -- Razor Talon
	224807, -- Algari Skinner's Notes
	224817, -- Algari Herbalist's Notes
	224818, -- Algari Miner's Notes
	224835, -- Deepgrove Roots
	224838, -- Null Sliver
	224960, -- Delver's Dirigible Schematic: Lantern Wing
	224979, -- Delver's Dirigible Schematic: Zeppelin
	224980, -- Delver's Dirigible Schematic: Front-Mounted Lantern
	224981, -- Delver's Dirigible Schematic: Brown Paint
	224982, -- Delver's Dirigible Schematic: Exhaust
	225220, -- Chitin Needle
	225221, -- Spool of Webweave
	225222, -- Stone-Leather Swatch
	225223, -- Sturdy Nerubian Carapace
	225224, -- Diaphanous Gem Shards
	225225, -- Deepstone Fragment
	225226, -- Striated Inkstone
	225227, -- Wax-Sealed Records
	225228, -- Rust-Locked Mechanism
	225229, -- Earthen Induction Coil
	225230, -- Crystalline Repository
	225231, -- Powdered Fulgurance
	225232, -- Coreway Billet
	225233, -- Dense Bladestone
	225234, -- Alchemical Sediment
	225235, -- Deepstone Crucible
	225415, -- Caddy Caller
	225554, -- Sunless Lure
	225557, -- Sizzling Cinderpollen
	225558, -- Murkfin Lure
	225559, -- Hungering Shimmerfin
	225969, -- Forged Flag of Victory
	226101, -- Chromie's Tour Goodie Bag
	226102, -- Chromie's Tour Goodie Bag
	226155, -- Big Candle
	226156, -- Really Big Candle
	226200, -- Soggy Celebration Crate
	226241, -- Shredded Green Hills of Stranglethorn
	226258, -- Delver's Pouch of Reagents
	226361, -- Next Week's Mount Competition Listing
	226362, -- Torn Note
	226364, -- Torn Note
	226365, -- Crumpled Letter
	226430, -- Navigations of The Soul
	226519, -- General's Expertise
	226681, -- Sizzling Cinderpollen
	226814, -- Chest of Gold
	227406, -- Interesting Notes
	227450, -- Sky Racer's Purse
	227659, -- Fleeting Arcane Manifestation
	227662, -- Shimmering Dust
	227665, -- Torn Diary, Page 4
	227667, -- Algari Enchanter's Folio
	227713, -- Artisan's Consortium Payout
	228210, -- Firelight Ruby Chip
	228220, -- Waxy Bundle
	228300, -- Sun-Baked Ransom Note
	228321, -- Dirt-Caked Ransom Note
	228449, -- Tasty Iron Bar
	228450, -- Edible Copper Nuggets
	228451, -- Scrumptious Gold Bar
	228452, -- Deepest, Darkest Black Ink
	228453, -- Extra Large Bag of Popped Pebbles
	228454, -- Collector's Commemorative Proscenium Playbill
	228455, -- Bolt of Bouldercloth
	228456, -- Bouldercloth
	228457, -- Lightspark Grade Book
	228458, -- Bouldercloth Bag
	228481, -- Tiny Fathomclam
	228482, -- Cracked Iridescent Pearl
	228483, -- Lovingly Carved Ramolith
	228485, -- Carver's Spare Whittling Knife
	228487, -- Freshly Fallen Sticks
	228488, -- Small Glass Vase
	228489, -- Fashionable Flask
	228490, -- Fresh Grazing Rocks
	228491, -- Ramolith Bedding Material
	228495, -- Well-Used Potter's Wheel
	228496, -- Cracked Lantern
	228497, -- Rusted Airship Cog
	228608, -- On the Application of Arathi Technology to Earthen Life
	228609, -- Rock Roasting for Dummies
	228627, -- Lively Clutch of Wyrm's Awakened Crests
	228628, -- Yawning Basket of Aspect's Awakened Crests
	228629, -- Restless Satchel of Drake's Awakened Crests
	228630, -- Pouch of Whelpling's Awakened Crests
	228631, -- Satchel of Drake's Awakened Crests
	228632, -- Clutch of Wyrm's Awakened Crests
	228633, -- Large Pouch of Whelpling's Awakened Crests
	228694, -- Damp Ransom Note
	228711, -- Small Candle
	228723, -- Earthen Pet Rock
	228766, -- Sandy Ransom Note
	228767, -- Sandy Celebration Crate
	228768, -- Water-Resistant Receipt
	228769, -- Surprisingly Pristine Ransom Note
	228770, -- Surprisingly Pristine Celebration Crate
	228772, -- Mysterious Bones
	228773, -- Algari Alchemist's Notebook
	228774, -- Algari Blacksmith's Journal
	228775, -- Algari Engineer's Notepad
	228776, -- Algari Scribe's Journal
	228777, -- Algari Jewelcrafter's Notebook
	228778, -- Algari Leatherworker's Journal
	228789, -- Coldflame Ring
	228966, -- Starry-Eyed Goggles
	228977, -- Burnt Ransom Note
	228985, -- Shiny Ransom Note
	228986, -- Aesthetician's Coupon Book
	228987, -- Scroll of Fel Binding
	228989, -- Exotic Critter Taming License
	228990, -- Bottle of Steam
	228995, -- Golden Muffin
	229007, -- Ancient Shaman Blood
	229046, -- Sentry Statue
	229054, -- Warden's Mirror
	229198, -- Ace of Air
	229199, -- Two of Air
	229200, -- Three of Air
	229201, -- Four of Air
	229202, -- Five of Air
	229203, -- Six of Air
	229204, -- Seven of Air
	229205, -- Eight of Air
	229206, -- Ace of Fire
	229207, -- Two of Fire
	229208, -- Three of Fire
	229209, -- Four of Fire
	229210, -- Five of Fire
	229211, -- Six of Fire
	229212, -- Seven of Fire
	229213, -- Eight of Fire
	229214, -- Ace of Frost
	229215, -- Two of Frost
	229216, -- Three of Frost
	229217, -- Four of Frost
	229218, -- Five of Frost
	229219, -- Six of Frost
	229220, -- Seven of Frost
	229221, -- Eight of Frost
	229222, -- Ace of Earth
	229223, -- Two of Earth
	229224, -- Three of Earth
	229225, -- Four of Earth
	229226, -- Five of Earth
	229227, -- Six of Earth
	229228, -- Seven of Earth
	229229, -- Eight of Earth
	229359, -- Chromie's Goodie Bag
	229369, -- Ghostly Ransom Note
	229823, -- Canister of Darkfuse Solution
	229899, -- Coffer Key Shard
	230207, -- N.U.K.U.L.A.R. Target Painter
	230216, -- Delver's Gob-Trotter Schematic: Harpoon
	230217, -- Delver's Gob-Trotter Schematic: Flamethrower
	230218, -- Delver's Gob-Trotter Schematic: Pipes
	230219, -- Delver's Gob-Trotter Schematic: Balloon
	230220, -- Delver's Gob-Trotter Schematic: Green
	230793, -- Algari Token of Merit
	231888, -- Mildewed Ransom Note
	232372, -- Crate of Bygone Riches
	232492, -- Gleaming Shatter
	232493, -- Restored Coffer Key
	232494, -- Restored Coffer Key
	232495, -- Restored Coffer Key
	232496, -- Restored Coffer Key
	232497, -- Restored Coffer Key
	232498, -- Restored Coffer Key
	232605, -- Thunderous Fragment
	232928, -- [DNT] Medium Surge Chest
	232930, -- Zaps Leadfoot
	232978, -- Louie Firehands
	232979, -- Jaks Jabberjaw
	232980, -- Axel Sneakfoot
	232981, -- GNZ Airmaster 9000
	232983, -- Steamboil
	232984, -- Handcrank
	232985, -- 22H Slicks
	232986, -- GE86 Advance
	233027, -- Well Loved Squeaky Toy
	233202, -- G.O.L.E.M, Jr.
	233555, -- Restored Coffer Key
	233557, -- Sifted Pile of Scrap
	233558, -- S.C.R.A.P. Scrubber Deluxe
	234327, -- Turbulent Fragment
	234328, -- Torrential Fragment
	234741, -- Miscellaneous Mechanica
	234743, -- Steamwheedle's Trove
	234950, -- Atomic Regoblinator
	234951, -- Uncracked Cold Ones
	234972, -- Bloodwake Missive
	234973, -- Pearlshell Scroll Case
	235053, -- Completed C.H.E.T.T. List
	235220, -- Fireworks Hat
	235258, -- Bilgewater's Trove
	235260, -- Blackwater's Trove
	235264, -- Venture Co.'s Trove
	235266, -- Fireworked Hat
	235268, -- Misprinted Card
	235280, -- Extra Crispy Laundry
	235388, -- Paint: Redlining Red
	235389, -- Paint: Goblin Green
	235390, -- Paint: Body Roll Blue
	235391, -- Paint: Yellow Cake Yellow
	235505, -- Satchel of Timewarped Badges
	235531, -- Restored Coffer Key
	235558, -- Box of Darkfuse Miscellany
	235683, -- Delver's Dirigible Schematic: Turbine
	235684, -- Delver's Dirigible Schematic: Glider
	235685, -- Delver's Dirigible Schematic: Drill
	235686, -- Delver's Dirigible Schematic: White Paint
	235687, -- Delver's Dirigible Schematic: Spoiler
	235688, -- Delver's Dirigible Schematic: Fan
	235689, -- Delver's Dirigible Schematic: Kite
	235690, -- Delver's Dirigible Schematic: Harpoon
	235691, -- Delver's Dirigible Schematic: Yellow Paint
	235692, -- Delver's Dirigible Schematic: Thrusters
	235693, -- Delver's Dirigible Schematic: Rocket
	235694, -- Delver's Dirigible Schematic: Blue Paint
	235695, -- Delver's Dirigible Schematic: Red Paint
	235696, -- Delver's Dirigible Schematic: Explorer Decal
	235697, -- Delver's Dirigible Schematic: Alliance Decal
	235698, -- Delver's Dirigible Schematic: Horde Decal
	235703, -- Noggenfogger Select DOWN
	235704, -- Noggenfogger Select UP
	235710, -- Noggenfogger Select FRESH
	235799, -- Throwin' Sawblade
	235807, -- Storefront-in-a-Box
	236096, -- Coffer Key Shard
	236669, -- The Whole Brass Band
	236670, -- Maniacal Melodies
	236671, -- The Buzzer
	236672, -- The Ol' Low-and-Slow
	236682, -- C.H.E.T.T. List
	236749, -- Take-Home Torq
	236751, -- Take-Home Flarendo
	236757, -- Generous Tip Chest
	236921, -- Triumphant Satchel of Carved Harbinger Crests
	236922, -- Celebratory Pack of Runed Harbinger Crests
	236923, -- Glorious Cluster of Gilded Harbinger Crests
	236924, -- Pouch of Weathered Harbinger Crests
	236925, -- Satchel of Carved Harbinger Crests
	236926, -- Pack of Runed Harbinger Crests
	237014, -- Severed Threads Commendation
	237131, -- X-Plo-Dar 64k ENHANCE Results
	237514, -- Viridian Ore
	237515, -- Crimson Ore
	237516, -- Cerulean Ore
	237517, -- Citrine Ore
	237759, -- Arathi Cleric's Chest
	238177, -- Delver's Mana-Skimmer Schematic: Emitter
	238178, -- Delver's Mana-Skimmer Schematic: Canister
	238179, -- Delver's Mana-Skimmer Schematic: Quad Glider
	238180, -- Delver's Mana-Skimmer Schematic: Void Paint
	238181, -- Delver's Mana-Skimmer Schematic: Energy Thrusters
	238407, -- Black Blood Residue
	238500, -- Maella's Report
	238526, -- Restored Coffer Key
	238527, -- Restored Coffer Key
	238837, -- Delver's Dirigible Schematic: Pale Paint
	238839, -- Delver's Dirigible Schematic: Arathi Decal
	239157, -- Nemesis Shard
	239158, -- Nemesis Shard
	239224, -- Cache of Infinite Treasure
	240178, -- Voidflame-Resistant Hide
	240180, -- Void-Scarred Boarhide
	240181, -- Boarhide Deathcycle Seat
	240182, -- Skull-Scythe Handlebars
	240183, -- Twisted Skull-Scythe Handlebars
	240185, -- Pulsing Void Crystal
	240186, -- Depleted Void Crystal
	240188, -- Void-Forged Inline Four Engine
	240189, -- Void-Forged Engine Block
	240190, -- Deathcycle Exhaust System
	240191, -- Magic-Lined Manifold
	240193, -- Tentacle Spokes
	240932, -- Pack of Runed Undermine Crests
	240933, -- Satchel of Carved Undermine Crests
	240934, -- Pouch of Weathered Undermine Crests
	240935, -- Glorious Cluster of Gilded Undermine Crests
	240937, -- Celebratory Pack of Runed Undermine Crests
	240938, -- Triumphant Satchel of Carved Undermine Crests
	242323, -- Chowdar's Favorite Ribbon
	242370, -- Horns of the First Satyr
	242520, -- Festival Hot Air Balloon
	242617, -- Curious Simulacrum
	242648, -- Black Blood Coagulate
	243014, -- Light-Dimmed Cleaver
	243015, -- Spear of Forgotten Memories
	243016, -- Efrat's Totally Abandonded Bulwark
	243017, -- Tulwar of the Pyrite Guard
	243018, -- Petrified Twig of the Fennad
	243021, -- Shadowguard Bonker
	243022, -- Sufaadi Skiff Candle
	243145, -- Well-Preserved Wrappings
	243154, -- Korgorath's Broken Nail
	243160, -- Tazavesh Shipping Manifest
	243161, -- Long-Pressed Flowers
	243292, -- Bag of Brewfest Merchandise
	243844, -- Petalwrap Bag
	243845, -- Petalwrap Sack
	244038, -- Vinetwined Crate
	244039, -- Pitcher Plant Vase
	244040, -- Sack of Seeds
	244041, -- Budding Seed
	244843, -- Lorewalker's Notes: The Ethereals
	244846, -- Lorewalker's Notes: Xal'atath, Blade of the Black Empire
	244848, -- Severed Threads Commendation
	244858, -- Lorewalker's Notes: The Lich King
	245553, -- Heroic Cache of Infinite Treasure
	245653, -- Coffer Key Shard
	245668, -- Warglaive of the Subdued Tracker
	245670, -- P.O.S.T. Employee's Backup Stamp
	245672, -- Blade of the Void Swamp
	245674, -- Rifle of Leaden Movement
	245749, -- Large Charm of Intelligence
	245887, -- Stalwart's Grand Charm
	245888, -- Serpent's Grand Charm
	245889, -- Large Charm of Dexterity
	245890, -- Large Charm of Strength
	245891, -- Small Charm of Inertia
	245892, -- Small Charm of Life
	245893, -- Small Charm of Alacrity
	245894, -- Small Charm of Proficiency
	245895, -- Small Charm of Savagery
	245896, -- Small Charm of Adaptability
	245899, -- Bat's Grand Charm
	245924, -- Mongoose's Grand Charm
	245934, -- Shatter Essence
	245937, -- Void-Tainted Remains
	245970, -- P.O.S.T. Master's Express Hearthstone
	246294, -- Shattered Buckler of the Last Stand
	246296, -- Off-Balance Mace of the Tazavesh Lookout
	246298, -- Cracked Staff of the Desperate Defender
	246301, -- Pitted Blade of Lost Hope
	246585, -- Artisan's Consortium Payout
	246745, -- Triumphant Satchel of Carved Ethereal Crests
	246746, -- Celebratory Pack of Runed Ethereal Crests
	246747, -- Glorious Cluster of Gilded Ethereal Crests
	246748, -- Pouch of Weathered Ethereal Crests
	246749, -- Satchel of Carved Ethereal Crests
	246750, -- Pack of Runed Ethereal Crests
	246815, -- Lesser Bronze Cache
	246951, -- Stormarion Core
	247808, -- Bronze Simulacrum
	247882, -- Phase Regulator
	248140, -- Bronze Simulacrum
	248141, -- Curious Simulacrum
	248200, -- The Brothers' Not-So-Final Present
	248242, -- Algari Token of Merit
	248393, -- Blank Doomsayer's Pamphlet
	248944, -- Ethereal Energy
	249468, -- Twilight's Blade Top Secret Strategy Training Guide
	250317, -- Pile of Ash
	250325, -- Night's Embrace
	250411, -- Timerunner's Hearthstone
	250974, -- Akil'zon's Updraft
	251023, -- Bronze Simulacrum
	251286, -- Bundle of Petrified Roots
	251287, -- Generous Bundle of Petrified Roots
	251633, -- Bursting Bounty Bundle
	251635, -- Illegal Cosmic Emitter
	252364, -- Gem of Gul'dan
	252609, -- Coffer Key Shard
	253222, -- Corrupted Thorn of the Dream
	253223, -- Fractal Felshard
	253224, -- Mote of a Broken Time
	253226, -- Restored Coffer Key
	253227, -- Flawless Thread of Time
	253304, -- Cosmic Soulsliver
	253305, -- Felwarped Slab
	253306, -- Everflame of Hatred
	253629, -- Personal Key to the Arcantina
	253849, -- Recycling
	254268, -- Restored Coffer Key
	254269, -- Restored Coffer Key
	254270, -- Restored Coffer Key
	254271, -- Restored Coffer Key
	254272, -- Restored Coffer Key
	254273, -- Restored Coffer Key
	254274, -- Restored Coffer Key
	254749, -- Phial of Burrow Balm
	255680, -- Forgotten Talon
	255688, -- Anchor of the Abyss
	255881, -- Severed Threads Commendation
	256164, -- Broken Oar
	256552, -- Verdant Rutaani Seed
	257149, -- Old Tome
	258556, -- Thalassian Token of Merit
	258768, -- Battered Safebox Key
	258769, -- Worn Safebox Key
	258770, -- Tarnished Safebox Key
	258839, -- Concealed Catalogue
	259084, -- Gift of the Cycle
	259335, -- Photo Finisher
	259899, -- Ashen Horn of the Fallen Keeper
	260170, -- Oathstone Fragment
	260522, -- Duck Egg
	260532, -- Tuskarr Dinner Bell
	260533, -- Oddsight Focus
	262559, -- Spare Key
	262741, -- \"Dispelling Leap\" Kit
	262742, -- \"Swift\" Kit
	262743, -- \"Nullification Field\" Kit
	262744, -- \"Riftwalk\" Kit
	262745, -- \"Stealth\" Kit
	262746, -- \"Clockwork Sentinel\" Kit
	262755, -- \"Eccentro-Magic Pulse\" Enhancement
	262756, -- \"Make Decoy\" Enhancement
	262757, -- \"Greater Metamorph\" Enhancement
	262951, -- Sin'dorei Gravestone
	262963, -- Pious Memorial
	262964, -- Death's Hope
	262965, -- Delver's Delight
	262966, -- Budget Friendly
	263198, -- Valdekar's Special
	263244, -- Enigmatic Fountain
	263348, -- Purple Is The New Black
	263350, -- Harbinger Fan Fiction
	263354, -- Filling the Void in Your Heart
	263361, -- Chicken Soup for the Soulless
	263368, -- Armageddon and You - A Beginner's Guide to Thriving in the Apocalypse
	263373, -- You Can't Believe It's Not Void
	263377, -- Xal-a-Pal
	263379, -- Personal Advertising Platform
	263380, -- Recruitment Pamphlets
	263381, -- Xal'atath Wall Scrolls
	263382, -- Twilight Material
	263933, -- Preyseeker's Hearthstone
	263934, -- Chest of Gold
	264182, -- Kelum'ko's Generous Aromatic Gift
	264183, -- Kelum'ko's Generous Aromatic Gift
	-- Monk
	136800, -- Meditation Manual: Zen Flight
	139861, -- Mogu Madstone
	146170, -- Ensemble: Vindictive Combatant's Ironskin Armor
	146171, -- Ensemble: Vindictive Combatant's Ironskin Armor
	147683, -- Ensemble: Cruel Combatant's Ironskin Armor
	147684, -- Ensemble: Cruel Combatant's Ironskin Armor
	150258, -- Ensemble: Fierce Combatant's Ironskin Armor
	150259, -- Ensemble: Fierce Combatant's Ironskin Armor
	225338, -- Glyph of Jab
	-- Paladin, Priest, Shaman, Monk, Druid, Evoker
	168944, -- Web of Unbridled Vitality
	-- Priest
	17413, -- Codex: Prayer of Fortitude
	21284, -- Codex of Greater Heal
	21285, -- Codex of Renew
	21287, -- Codex of Prayer of Healing
	22393, -- Codex: Prayer of Shadow Protection
	29549, -- Codex: Prayer of Fortitude
	31837, -- Codex: Prayer of Shadow Protection
	79538, -- Glyph of the Heavens
	139873, -- Bottled Sanity
	146158, -- Ensemble: Vindictive Combatant's Satin Armor
	146159, -- Ensemble: Vindictive Combatant's Satin Armor
	146433, -- Ensemble: Bloodthirsty Gladiator's Satin Armor
	147687, -- Ensemble: Cruel Combatant's Satin Armor
	147688, -- Ensemble: Cruel Combatant's Satin Armor
	150262, -- Ensemble: Fierce Combatant's Satin Armor
	150263, -- Ensemble: Fierce Combatant's Satin Armor
	171980, -- Ensemble: Vestments of the Devout
	-- Priest, Mage, Warlock
	152734, -- Unsullied Cloth Mantle
	152738, -- Unsullied Cloth Cap
	152742, -- Unsullied Cloth Cuffs
	153135, -- Unsullied Cloth Robes
	153141, -- Unsullied Cloth Mitts
	153144, -- Unsullied Cloth Slippers
	153154, -- Unsullied Cloth Leggings
	153156, -- Unsullied Cloth Sash
	180178, -- Ensemble: Dread Aspirant's Cloth Armor
	180179, -- Ensemble: Dread Aspirant's Cloth Armor
	180186, -- Ensemble: Sinister Aspirant's Cloth Armor
	180187, -- Ensemble: Sinister Aspirant's Cloth Armor
	180194, -- Ensemble: Notorious Aspirant's Cloth Armor
	180195, -- Ensemble: Notorious Aspirant's Cloth Armor
	180203, -- Ensemble: Corrupted Gladiator's Cloth Armor
	184419, -- Ensemble: Dread Gladiator's Cloth Armor
	184420, -- Ensemble: Dread Gladiator's Cloth Armor
	184427, -- Ensemble: Sinister Gladiator's Cloth Armor
	184428, -- Ensemble: Sinister Gladiator's Cloth Armor
	184436, -- Ensemble: Notorious Gladiator's Cloth Armor
	184437, -- Ensemble: Notorious Gladiator's Cloth Armor
	200909, -- Ensemble: Corrupted Runelord's Regalia
	203693, -- Ensemble: Cloudburst Regalia
	211140, -- Ensemble: Drakebreaker's Cloth Armor
	211141, -- Ensemble: Scalewarden's Cloth Armor
	211156, -- Arsenal: Drakebreaker's Wand
	211166, -- Arsenal: Scalewarden's Wand
	-- Priest, Mage, Warlock, Monk, Druid, Evoker
	211155, -- Arsenal: Drakebreaker's Offhand
	211167, -- Arsenal: Scalewarden's Offhand
	-- Profession > Alchemy
	193493, -- Expert Alchemist's Hat
	193544, -- Master's Wildercloth Alchemist's Robe
	219872, -- Nerubian Alchemist's Hat
	222850, -- Artisan Alchemist's Robe
	-- Profession > Blacksmithing
	5956, -- Blacksmith Hammer
	136350, -- Brumdysla, Hammer of Vrorsk
	140209, -- 'Imported' Blacksmith Hammer
	157585, -- Blacksmith Hammer
	174280, -- Bastion Blacksmithing Hammer
	177033, -- Manual Metal Shaper
	181763, -- Bonesmith's Hammer
	191230, -- Khaz'gorite Blacksmith's Toolbox
	193613, -- Flameproof Apron
	219874, -- Earthen Forgemaster's Apron
	-- Profession > Cooking
	223969, -- Secret Sauce
	-- Profession > Enchanting
	22463, -- Runed Eternium Rod
	36898, -- Runed Azurite Rod
	193042, -- Resonant Focus
	193533, -- Master's Wildercloth Enchanter's Hat
	215125, -- Enchanter's Crystal
	222849, -- Artisan Enchanter's Hat
	-- Profession > Engineering
	193491, -- Shockproof Gloves
	198246, -- Khaz'gorite Encased Samophlange
	219870, -- Charged Scrapmaster's Gauntlets
	221798, -- Aqirite Fueled Samophlange
	-- Profession > Fishing
	224171, -- Master's Wildercloth Fishing Cap
	-- Profession > Herbalism
	191224, -- Khaz'gorite Sickle
	193488, -- Lavish Floral Pack
	193542, -- Master's Wildercloth Gardening Hat
	219867, -- Stonebound Herbalist's Pack
	221697, -- Artisan Gardening Hat
	222488, -- Artisan Sickle
	222847, -- Artisan Gardening Hat
	-- Profession > Inscription
	193039, -- Fine-Print Trifocals
	193040, -- Magnificent Margin Magnifier
	194875, -- Scribe's Resplendent Quill
	215122, -- Novelist's Specs
	215123, -- Forger's Font Inspector
	-- Profession > Jewelcrafting
	193041, -- Alexstraszite Loupes
	193616, -- Resplendent Cover
	215124, -- Extravagant Loupes
	219876, -- Earthen Jeweler's Cover
	-- Profession > Leatherworking
	191227, -- Khaz'gorite Leatherworker's Knife
	191229, -- Khaz'gorite Leatherworker's Toolset
	193492, -- Masterwork Smock
	219871, -- Arathi Leatherworker's Smock
	222492, -- Artisan Leatherworker's Knife
	222493, -- Artisan Leatherworker's Toolset
	-- Profession > Mining
	1819, -- Gouging Pick
	198244, -- Khaz'gorite Delver's Helmet
	198263, -- Bottomless Mireslush Ore Satchel
	221796, -- Aqirite Miner's Headgear
	221800, -- Miner's Aqirite Hoard
	-- Profession > Skinning
	191225, -- Khaz'gorite Skinning Knife
	193489, -- Reinforced Pack
	193490, -- Expert Skinner's Cap
	219868, -- Deep Tracker's Pack
	219869, -- Deep Tracker's Cap
	-- Profession > Tailoring
	191226, -- Khaz'gorite Needle Set
	222491, -- Artisan Needle Set
	222852, -- Artisan Tailor's Coat
	-- Recipe > Alchemy
	193366, -- Advanced Phial Alchemical Experimentation
	193367, -- Advanced Potion Alchemical Experimentation
	194973, -- Reclaim Concoctions
	210813, -- Wild Experimentation
	210829, -- Neutralize Concoctions
	211796, -- Thaumaturgy
	211958, -- Meticulous Experimentation
	223883, -- Mercurial Transmutation
	223884, -- Volatile Transmutation
	223885, -- Ominous Transmutation
	223886, -- Mercurial Herbs
	223887, -- Ominous Herbs
	242637, -- Recycle Potions
	-- Recipe > Book
	8046, -- Kearnen's Journal
	166502, -- Blood-Soaked Tome of Dark Whispers
	171312, -- Recipe: Void Focus
	183124, -- Simple Tome of Bone-Binding
	186684, -- Memories of Brighter Times
	211314, -- Cinder of Companionship
	-- Recipe > Cooking
	86512, -- Journeyman Cookbook
	86550, -- Apprentice Cookbook
	86551, -- Expert Cookbook
	86552, -- Artisan Cookbook
	86553, -- Master Cookbook
	86554, -- Grand Master Cookbook
	-- Recipe > Enchanting
	11151, -- Ancient Enchanting Vellum
	-- Recipe > Inscription
	104209, -- Charred Recipe
	104215, -- Charred Recipe
	104217, -- Charred Recipe
	104220, -- Charred Recipe
	104226, -- Charred Recipe
	104230, -- Charred Recipe
	198390, -- Milling
	199901, -- Extraction: Awakened Fire
	199903, -- Extraction: Awakened Frost
	199904, -- Extraction: Awakened Air
	199905, -- Extraction: Awakened Earth
	222545, -- Milling
	262908, -- Milling
	-- Recipe > Jewelcrafting
	127771, -- Gemcutter Module: Critical Strike
	127772, -- Gemcutter Module: Haste
	127773, -- Gemcutter Module: Mastery
	127775, -- Gemcutter Module: Stamina
	194709, -- Prospecting
	201926, -- Crushing
	204216, -- Primordial Pulverizing
	215360, -- Personalized Setting
	-- Recipe > Tailoring
	194127, -- Dragon Isles Unravelling
	194537, -- Fiddle with Draconium Fabric Cutters
	194538, -- Fiddle with Khaz'gorite Fabric Cutters
	222788, -- Khaz Algar Unraveling
	-- Rogue
	2892, -- Empty Poison Vial
	2893, -- Empty Poison Vial
	5237, -- Empty Poison Vial
	6949, -- Empty Poison Vial
	6950, -- Empty Poison Vial
	8926, -- Empty Poison Vial
	8927, -- Empty Poison Vial
	8928, -- Empty Poison Vial
	8984, -- Empty Poison Vial
	10918, -- Empty Poison Vial
	20844, -- Empty Poison Vial
	21300, -- Handbook of Backstab
	21302, -- Handbook of Deadly Poison
	21927, -- Empty Poison Vial
	22054, -- Empty Poison Vial
	22055, -- Empty Poison Vial
	24102, -- Manual of Eviscerate IX
	27553, -- Crimson Steer Energy Drink
	43231, -- Empty Poison Vial
	43233, -- Empty Poison Vial
	136803, -- Dirty Tricks, Vol 1: Detection
	139442, -- Glyph of Burnout
	139833, -- Leech Brew
	146172, -- Ensemble: Vindictive Combatant's Leather Armor
	146173, -- Ensemble: Vindictive Combatant's Leather Armor
	146427, -- Ensemble: Bloodthirsty Gladiator's Leather Armor
	147685, -- Ensemble: Cruel Combatant's Leather Armor
	147686, -- Ensemble: Cruel Combatant's Leather Armor
	150260, -- Ensemble: Fierce Combatant's Leather Armor
	150261, -- Ensemble: Fierce Combatant's Leather Armor
	171981, -- Ensemble: Shadowcraft Armor
	220156, -- Bubbling Wax
	234245, -- Glyph of the Ashvane Pistol Shot
	234246, -- Glyph of the Admiral's Pistol Shot
	234247, -- Glyph of the Gilded Pistol Shot
	234248, -- Glyph of the Twilight Pistol Shot
	-- Rogue, Monk, Druid
	203696, -- Ensemble: Dust Devil Armor
	-- Rogue, Priest, Shaman, Mage, Warlock, Druid, Evoker
	211146, -- Arsenal: Drakebreaker's Knife
	211174, -- Arsenal: Scalewarden's Dagger
	-- Shaman
	21292, -- Tablet of Strength of Earth Totem
	23320, -- Tablet of Flame Shock
	136938, -- Tome of Hex: Compy
	136969, -- Tome of Hex: Spider
	136971, -- Tome of Hex: Snake
	138832, -- Illusion: Earthliving
	138833, -- Illusion: Flametongue
	138834, -- Illusion: Frostbrand
	138835, -- Illusion: Rockbiter
	138836, -- Illusion: Windfury
	139841, -- Totem of the Earth
	140632, -- Lava Fountain
	146152, -- Ensemble: Vindictive Combatant's Ringmail Armor
	146153, -- Ensemble: Vindictive Combatant's Ringmail Armor
	146431, -- Ensemble: Bloodthirsty Gladiator's Ringmail Armor
	147673, -- Ensemble: Cruel Combatant's Ringmail Armor
	147674, -- Ensemble: Cruel Combatant's Ringmail Armor
	150248, -- Ensemble: Fierce Combatant's Ringmail Armor
	150249, -- Ensemble: Fierce Combatant's Ringmail Armor
	159841, -- Tome of Hex: Skeletal Hatchling
	190378, -- Glyph of the Spectral Lupine
	190380, -- Glyph of the Spectral Vulpine
	-- Unknown > Unknown
	43228, -- Stone Keeper's Shard
	-- Warlock
	4213, -- Grimoire of Doom
	9214, -- Grimoire of Inferno
	21281, -- Grimoire of Shadow Bolt
	21282, -- Grimoire of Immolate
	21283, -- Grimoire of Corruption
	22891, -- Grimoire of Shadow Ward
	25469, -- Grimoire of Avoidance
	139857, -- Helm of Command
	140764, -- Grimoire of the First Necrolyte
	146160, -- Ensemble: Vindictive Combatant's Felweave Armor
	146161, -- Ensemble: Vindictive Combatant's Felweave Armor
	146425, -- Ensemble: Bloodthirsty Gladiator's Felweave Armor
	147681, -- Ensemble: Cruel Combatant's Felweave Armor
	147682, -- Ensemble: Cruel Combatant's Felweave Armor
	150256, -- Ensemble: Fierce Combatant's Felweave Armor
	150257, -- Ensemble: Fierce Combatant's Felweave Armor
	171983, -- Ensemble: Dreadmist Raiment
	-- Warrior
	21298, -- Manual of Battle Shout
	139853, -- Axe of the Valkyra
	146162, -- Ensemble: Vindictive Combatant's Plate Armor
	146163, -- Ensemble: Vindictive Combatant's Plate Armor
	146429, -- Ensemble: Bloodthirsty Gladiator's Plate Armor
	147691, -- Ensemble: Cruel Combatant's Plate Armor
	147692, -- Ensemble: Cruel Combatant's Plate Armor
	150266, -- Ensemble: Fierce Combatant's Plate Armor
	150267, -- Ensemble: Fierce Combatant's Plate Armor
	-- Warrior, Paladin, Death Knight
	152743, -- Unsullied Plate Sabatons
	153140, -- Unsullied Plate Waistplate
	153143, -- Unsullied Plate Breastplate
	153146, -- Unsullied Plate Greaves
	153150, -- Unsullied Plate Vambraces
	153153, -- Unsullied Plate Pauldrons
	153155, -- Unsullied Plate Helmet
	153157, -- Unsullied Plate Gauntlets
	180184, -- Ensemble: Dread Aspirant's Plate Armor
	180185, -- Ensemble: Dread Aspirant's Plate Armor
	180192, -- Ensemble: Sinister Aspirant's Plate Armor
	180193, -- Ensemble: Sinister Aspirant's Plate Armor
	180200, -- Ensemble: Notorious Aspirant's Plate Armor
	180201, -- Ensemble: Notorious Aspirant's Plate Armor
	180206, -- Ensemble: Corrupted Gladiator's Plate Armor
	184425, -- Ensemble: Dread Gladiator's Plate Armor
	184426, -- Ensemble: Dread Gladiator's Plate Armor
	184433, -- Ensemble: Sinister Gladiator's Plate Armor
	184434, -- Ensemble: Sinister Gladiator's Plate Armor
	184442, -- Ensemble: Notorious Gladiator's Plate Armor
	184443, -- Ensemble: Notorious Gladiator's Plate Armor
	188209, -- Ensemble: Ravencrest's Battleplate
	200910, -- Ensemble: Val'sharah Protector's Battleplate
	201230, -- Ensemble: Helarjar Berserker Warplate
	203695, -- Ensemble: Firestorm Armor
	211100, -- Ensemble: Drakebreaker's Plate Armor
	211134, -- Ensemble: Scalewarden's Plate Armor
	-- Warrior, Paladin, Death Knight, Evoker
	211153, -- Arsenal: Drakebreaker's Greatsword
	211169, -- Arsenal: Scalewarden's Greatsword
	-- Warrior, Paladin, Death Knight, Monk, Druid, Demon Hunter
	168538, -- Dazzling Azerite Formation
	-- Warrior, Paladin, Death Knight, Monk, Druid, Evoker
	211152, -- Arsenal: Drakebreaker's Polearm
	211170, -- Arsenal: Scalewarden's Polearm
	-- Warrior, Paladin, Hunter, Rogue, Priest, Death Knight, Shaman, Mage, Warlock, Monk
	86580, -- Wilted Lilypad
	-- Warrior, Paladin, Rogue, Death Knight, Mage, Warlock, Monk, Demon Hunter, Evoker
	211177, -- Arsenal: Scalewarden's Shortsword
	-- Warrior, Paladin, Rogue, Death Knight, Shaman, Monk, Demon Hunter, Evoker
	211148, -- Arsenal: Drakebreaker's Axe
	211172, -- Arsenal: Scalewarden's Axe
	-- Warrior, Paladin, Rogue, Priest, Death Knight, Shaman, Monk, Druid, Evoker
	211143, -- Arsenal: Drakebreaker's Spiked Hammer
	211144, -- Arsenal: Drakebreaker's Club
	211175, -- Arsenal: Scalewarden's Mace
	211176, -- Arsenal: Scalewarden's Club
	223989, -- Arsenal: Hellbloom Club
	223990, -- Arsenal: Hellbloom Hammer
	223991, -- Arsenal: Hellbloom Knife
	223992, -- Arsenal: Hellbloom Wand
	223993, -- Arsenal: Hellbloom Polearm
	223994, -- Arsenal: Hellbloom Shield
	223995, -- Arsenal: Hellbloom Staff
	223996, -- Arsenal: Hellbloom Bow
	223997, -- Arsenal: Hellbloom Warglaive
	223998, -- Arsenal: Hellbloom Sword
	223999, -- Arsenal: Hellbloom Greatsword
	224000, -- Arsenal: Hellbloom Axe
	224001, -- Arsenal: Hellbloom Branch
	-- Warrior, Paladin, Shaman
	211150, -- Arsenal: Drakebreaker's Shield
	211171, -- Arsenal: Scalewarden's Shield
}