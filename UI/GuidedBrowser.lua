local addonName, addonTable = ...
local UI = addonTable.UI
local function random(...)
    if addonTable.Utils and addonTable.Utils.Random then
        return (addonTable.Utils:Random(...))
    end
    return (...)
end

function UI:CreateGuidedBrowser(parent)
    local browser = CreateFrame("Frame", nil, parent, "BackdropTemplate")
    browser:SetSize(400, 440)
    browser:SetPoint("TOPLEFT", 10, -50)

    -- Safety check for database
    if not addonTable.Data or not addonTable.Data.Tree then
        print("|cffff0000Auccy Error:|r ItemDatabase not found!")
        return
    end

    -- Navigation Bar (Breadcrumbs Container)
    local navBar = CreateFrame("Frame", nil, browser)
    navBar:SetSize(400, 30)
    navBar:SetPoint("TOPLEFT", 0, 0)
    browser.NavBar = navBar

    browser.Content = CreateFrame("Frame", nil, browser)
    browser.Content:SetSize(400, 400)
    browser.Content:SetPoint("TOPLEFT", navBar, "BOTTOMLEFT", 0, -5)

    browser.CurrentPath = {}
    browser.History = { { name = "HOME", level = addonTable.Data.Tree } }
    browser.CurrentLevel = addonTable.Data.Tree

    self.Browser = browser
    self:UpdateBrowser()
    return browser
end

function UI:UpdateTip(text)
    if self.MainFrame and self.MainFrame.Tip then
        self.MainFrame.Tip:SetText(text)
        
        -- Calculate cycles based on text length (approx 8-10 chars per mouth-cycle)
        local length = #text
        local cycles = math.max(2, math.min(12, math.floor(length / 8)))
        
        self:AnimateTalk(cycles)
    end
end

