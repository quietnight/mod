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
                --elseif auraIcon.CanStealOrPurge then
                --    if resize(auraIcon, modTable.config.purgeable, durationSize) then
                --        didResize = true
                --    end
                else
                    if resize(auraIcon, 1, 10) then
                        didResize = true
                    end
                end

                if  not auraIcon.Cooldown.durationBg then
                    auraIcon.Cooldown.durationBg = auraIcon.Cooldown:CreateTexture(nil, "BORDER")
                    auraIcon.Cooldown.durationBg:SetColorTexture(0,0,0,.50)

                    auraIcon.Cooldown.durationBg:ClearAllPoints()
                    auraIcon.Cooldown.durationBg:SetPoint("CENTER", auraIcon.Cooldown.Timer)

                    auraIcon.Cooldown.durationBg:Hide()
                end

                if (auraIcon.ExpirationTime and auraIcon.ExpirationTime > 0) then
                    auraIcon.Cooldown.Timer:SetFormattedText(Plater.FormatTime(auraIcon.RemainingTime))
                    Plater:SetFontColor(auraIcon.Cooldown.Timer,envTable.getColorByTime(auraIcon.RemainingTime, auraIcon.Duration))

                    auraIcon.Cooldown.durationBg:SetWidth(auraIcon.Cooldown.Timer:GetStringWidth())
                    auraIcon.Cooldown.durationBg:SetHeight(auraIcon.Cooldown.Timer:GetStringHeight())
                    auraIcon.Cooldown.durationBg:Show()

                    auraIcon:SetAlpha(1)

                    if (auraIcon.RemainingTime / (auraIcon.Duration + 0.01) ) < 0.2 and auraIcon.RemainingTime < 60 then --buff only has 20% timeleft and is less then 60 seconds.
                        local f = GetTime() % 1
                        if f > 0.5 then
                            f = 1 - f
                        end
                        auraIcon:SetAlpha(f * 3)
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