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
        [48707]="Anti-Magic Shell",
        [48792]="Icebound Fortitude",

        -- Demon Hunter
        [179057]="Chaos Nova",
        [211881]="Fel Eruption",
        [209426]="Darkness",

        -- Druid
        [5211]="Mighty Bash",
        [22812]="Barkskin",
        [61336]="Survival Instincts",
        [102342]="Ironbark",

        -- Hunter
        [3355]="Freezing Trap",
        [53480]="Roar of Sacrifice",
        [186265]="Aspect of the Turtle",

        -- Mage
        [45438]="Ice Block",

        -- Monk
        [119381]="Leg Sweep",
        [116849]="Life Cocoon",
        [122783]="Diffuse Magic",
        [125174]="Touch of Karma",
        [243435]="Fortifying Brew",

        -- Paladin
        [853]="Hammer of Justice",
        [498]="Divine Protection",
        [642]="Divine Shield",
        [184662]="Shield of Vengeance",
        [6940]="Blessing of Sacrifice",

        -- Priest
        [8122]="Psychic Scream",
        [15487]="Silence",
        [64044]="Psychic Horror",
        [33206]="Pain Suppression",
        [47585]="Dispersion",
        [213602]="Greater Fade",

        -- Rogue
        [408]="Kidney Shot",
        [2094]="Blind",
        [31224]="Cloak of Shadows",

        -- Shaman
        [305485]="Lightning Lasso",
        [108271]="Astral Shift",

        -- Warlock
        [5484]="Howl of Terror",
        [6789]="Mortal Coil",
        [104773]="Unending Resolve",

        -- Warrior
        [5246]="Intimidating Shout",
        [107570]="Storm Bolt",
        [23920]="Spell Reflection",
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
        [305392]="Chill Streak",
        [77606]="Dark Simulacrum",

        -- Demon Hunter
        [217832]="Imprison",
        [209261]="Last Resort",

        -- Druid
        [33786]="Cyclone",
        [78675]="Solar beam",
        [102543]="Incarnation: King of the Jungle",
        [102560]="Incarnation: Chosen of Elune",
        [194223]="Celestial Alignment",
        [1850]="Dash",
        [77761]="Stampeding Roar",
        [339]="Entangling Roots",
        [102359]="Mass Entanglement",
        [102793]="Ursol's Vortex",

        -- Hunter
        [213691]="Scatter Shot",
        [288613]="Trueshot",

        -- Mage
        [118]="Polymorph",
        [190319]="Combustion",
        [82691]="Ring of frost",
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
        [605]="Mind Control",
        [88625]="Holy Word: Chastise",
        [200183]="Apotheosis",
        [323673]="Mindgames",

        -- Rogue
        [1833]="Cheap Shot",
        [6770]="Sap",
        [121471]="Shadow Blades",
        [185422]="Shadow Dance",
        [2983]="Sprint",
        [31230]="Cheat Death",
        [45182]="Cheating Death",
        [212182]="Smoke Bomb",

        -- Shaman
        [51514]="Hex",
        [2825]="Bloodlust",
        [32182]="Heroism",
        [8178]="Grounding Totem Effect",
        [204288]="Earth Shield",

        -- Warlock
        [710]="Banish",
        [5782]="Fear",
        [6358]="Seduction",
        [30283]="Shadowfury",
        [113858]="Dark Soul: Instability",
        [212295]="Nether Ward",

        -- Warrior
        [18499]="Berserker Rage",
        [46924]="Bladestorm",
        [107574]="Avatar",
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