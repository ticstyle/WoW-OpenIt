# Utils/Process.py

# ==============================================================================
# FUTURE UPDATE & DATABASE REQUIREMENTS INSTRUCTIONS:
# To update this item database in the future, you must export the following  
# 7 database tables as SQL files from your local game files using 'wow.export':
#   1. ItemClass.sql         - Maps main class IDs to category names (Weapon, Armor, etc.)
#   2. ItemSubClass.sql      - Maps subcategories (One-Handed Swords, Cloth, etc.)
#   3. Item.sql              - Links each item ID to its corresponding ClassID and SubclassID
#   4. ItemSparse.sql        - Contains raw item names, levels, sell prices, and allowable classes
#   5. ItemEffect.sql        - Contains active use/open effects for items that can be opened or used
#   6. PlayerCondition.sql   - Contains conditional requirements (zones, maps, factions, etc.)
#   7. Lock.sql              - Contains lock and key/unlock requirements for items/containers
#
# Place all seven files in the exact same folder as this script (Utils/) before running.
# ==============================================================================

import datetime
import os
import re

# Determine directories relative to the Utils script location
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PARENT_DIR = os.path.dirname(SCRIPT_DIR)
DATA_DIR = os.path.join(PARENT_DIR, "Data")

# Ensure the Data directory exists
os.makedirs(DATA_DIR, exist_ok=True)

# File paths for the required relational SQL tables
FILE_ITEM_CLASS = os.path.join(SCRIPT_DIR, "ItemClass.sql")
FILE_ITEM_SUBCLASS = os.path.join(SCRIPT_DIR, "ItemSubClass.sql")
FILE_ITEM_BASE = os.path.join(SCRIPT_DIR, "Item.sql")
FILE_ITEM_SPARSE = os.path.join(SCRIPT_DIR, "ItemSparse.sql")
FILE_ITEM_EFFECT = os.path.join(SCRIPT_DIR, "ItemEffect.sql")
FILE_PLAYER_CONDITION = os.path.join(SCRIPT_DIR, "PlayerCondition.sql")
FILE_LOCK = os.path.join(SCRIPT_DIR, "Lock.sql")

OUTPUT_PY_PATH = os.path.join(SCRIPT_DIR, "item_database.py")
OUTPUT_LUA_DATA_PATH = os.path.join(DATA_DIR, "Items.lua")
OUTPUT_LUA_UTILS_PATH = os.path.join(SCRIPT_DIR, "preclean.lua")

# Master Toggle: Set to False to bypass all category/subclass filtering and get unfiltered data
ENABLE_FILTERS = True

# Toggle to restrict items strictly to containers, mounts, pets, or items with usable/openable effects
FILTER_USABLE_OR_OPENABLE = False

# Toggle to exclude items that have player conditions (zone/faction/expansion locks)
EXCLUDE_ITEMS_WITH_PLAYER_CONDITIONS = True

# Toggle to exclude items that require keys (via Lock.sql)
EXCLUDE_ITEMS_REQUIRING_KEYS = True

