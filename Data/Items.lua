-- Data/Items.lua
-- https://github.com/ticstyle/WoW-OpenIt

-- luacheck: globals

local _, addon = ...

local itemIDs = {
	-- Caches, Chests & Containers
	139879, -- Crate of Champion Equipment
	142156, -- Order Resources Cache
	147876, -- Paragon Caches
	150737, -- Abundant Order Resources Cache
	170502, -- Waterlogged Toolbox
	207002, -- Heavy Dragonscale Chest
	211413, -- Radiant Cache
	202081, -- Dreamsurge Crate
	270244, -- Field Pouch
	264184, -- [Arsenal: Heirlooms of Atal'Aman]

	-- Lockboxes, Geodes & Clams
	5523, -- Small Barnacled Clam
	5524, -- Thick-Shelled Clam
	7973, -- Big-Mouth Clam
	16885, -- Heavy Junkbox
	36781, -- Darkwater Clam
	52340, -- Abyssal Clam
	78890, -- Crystalline Geode
	78891, -- Elementium-Coated Geode
	168853, -- Barnacled Lockbox
	198395, -- Dull Spined Clam
	202091, -- Unexplored Geode

	-- Profession Knowledge & Research
	201300, -- MINING [Iridescent Ore Fragments]
	113992, -- Scribe's Research Notes
	114002, -- Encoded Message
	114171, -- Crate Restored Artifact
	128980, -- Scroll of Forgotten Knowledge
	151653, -- Broken Isles Recipe Scrap
	198675, -- Lava-Infused Seed
	198689, -- Stormbound Horn
	198694, -- Enriched Earthen Shard
	198798, -- Flashfrozen Scroll
	198799, -- Forgotten Arcane Tome
	198800, -- Fractured Titanic Sphere
	201705, -- Studying (Knowledge Item)
	208396, -- Dragon Shard of Knowledge
	210231, -- Everburning Core
	210234, -- Essence of Dreams
	222546, -- Algari Treatise on Alchemy
	222547, -- Algari Treatise on Tailoring
	222548, -- Algari Treatise on Inscription
	222549, -- Algari Treatise on Leatherworking
	222550, -- Algari Treatise on Enchanting
	222551, -- Algari Treatise on Jewelcrafting
	222552, -- Algari Treatise on Herbalism
	222553, -- Algari Treatise on Mining
	222554, -- Algari Treatise on Blacksmithing
	222621, -- Algari Treatise on Engineering
	222649, -- Algari Treatise on Skinning

	-- Reputation Insignias & Tokens
	17047, -- Argent Dawn Valor Token
	94223, -- Stolen Shado-Pan Insignia
	94225, -- Stolen Celestial Insignia
	94226, -- Stolen Klaxxi Insignia
	94227, -- Stolen Golden Lotus Insignia
	139020, -- Valarjar Insignia
	139021, -- Dreamweaver Insignia
	139024, -- Highmountain Tribe Insignia
	139026, -- Nightfallen Insignia
	141340, -- Court of Farondis Insignia
	141342, -- Wardens Insignia
	141987, -- Greater Valarjar Insignia
	141988, -- Greater Dreamweaver Insignia
	141989, -- Greater Court of Farondis Insignia
	141990, -- Greater Highmountain Tribe Insignia
	141991, -- Greater Wardens Insignia
	141992, -- Greater Nightfallen Insignia
	146949, -- Legionfall Insignia
	147727, -- Greater Legionfall Insignia
	152955, -- Greater Army of the Light Insignia
	152958, -- Army of the Light Insignia
	152959, -- Argussian Reach Insignia
	152961, -- Greater Argussian Reach Insignia
	190339, -- Enlightened Offering
	201779, -- Merithra's Blessing
	201781, -- Memory of Tyr
	201782, -- Tyr's Blessing
	201783, -- Tutaqan's Commendation
	202091, -- Dragonscale Expedition Insignia
	202092, -- Iskaara Tuskarr Insignia
	202093, -- Valdrakken Accord Insignia
	202094, -- Maruuk Centaur Insignia
	205342, -- Loamm Niffen Insignia
	210324, -- Medal of Honor
	210757, -- Dream Warden Emblem

	-- Crests, Sparks & Currencies
	141071, -- Badge of Honor
	154879, -- Awoken Titan Essence
	204075, -- Whelpling's Shadowflame Crest Fragment
	204076, -- Drake's Shadowflame Crest Fragment
	204077, -- Wyrm's Shadowflame Crest Fragment
	204078, -- Aspect's Shadowflame Crest Fragment
	204717, -- Splintered Spark of Shadowflame
	210756, -- Gleaming Satchel of Drake's Dreaming Crests
	210762, -- Shimmering Clutch of Wyrm's Dreaming Crests
	210768, -- Viridescent Bouquet of Aspect's Dreaming Crests
	210770, -- Satchel of Drake's Dreaming Crests
	210917, -- Pouch of Whelpling's Dreaming Crests
	210923, -- Clutch of Wyrm's Dreaming Crests
	211515, -- Splintered Spark of Awakening
	211950, -- Lively Clutch of Wyrm's Awakened Crests
	211951, -- Pouch of Whelpling's Awakened Crests
	212383, -- Yawning Basket of Aspect's Awakened Crests
	212384, -- Restless Satchel of Drake's Awakened Crests
	220767, -- Triumphant Satchel of Carved Harbinger Crests
	220773, -- Celebratory Pack of Runed Harbinger Crests
	220776, -- Glorious Cluster of Gilded Harbinger Crests
	221268, -- Pouch of Weathered Harbinger Crests
	221373, -- Satchel of Carved Harbinger Crests
	221375, -- Pack of Runed Harbinger Crests
	230905, -- Fractured Spark of Fortunes
	231153, -- Triumphant Satchel of Carved Undermine Crests
	231154, -- Celebratory Pack of Runed Undermine Crests
	231264, -- Glorious Cluster of Gilded Undermine Crests
	231267, -- Pouch of Weathered Undermine Crests
	231269, -- Satchel of Carved Undermine Crests
	231270, -- Pack of Runed Undermine Crests
	231757, -- Fractured Spark of Fortunes

	-- Treasure Maps & Exploration Notes
	140744, -- Treasure Map: Azsuna
	166999, -- Treasure Map
	194540, -- Nokhud Armorer's Notes
	195453, -- Ludo's Stash Map
	198843, -- Emerald Gardens Explorer's Notes
	198852, -- Bear Termination Orders
	198854, -- Archeologist Artifact Notes
	199061, -- A Guide to Rare Fish
	199062, -- Ruby Gem Cluster Map
	199065, -- Sorrowful Letter
	199066, -- Letter of Caution
	199067, -- Precious Plans
	199068, -- Time-Lost Memo
	200738, -- Onyx Gem Cluster Map

	-- Delve Relics & Coffer Keys
	218129, -- Porcelain Arrowhead Idol
	225249, -- Rattling Bag o' Gold
	225897, -- Brute Force Idol
	225898, -- Idol of the Earthmother
	225900, -- Light-Touched Idol
	225901, -- Streamlined Relic
	225902, -- Idol of Final Will
	225903, -- Amorphous Relic
	225904, -- Time Lost Relic
	225905, -- Olden Seeker Relic
	225906, -- Lifeless Necrotic Relic
	225907, -- Relic of Sentience
	225908, -- Relicblood of Zekvir
	228582, -- Streamlined Relic
	228984, -- Unbreakable Iron Idol
	229353, -- Rage-Filled Idol
	229899, -- Coffer Key Shard
	233071, -- Delver's Bounty
	233555, -- Restored Coffer Key
	235531, -- Restored Coffer Key
	236096, -- Coffer Key Shard

	-- Pandaria Remix Threads & Gems
	210681, -- Chipped Quick Topaz
	210714, -- Chipped Deadly Sapphire
	210715, -- Chipped Masterful Amethyst
	210716, -- Chipped Swift Opal
	210717, -- Chipped Hungering Ruby
	210718, -- Hungering Ruby
	210982, -- Thread of Power
	210983, -- Thread of Stamina
	210984, -- Thread of Critical Strike
	210985, -- Thread of Haste
	210986, -- Thread of Speed
	210987, -- Thread of Leech
	210989, -- Thread of Mastery
	211106, -- Masterful Amethyst
	211107, -- Quick Topaz
	211109, -- Chipped Sustaining Emerald
	211123, -- Deadly Sapphire
	211124, -- Swift Opal
	211125, -- Sustaining Emerald
	216639, -- Flawed Swift Opal
	216640, -- Flawed Masterful Amethyst
	216641, -- Flawed Hungering Ruby
	216642, -- Flawed Sustaining Emerald
	216643, -- Flawed Quick Topaz
	216644, -- Flawed Deadly Sapphire
	217722, -- Thread of Experience
	219256, -- Temporal Thread of Power
	219257, -- Temporal Thread of Stamina
	219258, -- Temporal Thread of Critical Strike
	219259, -- Temporal Thread of Haste
	219260, -- Temporal Thread of Speed
	219261, -- Temporal Thread of Leech
	219262, -- Temporal Thread of Mastery
	219263, -- Temporal Thread of Versatility
	219264, -- Temporal Thread of Experience
	219265, -- Perpetual Thread of Power
	219266, -- Perpetual Thread of Stamina
	219267, -- Perpetual Thread of Critical Strike
	219268, -- Perpetual Thread of Haste
	219269, -- Perpetual Thread of Speed
	219270, -- Perpetual Thread of Leech
	219271, -- Perpetual Thread of Mastery
	219272, -- Perpetual Thread of Versatility
	219273, -- Perpetual Thread of Experience
	219274, -- Infinite Thread of Power
	219275, -- Infinite Thread of Stamina
	219276, -- Infinite Thread of Critical Strike
	219277, -- Infinite Thread of Haste
	219278, -- Infinite Thread of Speed
	219279, -- Infinite Thread of Leech
	219280, -- Infinite Thread of Mastery
	219281, -- Infinite Thread of Versatility
	219282, -- Infinite Thread of Experience
	220367, -- Chipped Stalwart Pearl
	220368, -- Flawed Stalwart Pearl
	220370, -- Stalwart Pearl
	220371, -- Chipped Versatile Diamond
	220372, -- Flawed Versatile Diamond
	220374, -- Versatile Diamond
	223904, -- Asynchronized Cogwheel Gem
	223905, -- Asynchronized Meta Gem
	223906, -- Asynchronized Tinker Gem
	223907, -- Asynchronized Prismatic Gem
	226142, -- Greater Spool of Eternal Thread
	226143, -- Spool of Eternal Thread
	226144, -- Lesser Spool of Eternal Thread
	226145, -- Minor Spool of Eternal Thread

	-- Pets, Mounts, Toys & Cosmetics
	44983, -- Strand Crawler
	82800, -- Pet Cage
	89125, -- Sack of Pet Supplies
	91085, -- Pet Supplies
	91086, -- Pet Supplies
	93146, -- Pet Supplies
	93147, -- Pet Supplies
	93148, -- Pet Supplies
	93149, -- Pet Supplies
	94207, -- Pet Supplies
	98095, -- Pet Supplies
	104165, -- Kovok
	118427, -- Autographed Hearthstone Card
	118697, -- Pet Supplies
	122535, -- Traveler's Pet Supplies
	142447, -- Torn Sack of Pet Supplies
	199752, -- Ensemble: Crimson Valdrakken Clothing
	199753, -- Ensemble: Black Valdrakken Clothing
	199754, -- Ensemble: Azure Valdrakken Clothing
	199755, -- Ensemble: Green Valdrakken Clothing
	199756, -- Ensemble: Bronze Valdrakken Clothing
	201837, -- Magmammoth Harness
	205363, -- Ensemble: Ornate Black Dragon Labwear
	207018, -- Rift-Mender's Spaulders
	207020, -- Ensemble: Rift-Mender's Vestments
	208126, -- Quantum Shield
	208216, -- Reins of the Quantum Courser
	209417, -- Ensemble: Thundering Stormrider's Attire
	209604, -- Ensemble: Raiment of Amirdrassil
	210790, -- Ensemble: Elegant Green Dragon Outerwear

	--Mounts
	268557, -- [Akiki]

	-- General Openables & Consumables
	21813, -- Bag of Heart Candies
	32971, -- Water Bucket
	46847, -- Huge Seaforium Bombs
	47030, -- Huge Seaforium Bombs
	146328, -- Petrified Wyrmtongue
	178512, -- Celebration Package (16th Anniversary)
	178513, -- Celebration Packages

	-- Decor and housing items
	271851, -- [Oozing Vilescar Barricade]
}

-- Build a fast lookup table on load
addon.knownItems = {}
for _, itemID in ipairs(itemIDs) do
	addon.knownItems[itemID] = true
end
