# OpenIt

**OpenIt** is a lightweight World of Warcraft (Retail) addon that scans your bags and displays a floating, interactive button whenever you have containers, satchels, lockboxes, geodes, or consumable item packages that can be opened or used.

---

## Features

* **Automatic Bag Scanning:** Detects openable items, caches, lockboxes, geodes, and usable packages in your inventory automatically.
* **Smart Requirement Validation:** Ignores items if you don't meet their requirements yet (e.g., reagent/fragment progress like `10/15`, missing professions, or insufficient levels).
* **Smart Filtering:** Automatically excludes equippable gear with "Use" effects, readable books/ledgers, hearthstones, and teleportation toys.
* **Snooze Functionality:** Temporarily hide an item for 3 hours with a single click.
* **Custom Blacklist:** Permanently blacklist annoying items straight from the floating button or manage them in the options menu.
* **Extensible Item Databases:** Pre-configured item lists organized cleanly in subdirectories for easy updates.

---

## Controls

| Action | Control | Description |
| :--- | :--- | :--- |
| **Open / Use** | `Left-Click` | Opens or uses the displayed item directly from your bags. |
| **Snooze** | `Right-Click` | Hides the current item for 3 hours. |
| **Blacklist** | `Shift + Right-Click` | Adds the item to your blacklist and immediately shows the next available item. |
| **Move** | `Click + Drag` | Drags the button to any position on your screen (when unlocked). |

---

## Options & Commands

Access the options panel via the standard WoW AddOn Settings menu or by using the slash command:

```text
/openit        - Opens the OpenIt settings panel
/openit reset  - Resets the button position to default (halfway left of screen center)
```

### Settings Include:
* **Lock Position:** Lock the button in place to prevent accidental dragging.
* **Button Size:** Scale the button smoothly from `24px` to `96px`.
* **Opacity:** Adjust button transparency from `10%` to `100%`.
* **Blacklist Manager:** Scrollable list displaying blacklisted item names with quality colors and Item IDs. Click the red **X** next to any item to remove it from your blacklist.

---

## Data Structure & Customization

OpenIt uses dedicated data files inside the `Data/` subdirectory to manage item lists:

* **`Data/Items.lua`**: Contains known item IDs that should always trigger the button.
* **`Data/Blacklist.lua`**: Contains hardcoded, permanently ignored item IDs (Hearthstones, toys, utility items).

### Adding Known Items Manually

If you find an openable item that isn't automatically picked up, you can add its ID directly to `Data/Items.lua`:

```lua
addon.knownItems = {
    [207002] = true, -- Heavy Dragonscale Chest
    [211413] = true, -- Radiant Cache
    [219191] = true, -- Hastily Scrawled Notes
}
```

*Tip: Hover over the OpenIt floating button in-game to see the Item ID listed at the bottom of the tooltip.*

---

## Installation

1. Download or clone this repository:
   ```bash
   git clone [https://github.com/ticstyle/WoW-OpenIt.git](https://github.com/ticstyle/WoW-OpenIt.git) OpenIt
   ```
2. Place the `OpenIt` folder into your WoW interface directory:
   `World of Warcraft\_retail_\Interface\AddOns\`
3. Restart WoW or run `/reload` in-game.

---

## Author

Created by **dualityps** ([GitHub](https://github.com/ticstyle)).