# ------------------------------------------------------------------------------
# 1. HUMAN-READABLE CLASS & SUBCLASS TOGGLES (Player Class Combos Excluded)
# ------------------------------------------------------------------------------
ENABLED_CLASS_SUBCLASSES = {
    # Armor
    "Armor": False,
    "Armor > Cloth": False,
    "Armor > Cosmetic": False,
    "Armor > Leather": False,
    "Armor > Mail": False,
    "Armor > Miscellaneous": False,
    "Armor > Plate": False,
    "Armor > Shield": False,

    # Battle Pets
    "Battle Pets": True,
    "Battle Pets > Battle Pet": True,
    "Battle Pets > BattlePet": True,

    # Consumables
    "Consumable": True,
    "Consumable > Consumable": True,
    "Consumable > Potion": False,
    "Consumable > Potions": False,
    "Consumable > Elixir": False,
    "Consumable > Elixirs": False,
    "Consumable > Flask": False,
    "Consumable > Flasks & Phials": False,
    "Consumable > Scroll": False,
    "Consumable > Scrolls": False,
    "Consumable > Food & Drink": False,
    "Consumable > Item Enhancement": False,
    "Consumable > Bandages": False,
    "Consumable > Explosives and Devices": False,
    "Consumable > Vantus Runes": False,
    "Consumable > Combat Curio": False,
    "Consumable > Utility Curio": False,
    "Consumable > Other": True,

    # Containers
    "Container": True,
    "Container > Bag": False,
    "Container > Cooking Bag": False,
    "Container > Enchanting Bag": False,
    "Container > Engineering Bag": False,
    "Container > Gem Bag": False,
    "Container > Herb Bag": False,
    "Container > Inscription Bag": False,
    "Container > Leatherworking Bag": False,
    "Container > Mining Bag": False,
    "Container > Reagent Bag": False,
    "Container > Tackle Box": False,
    "Container > Soul Bag": False,

    # Gems
    "Gem": False,
    "Gem > Agility": False,
    "Gem > Artifact Relic": False,
    "Gem > Critical Strike": False,
    "Gem > Haste": False,
    "Gem > Intellect": False,
    "Gem > Mastery": False,
    "Gem > Multiple Stats": False,
    "Gem > Other": False,
    "Gem > Stamina": False,
    "Gem > Strength": False,
    "Gem > Versatility": False,

    # Housing
    "Housing": True,
    "Housing > Decor": True,
    "Housing > Exterior Customization": True,
    "Housing > Housing Dye": True,
    "Housing > Room": True,
    "Housing > Service Item": True,

    # Item Enhancements
    "Item Enhancement": False,
    "Item Enhancement > Chest": False,
    "Item Enhancement > Cloak": False,
    "Item Enhancement > Feet": False,
    "Item Enhancement > Finger": False,
    "Item Enhancement > Hands": False,
    "Item Enhancement > Head": False,
    "Item Enhancement > Legs": False,
    "Item Enhancement > Misc": False,
    "Item Enhancement > Miscellaneous": False,
    "Item Enhancement > Neck": False,
    "Item Enhancement > Shield/Off-hand": False,
    "Item Enhancement > Shoulder": False,
    "Item Enhancement > Two-Handed Weapon": False,
    "Item Enhancement > Waist": False,
    "Item Enhancement > Weapon": False,
    "Item Enhancement > Wrist": False,

    # Keys & Quests
    "Key": False,
    "Key > Key": False,
    "Quest": False,
    "Quest > Quest": False,

    # Miscellaneous
    "Miscellaneous": True,
    "Miscellaneous > Companion Pets": True,
    "Miscellaneous > Holiday": True,
    "Miscellaneous > Junk": False,
    "Miscellaneous > Mount": True,
    "Miscellaneous > Mount Equipment": True,
    "Miscellaneous > Other": True,
    "Miscellaneous > Reagent": False,
    "Miscellaneous > Unknown": True,

    # Professions
    "Profession": True,
    "Profession > Alchemy": True,
    "Profession > Blacksmithing": True,
    "Profession > Cooking": True,
    "Profession > Enchanting": True,
    "Profession > Engineering": True,
    "Profession > Fishing": True,
    "Profession > Herbalism": True,
    "Profession > Inscription": True,
    "Profession > Jewelcrafting": True,
    "Profession > Mining": True,
    "Profession > Skinning": True,
    "Profession > Tailoring": True,

    # Projectiles
    "Projectile": False,
    "Projectile > Arrow": False,
    "Projectile > Bullet": False,

    # Reagents
    "Reagent": False,
    "Reagent > Context Token": False,
    "Reagent > Keystone": False,
    "Reagent > Reagent": False,

    # Recipes
    "Recipe": True,
    "Recipe > Alchemy": True,
    "Recipe > Blacksmithing": True,
    "Recipe > Book": True,
    "Recipe > Cooking": True,
    "Recipe > Enchanting": True,
    "Recipe > Engineering": True,
    "Recipe > First Aid": True,
    "Recipe > Fishing": True,
    "Recipe > Inscription": True,
    "Recipe > Jewelcrafting": True,
    "Recipe > Leatherworking": True,
    "Recipe > Tailoring": True,

    # Tradeskills
    "Tradeskill": False,
    "Tradeskill > Cloth": False,
    "Tradeskill > Cooking": False,
    "Tradeskill > Elemental": False,
    "Tradeskill > Enchanting": False,
    "Tradeskill > Finishing Reagents": False,
    "Tradeskill > Herb": False,
    "Tradeskill > Inscription": False,
    "Tradeskill > Jewelcrafting": False,
    "Tradeskill > Leather": False,
    "Tradeskill > Metal & Stone": False,
    "Tradeskill > Optional Reagents": False,
    "Tradeskill > Other": False,
    "Tradeskill > Parts": False,
    "Tradeskill > Unknown": False,

    # Unknown / Housing / Token
    "Unknown > Unknown": True,
    "WoW Token": False,
    "WoW Token > WoW Token": False,

    # Weapons
    "Weapon": False,
    "Weapon > Axe": False,
    "Weapon > Bow": False,
    "Weapon > Crossbow": False,
    "Weapon > Dagger": False,
    "Weapon > Fishing Pole": False,
    "Weapon > Fist Weapon": False,
    "Weapon > Gun": False,
    "Weapon > Mace": False,
    "Weapon > Miscellaneous": False,
    "Weapon > Polearm": False,
    "Weapon > Staff": False,
    "Weapon > Sword": False,
    "Weapon > Thrown": False,
    "Weapon > Wand": False,
    "Weapon > Warglaives": False,
}

