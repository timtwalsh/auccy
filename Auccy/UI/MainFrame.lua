local addonName, addonTable = ...
local UI = addonTable.UI or {}
addonTable.UI = UI
local function random(...)
    if addonTable.Utils and addonTable.Utils.Random then
        return (addonTable.Utils:Random(...))
    end
    return (...)
end

-- Spritesheet mapping (4x2)
local STATES = {
    IDLE  = {0, 0}, BORED = {1, 0}, BLINK = {2, 0}, SLEEP = {3, 0},
    TALK1 = {0, 1}, TALK2 = {1, 1}, YELL1 = {2, 1}, YELL2 = {3, 1}
}

function UI:SetMascotState(state)
    local coords = STATES[state] or STATES.IDLE
    local x, y = coords[1], coords[2]
    self.MainFrame.Mascot:SetTexCoord(x*0.25, (x+1)*0.25, y*0.5, (y+1)*0.5)
end

function UI:AnimateTalk(times)
    self.IsAnimatingTalk = true
    times = times or 3
    local stepsPerCycle = 4 -- More steps for more variety
    local stepDuration = 0.08 -- Faster, snappier movement
    local totalSteps = times * stepsPerCycle
    
    for i = 0, totalSteps - 1 do
        local offset = i * stepDuration
        C_Timer.After(offset, function()
            local r = math.random(1, 100)
            -- Jittery logic: high chance of talking, lower chance of yelling/idling mid-speech
            if r < 15 then
                self:SetMascotState("IDLE")
            elseif r < 35 then
                self:SetMascotState("YELL1")
            elseif r < 45 then
                self:SetMascotState("YELL2")
            elseif r < 75 then
                self:SetMascotState("TALK1")
            else
                self:SetMascotState("TALK2")
            end
        end)
    end
    -- Always end on IDLE
    C_Timer.After(totalSteps * stepDuration, function() 
        self:SetMascotState("IDLE") 
        self.IsAnimatingTalk = false
    end)
end

function UI:CreateAHToggle()
    if self.AHToggle then return end
    if not AuctionFrame then return end

    local btn = CreateFrame("Button", nil, AuctionFrame, "UIPanelButtonTemplate")
    btn:SetSize(60, 22)
    -- Position it near the top right of the AuctionFrame
    btn:SetPoint("TOPRIGHT", AuctionFrame, "TOPRIGHT", -50, -14)
    btn:SetText("Auccy")
    btn:SetFrameLevel(AuctionFrame:GetFrameLevel() + 10)
    
    btn:SetScript("OnClick", function()
        if self.MainFrame:IsShown() then
            self.MainFrame:Hide()
        else
            self.MainFrame:Show()
            self:UpdateTip(random("Yo! What ya need?", "Don't tell my boss I'm out here shopping.", "Ayy they'll let bloody anyone in here!", "It's Auccy, Like Jockey. Just ask your mummy." ))
        end
    end)

    self.AHToggle = btn
end

function UI:CreateMainFrame()
    if self.MainFrame then return self.MainFrame end

    -- Compact Sidebar Widget
    local f = CreateFrame("Frame", "AuccyMainFrame", UIParent, "BackdropTemplate")
    f:SetSize(420, 500)
    f:SetPoint("LEFT", 50, 0)
    f:SetFrameStrata("DIALOG")
    f:SetMovable(true)
    f:EnableMouse(true)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)
    f:SetClampedToScreen(true)

    -- Classic Blizzard Backdrop (Solid Dark Stone)
    f:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tile = true, tileSize = 32, edgeSize = 32,
        insets = { left = 8, right = 8, top = 8, bottom = 8 }
    })
    f:SetBackdropColor(0.15, 0.15, 0.15, 1)

    -- Gold Header Line
    local header = f:CreateTexture(nil, "ARTWORK")
    header:SetSize(400, 32)
    header:SetPoint("TOP", 0, -8)
    header:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
    header:SetWidth(250)
    
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOP", 0, -14)
    title:SetText("Auccy")
    
    -- Custom Close Button (Standard Blizzard style)
    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", -2, -2)
    close:SetScript("OnClick", function() f:Hide() end)

    -- Mascot Frame (High Z-Index)
    local mascotFrame = CreateFrame("Frame", nil, f)
    mascotFrame:SetAllPoints(f)
    mascotFrame:SetFrameLevel(f:GetFrameLevel() + 50) -- High above everything else

    -- Mascot Texture
    local mascot = mascotFrame:CreateTexture(nil, "OVERLAY", nil, 7)
    mascot:SetSize(160, 160)
    mascot:SetPoint("TOPRIGHT", 80, 40)
    mascot:SetTexture("Interface\\AddOns\\Auccy\\auccy.png")
    f.Mascot = mascot
    self.MainFrame = f
    self:SetMascotState("IDLE")

    -- Speech Bubble (Static, behind mascot)
    local bubble = CreateFrame("Frame", nil, f, "BackdropTemplate")
    bubble:SetSize(360, 70) 
    bubble:SetPoint("TOPRIGHT", -30, 45)
    bubble:SetFrameLevel(f:GetFrameLevel() + 10) -- Lower than mascot (which is at +50)
    
    bubble:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8X8",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 16,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    bubble:SetBackdropColor(0.05, 0.05, 0.1, 0.95)
    bubble:SetBackdropBorderColor(0.3, 0.3, 0.5, 0.8)

    -- Speech Bubble Tail (Rotated square to create a triangle point)
    local tail = bubble:CreateTexture(nil, "BACKGROUND")
    tail:SetSize(24, 24)
    tail:SetTexture("Interface\\Buttons\\WHITE8X8")
    tail:SetVertexColor(0.05, 0.05, 0.1, 0.95)
    tail:SetPoint("BOTTOMRIGHT", -40, -8)
    tail:SetRotation(math.rad(45))
    
    f.Bubble = bubble
    
    local tip = bubble:CreateFontString(nil, "OVERLAY", "GameFontHighlightSmall")
    tip:SetPoint("LEFT", 12, 0)
    tip:SetPoint("RIGHT", -12, 0)
    tip:SetJustifyH("LEFT")
    tip:SetText(random("Okay, let's get to business.", "What ya need?", "Let's get it.", "How many times..? AUCCY like JOCKEY, Just ask your mummy." ))
    f.Tip = tip

    -- Smooth Floating Animation
    local totalElapsed = 0
    f:SetScript("OnUpdate", function(self, delta)
        if self:IsVisible() then
            totalElapsed = totalElapsed + delta
            
            -- Floating effect: Sinusoidal movement for a "hovering" feel
            local yOff = math.sin(totalElapsed * 2.5) * 6
            local xOff = math.cos(totalElapsed * 1.8) * 4
            
            -- Move Mascot
            self.Mascot:SetPoint("TOPRIGHT", 80 + xOff, 40 + yOff)
        end
    end)

    -- Enhanced Idle Animation Ticker
    f.IdleTicker = C_Timer.NewTicker(2, function()
        if f:IsVisible() and not UI.IsAnimatingTalk then
            local r = math.random(1, 100)
            if r < 15 then
                -- Blink
                UI:SetMascotState("BLINK")
                C_Timer.After(0.15, function() if not UI.IsAnimatingTalk then UI:SetMascotState("IDLE") end end)
            elseif r < 20 then
                -- Bored / Look away
                UI:SetMascotState("BORED")
                C_Timer.After(1.5, function() if not UI.IsAnimatingTalk then UI:SetMascotState("IDLE") end end)
            end
        end
    end)

    -- Assemble components
    self:CreateGuidedBrowser(f)

    f:Hide()
    return f
end
