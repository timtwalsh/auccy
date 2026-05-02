local addonName, addonTable = ...
local frame = CreateFrame("Frame")

local function random(...)
    if addonTable.Utils and addonTable.Utils.Random then
        return (addonTable.Utils:Random(...))
    end
    return (...)
end

frame:SetScript("OnEvent", function(self, event, ...)
    local arg1 = ...
    if event == "ADDON_LOADED" and arg1 == addonName then
        print("|cff00ccffAuccy|r: Initializing Personality...")
        -- Init DB and Main Frame
        AuccyDB = AuccyDB or {}
        addonTable.UI:CreateMainFrame()
        if addonTable.UI.MainFrame then addonTable.UI.MainFrame:Hide() end

    elseif event == "AUCTION_HOUSE_SHOW" then
        addonTable.UI:CreateAHToggle()
        if addonTable.UI.MainFrame then
            local role, archetype = addonTable.Utils:GetCharacterProfile()
            local msg = random("Oh watch out here comes the big shot", "Yo!", "Yeah you weren't *really* trying to parse well last run.", "I'm dating your GM on discord, Gettin that first Warglaive :3")
            
            if role == "Banker" then
                msg = random("Oi Moneybags buy me a Blinkstrike!", "You're getting me a Blade of Wizardry right?", "Don't forget my cut!", "Buy low sell high, idiot.", "Wow, Nice outfit", "Put your credit card away, please!")
            elseif role == "Leveling Legend" then
                msg = random("Gearing up for the grind?", "Here they come! Sshh", "Out of rested exp already?", "After this just knock out a couple more quests!", "Coming along nicely", "STILL at it?!")
            end
            
            addonTable.UI.MainFrame:Show()
            addonTable.UI:UpdateTip(msg)
        end

    elseif event == "AUCTION_HOUSE_CLOSED" then
        if addonTable.UI.MainFrame then
            addonTable.UI.MainFrame:Hide()
        end
    end
end)

frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("AUCTION_HOUSE_SHOW")
frame:RegisterEvent("AUCTION_HOUSE_CLOSED")

-- Slash commands
SLASH_AUCCY1 = "/auccy"
SlashCmdList["AUCCY"] = function(msg)
    if addonTable.UI.MainFrame:IsShown() then
        addonTable.UI.MainFrame:Hide()
    else
        addonTable.UI.MainFrame:Show()
    end
end