function UI:NavigateToHistoryIndex(index)
    while #self.Browser.History > index do
        table.remove(self.Browser.History)
        table.remove(self.Browser.CurrentPath)
    end
    self.Browser.CurrentLevel = self.Browser.History[#self.Browser.History].level
    self:UpdateBrowser()
    self:UpdateTip(random("You look confused", "Thought you might go another way...", "JUST CLICK THE ONE YOU WANT THIS TIME", "Oi Wabang check out this one hahaha"))
end

function UI:UpdateBreadcrumbs()
    if not self.BreadcrumbButtons then self.BreadcrumbButtons = {} end
    for _, btn in ipairs(self.BreadcrumbButtons) do btn:Hide() end

    local xOffset = 5
    for i, step in ipairs(self.Browser.History) do
        if not self.BreadcrumbButtons[i] then
            local btn = CreateFrame("Button", nil, self.Browser.NavBar)
            btn:SetHeight(20)
            btn.Text = btn:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
            btn.Text:SetPoint("LEFT")
            btn:SetFontString(btn.Text)
            
            btn.Arrow = btn:CreateTexture(nil, "OVERLAY")
            btn.Arrow:SetSize(12, 12)
            btn.Arrow:SetTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
            btn.Arrow:SetPoint("LEFT", btn.Text, "RIGHT", 2, 0)
            
            self.BreadcrumbButtons[i] = btn
        end

        local btn = self.BreadcrumbButtons[i]
        btn:SetPoint("LEFT", xOffset, 0)
        btn:SetText(step.name:upper())
        btn.Text:SetTextColor(1, 0.82, 0) -- Gold for clickable
        
        if i == #self.Browser.History then
            btn.Text:SetTextColor(1, 1, 1) -- White for current
            btn.Arrow:Hide()
            btn:SetEnabled(false)
        else
            btn.Arrow:Show()
            btn:SetEnabled(true)
            btn:SetScript("OnClick", function() self:NavigateToHistoryIndex(i) end)
        end

        local width = btn.Text:GetStringWidth()
        btn:SetWidth(width + (i == #self.Browser.History and 0 or 15))
        xOffset = xOffset + btn:GetWidth() + 5
        btn:Show()
    end
end

function UI:UpdateBrowser()
    -- Clear current content
    if not self.BrowserButtons then self.BrowserButtons = {} end
    for _, btn in ipairs(self.BrowserButtons) do btn:Hide() end

    local data = self.Browser.CurrentLevel
    for i, entry in ipairs(data) do
        if not self.BrowserButtons[i] then
            local btn = CreateFrame("Button", nil, self.Browser.Content, "BackdropTemplate")
            btn:SetSize(390, 30)
            btn:SetBackdrop({ bgFile = "Interface\\Buttons\\WHITE8X8" })
            btn:SetBackdropColor(0, 0, 0, 0.08)
            
            btn.Text = btn:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
            btn.Text:SetPoint("LEFT", 10, 0)
            btn.Text:SetPoint("RIGHT", -10, 0)
            btn.Text:SetJustifyH("LEFT")
            btn.Text:SetWordWrap(false)
            
            btn.Chevron = btn:CreateTexture(nil, "OVERLAY")
            btn.Chevron:SetSize(16, 16)
            btn.Chevron:SetPoint("RIGHT", -5, 0)
            btn.Chevron:SetTexture("Interface\\Buttons\\UI-SpellbookIcon-NextPage-Up")
            btn.Chevron:SetAlpha(0.3)
            
            self.BrowserButtons[i] = btn
        end

        local btn = self.BrowserButtons[i]
        btn:SetPoint("TOPLEFT", 5, -(i-1) * 32)
        
        local isFolder = entry.sub or entry.items
        btn.Chevron:SetShown(isFolder)

        -- Coloring and Name Handling
        local displayName = entry.name
        local searchName = entry.name
        if entry.id then
            local name, _, quality = GetItemInfo(entry.id)
            if name then
                searchName = name
                local r, g, b = GetItemQualityColor(quality)
                btn.Text:SetTextColor(r, g, b)
            else
                btn.Text:SetTextColor(1, 1, 1) -- Default white if not cached
            end
        else
            btn.Text:SetTextColor(1, 0.82, 0) -- Gold for categories
        end
        
        btn.Text:SetText(displayName)

        btn:SetScript("OnClick", function()
            if isFolder then
                local nextLevel = entry.sub or entry.items
                self.Browser.CurrentLevel = nextLevel
                table.insert(self.Browser.CurrentPath, entry.name)
                table.insert(self.Browser.History, { name = entry.name, level = nextLevel })
                self:UpdateBrowser()
                
                -- Archetype-aware tips
                local role, archetype, class = addonTable.Utils:GetCharacterProfile()
                local tipMsg = random("Need some help with " .. entry.name .. "?", "Looking for " .. entry.name .. "?", "Ah, " .. entry.name .. ". Good choice.")
                
                local gemColors = { Red = "shiny red ones", Orange = "orange ones", Yellow = "yellow ones", Green = "green ones", Purple = "purple ones", Blue = "blue ones" }
                if gemColors[entry.name] then
                    tipMsg = random("Ooh, looking for some " .. gemColors[entry.name] .. "?", "Gems? I love shiny things!", "Adding some gems to that gear?")
                    if role == "Banker" then
                        tipMsg = "Investing in some " .. entry.name .. " gems, Boss?"
                    elseif role == "Leveling Legend" then
                        tipMsg = "Nice upgrade, now back to auchindoun!"
                    elseif role == "Champion" then
                        if archetype == "Tank" then
                            tipMsg = "You're getting stamina right?"
                        else 
                            tipMsg = "I can't believe they let *you* have that?!"
                        end
                    end
                elseif entry.name == "Spell (SP/Int)" then
                    if archetype == "Caster" then tipMsg = random("Watch out everyone, they use consumables! Ooh la la!", "I heard your Spell Hit is actually capped. Showoff.","I hope you're ready to press one button for the next three hours!", "Wow, look at that Intellect. You must be a real genius.", "Ooh, Shelling out for the big the Flask?")
                    elseif archetype == "Healer" then tipMsg = "You know those are for the mages and warlocks right?"
                    elseif archetype == "Phys DPS" then tipMsg = "Oi back to zugzugging"
                    elseif archetype == "Tank" then tipMsg = "Paly tank or stupid? Hmm"
                    end
                elseif entry.name == "Physical (Agi/Str)" then
                    if archetype == "Phys DPS" then tipMsg = random("Yooo! Sick of parsing green huh?", "Let me guess... it's a 'threat issue' and not a 'in the wrong place' issue?", "Nice Agility. Does it help you dodge the responsibility of CC'ing?", "Strength? Agility? How about some 'Stamina' so you stay off the floor?", "You look like the type of person who stays in the fire for an extra attack.")
                    elseif archetype == "Caster" then tipMsg = "Someone get a scroll of wisdom for this one."
                    elseif archetype == "Healer" then tipMsg = "Oi! You're supposed to be a HEALER!"
                    elseif archetype == "Tank" then tipMsg = "These probably aren't for you..."
                    end
                elseif entry.name == "Healer (Healing Power, Mp5)" then
                    if archetype == "Healer" then tipMsg = random("You wouldn't need this if they didn't stand in the fire.", "If they die, it’s a 'lack of coordination.' If you die, it’s a wipe.","The only thing higher than your HPS is your blood pressure.", "Remember: if the tank is annoying, 'lag' is a valid excuse.", "One day, they'll learn what a 'Line of Sight' is. But not today.", "Ready to carry 24 other people on your back again?" )
                    elseif archetype == "Tank" then tipMsg = "These for your Healer 'friend'?"
                    elseif archetype == "Phys DPS" then tipMsg = "You probably have 10 OF subs."
                    elseif archetype == "Caster" then tipMsg = "lmao you wanna heal?"
                    end
                elseif entry.name == "Tank (Defensive, Stamina)" then
                    if archetype == "Tank" then tipMsg = random("Yes, Just a few more years of this and you can go DPS.","How’s the view of the boss's shins today? Majestic?","Are you 'Crit Immune' or just 'Indifferent to Pain'?",            "The only thing higher than your health pool is your repair bill.","Is that a shield or just a really heavy security blanket?","Main character energy incoming. Clear the way for the punching bag!" )
                    elseif archetype == "Phys DPS" then tipMsg = "Oi you should be BEHIND the boss."
                    elseif archetype == "Healer" then tipMsg = "Ayo, you're meant to be healing!"
                    elseif archetype == "Caster" then tipMsg = "Wrong section buddy..."
                    end
                end
                
                self:UpdateTip(tipMsg)
            else
                -- It's an item - Use the REAL name from GetItemInfo if possible
                local name = GetItemInfo(entry.id) or searchName
                -- Strip any parenthetical notes if we're using the DB name fallback
                if not GetItemInfo(entry.id) then
                    name = name:gsub("%s%b()", "")
                end
                
                self:UpdateTip(random("Here are the ", "Here's the ", "Right, here's the ") .. name .. "...")
                
                local editBox = BrowseName
                if not (editBox and editBox:IsVisible()) then
                    if AuctionatorShoppingFrame and AuctionatorShoppingFrame.SearchOptions and AuctionatorShoppingFrame.SearchOptions.SearchString and AuctionatorShoppingFrame:IsVisible() then
                        editBox = AuctionatorShoppingFrame.SearchOptions.SearchString
                    elseif AuctionatorSearchBox and AuctionatorSearchBox:IsVisible() then
                        editBox = AuctionatorSearchBox
                    end
                end
                
                if editBox and editBox:IsVisible() then
                    editBox:SetText(name)
                    editBox:SetFocus()
                    if editBox == BrowseName and BrowseSearchButton and BrowseSearchButton:IsEnabled() then
                        BrowseSearchButton:Click()
                    elseif editBox:GetScript("OnEnterPressed") then
                        editBox:GetScript("OnEnterPressed")(editBox)
                    end
                else
                -- TSM Support: Simulate a shift-click which TSM intercepts for searching
                local _, link = GetItemInfo(entry.id)
                if link then
                    local origIsModifiedClick = _G.IsModifiedClick
                    _G.IsModifiedClick = function(action)
                        if action == "CHATLINK" then return true end
                        if type(origIsModifiedClick) == "function" then
                            return origIsModifiedClick(action)
                        end
                        return false
                    end
                    
                    local origIsShift = _G.IsShiftKeyDown
                    _G.IsShiftKeyDown = function() return true end
                    
                    pcall(function()
                        HandleModifiedItemClick(link)
                    end)
                    
                    _G.IsModifiedClick = origIsModifiedClick
                    _G.IsShiftKeyDown = origIsShift
                else
                    QueryAuctionItems(name)
                end
            end
        end
    end)

        if not isFolder then
            btn:SetScript("OnEnter", function(self)
                self:SetBackdropColor(1, 1, 1, 0.15)
                GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                GameTooltip:SetItemByID(entry.id)
                GameTooltip:Show()
            end)
            btn:SetScript("OnLeave", function(self)
                self:SetBackdropColor(1, 1, 1, 0.05)
                GameTooltip:Hide()
            end)
        else
            btn:SetScript("OnEnter", function(self) self:SetBackdropColor(1, 1, 1, 0.15) end)
            btn:SetScript("OnLeave", function(self) self:SetBackdropColor(1, 1, 1, 0.05) end)
        end

        btn:Show()
    end

    self:UpdateBreadcrumbs()
end
