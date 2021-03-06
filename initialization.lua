function (modTable)
    -- -------------------------------------------------------------------------
    -- Configuration
    -- -------------------------------------------------------------------------
    -- Not all spells are caught by the Details lib. If you
    -- want to add additional spells yourself to one of
    -- the categories, do so below here in the format:
    --
    -- [spellId]="Spell name",


    -- -------------------------------------------------------------------------
    -- Add most important spells with huge icons.
    -- -------------------------------------------------------------------------
    local defaultLargeSpells = {

        -- DK
        [108194]="Asphyxiate",
        [207167]="Blinding Sleet",
        [48707]="Anti-Magic Shell",
        [48792]="Icebound Fortitude",
        [51052]="Anti-magic Zone",

        -- Demon Hunter
        [179057]="Chaos Nova",
        [211881]="Fel Eruption",
        [198589]="Blur",
        [209426]="Darkness",

        -- Druid
        [5211]="Mighty Bash",
        [33786]="Cyclone",
        [209753]="Cyclone",
        [22812]="Barkskin",
        [29166]="Innervate",
        [61336]="Survival Instincts",
        [102342]="Ironbark",

        -- Hunter
        [3355]="Freezing Trap",
        [53480]="Roar of Sacrifice",
        [109304]="Exhilaration",
        [186265]="Aspect of the Turtle",

        -- Mage
        [118]="Polymorph",
        [28271]="Polymorph Turtle",
        [28272]="Polymorph Pig",
        [61305]="Polymorph Black Cat",
        [61721]="Polymorph Rabbit",
        [126819]="Polymorph Porcupine",
        [161353]="Polymorph Polar Bear Cub",
        [161354]="Polymorph Monkey",
        [277787]="Polymorph Direhorn",
        [277792]="Polymorph Bumblebee",
        [45438]="Ice Block",

        -- Monk
        [119381]="Leg Sweep",
        [116849]="Life Cocoon",
        [122470]="Touch of Karma",
        [122783]="Diffuse Magic",
        [243435]="Fortifying Brew",

        -- Paladin
        [853]="Hammer of Justice",
        [498]="Divine Protection",
        [642]="Divine Shield",
        [184662]="Shield of Vengeance",
        [6940]="Blessing of Sacrifice",

        -- Priest
        [605]="Mind Control",
        [8122]="Psychic Scream",
        [15487]="Silence",
        [64044]="Psychic Horror",
        [33206]="Pain Suppression",
        [47585]="Dispersion",
        [200183]="Apotheosis",
        [213602]="Greater Fade",

        -- Rogue
        [408]="Kidney Shot",
        [2094]="Blind",
        [31224]="Cloak of Shadows",

        -- Shaman
        [51514]="Hex",
        [210873]="Hex (Compy)",
        [211004]="Hex (Spider)",
        [211010]="Hex (Snake)",
        [211015]="Hex (Cockroach)",
        [269352]="Hex (Skeletal Hatchling)",
        [277778]="Hex (Zandalari Tendonripper)",
        [277784]="Hex (Wicker Mongrel)",
        [309328]="Hex (Living Honey)",
        [305485]="Lightning Lasso",
        [8178]="Grounding Totem Effect",
        [108271]="Astral Shift",

        -- Warlock
        [5484]="Howl of Terror",
        [118699]="Fear",
        [6789]="Mortal Coil",
        [104773]="Unending Resolve",

        -- Warrior
        [5246]="Intimidating Shout",
        [132169]="Storm Bolt",
        [118038]="Die by the Sword",

        ----
        [23333]="Warsong Flag",
        [23335]="Silverwing Flag",
        [34976]="Netherstorm Flag",
    }

    -- -------------------------------------------------------------------------
    -- Add semi-important spells with medium icons.
    -- -------------------------------------------------------------------------
    local defaultMediumSpells = {

        -- DK
        [334693]="Absolute Zero",
        [305392]="Chill Streak",
        [77606]="Dark Simulacrum",

        -- Demon Hunter
        -- [187827]="Metamorphosis",
        [200166]="Metamorphosis",
        -- [202137]="Sigil of Silence",
        -- [205630]="Illidan's Grasp",
        -- [207685]="Sigil of Misery",
        [217832]="Imprison",
        -- [209261]="Last Resort",

        -- Druid
        [99]="Incapacitating Roar",
        -- [2637]="Hibernate",
        [163505]="Rake",
        [203123]="Maim",
        -- [236748]="Intimidating Roar",
        [33891]="Incarnation: Tree of Life",
        [102543]="Incarnation: King of the Jungle",
        [102560]="Incarnation: Chosen of Elune",
        [194223]="Celestial Alignment",
        [339]="Entangling Roots",
        -- [45334]="Immobilized",
        -- [50259]="Dazed",
        -- [61391]="Typhoon",
        [102359]="Mass Entanglement",
        [102793]="Ursol's Vortex",
        [1850]="Dash",
        -- [77761]="Stampeding Roar",
        [78675]="Solar beam",

        -- Hunter
        [19577]="Intimidation",
        [213691]="Scatter Shot",
        [288613]="Trueshot",
        [117526]="Binding Shot",
        [162480]="Steel Trap",
        -- [190927]="Harpoon",

        -- Mage
        -- [31661]="Dragon's Breath",
        [82691]="Ring of frost",
        [190319]="Combustion",
        [86949]="Cauterize",

        -- Monk
        [115078]="Paralysis",
        [310454]="Weapons of Order",

        -- Paladin
        [20066]="Repentance",
        [115750]="Blinding Light",
        [31884]="Avenging Wrath",
        [1022]="Blessing of Protection",
        [1044]="Blessing of freedom",
        [210256]="Blessing of Sanctuary",
        [210294]="Divine favor",

        -- Priest
        [200196]="Holy Word: Chastise (debuff spellid)",
        [200200]="Holy Word: Chastise (talent debuff spellid)",
        [10060]="Power Infusion",
        [323673]="Mindgames",

        -- Rogue
        -- [1776]="Gouge",
        [1833]="Cheap Shot",
        [6770]="Sap",
        -- [79140]="Vendetta",
        [121471]="Shadow Blades",
        [185422]="Shadow Dance",
        [2983]="Sprint",
        [31230]="Cheat Death",
        [45182]="Cheating Death",
        [212182]="Smoke Bomb",

        -- Shaman
        [197214]="Sundering",
        [2825]="Bloodlust",
        [32182]="Heroism",
        [16166]="Master of the Elements",
        [114050]="Ascendance",
        [114051]="Ascendance",
        [114052]="Ascendance",
        [191634]="Stormkeeper",
        [320125]="Echoing Shock",
        [974]="Earth Shield",
        [64695]="Earthgrab",

        -- Warlock
        [710]="Banish",
        -- [6358]="Seduction",
        [30283]="Shadowfury",
        [113858]="Dark Soul: Instability",
        [113860]="Dark Soul: Misery",
        [212295]="Nether Ward",

        -- Warrior
        [46924]="Bladestorm",
        [107574]="Avatar",
        [18499]="Berserker Rage",
        [23920]="Spell Reflection",
        [236077]="Disarm",

        --
        [331866]="Agent of Chaos",
        [345231]="Gladiator's Emblem",
    }

    -- -------------------------------------------------------------------------
    -- Add spells that should show
    -- -------------------------------------------------------------------------
    local defaultSpells = {
    }

    -- -------------------------------------------------------------------------
    -- Actual code
    -- -------------------------------------------------------------------------
    modTable.resize = function(self, scale, size)
        local expectedW = math.floor(Plater.db.profile.aura_width * scale + 0.5)
        local expectedH = math.floor(Plater.db.profile.aura_height * scale + 0.5)
        local W, H = self:GetSize()
        local currentW = math.floor(W + 0.5)
        local currentH = math.floor(W + 0.5)


        if not (currentW == expectedW) or not (currentW == expectedW) then
            self:SetSize (expectedW, expectedH)
            self.Icon:SetSize (expectedW-2, expectedH-2)
            Plater:SetFontSize(self.TimerText,size)
            return true
        end
        return false
    end

    modTable.largeSpellsTable = defaultLargeSpells
    modTable.mediumSpellsTable = defaultMediumSpells

    modTable.debug = function(table)
        for k,v in pairs(table) do
            print( k, v )
        end
    end
end