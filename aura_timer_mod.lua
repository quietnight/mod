function (modTable)
    --timeIntervals
    local minute, hour, day = 60, 3600, 86400
    local aboutMinute, aboutHour, aboutDay = 59.5, 60 * 59.5, 3600 * 23.5

    local function round(x) return floor(x + 0.5) end

    function Plater.FormatTime(seconds)
        if seconds < 10 then
            return "%.1f", seconds
        elseif seconds < aboutMinute then
            local seconds = round(seconds)
            return seconds ~= 0 and seconds or ""
        elseif seconds < aboutHour then
            return "%dm", round(seconds / minute)
        elseif seconds < aboutDay then
            return "%dh", round(seconds / hour)
        else
            return "%dd", round(seconds / day)
        end
    end

    modTable.getColorByTime = function(current, max)
        if max == 0 then max = 1 end
        local percentage = (current / max) * 100
        local red, green = 0, 0
        if percentage >= 50 then
            --green to yellow
            green		= 1
            red			= ((100 - percentage) / 100) * 2
        else
            --yellow to red
            red	= 1
            green		= ((100 - (100 - percentage)) / 100) * 2
        end
        return red, green, 0
    end
end

function (self, unitId, unitFrame, envTable)

    --timeIntervals
    local minute, hour, day = 60, 3600, 86400
    local aboutMinute, aboutHour, aboutDay = 59.5, 60 * 59.5, 3600 * 23.5

    local function round(x) return floor(x + 0.5) end

    function Plater.FormatTime(seconds)
        if seconds < 10 then
            return "%.1f", seconds
        elseif seconds < aboutMinute then
            local seconds = round(seconds)
            return seconds ~= 0 and seconds or ""
        elseif seconds < aboutHour then
            return "%dm", round(seconds / minute)
        elseif seconds < aboutDay then
            return "%dh", round(seconds / hour)
        else
            return "%dd", round(seconds / day)
        end
    end

    envTable.getColorByTime = function(current, max)
        if max == 0 then max = 1 end
        local percentage = (current / max) * 100
        local red, green = 0, 0
        if percentage >= 50 then
            --green to yellow
            green		= 1
            red			= ((100 - percentage) / 100) * 2
        else
            --yellow to red
            red	= 1
            green		= ((100 - (100 - percentage)) / 100) * 2
        end
        return red, green, 0
    end

end

function (self, unitId, unitFrame, envTable, modTable)
    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}

    if (Plater.db.profile.buffs_on_aura2) then
        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList
    end

    for containerID = 1, #auraContainers do
        local auraContainer = auraContainers[containerID]
        for index, auraIcon in ipairs(auraContainer) do
            if (auraIcon:IsShown()) then
                auraIcon.Cooldown.durationBg = auraIcon.Cooldown:CreateTexture(nil, "BORDER")
                auraIcon.Cooldown.durationBg:SetColorTexture(0,0,0,.50)

                auraIcon.Cooldown.durationBg:ClearAllPoints()
                auraIcon.Cooldown.durationBg:SetPoint("CENTER", auraIcon.Cooldown.Timer)

                auraIcon.Cooldown.durationBg:Hide()
            end
        end
    end
end

function (self, unitId, unitFrame, envTable, modTable)
    --insert code here
    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}

    if (Plater.db.profile.buffs_on_aura2) then
        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList
    end

    for containerID = 1, #auraContainers do
        local auraContainer = auraContainers[containerID]
        for index, auraIcon in ipairs(auraContainer) do
            if (auraIcon.ExpirationTime and auraIcon.ExpirationTime > 0) then
                auraIcon.Cooldown.Timer:SetFormattedText(Plater.FormatTime(auraIcon.RemainingTime))
                Plater:SetFontColor(auraIcon.Cooldown.Timer, envTable.getColorByTime(auraIcon.RemainingTime, auraIcon.Duration))

                auraIcon.Cooldown.durationBg:SetWidth(auraIcon.Cooldown.Timer:GetStringWidth())
                auraIcon.Cooldown.durationBg:SetHeight(auraIcon.Cooldown.Timer:GetStringHeight())
                auraIcon.Cooldown.durationBg:Show()
            end
        end
    end
end