# ------------------------------------------------------------------------------
# 2. HUMAN-READABLE COLUMN / ATTRIBUTE TOGGLES
# ------------------------------------------------------------------------------
ENABLED_ATTRIBUTES = {
    "class_id": False,
    "class_name": True,
    "subclass_id": False,
    "subclass_name": True,
    "item_level": True,
    "required_level": True,
    "sell_price": False,
    "quality": True,
    "inventory_type": True,
    "allowed_classes": True,        # Decodes AllowableClass bitmask into class names
    "openable": True,               # 1 for true (containers/effects), 0 for false
    "player_condition_id": False,   # Optional numeric condition ID
    "player_condition": True,       # 1 if condition present, 0 otherwise
}

# Standard World of Warcraft class bitmask flag definitions
CLASS_FLAGS = {
    1: "Warrior",
    2: "Paladin",
    4: "Hunter",
    8: "Rogue",
    16: "Priest",
    32: "Death Knight",
    64: "Shaman",
    128: "Mage",
    256: "Warlock",
    512: "Monk",
    1024: "Druid",
    2048: "Demon Hunter",
    4096: "Evoker",
}

# Common internal developer terms used by Blizzard to tag test or unused items
JUNK_PATTERNS = ["test", "placeholder", "obsolete", "unused", "repair", "debug"]


def is_valid_item(name):
  if not name or name.strip() == "":
    return False
  name_lower = name.lower()
  for pattern in JUNK_PATTERNS:
    if pattern in name_lower:
      return False
  return True


def decode_allowable_classes(mask_val):
  if mask_val == -1 or mask_val == 0:
    return ["All Classes"]
  allowed = []
  for bit, class_name in CLASS_FLAGS.items():
    if mask_val & bit:
      allowed.append(class_name)
  return allowed if allowed else ["All Classes"]


def parse_sql_values(sql_line):
  match = re.search(r"\((.*?)\)", sql_line)
  if not match:
    return None

  raw_values = match.group(1)
  values = []
  current_val = []
  in_string = False

  i = 0
  while i < len(raw_values):
    char = raw_values[i]
    if char == "'":
      if in_string and i + 1 < len(raw_values) and raw_values[i + 1] == "'":
        current_val.append("'")
        i += 2
        continue
      else:
        in_string = not in_string
        current_val.append(char)
    elif char == "," and not in_string:
      values.append("".join(current_val).strip())
      current_val = []
    else:
      current_val.append(char)
    i += 1
  values.append("".join(current_val).strip())

  cleaned = []
  for v in values:
    if v.startswith("'") and v.endswith("'"):
      v = v[1:-1].replace("''", "'")
    cleaned.append(v)
  return cleaned


