local addonName, addonTable = ...
local Data = {}
addonTable.Data = Data

-- Hierarchical item database sourced from Blizzard Game Data API (static-classicann-us)
Data.Tree = {
    {
        name = "Gems",
        sub = {
            {
                name = "Uncommon",
                sub = {
                    {
                        name = "Red",
                        items = {
                            { id = 23095, name = "Bold Blood Garnet (Str)" },
                            { id = 23097, name = "Delicate Blood Garnet (Agi)" },
                            { id = 28595, name = "Bright Blood Garnet (AP)" },
                            { id = 23096, name = "Runed Blood Garnet (Spell Power)" },
                            { id = 23094, name = "Teardrop Blood Garnet (Heal)" },
                        }
                    },
                    {
                        name = "Orange",
                        items = {
                            { id = 23098, name = "Inscribed Flame Spessarite (STR/Crit)" },
                            { id = 23100, name = "Glinting Flame Spessarite (Agi/Hit)" },
                            { id = 31869, name = "Wicked Flame Spessarite (AP/Crit)" },
                            { id = 23101, name = "Potent Flame Spessarite (SP/Crit)" },
                            { id = 31866, name = "Veiled Flame Spessarite (SP/Hit) P3+" },
                            { id = 23099, name = "Luminous Flame Spessarite (SP/Int)" }
                        }
                    },
                    {
                        name = "Yellow",
                        items = {
                            { id = 23116, name = "Rigid Golden Draenite (Hit)" },
                            { id = 28290, name = "Smooth Golden Draenite (Crit)" },
                            { id = 23113, name = "Brilliant Golden Draenite (Int)" },
                            { id = 23114, name = "Gleaming Golden Draenite (Spell Crit)" },
                            { id = 31860, name = "Great Golden Draenite (Spell Hit)" },
                            { id = 23115, name = "Thick Golden Draenite (Def)" },
                        }
                    },
                    {
                        name = "Green",
                        items = {
                            { id = 23104, name = "Jagged Deep Peridot (Crit/Stam)" },
                            { id = 23106, name = "Dazzling Deep Peridot (Int/Mp5)" },
                            { id = 23103, name = "Radiant Deep Peridot (Spell Crit/Pen)" },
                            { id = 23105, name = "Enduring Deep Peridot (Def/Stam)" },
                        }
                    },
                    {
                        name = "Purple",
                        items = {
                            { id = 23111, name = "Sovereign Shadow Draenite (Str/Stam)" },
                            { id = 23110, name = "Shifting Shadow Draenite (Agi/Stam)" },
                            { id = 23108, name = "Glowing Shadow Draenite (SP/Stam)" },
                            { id = 23109, name = "Royal Shadow Draenite (Healing/MP5)" },
                        }
                    },
                    {
                        name = "Blue",
                        items = {
                            { id = 23118, name = "Solid Azure Moonstone (Stam)" },
                            { id = 23119, name = "Sparkling Azure Moonstone (Spirit)" },
                            { id = 23121, name = "Lustrous Azure Moonstone (Mp5)" },
                            { id = 23120, name = "Stormy Azure Moonstone (Spell Pen)" },
                        }
                    }
                }
            },
            {
                name = "Rare",
                sub = {
                    {
                        name = "Red",
                        items = {
                            { id = 24027, name = "Bold Living Ruby (Str)" },
                            { id = 24028, name = "Delicate Living Ruby (Agi)" },
                            { id = 24031, name = "Bright Living Ruby (AP)" },
                            { id = 24030, name = "Runed Living Ruby (SP)" },
                            { id = 24029, name = "Teardrop Living Ruby (Heal)" },
                            { id = 24032, name = "Subtle Living Ruby (Dodge)" },
                            { id = 24036, name = "Flashing Living Ruby (Parry)" },
                        }
                    },
                    {
                        name = "Orange",
                        items = {
                            { id = 24058, name = "Inscribed Noble Topaz (Str/Crit)" },
                            { id = 24061, name = "Glinting Noble Topaz (Agi/Hit)" },
                            { id = 31868, name = "Wicked Noble Topaz (AP/Crit)" },
                            { id = 24059, name = "Potent Noble Topaz (SP/Crit)" },
                            { id = 24060, name = "Luminous Noble Topaz (SP/Int)" },
                            { id = 31867, name = "Veiled Noble Topaz (SP/Hit)" },
                            { id = 35316, name = "Reckless Noble Topaz (SP/Haste)" },
                        }
                    },
                    {
                        name = "Yellow",
                        items = {
                            { id = 24051, name = "Rigid Dawnstone (Hit)" },
                            { id = 24048, name = "Smooth Dawnstone (Crit)" },
                            { id = 24047, name = "Brilliant Dawnstone (Int)" },
                            { id = 24050, name = "Gleaming Dawnstone (Spell Crit)" },
                            { id = 31861, name = "Great Dawnstone (Spell Hit)" },
                            { id = 35315, name = "Quick Dawnstone (Spell Haste)" },
                            { id = 24052, name = "Thick Dawnstone (Def)" },
                            { id = 24053, name = "Mystic Dawnstone (Resil)" },
                        }
                    },
                    {
                        name = "Green",
                        items = {
                            { id = 24067, name = "Jagged Talasite (Crit/Stam)" },
                            { id = 24066, name = "Radiant Talasite (Spell Crit/Spell Pen)" },
                            { id = 24065, name = "Dazzling Talasite (Int/Mp5)" },
                            { id = 24062, name = "Enduring Talasite (Def/Stam)" },
                            { id = 33782, name = "Steady Talasite (Resil/Stam)" },
                        }
                    },
                    {
                        name = "Purple",
                        items = {
                            { id = 24054, name = "Sovereign Nightseye (Str/Stam)" },
                            { id = 24055, name = "Shifting Nightseye (Agi/Stam)" },
                            { id = 31863, name = "Balanced Nightseye (AP/Stam)" },
                            { id = 24056, name = "Glowing Nightseye (SP/Stam)" },
                            { id = 24057, name = "Royal Nightseye (Heal/Mp5)" },
                            { id = 35707, name = "Regal Nightseye (Dodge/Stam)" },
                            { id = 31865, name = "Infused Nightseye (AP/Mp5)" },
                        }
                    },
                    {
                        name = "Blue",
                        items = {
                            { id = 24033, name = "Solid Star of Elune (Stam)" },
                            { id = 24035, name = "Sparkling Star of Elune (Spirit)" },
                            { id = 24037, name = "Lustrous Star of Elune (MP5)" },
                            { id = 24039, name = "Stormy Star of Elune (Spell Pen)" },
                        }
                    }
                }
            },
            {
                name = "Epic (Phase 3+)",
                sub = {
                    {
                        name = "Red",
                        items = {
                            { id = 32193, name = "Bold Crimson Spinel (Str)" },
                            { id = 32194, name = "Delicate Crimson Spinel (Agi)" },
                            { id = 35487, name = "Bright Crimson Spinel (AP)" },
                            { id = 35488, name = "Runed Crimson Spinel (Spell)" },
                            { id = 35489, name = "Teardrop Crimson Spinel (Heal)" },
                            { id = 32198, name = "Subtle Crimson Spinel (Dodge)" },
                            { id = 32199, name = "Flashing Crimson Spinel (Parry)" },
                        }
                    },
                    {
                        name = "Orange",
                        items = {
                            { id = 32217, name = "Inscribed Pyrestone (Str/Crit)" },
                            { id = 32218, name = "Potent Pyrestone (Spell/Crit)" },
                            { id = 32220, name = "Glinting Pyrestone (Agi/Hit)" },
                            { id = 32221, name = "Veiled Pyrestone (Spell/Hit)" },
                            { id = 32219, name = "Luminous Pyrestone (Spell/Int)" },
                            { id = 32222, name = "Wicked Pyrestone (AP/Crit)" },
                            { id = 35760, name = "Reckless Pyrestone (Spell/Haste)" },
                            { id = 32231, name = "Champion's Pyrestone (Str/Def)" },
                        }
                    },
                    {
                        name = "Yellow",
                        items = {
                            { id = 32204, name = "Brilliant Lionseye (Int)" },
                            { id = 32205, name = "Smooth Lionseye (Crit)" },
                            { id = 32207, name = "Gleaming Lionseye (Spell Crit)" },
                            { id = 32206, name = "Rigid Lionseye (Hit)" },
                            { id = 32208, name = "Thick Lionseye (Def)" },
                            { id = 35761, name = "Quick Lionseye (Haste)" },
                            { id = 32209, name = "Mystic Lionseye (Resil)" },
                        }
                    },
                    {
                        name = "Green",
                        items = {
                            { id = 32226, name = "Jagged Seaspray Emerald (Crit/Stam)" },
                            { id = 32223, name = "Enduring Seaspray Emerald (Def/Stam)" },
                            { id = 32224, name = "Radiant Seaspray Emerald (Sp Crit/Pen)" },
                            { id = 32225, name = "Dazzling Seaspray Emerald (Int/MP5)" },
                            { id = 35758, name = "Steady Seaspray Emerald (Resil/Stam)" },
                            { id = 35759, name = "Forceful Seaspray Emerald (Haste/Stam)" },
                            { id = 32249, name = "Turbid Seaspray Emerald (Resil/Sp Pen)" },
                        }
                    },
                    {
                        name = "Purple",
                        items = {
                            { id = 32211, name = "Sovereign Shadowsong Amethyst (Str/Stam)" },
                            { id = 32212, name = "Shifting Shadowsong Amethyst (Agi/Stam)" },
                            { id = 32215, name = "Glowing Shadowsong Amethyst (Spell/Stam)" },
                            { id = 32216, name = "Royal Shadowsong Amethyst (Heal/MP5)" },
                            { id = 32230, name = "Shattered Shadowsong Amethyst (AP/Stam)" },
                        }
                    },
                    {
                        name = "Blue",
                        items = {
                            { id = 32200, name = "Solid Empyrean Sapphire (Stam)" },
                            { id = 32201, name = "Sparkling Empyrean Sapphire (Spirit)" },
                            { id = 32202, name = "Lustrous Empyrean Sapphire (MP5)" },
                            { id = 32203, name = "Stormy Empyrean Sapphire (Sp Pen)" },
                        }
                    }
                }
            },
            {
                name = "Meta Gems",
                items = {
                    { id = 32409, name = "Relentless Earthstorm Diamond (Phys DPS)" },
                    { id = 34220, name = "Chaotic Skyfire Diamond (Spell DPS)" },
                    { id = 25890, name = "Destructive Skyfire Diamond (SP/Mana)" },
                    { id = 25896, name = "Powerful Earthstorm Diamond (Tank)" },
                    { id = 25893, name = "Mystical Skyfire Diamond (Haste)" },
                    { id = 32410, name = "Thundering Skyfire Diamond (Phys Haste)" },
                    { id = 25901, name = "Insightful Earthstorm Diamond (Healing)" },
                    { id = 25899, name = "Brutal Earthstorm Diamond (Str/Stun)" },
                }
            }
        }
    },
    {
        name = "Physical (Agi/Str)",
        sub = {
            {
                name = "Flasks",
                items = {
                    { id = 22854, name = "Flask of Relentless Assault" },
                    { id = 13510, name = "Flask of the Titans (Budget)" },
                }
            },
            {
                name = "Elixirs",
                items = {
                    { id = 22831, name = "Elixir of Major Agility (Battle)" },
                    { id = 22824, name = "Elixir of Major Strength (Battle)" },
                    { id = 9224, name = "Elixir of Demonslaying (Battle)" },
                    { id = 13452, name = "Elixir of the Mongoose (Budget)" },
                    { id = 32062, name = "Elixir of Major Fortitude (Guardian)" },
                    { id = 32067, name = "Elixir of Draenic Wisdom (Guardian/Hunter)" },
                    { id = 22840, name = "Elixir of Major Mageblood (Guardian/Hunter)" },
                }
            },
            {
                name = "Potions",
                items = {
                    { id = 22838, name = "Haste Potion" },
                    { id = 22828, name = "Insane Strength Potion" },
                }
            },
            {
                name = "Food",
                items = {
                    { id = 33872, name = "Spicy Hot Talbuk (Hit/Spirit)" },
                    { id = 27659, name = "Warp Burger (Agi/Stam)" },
                    { id = 27664, name = "Grilled Mudfish (Agi/Spirit)" },
                    { id = 27658, name = "Roasted Clefthoof (Str/Stam)" },
                    { id = 27655, name = "Ravager Dog (AP/Spirit)" },
                    { id = 21023, name = "Dirge's Kickin' Chimaerok Chops (Budget)" },
                }
            },
            {
                name = "Weapon Buffs",
                items = {
                    { id = 23529, name = "Adamantite Sharpening Stone" },
                    { id = 18262, name = "Elemental Sharpening Stone (Budget)" },
                }
            }
        }
    },
    {
        name = "Spell (SP/Int)",
        sub = {
            {
                name = "Flasks",
                items = {
                    { id = 22866, name = "Flask of Pure Death" },
                    { id = 22861, name = "Flask of Blinding Light" },
                    { id = 13512, name = "Flask of Supreme Power (Budget)" },
                    { id = 13511, name = "Flask of Distilled Wisdom (Budget)" },
                }
            },
            {
                name = "Elixirs",
                items = {
                    { id = 28103, name = "Adept's Elixir (Battle)" },
                    { id = 22835, name = "Elixir of Major Shadow Power (Battle)" },
                    { id = 22833, name = "Elixir of Major Firepower (Battle)" },
                    { id = 32067, name = "Elixir of Draenic Wisdom (Guardian)" },
                    { id = 22840, name = "Elixir of Major Mageblood (Guardian)" },
                    { id = 9264, name = "Elixir of Shadow Power (Budget)" },
                    { id = 13454, name = "Greater Arcane Elixir (Budget)" },
                    { id = 21546, name = "Elixir of Greater Firepower (Budget)" },
                }
            },
            {
                name = "Potions",
                items = {
                    { id = 22839, name = "Destruction Potion" },
                    { id = 22832, name = "Super Mana Potion" },
                    { id = 22788, name = "Flame Cap (Fire Burst)" },
                }
            },
            {
                name = "Food",
                items = {
                    { id = 27657, name = "Blackened Basilisk (SP/Spirit)" },
                    { id = 31673, name = "Crunchy Serpent (SP/Spirit)" },
                    { id = 27665, name = "Poached Bluefish (SP/Spirit)" },
                    { id = 33825, name = "Skullfish Soup (Spell Crit/Spirit)" },
                }
            }, 
            {
                name = "Weapon Oil",
                items = {
                    { id = 22522, name = "Superior Wizard Oil (SP)" },
                    { id = 20749, name = "Brilliant Wizard Oil (SP/Crit)" },
                    { id = 23123, name = "Blessed Wizard Oil (vs Undead)" },
                }
            }
        }
    },
    {
        name = "Healer (Healing Power, Mp5)",
        sub = {
            {
                name = "Flasks",
                items = {
                    { id = 22853, name = "Flask of Mighty Restoration" },
                    { id = 13511, name = "Flask of Distilled Wisdom (Budget)" },
                }
            },
            {
                name = "Elixirs",
                items = {
                    { id = 22825, name = "Elixir of Healing Power (Battle)" },
                    { id = 28103, name = "Adept's Elixir (Battle)" },
                    { id = 32067, name = "Elixir of Draenic Wisdom (Guardian)" },
                    { id = 22840, name = "Elixir of Major Mageblood (Guardian)" },
                }
            },
            {
                name = "Potions",
                items = {
                    { id = 22832, name = "Super Mana Potion" },
                    { id = 13444, name = "Major Mana Potion (Budget)" },
                    { id = 22836, name = "Major Dreamless Sleep Potion" },
                }
            },
            {
                name = "Food",
                items = {
                    { id = 27666, name = "Golden Fish Sticks (Heal/Spirit)" },
                    { id = 27661, name = "Blackened Trout (Mp5/Spirit)" },
                    { id = 33825, name = "Skullfish Soup (Spell Crit/Spirit)" },
                    { id = 13931, name = "Nightfin Soup (Mp5 Budget)" },
                }
            },
            {
                name = "Weapon Oil",
                items = {
                    { id = 22521, name = "Superior Mana Oil" },
                    { id = 20748, name = "Brilliant Mana Oil (Budget)" },
                }
            }
        }
    },
    {
        name = "Tank (Defensive, Stamina)",
        sub = {
            {
                name = "Flasks",
                items = {
                    { id = 22851, name = "Flask of Fortification" },
                }
            },
            {
                name = "Elixirs",
                items = {
                    { id = 22831, name = "Elixir of Major Agility (Battle)" },
                    { id = 22824, name = "Elixir of Major Strength (Battle)" },
                    { id = 32062, name = "Elixir of Major Fortitude (Guardian)" },
                    { id = 22834, name = "Elixir of Major Defense (Guardian)" },
                    { id = 32068, name = "Elixir of Ironskin (Guardian)" },
                }
            },
            {
                name = "Potions",
                items = {
                    { id = 22849, name = "Ironshield Potion" },
                    { id = 22797, name = "Nightmare Seed" },
                    { id = 22837, name = "Heroic Potion" },
                    { id = 22829, name = "Super Healing Potion" },
                }
            }
        }
    },
    {
        name = "Mana Restoration",
        items = {
            { id = 22832, name = "Super Mana Potion" },
            { id = 13444, name = "Major Mana Potion (Budget)" },
            { id = 20520, name = "Dark Rune" },
        }
    },
    {
        name = "Buff Scrolls",
        items = {
            { id = 27500, name = "Scroll of Protection V" },
            { id = 27502, name = "Scroll of Stamina V" },
            { id = 27503, name = "Scroll of Strength V" },
            { id = 10310, name = "Scroll of Strength IV" },
            { id = 27498, name = "Scroll of Agility V" },
            { id = 10309, name = "Scroll of Agility IV" },
            { id = 27499, name = "Scroll of Intellect V" },
            { id = 27501, name = "Scroll of Spirit V" },
        }
    },
    {
        name = "Resistance/Protection Potions",
        items = {
            { id = 33208, name = "Flask of Chromatic Wonder" },
            { id = 13513, name = "Flask of Chromatic Resistance (Budget)" },
            { id = 22841, name = "Major Fire Protection" },
            { id = 32850, name = "Major Frost Protection" },
            { id = 22844, name = "Major Nature Protection" },
            { id = 22846, name = "Major Shadow Protection" },
            { id = 22845, name = "Major Arcane Protection" },
            { id = 22847, name = "Major Holy Protection" },
        }
    }
}
