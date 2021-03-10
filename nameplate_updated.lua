function (self, unitId, unitFrame, envTable, modTable)
    local largeSpells, mediumSpells = modTable.largeSpellsTable, modTable.mediumSpellsTable

    local resize = modTable.resize

    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}

    if (Plater.db.profile.buffs_on_aura2) then
        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList
    end

    local didResize = false

    for containerID = 1, #auraContainers do
        local auraContainer = auraContainers [containerID]
        for _, auraIcon in ipairs (auraContainer) do
            if auraIcon:IsShown() then
                local id = auraIcon.SpellId

                if mediumSpells[id] then
                    if resize(auraIcon, modTable.config.mediumScale, modTable.config.mediumSize) then
                        didResize = true
                    end
                elseif largeSpells[id] then
                    if resize(auraIcon, modTable.config.largeScale, modTable.config.largeSize) then
                        didResize = true
                    end
                elseif auraIcon.CanStealOrPurge then
                    if resize(auraIcon, modTable.config.purgeable, durationSize) then
                        didResize = true
                    end
                else
                    if resize(auraIcon, 1, 10) then
                        didResize = true
                    end
                end
            end
        end
    end

    if Plater.Masque and didResize then
        Plater.Masque.AuraFrame1:ReSkin()
        Plater.Masque.AuraFrame2:ReSkin()
    end
end