def load_table(file_path):
  rows = []
  if not os.path.exists(file_path):
    print(f"Notice: {file_path} not found. Skipping.")
    return rows

  print(f"Reading {file_path}...")
  with open(file_path, "r", encoding="utf-8", errors="ignore") as f:
    for line in f:
      stripped = line.strip()
      if stripped.startswith("("):
        vals = parse_sql_values(stripped)
        if vals:
          rows.append(vals)
  return rows


# Build Class ID mapping table
class_map = {}
for row in load_table(FILE_ITEM_CLASS):
  if len(row) >= 3:
    try:
      class_map[int(row[2])] = row[1]
    except ValueError:
      continue

# Build Subclass ID mapping table
subclass_map = {}
for row in load_table(FILE_ITEM_SUBCLASS):
  if len(row) >= 5:
    try:
      c_id = int(row[3])
      sc_id = int(row[4])
      subclass_map[(c_id, sc_id)] = row[1] if row[1] else row[2]
    except ValueError:
      continue

# Load base item relational links
item_base_data = {}
for row in load_table(FILE_ITEM_BASE):
  if len(row) >= 6:
    try:
      item_id = int(row[0])
      item_base_data[item_id] = {
          "class_id": int(row[1]) if row[1].isdigit() else 0,
          "subclass_id": (
              int(row[2])
              if row[2].isdigit()
              or (row[2].startswith("-") and row[2][1:].isdigit())
              else 0
          ),
          "inventory_type": int(row[4]) if row[4].isdigit() else 0,
      }
    except ValueError:
      continue

# Load PlayerCondition.sql into a dictionary lookup map
player_conditions = {}
for row in load_table(FILE_PLAYER_CONDITION):
  if len(row) > 0 and row[0].isdigit():
    try:
      cond_id = int(row[0])
      player_conditions[cond_id] = row
    except ValueError:
      continue

# Load Lock.sql to identify locks requiring keys (Type == 1)
locks_requiring_keys = set()
for row in load_table(FILE_LOCK):
  if len(row) > 0 and row[0].isdigit():
    try:
      lock_id = int(row[0])
      for i in range(1, len(row), 4):
        if row[i].isdigit() and int(row[i]) == 1:
          locks_requiring_keys.add(lock_id)
          break
    except ValueError:
      continue

# Load ItemEffect to identify item effects and map item_id -> player_condition_id
item_effects_set = set()
item_condition_map = {}
for row in load_table(FILE_ITEM_EFFECT):
  if len(row) >= 2:
    try:
      ints = [int(v) for v in row if v.isdigit()]
      if len(ints) >= 1:
        item_id_candidate = ints[0]
        item_effects_set.add(item_id_candidate)
        
        for val in ints[1:]:
          if val in player_conditions:
            item_condition_map[item_id_candidate] = val
            break
    except ValueError:
      continue


def is_openable_or_usable(item_id, class_name, subclass_name, row):
  """Comprehensive check to determine if an item is openable, a container,

  a mount, a companion pet, or has an active spell use effect.
  """
  if class_name == "Container":
    return True
  if class_name == "Miscellaneous" and subclass_name in [
      "Mount",
      "Companion Pets",
      "Battle Pet",
      "BattlePets",
  ]:
    return True
  if item_id in item_effects_set:
    return True
  for col_idx in [13, 14, 15, 16, 17]:
    if col_idx < len(row) and row[col_idx].isdigit():
      if int(row[col_idx]) > 0:
        return True
  return False


# Parse ItemSparse and apply category/subclass toggles, attribute toggles, and filtering
master_items = {}
for row in load_table(FILE_ITEM_SPARSE):
  if len(row) >= 67:
    try:
      item_id = int(row[0])
      name = row[5]

      if not is_valid_item(name):
        continue

      base = item_base_data.get(item_id, {})
      class_id = base.get("class_id", 0)
      subclass_id = base.get("subclass_id", 0)

      class_name = class_map.get(class_id, "Unknown")
      subclass_name = subclass_map.get((class_id, subclass_id), "Unknown")

      subclass_key = f"{class_name} > {subclass_name}"

      has_condition = item_id in item_condition_map
      
      # Check if this item references any lock that requires a key
      requires_key = False
      if locks_requiring_keys:
        for val in row:
          if val.isdigit() and int(val) in locks_requiring_keys:
            requires_key = True
            break

      # Only evaluate filtering toggles if ENABLED (master toggle is True)
      if ENABLE_FILTERS:
        # Evaluate main class toggle
        if not ENABLED_CLASS_SUBCLASSES.get(class_name, True):
          continue
        # Evaluate specific class > subclass toggle
        if (
            subclass_key in ENABLED_CLASS_SUBCLASSES
            and not ENABLED_CLASS_SUBCLASSES.get(subclass_key, True)
        ):
          continue

        # Exclude items with player conditions if toggle is active
        if EXCLUDE_ITEMS_WITH_PLAYER_CONDITIONS and has_condition:
          continue

        # Exclude items requiring keys if toggle is active
        if EXCLUDE_ITEMS_REQUIRING_KEYS and requires_key:
          continue

        # Refined usable/openable check if master filter is active
        if FILTER_USABLE_OR_OPENABLE:
          if not is_openable_or_usable(
              item_id, class_name, subclass_name, row
          ):
            continue

      # Construct item dictionary dynamically based on ENABLED_ATTRIBUTES toggles
      item_payload = {"name": name}

      if ENABLED_ATTRIBUTES.get("class_id", True):
        item_payload["class_id"] = class_id
      if ENABLED_ATTRIBUTES.get("class_name", True):
        item_payload["class_name"] = class_name
      if ENABLED_ATTRIBUTES.get("subclass_id", True):
        item_payload["subclass_id"] = subclass_id
      if ENABLED_ATTRIBUTES.get("subclass_name", True):
        item_payload["subclass_name"] = subclass_name
      if ENABLED_ATTRIBUTES.get("item_level", True):
        item_payload["item_level"] = int(row[51]) if row[51].isdigit() else 0
      if ENABLED_ATTRIBUTES.get("required_level", True):
        item_payload["required_level"] = int(row[64]) if row[64].isdigit() else 0
      if ENABLED_ATTRIBUTES.get("sell_price", True):
        item_payload["sell_price"] = int(row[23]) if row[23].isdigit() else 0
      if ENABLED_ATTRIBUTES.get("quality", True):
        item_payload["quality"] = int(row[66]) if row[66].isdigit() else 0
      if ENABLED_ATTRIBUTES.get("inventory_type", True):
        item_payload["inventory_type"] = base.get("inventory_type", 0)
      if ENABLED_ATTRIBUTES.get("allowed_classes", True):
        mask_val = (
            int(row[52])
            if row[52].isdigit()
            or (row[52].startswith("-") and row[52][1:].isdigit())
            else -1
        )
        item_payload["allowed_classes"] = decode_allowable_classes(mask_val)
      if ENABLED_ATTRIBUTES.get("openable", True):
        item_payload["openable"] = (
            1
            if is_openable_or_usable(item_id, class_name, subclass_name, row)
            else 0
        )
      if ENABLED_ATTRIBUTES.get("player_condition_id", False):
        if has_condition:
          item_payload["player_condition_id"] = item_condition_map[item_id]
      if ENABLED_ATTRIBUTES.get("player_condition", True):
        item_payload["player_condition"] = 1 if has_condition else 0

      master_items[item_id] = item_payload
    except ValueError:
      continue

sorted_ids = sorted(master_items.keys())
current_timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")

# 1. Export Python Database Module
print(
    f"Exporting {len(sorted_ids)} items to Python module {OUTPUT_PY_PATH}..."
)
with open(OUTPUT_PY_PATH, "w", encoding="utf-8") as out:
  out.write(
      f"# World of Warcraft Retail Item database for the addon OpenIt, created"
      f" {current_timestamp}\n"
  )
  out.write(f"# Number of items {len(sorted_ids)}\n")
  out.write("ITEMS = {\n")
  for item_id in sorted_ids:
    data = master_items[item_id]
    out.write(f"    {item_id}: {{\n")
    for key, val in data.items():
      if isinstance(val, str):
        safe_val = val.replace('"', '\\"')
        out.write(f'        "{key}": "{safe_val}",\n')
      elif isinstance(val, list):
        out.write(f'        "{key}": {val},\n')
      else:
        out.write(f'        "{key}": {val},\n')
    out.write("    },\n")
  out.write("}\n")

# Group items for Lua formatting
lua_groups = {}
for item_id in sorted_ids:
  data = master_items[item_id]
  allowed = data.get("allowed_classes", ["All Classes"])

  if allowed == ["All Classes"]:
    c_name = data.get("class_name", "Unknown")
    sc_name = data.get("subclass_name", "Unknown")
    group_key = f"{c_name} > {sc_name}"
  else:
    group_key = ", ".join(allowed)

  if group_key not in lua_groups:
    lua_groups[group_key] = []
  lua_groups[group_key].append((item_id, data["name"]))

# 2. Export Speed-Optimized Items.lua to Data/ folder (Sorted purely by item ID, minimal comments)
print(f"Exporting speed-optimized items to Lua file {OUTPUT_LUA_DATA_PATH}...")
with open(OUTPUT_LUA_DATA_PATH, "w", encoding="utf-8") as out:
  out.write("-- Data/Items.lua\n")
  out.write("-- https://github.com/ticstyle/WoW-OpenIt\n\n")
  out.write("-- luacheck: globals\n\n")
  out.write("local _, addon = ...\n\n")
  out.write("local itemIDs = {\n")

  # Sort purely numerically by item ID for absolute speed and clean sequence
  for item_id in sorted_ids:
    out.write(f"\t{item_id},\n")

  out.write("}\n\n")
  out.write("-- Build a fast lookup table on load\n")
  out.write("addon.knownItems = {}\n")
  out.write("for _, itemID in ipairs(itemIDs) do\n")
  out.write("\taddon.knownItems[itemID] = true\n")
  out.write("end")

# 3. Export Annotated preclean.lua to Utils/ folder (Grouped with comments and item names)
print(f"Exporting annotated items to Lua file {OUTPUT_LUA_UTILS_PATH}...")
with open(OUTPUT_LUA_UTILS_PATH, "w", encoding="utf-8") as out:
  out.write("-- Utils/preclean.lua\n")
  out.write("-- https://github.com/ticstyle/WoW-OpenIt\n\n")
  out.write(
      f"-- World of Warcraft Retail Item database for the addon OpenIt, created"
      f" {current_timestamp}\n"
  )
  out.write(f"-- Number of items {len(sorted_ids)}\n\n")
  out.write("-- Included Groups:\n")
  for group_key in sorted(lua_groups.keys()):
    out.write(f"--   {group_key}\n")
  out.write("\n")
  out.write("-- luacheck: globals\n\n")
  out.write("local _, addon = ...\n\n")
  out.write("local itemIDs = {\n")

  for group_key in sorted(lua_groups.keys()):
    out.write(f"\t-- {group_key}\n")
    sorted_group_items = sorted(lua_groups[group_key], key=lambda x: x[0])
    for item_id, name in sorted_group_items:
      safe_name = name.replace('"', '\\"')
      out.write(f"\t{item_id}, -- {safe_name}\n")
  out.write("}")

print("Generation complete.")
