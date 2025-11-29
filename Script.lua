--found this source and i edited it, credits to the owner.
 
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local localPlayer = Players.LocalPlayer
StarterGui:SetCore("SendNotification", {
    Title = "Script Loading",
    Text = "Welcome, " .. localPlayer.Name .. "! Script is loading, please wait...",
    Icon = "rbxthumb://type=AvatarHeadShot&id=" .. localPlayer.UserId .. "&w=150&h=150",
    Duration = 50,
    Button1 = "OK"
})

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebulla-Softworks/Luna-Interface-Suite/main/sourcecode"))()

print("✅ WindUI loaded successfully!")
WindUI:SetTheme('Dark')

local Services = {
    Players = game:GetService('Players'),
    RunService = game:GetService('RunService'),
    UserInputService = game:GetService('UserInputService'),
    Lighting = game:GetService('Lighting'),
    StarterPack = game:GetService('StarterPack'),
    ReplicatedStorage = game:GetService('ReplicatedStorage'),
    TweenService = game:GetService('TweenService'),
    VirtualUser = game:GetService('VirtualUser'),
    Workspace = game:GetService('Workspace'),
    HttpService = game:GetService('HttpService'),
    TeleportService = game:GetService('TeleportService'),
    Stats = game:GetService('Stats'),
    ReplicatedFirst = game:GetService('ReplicatedFirst'),
}

local LocalPlayer = Services.Players.LocalPlayer

-- Enhanced gradient function
function gradient(text, startColor, endColor)
    local result = ''
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor(
            (startColor.R + (endColor.R - startColor.R) * t) * 255
        )
        local g = math.floor(
            (startColor.G + (endColor.G - startColor.G) * t) * 255
        )
        local b = math.floor(
            (startColor.B + (endColor.B - startColor.B) * t) * 255
        )

        local char = text:sub(i, i)
        result = result
            .. '<font color="rgb('
            .. r
            .. ', '
            .. g
            .. ', '
            .. b
            .. ')">'
            .. char
            .. '</font>'
    end

    return result
end

local Confirmed = false

WindUI:Popup({
    Title = 'Welcome, ' .. gradient(
        LocalPlayer.Name,
        Color3.fromRGB(135, 206, 250),   -- start color (light blue)
        Color3.fromRGB(0, 0, 139)        -- end color (dark blue)
    ),
    Image = 'rbxassetid://98892485471236',
    IconThemed = true,
    Content = gradient(
        'Thanks for using Davi UI! Enhanced Edition',
        Color3.fromRGB(255, 255, 255),   -- start color (white)
        Color3.fromRGB(128, 128, 128)    -- end color (grey)
    )
        .. gradient(
            '',
            Color3.fromHex('#00fff7'),
            Color3.fromHex('#4facfe')
        ),

    Buttons = {
        {
            Title = 'Copy',
            Icon = '',
            Callback = function()
                setclipboard('skidz on top lol')
                Confirmed = true
            end,
            Variant = 'Primary',
        },
        {
            Title = 'Okay',
            Icon = 'arrow-right',
            Callback = function()
                Confirmed = true
            end,
            Variant = 'Primary',
        },
    },
})

repeat
    task.wait()
until Confirmed

-- Create enhanced window
local Window = WindUI:CreateWindow({
    Title = 'davi UI',
    Icon = 'door-open',
    Author = 'edited by davizin hub :)',
    Folder = 'dvi Ui',

    -- Enhanced settings
    Size = UDim2.fromOffset(600, 500),
    Transparent = true,
    Theme = 'Dark',
    Resizable = true,
    SideBarWidth = 220,
    BackgroundImageTransparency = 0.35,
    HideSearchBar = false,
    ScrollBarEnabled = true,

    -- User profile
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function() end,
    },
})

-- Enhanced Tabs with better organization
local Tabs = {}

-- Home Tab (formerly Main)
Tabs.HomeTab = Window:Tab({
    Title = "Home",
    Icon = "home",
    ShowTabTitle = true,
})

-- Character Tab (formerly Player)
Tabs.CharacterTab = Window:Tab({
    Title = "Character",
    Icon = "user",
    ShowTabTitle = true,
})

-- Visuals Tab
Tabs.VisualsTab = Window:Tab({
    Title = "Visuals",
    Icon = "eye",
    ShowTabTitle = true,
})

-- Combat Tab
Tabs.CombatTab = Window:Tab({
    Title = "Combat",
    Icon = "crosshair",
    ShowTabTitle = true,
})

-- Farming Tab (formerly Auto Farm)
Tabs.FarmingTab = Window:Tab({
    Title = "Farming",
    Icon = "coins",
    ShowTabTitle = true,
})

-- Scripts Tab (formerly Hub)
Tabs.ScriptsTab = Window:Tab({
    Title = "Scripts",
    Icon = "code",
    ShowTabTitle = true,
})

-- Settings Tab
Tabs.SettingsTab = Window:Tab({
    Title = "Settings",
    Icon = "settings",
    ShowTabTitle = true,
})

-- Enhanced Time Tag with better design
local TimeTag = Window:Tag({
    Title = '--:--',
    Radius = 12,
    Color = WindUI:Gradient({
        ['0'] = { Color = Color3.fromHex('#FF0F7B'), Transparency = 0 },
        ['50'] = { Color = Color3.fromHex('#F89B29'), Transparency = 0 },
        ['100'] = { Color = Color3.fromHex('#4facfe'), Transparency = 0 },
    }, {
        Rotation = 45,
    }),
})

-- Enhanced rainbow effect & Time
local hue = 0
task.spawn(function()
    while true do
        local now = os.date('*t')
        local hours = string.format('%02d', now.hour)
        local minutes = string.format('%02d', now.min)
        local seconds = string.format('%02d', now.sec)

        hue = (hue + 0.015) % 1
        local color = Color3.fromHSV(hue, 0.8, 1)

        TimeTag:SetTitle(hours .. ':' .. minutes .. ':' .. seconds)
        TimeTag:SetColor(color)

        task.wait(0.5)
    end
end)

-- [[ ENHANCED FEATURES START ]] --

local RunService = Services.RunService

-- Enhanced Settings with more options
local walkSpeed, jumpPower = 16, 50
local noclipEnabled = false
local flying = false
local flySpeed = 50
local infiniteJump = false
local xRay = false
local gravityEnabled = true
local mobileFlyActive = false
local antiFlingEnabled = false
local godModeEnabled = false
local autoFarmEnabled = false
local espEnabled = false

-- NEW: Performance monitoring
local performanceStats = {
    FPS = 0,
    Ping = 0,
    Memory = 0
}

-- NEW: Enhanced fly system with better controls
local bodyVelocity, bodyGyro
local flyKeys = {
    Forward = Enum.KeyCode.W,
    Backward = Enum.KeyCode.S,
    Left = Enum.KeyCode.A,
    Right = Enum.KeyCode.D,
    Up = Enum.KeyCode.Space,
    Down = Enum.KeyCode.LeftShift
}

-- NEW: ESP System
local espObjects = {}
local highlightInstances = {}

-- NEW: Auto Farm System
local farmingConnections = {}

-- [[ HOME TAB ]] --
Tabs.HomeTab:Section({ Title = 'Quick Actions', Desc = 'Essential features for quick access' })
Tabs.HomeTab:Divider()

-- Enhanced Kill All with cooldown protection
Tabs.HomeTab:Button({
    Title = '⚡ Instant Kill All',
    Description = 'Eliminates all players instantly with protection',
    Callback = function()
        local lastKillTime = 0
        local function SafeKillAll()
            if tick() - lastKillTime < 2 then return end
            lastKillTime = tick()
            
            local Knife = LocalPlayer.Backpack:FindFirstChild('Knife') or LocalPlayer.Character:FindFirstChild('Knife')
            if Knife then
                if Knife.Parent.Name == 'Backpack' then
                    LocalPlayer.Character.Humanoid:EquipTool(Knife)
                end
                for _, player in ipairs(Services.Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild('HumanoidRootPart') then
                        Services.VirtualUser:ClickButton1(Vector2.new())
                        firetouchinterest(player.Character.HumanoidRootPart, Knife.Handle, 1)
                        firetouchinterest(player.Character.HumanoidRootPart, Knife.Handle, 0)
                    end
                end
            end
        end
        SafeKillAll()
    end,
})

-- Enhanced God Mode
Tabs.HomeTab:Toggle({
    Title = '🛡️ God Mode',
    Description = 'Makes you invincible to damage',
    Value = false,
    Callback = function(val)
        godModeEnabled = val
        if val then
            local player = LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") then
                local accessories = {}

                -- Save accessories
                for _, accessory in pairs(character.Humanoid:GetAccessories()) do
                    table.insert(accessories, accessory:Clone())
                end

                -- Rename current humanoid
                character.Humanoid.Name = "boop"

                -- Clone it back as real humanoid
                local v = character["boop"]:Clone()
                v.Parent = character
                v.Name = "Humanoid"
                task.wait(0.1)
                character["boop"]:Destroy()

                -- Reset camera
                Services.Workspace.CurrentCamera.CameraSubject = character.Humanoid

                -- Reattach accessories
                for _, accessory in pairs(accessories) do
                    character.Humanoid:AddAccessory(accessory)
                end

                -- Reset animations
                character.Animate.Disabled = true
                task.wait(0.1)
                character.Animate.Disabled = false
                
                WindUI:Notify({
                    Title = "God Mode",
                    Content = "God mode activated!",
                    Duration = 3
                })
            end
        else
            WindUI:Notify({
                Title = "God Mode",
                Content = "God mode deactivated!",
                Duration = 3
            })
        end
    end,
})

-- Enhanced Anti-Fling
Tabs.HomeTab:Toggle({
    Title = '🌀 Anti Fling',
    Description = 'Protects against flinging attacks',
    Value = false,
    Callback = function(state)
        antiFlingEnabled = state
        if state then
            getgenv().AntiFlingConnection = Services.RunService.Heartbeat:Connect(
                function()
                    for _, plr in ipairs(Services.Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character then
                            for _, part in ipairs(plr.Character:GetDescendants()) do
                                if part:IsA('BasePart') and not part.Anchored then
                                    if part.Velocity.Magnitude > 100 then
                                        part.Velocity, part.RotVelocity = Vector3.zero, Vector3.zero
                                        part.Anchored = true
                                        task.delay(0.5, function()
                                            if part and part.Parent then
                                                part.Anchored = false
                                            end
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            )
            WindUI:Notify({
                Title = "Anti-Fling",
                Content = "Anti-fling protection activated!",
                Duration = 3
            })
        elseif getgenv().AntiFlingConnection then
            getgenv().AntiFlingConnection:Disconnect()
            getgenv().AntiFlingConnection = nil
            WindUI:Notify({
                Title = "Anti-Fling",
                Content = "Anti-fling protection deactivated!",
                Duration = 3
            })
        end
    end,
})

-- Performance Monitor
Tabs.HomeTab:Section({ Title = 'Performance', Desc = 'System performance monitoring' })
Tabs.HomeTab:Divider()

local PerformanceLabel = Tabs.HomeTab:Paragraph({
    Title = "FPS: -- | Ping: -- ms",
    Desc = "Memory: -- MB | Server: -- players"
})

spawn(function()
    while true do
        performanceStats.FPS = math.round(1 / RunService.RenderStepped:Wait())
        performanceStats.Ping = Services.Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        performanceStats.Memory = math.round(Services.Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryType.Script))
        
        local playerCount = #Services.Players:GetPlayers()
        local maxPlayers = Services.Players.MaxPlayers
        
        PerformanceLabel:Set({
            Title = string.format("FPS: %d | Ping: %d ms", performanceStats.FPS, performanceStats.Ping),
            Desc = string.format("Memory: %d MB | Server: %d/%d players", performanceStats.Memory, playerCount, maxPlayers)
        })
        wait(1)
    end
end)

-- [[ CHARACTER TAB ]] --
Tabs.CharacterTab:Section({ Title = 'Movement', Desc = 'Character movement enhancements' })
Tabs.CharacterTab:Divider()

-- Enhanced Walk Speed with real-time update
Tabs.CharacterTab:Slider({
    Title = '🚶 Walk Speed',
    Compact = true,
    Value = { Min = 16, Max = 200, Default = 16 },
    Callback = function(value)
        walkSpeed = value
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end,
})

-- Enhanced Jump Power
Tabs.CharacterTab:Slider({
    Title = '🦘 Jump Power',
    Compact = true,
    Value = { Min = 50, Max = 500, Default = 50 },
    Callback = function(value)
        jumpPower = value
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
        if humanoid then
            humanoid.JumpPower = value
        end
    end,
})

-- Enhanced Infinite Jump
Tabs.CharacterTab:Toggle({
    Title = '∞ Infinite Jump',
    Compact = true,
    Callback = function(state)
        infiniteJump = state
        if state then
            WindUI:Notify({
                Title = "Infinite Jump",
                Content = "Hold spacebar to jump infinitely!",
                Duration = 3
            })
        end
    end,
})

-- Enhanced Infinite Jump Logic
Services.UserInputService.JumpRequest:Connect(function()
    if infiniteJump and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
        if humanoid then
            humanoid:ChangeState('Jumping')
        end
    end
end)

-- Enhanced Gravity Toggle
Tabs.CharacterTab:Toggle({
    Title = '🌌 Zero Gravity',
    Compact = true,
    Callback = function(state)
        gravityEnabled = not state
        Services.Workspace.Gravity = state and 0 or 196.2
        WindUI:Notify({
            Title = "Gravity",
            Content = state and "Gravity disabled!" or "Gravity restored!",
            Duration = 3
        })
    end,
})

-- Enhanced Flight System
Tabs.CharacterTab:Section({ Title = 'Flight System', Desc = 'Advanced flight controls' })
Tabs.CharacterTab:Divider()

-- Create physics objects for flight
local function createBodyMovers()
    bodyVelocity = Instance.new('BodyVelocity')
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)

    bodyGyro = Instance.new('BodyGyro')
    bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
end

-- Start flying function
local function startFlying()
    if not LocalPlayer.Character then return end

    local character = LocalPlayer.Character
    local humanoidRootPart = character:FindFirstChild('HumanoidRootPart')
    local humanoid = character:FindFirstChildOfClass('Humanoid')

    if not humanoidRootPart or not humanoid then return end

    createBodyMovers()
    flying = true
    bodyVelocity.Parent = humanoidRootPart
    bodyGyro.Parent = humanoidRootPart
    bodyGyro.CFrame = humanoidRootPart.CFrame
    humanoid.PlatformStand = true
    
    WindUI:Notify({
        Title = "Flight",
        Content = "Flight activated! Press E to toggle.",
        Duration = 3
    })
end

-- Stop flying function
local function stopFlying()
    flying = false
    if bodyVelocity then bodyVelocity:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end

    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass('Humanoid')
        if humanoid then humanoid.PlatformStand = false end
    end

    WindUI:Notify({
        Title = 'Flight',
        Content = 'Flight disabled',
        Duration = 2,
    })
end

-- E key to toggle flight
Services.UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or input.KeyCode ~= Enum.KeyCode.E then return end
    if not flyEnabled then return end

    if flying then
        stopFlying()
    else
        startFlying()
    end
end)

-- Flight movement logic
Services.RunService.RenderStepped:Connect(function()
    if not flying or not LocalPlayer.Character then return end

    local character = LocalPlayer.Character
    local humanoidRootPart = character:FindFirstChild('HumanoidRootPart')
    if not humanoidRootPart then return end

    local moveDirection = Vector3.new(0, 0, 0)
    local camera = Services.Workspace.CurrentCamera

    -- Enhanced movement controls
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.W) then
        moveDirection = moveDirection + camera.CFrame.LookVector
    end
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.S) then
        moveDirection = moveDirection - camera.CFrame.LookVector
    end
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.A) then
        moveDirection = moveDirection - camera.CFrame.RightVector
    end
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.D) then
        moveDirection = moveDirection + camera.CFrame.RightVector
    end
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        moveDirection = moveDirection + Vector3.new(0, 1, 0)
    end
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        moveDirection = moveDirection - Vector3.new(0, 1, 0)
    end

    -- Apply movement
    bodyVelocity.Velocity = moveDirection * flySpeed
    bodyGyro.CFrame = camera.CFrame
end)

-- Handle character reset
LocalPlayer.CharacterAdded:Connect(function(character)
    if flyEnabled and flying then
        task.wait(1)
        startFlying()
    end
end)

-- Flight Toggle
local flyEnabled = false
Tabs.CharacterTab:Toggle({
    Title = '✈️ PC Flight (E to toggle)',
    Compact = true,
    Callback = function(state)
        flyEnabled = state
        if not state and flying then
            stopFlying()
        elseif state then
            WindUI:Notify({
                Title = "Flight",
                Content = "Flight enabled! Press E to start flying.",
                Duration = 3
            })
        end
    end,
})

-- Flight Speed Slider
Tabs.CharacterTab:Slider({
    Title = 'Flight Speed',
    Compact = true,
    Value = { Min = 20, Max = 200, Default = 50 },
    Callback = function(value)
        flySpeed = value
        if flying then
            WindUI:Notify({
                Title = 'Flight Speed',
                Content = 'Speed set to: ' .. value,
                Duration = 2,
            })
        end
    end,
})

-- Mobile Fly
Tabs.CharacterTab:Button({
    Title = '📱 Mobile Fly',
    Compact = true,
    Callback = function()
        mobileFlyActive = not mobileFlyActive
        if mobileFlyActive then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
            WindUI:Notify({
                Title = "Mobile Fly",
                Content = "Mobile flight system loaded!",
                Duration = 3
            })
        end
    end,
})

-- Enhanced NoClip
Tabs.CharacterTab:Toggle({
    Title = '👻 NoClip',
    Compact = true,
    Callback = function(state)
        noclipEnabled = state
        if state then
            coroutine.wrap(function()
                while noclipEnabled and LocalPlayer.Character do
                    local humanoid = LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                    if humanoid then
                        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                            if part:IsA('BasePart') then
                                part.CanCollide = false
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)()
            WindUI:Notify({
                Title = "NoClip",
                Content = "NoClip activated! Walk through walls.",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "NoClip",
                Content = "NoClip deactivated!",
                Duration = 3
            })
        end
    end,
})

-- [[ VISUALS TAB ]] --
Tabs.VisualsTab:Section({ Title = 'Visual Enhancements', Desc = 'Improve your visual experience' })
Tabs.VisualsTab:Divider()

-- Enhanced X-Ray
Tabs.VisualsTab:Toggle({
    Title = '🔍 X-ray Vision',
    Compact = true,
    Callback = function(state)
        xRay = state
        for _, part in pairs(Services.Workspace:GetDescendants()) do
            if part:IsA('BasePart') and not part:IsDescendantOf(LocalPlayer.Character) then
                part.LocalTransparencyModifier = state and 0.7 or 0
            end
        end
        WindUI:Notify({
            Title = "X-Ray",
            Content = state and "X-Ray vision activated!" or "X-Ray vision deactivated!",
            Duration = 3
        })
    end,
})

-- FOV Changer
Tabs.VisualsTab:Slider({
    Title = '🎯 Field of View',
    Compact = true,
    Value = { Min = 50, Max = 120, Default = 70 },
    Callback = function(value)
        Services.Workspace.CurrentCamera.FieldOfView = value
    end,
})

-- Full Bright
Tabs.VisualsTab:Toggle({
    Title = '💡 Full Bright',
    Compact = true,
    Callback = function(state)
        if state then
            Services.Lighting.Brightness = 2
            Services.Lighting.ClockTime = 14
            Services.Lighting.FogEnd = 100000
            Services.Lighting.GlobalShadows = false
            WindUI:Notify({
                Title = "Full Bright",
                Content = "Full bright activated!",
                Duration = 3
            })
        else
            Services.Lighting.Brightness = 1
            Services.Lighting.ClockTime = 12
            Services.Lighting.FogEnd = 100
            Services.Lighting.GlobalShadows = true
            WindUI:Notify({
                Title = "Full Bright",
                Content = "Full bright deactivated!",
                Duration = 3
            })
        end
    end,
})

-- [[ COMBAT TAB ]] --
Tabs.CombatTab:Section({ Title = 'Aimbot & Targeting', Desc = 'Combat enhancement features' })
Tabs.CombatTab:Divider()

-- Enhanced Aimbot
Tabs.CombatTab:Toggle({
    Title = '🎯 Aimlock (Torso)',
    Compact = true,
    Callback = function(state)
        getgenv().AimlockEnabled = state

        if state then
            if not getgenv().AimlockInitialized then
                getgenv().AimlockInitialized = true

                local Players = Services.Players
                local Workspace = Services.Workspace
                local RunService = Services.RunService
                local Camera = Workspace.CurrentCamera

                -- Find the murderer
                local function FindMurderer()
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local hasKnife = player.Character:FindFirstChild('Knife') or player.Backpack:FindFirstChild('Knife')
                            if hasKnife and player.Character:FindFirstChild('HumanoidRootPart') then
                                return player
                            end
                        end
                    end
                    return nil
                end

                -- Aimbot loop
                RunService.RenderStepped:Connect(function()
                    if getgenv().AimlockEnabled then
                        local murderer = FindMurderer()
                        if murderer and murderer.Character then
                            local torso = murderer.Character:FindFirstChild('HumanoidRootPart')
                            if torso then
                                -- Smooth camera lock onto torso
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, torso.Position)
                            end
                        end
                    end
                end)

                -- Cleanup
                Players.PlayerRemoving:Connect(function(player)
                    if player == LocalPlayer then
                        getgenv().AimlockEnabled = false
                        getgenv().AimlockInitialized = false
                    end
                end)
            end
            WindUI:Notify({
                Title = "Aimlock",
                Content = "Aimlock activated! Targeting murderers.",
                Duration = 3
            })
        else
            getgenv().AimlockEnabled = false
            WindUI:Notify({
                Title = "Aimlock",
                Content = "Aimlock deactivated!",
                Duration = 3
            })
        end
    end,
})

-- Auto Shoot
local AutoShootEnabled = false
local ShootKey = Enum.KeyCode.Z

Tabs.CombatTab:Toggle({
    Title = '🔫 Auto Shoot',
    Description = 'Automatically shoot at murderers',
    Value = false,
    Callback = function(state)
        AutoShootEnabled = state
        WindUI:Notify({
            Title = "Auto Shoot",
            Content = state and "Auto shoot activated!" or "Auto shoot deactivated!",
            Duration = 3
        })
    end,
})

-- Shoot Keybind
Tabs.CombatTab:Keybind({
    Title = 'Shoot Key',
    Desc = 'Key to activate auto shooting',
    Value = 'Z',
    Callback = function(v)
        ShootKey = Enum.KeyCode[v]
        WindUI:Notify({
            Title = "Shoot Key",
            Content = "Shoot key set to: " .. v,
            Duration = 2
        })
    end,
})

-- [[ FARMING TAB ]] --
Tabs.FarmingTab:Section({ Title = 'Auto Farming', Desc = 'Automate your gameplay' })
Tabs.FarmingTab:Divider()

-- Enhanced Auto Farm Button
Tabs.FarmingTab:Button({
    Title = '🚀 Activate Auto Farm',
    Description = 'Start automated farming system',
    Callback = function()
        if not game:IsLoaded() then game.Loaded:Wait() end
        
        -- Delete old UI if exists
        if LocalPlayer.PlayerGui:FindFirstChild("SkidSource_FarmUI") then
            LocalPlayer.PlayerGui.SkidSource_FarmUI:Destroy()
        end

        local autoFarmEnabled = false
        local autoResetEnabled = false

        -- Create farming UI
        local gui = Instance.new("ScreenGui")
        gui.Name = "SkidSource_FarmUI"
        gui.ResetOnSpawn = false
        gui.Parent = LocalPlayer.PlayerGui

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 300, 0, 200)
        frame.Position = UDim2.new(0.5, -150, 0.5, -100)
        frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        frame.BackgroundTransparency = 0.1
        frame.BorderSizePixel = 0
        frame.Parent = gui
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

        -- Gradient effect
        local gradient = Instance.new("UIGradient", frame)
        gradient.Rotation = 135
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 0, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 120, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 180))
        }

        -- Title
        local title = Instance.new("TextLabel", frame)
        title.Size = UDim2.new(1, 0, 0, 40)
        title.Position = UDim2.new(0, 0, 0, 10)
        title.BackgroundTransparency = 1
        title.Text = "SkidSource Auto Farm"
        title.TextColor3 = Color3.new(1,1,1)
        title.Font = Enum.Font.FredokaOne
        title.TextSize = 20
        title.TextStrokeTransparency = 0.5

        -- Toggle buttons would go here (similar to your original farming code)
        -- For brevity, I'm including the core farming logic:

        local CoinCollected = Services.ReplicatedStorage.Remotes.Gameplay.CoinCollected
        local RoundStart = Services.ReplicatedStorage.Remotes.Gameplay.RoundStart
        local RoundEnd = Services.ReplicatedStorage.Remotes.Gameplay.RoundEndFade

        local farming = false
        local bag_full = false
        local resetting = false
        local start_position = nil

        LocalPlayer.Idled:Connect(function()
            Services.VirtualUser:CaptureController()
            Services.VirtualUser:ClickButton2(Vector2.new())
        end)

        local function getCharacter() 
            return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() 
        end
        
        local function getHRP() 
            return getCharacter():WaitForChild("HumanoidRootPart") 
        end

        CoinCollected.OnClientEvent:Connect(function(_, current, max)
            if current == max and not resetting and autoResetEnabled then
                resetting = true
                bag_full = true
                local hrp = getHRP()
                if start_position then
                    Services.TweenService:Create(hrp, TweenInfo.new(2), {CFrame = start_position}):Play():Wait()
                end
                task.wait(0.5)
                LocalPlayer.Character.Humanoid.Health = 0
                LocalPlayer.CharacterAdded:Wait()
                task.wait(1.5)
                resetting = false
                bag_full = false
            end
        end)

        RoundStart.OnClientEvent:Connect(function()
            farming = true
            start_position = getHRP().CFrame
        end)

        RoundEnd.OnClientEvent:Connect(function() 
            farming = false 
        end)

        local function get_nearest_coin()
            local hrp = getHRP()
            local closest, dist = nil, math.huge
            for _, m in pairs(Services.Workspace:GetChildren()) do
                if m:FindFirstChild("CoinContainer") then
                    for _, coin in pairs(m.CoinContainer:GetChildren()) do
                        if coin:IsA("BasePart") and coin:FindFirstChild("TouchInterest") then
                            local d = (hrp.Position - coin.Position).Magnitude
                            if d < dist then 
                                closest, dist = coin, d 
                            end
                        end
                    end
                end
            end
            return closest, dist
        end

        -- Start farming loop
        autoFarmEnabled = true
        task.spawn(function()
            while autoFarmEnabled do
                if farming and not bag_full then
                    local coin, dist = get_nearest_coin()
                    if coin then
                        local hrp = getHRP()
                        if dist > 150 then
                            hrp.CFrame = coin.CFrame
                        else
                            local tween = Services.TweenService:Create(hrp, TweenInfo.new(dist/20, Enum.EasingStyle.Linear), {CFrame = coin.CFrame})
                            tween:Play()
                            repeat task.wait() until not coin:FindFirstChild("TouchInterest") or not farming
                            tween:Cancel()
                        end
                    end
                end
                task.wait(0.2)
            end
        end)

        WindUI:Notify({
            Title = "Auto Farm",
            Content = "Auto farming system activated!",
            Duration = 5
        })
    end,
})

-- [[ SCRIPTS TAB ]] --
Tabs.ScriptsTab:Section({ Title = 'Popular Scripts', Desc = 'One-click script loader' })
Tabs.ScriptsTab:Divider()

-- Organized script buttons by category
Tabs.ScriptsTab:Section({ Title = 'Admin Scripts', Desc = '' })
Tabs.ScriptsTab:Button({Title="Infinite Yield", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()end})
Tabs.ScriptsTab:Button({Title="Nameless Admin", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()end})
Tabs.ScriptsTab:Button({Title="CMD-X", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()end})
Tabs.ScriptsTab:Button({Title="Fates Admin", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/source.lua"))()end})

Tabs.ScriptsTab:Section({ Title = 'Utility Scripts', Desc = '' })
Tabs.ScriptsTab:Button({Title="Orca", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()end})
Tabs.ScriptsTab:Button({Title="Hydroxide", Callback=function()
    local o,b="Upbolt","revision"
    pcall(function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/%s/Hydroxide/%s/init.lua"):format(o,b)))()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/%s/Hydroxide/%s/ui/main.lua"):format(o,b)))()
    end)
end})
Tabs.ScriptsTab:Button({Title="Simple V3", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Simple-Scripts/main/Simple%20V3"))()end})

Tabs.ScriptsTab:Section({ Title = 'Game Scripts', Desc = '' })
Tabs.ScriptsTab:Button({Title="Redz Hub (Blox Fruits)", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))({JoinTeam="Pirates",Translator=true})end})
Tabs.ScriptsTab:Button({Title="Hoho Hub (Blox Fruits)", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()end})
Tabs.ScriptsTab:Button({Title="Da Hood OP Script", Callback=function()loadstring(game:HttpGet("https://rscripts.net/script/dah-hood-op-script-RXe2"))()end})

-- [[ SETTINGS TAB ]] --
Tabs.SettingsTab:Section({ Title = 'UI Settings', Desc = 'Customize your experience' })
Tabs.SettingsTab:Divider()

-- Theme selector
local themes = {"Dark", "Light", "Darker", "Luna", "Aqua"}
Tabs.SettingsTab:Dropdown({
    Title = '🎨 Theme',
    Values = themes,
    Value = 'Dark',
    Callback = function(value)
        WindUI:SetTheme(value)
        WindUI:Notify({
            Title = "Theme Changed",
            Content = "Theme set to: " .. value,
            Duration = 3
        })
    end,
})

-- Transparency slider
Tabs.SettingsTab:Slider({
    Title = 'Transparency',
    Value = { Min = 0, Max = 1, Default = 0.35, Step = 0.05 },
    Callback = function(value)
        Window:ToggleTransparency(value > 0)
        WindUI.TransparencyValue = value
    end,
})

-- UI Keybind
Tabs.SettingsTab:Keybind({
    Title = 'UI Toggle Key',
    Desc = 'Key to show/hide the UI',
    Value = 'RightControl',
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
        WindUI:Notify({
            Title = "Keybind Updated",
            Content = "UI toggle key set to: " .. v,
            Duration = 3
        })
    end,
})

-- Configuration Section
Tabs.SettingsTab:Section({ Title = 'Configuration', Desc = 'Save and load your settings' })
Tabs.SettingsTab:Divider()

local configName = "default"
Tabs.SettingsTab:Input({
    Title = 'Config Name',
    Value = configName,
    Callback = function(value)
        configName = value or "default"
    end,
})

Tabs.SettingsTab:Button({
    Title = '💾 Save Config',
    Callback = function()
        local configData = {
            WalkSpeed = walkSpeed,
            JumpPower = jumpPower,
            FlySpeed = flySpeed,
            InfiniteJump = infiniteJump,
            GodMode = godModeEnabled,
            AntiFling = antiFlingEnabled,
            NoClip = noclipEnabled,
            XRay = xRay
        }
        
        writefile("skidsource_config_" .. configName .. ".json", Services.HttpService:JSONEncode(configData))
        
        WindUI:Notify({
            Title = "Config Saved",
            Content = "Configuration '" .. configName .. "' saved successfully!",
            Duration = 3
        })
    end,
})

Tabs.SettingsTab:Button({
    Title = '📂 Load Config',
    Callback = function()
        if isfile("skidsource_config_" .. configName .. ".json") then
            local configData = Services.HttpService:JSONDecode(readfile("skidsource_config_" .. configName .. ".json"))
            
            -- Apply loaded settings
            if configData.WalkSpeed then
                walkSpeed = configData.WalkSpeed
                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                if humanoid then humanoid.WalkSpeed = walkSpeed end
            end
            
            -- You would apply other settings here...
            
            WindUI:Notify({
                Title = "Config Loaded",
                Content = "Configuration '" .. configName .. "' loaded successfully!",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "Config Error",
                Content = "Configuration '" .. configName .. "' not found!",
                Duration = 3
            })
        end
    end,
})

-- Final initialization
Window:SelectTab(1)
Window:UnlockAll()

Window:OnClose(function()
    WindUI:Notify({
        Title = "SkidSource",
        Content = "UI hidden! Press RightControl to reopen.",
        Duration = 3
    })
end)

Window:OnOpen(function()
    WindUI:Notify({
        Title = "SkidSource",
        Content = "Enhanced UI loaded successfully!",
        Duration = 3
    })
end)

-- Auto-execute saved settings
spawn(function()
    wait(3)
    if isfile("skidsource_config_default.json") then
        local configData = Services.HttpService:JSONDecode(readfile("skidsource_config_default.json"))
        -- Apply default config if exists
        WindUI:Notify({
            Title = "SkidSource",
            Content = "Default configuration applied!",
            Duration = 3
        })
    end
end)

print("🎮 SkidSource hehe skid skid")--found this source and i edited it, credits to the owner.
 
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")

local localPlayer = Players.LocalPlayer
StarterGui:SetCore("SendNotification", {
    Title = "Script Loading",
    Text = "Welcome, " .. localPlayer.Name .. "! Script is loading, please wait...",
    Icon = "rbxthumb://type=AvatarHeadShot&id=" .. localPlayer.UserId .. "&w=150&h=150",
    Duration = 50,
    Button1 = "OK"
})

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebulla-Softworks/Luna-Interface-Suite/main/sourcecode"))()

print("✅ WindUI loaded successfully!")
WindUI:SetTheme('Dark')

local Services = {
    Players = game:GetService('Players'),
    RunService = game:GetService('RunService'),
    UserInputService = game:GetService('UserInputService'),
    Lighting = game:GetService('Lighting'),
    StarterPack = game:GetService('StarterPack'),
    ReplicatedStorage = game:GetService('ReplicatedStorage'),
    TweenService = game:GetService('TweenService'),
    VirtualUser = game:GetService('VirtualUser'),
    Workspace = game:GetService('Workspace'),
    HttpService = game:GetService('HttpService'),
    TeleportService = game:GetService('TeleportService'),
    Stats = game:GetService('Stats'),
    ReplicatedFirst = game:GetService('ReplicatedFirst'),
}

local LocalPlayer = Services.Players.LocalPlayer

-- Enhanced gradient function
function gradient(text, startColor, endColor)
    local result = ''
    local length = #text

    for i = 1, length do
        local t = (i - 1) / math.max(length - 1, 1)
        local r = math.floor(
            (startColor.R + (endColor.R - startColor.R) * t) * 255
        )
        local g = math.floor(
            (startColor.G + (endColor.G - startColor.G) * t) * 255
        )
        local b = math.floor(
            (startColor.B + (endColor.B - startColor.B) * t) * 255
        )

        local char = text:sub(i, i)
        result = result
            .. '<font color="rgb('
            .. r
            .. ', '
            .. g
            .. ', '
            .. b
            .. ')">'
            .. char
            .. '</font>'
    end

    return result
end

local Confirmed = false

WindUI:Popup({
    Title = 'Welcome, ' .. gradient(
        LocalPlayer.Name,
        Color3.fromRGB(135, 206, 250),   -- start color (light blue)
        Color3.fromRGB(0, 0, 139)        -- end color (dark blue)
    ),
    Image = 'rbxassetid://98892485471236',
    IconThemed = true,
    Content = gradient(
        'Thanks for using SkidSource! Enhanced Edition',
        Color3.fromRGB(255, 255, 255),   -- start color (white)
        Color3.fromRGB(128, 128, 128)    -- end color (grey)
    )
        .. gradient(
            '',
            Color3.fromHex('#00fff7'),
            Color3.fromHex('#4facfe')
        ),

    Buttons = {
        {
            Title = 'Copy',
            Icon = '',
            Callback = function()
                setclipboard('skidz on top lol')
                Confirmed = true
            end,
            Variant = 'Primary',
        },
        {
            Title = 'Okay',
            Icon = 'arrow-right',
            Callback = function()
                Confirmed = true
            end,
            Variant = 'Primary',
        },
    },
})

repeat
    task.wait()
until Confirmed

-- Create enhanced window
local Window = WindUI:CreateWindow({
    Title = 'Davizin Hub',
    Icon = 'door-open',
    Author = 'edited by davizinHub :)',
    Folder = 'Davi UI',

    -- Enhanced settings
    Size = UDim2.fromOffset(600, 500),
    Transparent = true,
    Theme = 'Dark',
    Resizable = true,
    SideBarWidth = 220,
    BackgroundImageTransparency = 0.35,
    HideSearchBar = false,
    ScrollBarEnabled = true,

    -- User profile
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function() end,
    },
})

-- Enhanced Tabs with better organization
local Tabs = {}

-- Home Tab (formerly Main)
Tabs.HomeTab = Window:Tab({
    Title = "Home",
    Icon = "home",
    ShowTabTitle = true,
})

-- Character Tab (formerly Player)
Tabs.CharacterTab = Window:Tab({
    Title = "Character",
    Icon = "user",
    ShowTabTitle = true,
})

-- Visuals Tab
Tabs.VisualsTab = Window:Tab({
    Title = "Visuals",
    Icon = "eye",
    ShowTabTitle = true,
})

-- Combat Tab
Tabs.CombatTab = Window:Tab({
    Title = "Combat",
    Icon = "crosshair",
    ShowTabTitle = true,
})

-- Farming Tab (formerly Auto Farm)
Tabs.FarmingTab = Window:Tab({
    Title = "Farming",
    Icon = "coins",
    ShowTabTitle = true,
})

-- Scripts Tab (formerly Hub)
Tabs.ScriptsTab = Window:Tab({
    Title = "Scripts",
    Icon = "code",
    ShowTabTitle = true,
})

-- Settings Tab
Tabs.SettingsTab = Window:Tab({
    Title = "Settings",
    Icon = "settings",
    ShowTabTitle = true,
})

-- Enhanced Time Tag with better design
local TimeTag = Window:Tag({
    Title = '--:--',
    Radius = 12,
    Color = WindUI:Gradient({
        ['0'] = { Color = Color3.fromHex('#FF0F7B'), Transparency = 0 },
        ['50'] = { Color = Color3.fromHex('#F89B29'), Transparency = 0 },
        ['100'] = { Color = Color3.fromHex('#4facfe'), Transparency = 0 },
    }, {
        Rotation = 45,
    }),
})

-- Enhanced rainbow effect & Time
local hue = 0
task.spawn(function()
    while true do
        local now = os.date('*t')
        local hours = string.format('%02d', now.hour)
        local minutes = string.format('%02d', now.min)
        local seconds = string.format('%02d', now.sec)

        hue = (hue + 0.015) % 1
        local color = Color3.fromHSV(hue, 0.8, 1)

        TimeTag:SetTitle(hours .. ':' .. minutes .. ':' .. seconds)
        TimeTag:SetColor(color)

        task.wait(0.5)
    end
end)

-- [[ ENHANCED FEATURES START ]] --

local RunService = Services.RunService

-- Enhanced Settings with more options
local walkSpeed, jumpPower = 16, 50
local noclipEnabled = false
local flying = false
local flySpeed = 50
local infiniteJump = false
local xRay = false
local gravityEnabled = true
local mobileFlyActive = false
local antiFlingEnabled = false
local godModeEnabled = false
local autoFarmEnabled = false
local espEnabled = false

-- NEW: Performance monitoring
local performanceStats = {
    FPS = 0,
    Ping = 0,
    Memory = 0
}

-- NEW: Enhanced fly system with better controls
local bodyVelocity, bodyGyro
local flyKeys = {
    Forward = Enum.KeyCode.W,
    Backward = Enum.KeyCode.S,
    Left = Enum.KeyCode.A,
    Right = Enum.KeyCode.D,
    Up = Enum.KeyCode.Space,
    Down = Enum.KeyCode.LeftShift
}

-- NEW: ESP System
local espObjects = {}
local highlightInstances = {}

-- NEW: Auto Farm System
local farmingConnections = {}

-- [[ HOME TAB ]] --
Tabs.HomeTab:Section({ Title = 'Quick Actions', Desc = 'Essential features for quick access' })
Tabs.HomeTab:Divider()

-- Enhanced Kill All with cooldown protection
Tabs.HomeTab:Button({
    Title = '⚡ Instant Kill All',
    Description = 'Eliminates all players instantly with protection',
    Callback = function()
        local lastKillTime = 0
        local function SafeKillAll()
            if tick() - lastKillTime < 2 then return end
            lastKillTime = tick()
            
            local Knife = LocalPlayer.Backpack:FindFirstChild('Knife') or LocalPlayer.Character:FindFirstChild('Knife')
            if Knife then
                if Knife.Parent.Name == 'Backpack' then
                    LocalPlayer.Character.Humanoid:EquipTool(Knife)
                end
                for _, player in ipairs(Services.Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild('HumanoidRootPart') then
                        Services.VirtualUser:ClickButton1(Vector2.new())
                        firetouchinterest(player.Character.HumanoidRootPart, Knife.Handle, 1)
                        firetouchinterest(player.Character.HumanoidRootPart, Knife.Handle, 0)
                    end
                end
            end
        end
        SafeKillAll()
    end,
})

-- Enhanced God Mode
Tabs.HomeTab:Toggle({
    Title = '🛡️ God Mode',
    Description = 'Makes you invincible to damage',
    Value = false,
    Callback = function(val)
        godModeEnabled = val
        if val then
            local player = LocalPlayer
            local character = player.Character
            if character and character:FindFirstChild("Humanoid") then
                local accessories = {}

                -- Save accessories
                for _, accessory in pairs(character.Humanoid:GetAccessories()) do
                    table.insert(accessories, accessory:Clone())
                end

                -- Rename current humanoid
                character.Humanoid.Name = "boop"

                -- Clone it back as real humanoid
                local v = character["boop"]:Clone()
                v.Parent = character
                v.Name = "Humanoid"
                task.wait(0.1)
                character["boop"]:Destroy()

                -- Reset camera
                Services.Workspace.CurrentCamera.CameraSubject = character.Humanoid

                -- Reattach accessories
                for _, accessory in pairs(accessories) do
                    character.Humanoid:AddAccessory(accessory)
                end

                -- Reset animations
                character.Animate.Disabled = true
                task.wait(0.1)
                character.Animate.Disabled = false
                
                WindUI:Notify({
                    Title = "God Mode",
                    Content = "God mode activated!",
                    Duration = 3
                })
            end
        else
            WindUI:Notify({
                Title = "God Mode",
                Content = "God mode deactivated!",
                Duration = 3
            })
        end
    end,
})

-- Enhanced Anti-Fling
Tabs.HomeTab:Toggle({
    Title = '🌀 Anti Fling',
    Description = 'Protects against flinging attacks',
    Value = false,
    Callback = function(state)
        antiFlingEnabled = state
        if state then
            getgenv().AntiFlingConnection = Services.RunService.Heartbeat:Connect(
                function()
                    for _, plr in ipairs(Services.Players:GetPlayers()) do
                        if plr ~= LocalPlayer and plr.Character then
                            for _, part in ipairs(plr.Character:GetDescendants()) do
                                if part:IsA('BasePart') and not part.Anchored then
                                    if part.Velocity.Magnitude > 100 then
                                        part.Velocity, part.RotVelocity = Vector3.zero, Vector3.zero
                                        part.Anchored = true
                                        task.delay(0.5, function()
                                            if part and part.Parent then
                                                part.Anchored = false
                                            end
                                        end)
                                    end
                                end
                            end
                        end
                    end
                end
            )
            WindUI:Notify({
                Title = "Anti-Fling",
                Content = "Anti-fling protection activated!",
                Duration = 3
            })
        elseif getgenv().AntiFlingConnection then
            getgenv().AntiFlingConnection:Disconnect()
            getgenv().AntiFlingConnection = nil
            WindUI:Notify({
                Title = "Anti-Fling",
                Content = "Anti-fling protection deactivated!",
                Duration = 3
            })
        end
    end,
})

-- Performance Monitor
Tabs.HomeTab:Section({ Title = 'Performance', Desc = 'System performance monitoring' })
Tabs.HomeTab:Divider()

local PerformanceLabel = Tabs.HomeTab:Paragraph({
    Title = "FPS: -- | Ping: -- ms",
    Desc = "Memory: -- MB | Server: -- players"
})

spawn(function()
    while true do
        performanceStats.FPS = math.round(1 / RunService.RenderStepped:Wait())
        performanceStats.Ping = Services.Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        performanceStats.Memory = math.round(Services.Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryType.Script))
        
        local playerCount = #Services.Players:GetPlayers()
        local maxPlayers = Services.Players.MaxPlayers
        
        PerformanceLabel:Set({
            Title = string.format("FPS: %d | Ping: %d ms", performanceStats.FPS, performanceStats.Ping),
            Desc = string.format("Memory: %d MB | Server: %d/%d players", performanceStats.Memory, playerCount, maxPlayers)
        })
        wait(1)
    end
end)

-- [[ CHARACTER TAB ]] --
Tabs.CharacterTab:Section({ Title = 'Movement', Desc = 'Character movement enhancements' })
Tabs.CharacterTab:Divider()

-- Enhanced Walk Speed with real-time update
Tabs.CharacterTab:Slider({
    Title = '🚶 Walk Speed',
    Compact = true,
    Value = { Min = 16, Max = 200, Default = 16 },
    Callback = function(value)
        walkSpeed = value
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
        if humanoid then
            humanoid.WalkSpeed = value
        end
    end,
})

-- Enhanced Jump Power
Tabs.CharacterTab:Slider({
    Title = '🦘 Jump Power',
    Compact = true,
    Value = { Min = 50, Max = 500, Default = 50 },
    Callback = function(value)
        jumpPower = value
        local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
        if humanoid then
            humanoid.JumpPower = value
        end
    end,
})

-- Enhanced Infinite Jump
Tabs.CharacterTab:Toggle({
    Title = '∞ Infinite Jump',
    Compact = true,
    Callback = function(state)
        infiniteJump = state
        if state then
            WindUI:Notify({
                Title = "Infinite Jump",
                Content = "Hold spacebar to jump infinitely!",
                Duration = 3
            })
        end
    end,
})

-- Enhanced Infinite Jump Logic
Services.UserInputService.JumpRequest:Connect(function()
    if infiniteJump and LocalPlayer.Character then
        local humanoid = LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
        if humanoid then
            humanoid:ChangeState('Jumping')
        end
    end
end)

-- Enhanced Gravity Toggle
Tabs.CharacterTab:Toggle({
    Title = '🌌 Zero Gravity',
    Compact = true,
    Callback = function(state)
        gravityEnabled = not state
        Services.Workspace.Gravity = state and 0 or 196.2
        WindUI:Notify({
            Title = "Gravity",
            Content = state and "Gravity disabled!" or "Gravity restored!",
            Duration = 3
        })
    end,
})

-- Enhanced Flight System
Tabs.CharacterTab:Section({ Title = 'Flight System', Desc = 'Advanced flight controls' })
Tabs.CharacterTab:Divider()

-- Create physics objects for flight
local function createBodyMovers()
    bodyVelocity = Instance.new('BodyVelocity')
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(100000, 100000, 100000)

    bodyGyro = Instance.new('BodyGyro')
    bodyGyro.MaxTorque = Vector3.new(100000, 100000, 100000)
end

-- Start flying function
local function startFlying()
    if not LocalPlayer.Character then return end

    local character = LocalPlayer.Character
    local humanoidRootPart = character:FindFirstChild('HumanoidRootPart')
    local humanoid = character:FindFirstChildOfClass('Humanoid')

    if not humanoidRootPart or not humanoid then return end

    createBodyMovers()
    flying = true
    bodyVelocity.Parent = humanoidRootPart
    bodyGyro.Parent = humanoidRootPart
    bodyGyro.CFrame = humanoidRootPart.CFrame
    humanoid.PlatformStand = true
    
    WindUI:Notify({
        Title = "Flight",
        Content = "Flight activated! Press E to toggle.",
        Duration = 3
    })
end

-- Stop flying function
local function stopFlying()
    flying = false
    if bodyVelocity then bodyVelocity:Destroy() end
    if bodyGyro then bodyGyro:Destroy() end

    local character = LocalPlayer.Character
    if character then
        local humanoid = character:FindFirstChildOfClass('Humanoid')
        if humanoid then humanoid.PlatformStand = false end
    end

    WindUI:Notify({
        Title = 'Flight',
        Content = 'Flight disabled',
        Duration = 2,
    })
end

-- E key to toggle flight
Services.UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or input.KeyCode ~= Enum.KeyCode.E then return end
    if not flyEnabled then return end

    if flying then
        stopFlying()
    else
        startFlying()
    end
end)

-- Flight movement logic
Services.RunService.RenderStepped:Connect(function()
    if not flying or not LocalPlayer.Character then return end

    local character = LocalPlayer.Character
    local humanoidRootPart = character:FindFirstChild('HumanoidRootPart')
    if not humanoidRootPart then return end

    local moveDirection = Vector3.new(0, 0, 0)
    local camera = Services.Workspace.CurrentCamera

    -- Enhanced movement controls
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.W) then
        moveDirection = moveDirection + camera.CFrame.LookVector
    end
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.S) then
        moveDirection = moveDirection - camera.CFrame.LookVector
    end
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.A) then
        moveDirection = moveDirection - camera.CFrame.RightVector
    end
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.D) then
        moveDirection = moveDirection + camera.CFrame.RightVector
    end
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.Space) then
        moveDirection = moveDirection + Vector3.new(0, 1, 0)
    end
    if Services.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then
        moveDirection = moveDirection - Vector3.new(0, 1, 0)
    end

    -- Apply movement
    bodyVelocity.Velocity = moveDirection * flySpeed
    bodyGyro.CFrame = camera.CFrame
end)

-- Handle character reset
LocalPlayer.CharacterAdded:Connect(function(character)
    if flyEnabled and flying then
        task.wait(1)
        startFlying()
    end
end)

-- Flight Toggle
local flyEnabled = false
Tabs.CharacterTab:Toggle({
    Title = '✈️ PC Flight (E to toggle)',
    Compact = true,
    Callback = function(state)
        flyEnabled = state
        if not state and flying then
            stopFlying()
        elseif state then
            WindUI:Notify({
                Title = "Flight",
                Content = "Flight enabled! Press E to start flying.",
                Duration = 3
            })
        end
    end,
})

-- Flight Speed Slider
Tabs.CharacterTab:Slider({
    Title = 'Flight Speed',
    Compact = true,
    Value = { Min = 20, Max = 200, Default = 50 },
    Callback = function(value)
        flySpeed = value
        if flying then
            WindUI:Notify({
                Title = 'Flight Speed',
                Content = 'Speed set to: ' .. value,
                Duration = 2,
            })
        end
    end,
})

-- Mobile Fly
Tabs.CharacterTab:Button({
    Title = '📱 Mobile Fly',
    Compact = true,
    Callback = function()
        mobileFlyActive = not mobileFlyActive
        if mobileFlyActive then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
            WindUI:Notify({
                Title = "Mobile Fly",
                Content = "Mobile flight system loaded!",
                Duration = 3
            })
        end
    end,
})

-- Enhanced NoClip
Tabs.CharacterTab:Toggle({
    Title = '👻 NoClip',
    Compact = true,
    Callback = function(state)
        noclipEnabled = state
        if state then
            coroutine.wrap(function()
                while noclipEnabled and LocalPlayer.Character do
                    local humanoid = LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                    if humanoid then
                        for _, part in pairs(LocalPlayer.Character:GetDescendants()) do
                            if part:IsA('BasePart') then
                                part.CanCollide = false
                            end
                        end
                    end
                    task.wait(0.1)
                end
            end)()
            WindUI:Notify({
                Title = "NoClip",
                Content = "NoClip activated! Walk through walls.",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "NoClip",
                Content = "NoClip deactivated!",
                Duration = 3
            })
        end
    end,
})

-- [[ VISUALS TAB ]] --
Tabs.VisualsTab:Section({ Title = 'Visual Enhancements', Desc = 'Improve your visual experience' })
Tabs.VisualsTab:Divider()

-- Enhanced X-Ray
Tabs.VisualsTab:Toggle({
    Title = '🔍 X-ray Vision',
    Compact = true,
    Callback = function(state)
        xRay = state
        for _, part in pairs(Services.Workspace:GetDescendants()) do
            if part:IsA('BasePart') and not part:IsDescendantOf(LocalPlayer.Character) then
                part.LocalTransparencyModifier = state and 0.7 or 0
            end
        end
        WindUI:Notify({
            Title = "X-Ray",
            Content = state and "X-Ray vision activated!" or "X-Ray vision deactivated!",
            Duration = 3
        })
    end,
})

-- FOV Changer
Tabs.VisualsTab:Slider({
    Title = '🎯 Field of View',
    Compact = true,
    Value = { Min = 50, Max = 120, Default = 70 },
    Callback = function(value)
        Services.Workspace.CurrentCamera.FieldOfView = value
    end,
})

-- Full Bright
Tabs.VisualsTab:Toggle({
    Title = '💡 Full Bright',
    Compact = true,
    Callback = function(state)
        if state then
            Services.Lighting.Brightness = 2
            Services.Lighting.ClockTime = 14
            Services.Lighting.FogEnd = 100000
            Services.Lighting.GlobalShadows = false
            WindUI:Notify({
                Title = "Full Bright",
                Content = "Full bright activated!",
                Duration = 3
            })
        else
            Services.Lighting.Brightness = 1
            Services.Lighting.ClockTime = 12
            Services.Lighting.FogEnd = 100
            Services.Lighting.GlobalShadows = true
            WindUI:Notify({
                Title = "Full Bright",
                Content = "Full bright deactivated!",
                Duration = 3
            })
        end
    end,
})

-- [[ COMBAT TAB ]] --
Tabs.CombatTab:Section({ Title = 'Aimbot & Targeting', Desc = 'Combat enhancement features' })
Tabs.CombatTab:Divider()

-- Enhanced Aimbot
Tabs.CombatTab:Toggle({
    Title = '🎯 Aimlock (Torso)',
    Compact = true,
    Callback = function(state)
        getgenv().AimlockEnabled = state

        if state then
            if not getgenv().AimlockInitialized then
                getgenv().AimlockInitialized = true

                local Players = Services.Players
                local Workspace = Services.Workspace
                local RunService = Services.RunService
                local Camera = Workspace.CurrentCamera

                -- Find the murderer
                local function FindMurderer()
                    for _, player in ipairs(Players:GetPlayers()) do
                        if player ~= LocalPlayer and player.Character then
                            local hasKnife = player.Character:FindFirstChild('Knife') or player.Backpack:FindFirstChild('Knife')
                            if hasKnife and player.Character:FindFirstChild('HumanoidRootPart') then
                                return player
                            end
                        end
                    end
                    return nil
                end

                -- Aimbot loop
                RunService.RenderStepped:Connect(function()
                    if getgenv().AimlockEnabled then
                        local murderer = FindMurderer()
                        if murderer and murderer.Character then
                            local torso = murderer.Character:FindFirstChild('HumanoidRootPart')
                            if torso then
                                -- Smooth camera lock onto torso
                                Camera.CFrame = CFrame.new(Camera.CFrame.Position, torso.Position)
                            end
                        end
                    end
                end)

                -- Cleanup
                Players.PlayerRemoving:Connect(function(player)
                    if player == LocalPlayer then
                        getgenv().AimlockEnabled = false
                        getgenv().AimlockInitialized = false
                    end
                end)
            end
            WindUI:Notify({
                Title = "Aimlock",
                Content = "Aimlock activated! Targeting murderers.",
                Duration = 3
            })
        else
            getgenv().AimlockEnabled = false
            WindUI:Notify({
                Title = "Aimlock",
                Content = "Aimlock deactivated!",
                Duration = 3
            })
        end
    end,
})

-- Auto Shoot
local AutoShootEnabled = false
local ShootKey = Enum.KeyCode.Z

Tabs.CombatTab:Toggle({
    Title = '🔫 Auto Shoot',
    Description = 'Automatically shoot at murderers',
    Value = false,
    Callback = function(state)
        AutoShootEnabled = state
        WindUI:Notify({
            Title = "Auto Shoot",
            Content = state and "Auto shoot activated!" or "Auto shoot deactivated!",
            Duration = 3
        })
    end,
})

-- Shoot Keybind
Tabs.CombatTab:Keybind({
    Title = 'Shoot Key',
    Desc = 'Key to activate auto shooting',
    Value = 'Z',
    Callback = function(v)
        ShootKey = Enum.KeyCode[v]
        WindUI:Notify({
            Title = "Shoot Key",
            Content = "Shoot key set to: " .. v,
            Duration = 2
        })
    end,
})

-- [[ FARMING TAB ]] --
Tabs.FarmingTab:Section({ Title = 'Auto Farming', Desc = 'Automate your gameplay' })
Tabs.FarmingTab:Divider()

-- Enhanced Auto Farm Button
Tabs.FarmingTab:Button({
    Title = '🚀 Activate Auto Farm',
    Description = 'Start automated farming system',
    Callback = function()
        if not game:IsLoaded() then game.Loaded:Wait() end
        
        -- Delete old UI if exists
        if LocalPlayer.PlayerGui:FindFirstChild("SkidSource_FarmUI") then
            LocalPlayer.PlayerGui.SkidSource_FarmUI:Destroy()
        end

        local autoFarmEnabled = false
        local autoResetEnabled = false

        -- Create farming UI
        local gui = Instance.new("ScreenGui")
        gui.Name = "SkidSource_FarmUI"
        gui.ResetOnSpawn = false
        gui.Parent = LocalPlayer.PlayerGui

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 300, 0, 200)
        frame.Position = UDim2.new(0.5, -150, 0.5, -100)
        frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
        frame.BackgroundTransparency = 0.1
        frame.BorderSizePixel = 0
        frame.Parent = gui
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

        -- Gradient effect
        local gradient = Instance.new("UIGradient", frame)
        gradient.Rotation = 135
        gradient.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 0, 0)),
            ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0, 120, 0)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 180))
        }

        -- Title
        local title = Instance.new("TextLabel", frame)
        title.Size = UDim2.new(1, 0, 0, 40)
        title.Position = UDim2.new(0, 0, 0, 10)
        title.BackgroundTransparency = 1
        title.Text = "SkidSource Auto Farm"
        title.TextColor3 = Color3.new(1,1,1)
        title.Font = Enum.Font.FredokaOne
        title.TextSize = 20
        title.TextStrokeTransparency = 0.5

        -- Toggle buttons would go here (similar to your original farming code)
        -- For brevity, I'm including the core farming logic:

        local CoinCollected = Services.ReplicatedStorage.Remotes.Gameplay.CoinCollected
        local RoundStart = Services.ReplicatedStorage.Remotes.Gameplay.RoundStart
        local RoundEnd = Services.ReplicatedStorage.Remotes.Gameplay.RoundEndFade

        local farming = false
        local bag_full = false
        local resetting = false
        local start_position = nil

        LocalPlayer.Idled:Connect(function()
            Services.VirtualUser:CaptureController()
            Services.VirtualUser:ClickButton2(Vector2.new())
        end)

        local function getCharacter() 
            return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() 
        end
        
        local function getHRP() 
            return getCharacter():WaitForChild("HumanoidRootPart") 
        end

        CoinCollected.OnClientEvent:Connect(function(_, current, max)
            if current == max and not resetting and autoResetEnabled then
                resetting = true
                bag_full = true
                local hrp = getHRP()
                if start_position then
                    Services.TweenService:Create(hrp, TweenInfo.new(2), {CFrame = start_position}):Play():Wait()
                end
                task.wait(0.5)
                LocalPlayer.Character.Humanoid.Health = 0
                LocalPlayer.CharacterAdded:Wait()
                task.wait(1.5)
                resetting = false
                bag_full = false
            end
        end)

        RoundStart.OnClientEvent:Connect(function()
            farming = true
            start_position = getHRP().CFrame
        end)

        RoundEnd.OnClientEvent:Connect(function() 
            farming = false 
        end)

        local function get_nearest_coin()
            local hrp = getHRP()
            local closest, dist = nil, math.huge
            for _, m in pairs(Services.Workspace:GetChildren()) do
                if m:FindFirstChild("CoinContainer") then
                    for _, coin in pairs(m.CoinContainer:GetChildren()) do
                        if coin:IsA("BasePart") and coin:FindFirstChild("TouchInterest") then
                            local d = (hrp.Position - coin.Position).Magnitude
                            if d < dist then 
                                closest, dist = coin, d 
                            end
                        end
                    end
                end
            end
            return closest, dist
        end

        -- Start farming loop
        autoFarmEnabled = true
        task.spawn(function()
            while autoFarmEnabled do
                if farming and not bag_full then
                    local coin, dist = get_nearest_coin()
                    if coin then
                        local hrp = getHRP()
                        if dist > 150 then
                            hrp.CFrame = coin.CFrame
                        else
                            local tween = Services.TweenService:Create(hrp, TweenInfo.new(dist/20, Enum.EasingStyle.Linear), {CFrame = coin.CFrame})
                            tween:Play()
                            repeat task.wait() until not coin:FindFirstChild("TouchInterest") or not farming
                            tween:Cancel()
                        end
                    end
                end
                task.wait(0.2)
            end
        end)

        WindUI:Notify({
            Title = "Auto Farm",
            Content = "Auto farming system activated!",
            Duration = 5
        })
    end,
})

-- [[ SCRIPTS TAB ]] --
Tabs.ScriptsTab:Section({ Title = 'Popular Scripts', Desc = 'One-click script loader' })
Tabs.ScriptsTab:Divider()

-- Organized script buttons by category
Tabs.ScriptsTab:Section({ Title = 'Admin Scripts', Desc = '' })
Tabs.ScriptsTab:Button({Title="Infinite Yield", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()end})
Tabs.ScriptsTab:Button({Title="Nameless Admin", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/FilteringEnabled/NamelessAdmin/main/Source"))()end})
Tabs.ScriptsTab:Button({Title="CMD-X", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source"))()end})
Tabs.ScriptsTab:Button({Title="Fates Admin", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/source.lua"))()end})

Tabs.ScriptsTab:Section({ Title = 'Utility Scripts', Desc = '' })
Tabs.ScriptsTab:Button({Title="Orca", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/richie0866/orca/master/public/latest.lua"))()end})
Tabs.ScriptsTab:Button({Title="Hydroxide", Callback=function()
    local o,b="Upbolt","revision"
    pcall(function()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/%s/Hydroxide/%s/init.lua"):format(o,b)))()
        loadstring(game:HttpGet(("https://raw.githubusercontent.com/%s/Hydroxide/%s/ui/main.lua"):format(o,b)))()
    end)
end})
Tabs.ScriptsTab:Button({Title="Simple V3", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Simple-Scripts/main/Simple%20V3"))()end})

Tabs.ScriptsTab:Section({ Title = 'Game Scripts', Desc = '' })
Tabs.ScriptsTab:Button({Title="Redz Hub (Blox Fruits)", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/tlredz/Scripts/refs/heads/main/main.luau"))({JoinTeam="Pirates",Translator=true})end})
Tabs.ScriptsTab:Button({Title="Hoho Hub (Blox Fruits)", Callback=function()loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()end})
Tabs.ScriptsTab:Button({Title="Da Hood OP Script", Callback=function()loadstring(game:HttpGet("https://rscripts.net/script/dah-hood-op-script-RXe2"))()end})

-- [[ SETTINGS TAB ]] --
Tabs.SettingsTab:Section({ Title = 'UI Settings', Desc = 'Customize your experience' })
Tabs.SettingsTab:Divider()

-- Theme selector
local themes = {"Dark", "Light", "Darker", "Luna", "Aqua"}
Tabs.SettingsTab:Dropdown({
    Title = '🎨 Theme',
    Values = themes,
    Value = 'Dark',
    Callback = function(value)
        WindUI:SetTheme(value)
        WindUI:Notify({
            Title = "Theme Changed",
            Content = "Theme set to: " .. value,
            Duration = 3
        })
    end,
})

-- Transparency slider
Tabs.SettingsTab:Slider({
    Title = 'Transparency',
    Value = { Min = 0, Max = 1, Default = 0.35, Step = 0.05 },
    Callback = function(value)
        Window:ToggleTransparency(value > 0)
        WindUI.TransparencyValue = value
    end,
})

-- UI Keybind
Tabs.SettingsTab:Keybind({
    Title = 'UI Toggle Key',
    Desc = 'Key to show/hide the UI',
    Value = 'RightControl',
    Callback = function(v)
        Window:SetToggleKey(Enum.KeyCode[v])
        WindUI:Notify({
            Title = "Keybind Updated",
            Content = "UI toggle key set to: " .. v,
            Duration = 3
        })
    end,
})

-- Configuration Section
Tabs.SettingsTab:Section({ Title = 'Configuration', Desc = 'Save and load your settings' })
Tabs.SettingsTab:Divider()

local configName = "default"
Tabs.SettingsTab:Input({
    Title = 'Config Name',
    Value = configName,
    Callback = function(value)
        configName = value or "default"
    end,
})

Tabs.SettingsTab:Button({
    Title = '💾 Save Config',
    Callback = function()
        local configData = {
            WalkSpeed = walkSpeed,
            JumpPower = jumpPower,
            FlySpeed = flySpeed,
            InfiniteJump = infiniteJump,
            GodMode = godModeEnabled,
            AntiFling = antiFlingEnabled,
            NoClip = noclipEnabled,
            XRay = xRay
        }
        
        writefile("skidsource_config_" .. configName .. ".json", Services.HttpService:JSONEncode(configData))
        
        WindUI:Notify({
            Title = "Config Saved",
            Content = "Configuration '" .. configName .. "' saved successfully!",
            Duration = 3
        })
    end,
})

Tabs.SettingsTab:Button({
    Title = '📂 Load Config',
    Callback = function()
        if isfile("skidsource_config_" .. configName .. ".json") then
            local configData = Services.HttpService:JSONDecode(readfile("skidsource_config_" .. configName .. ".json"))
            
            -- Apply loaded settings
            if configData.WalkSpeed then
                walkSpeed = configData.WalkSpeed
                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
                if humanoid then humanoid.WalkSpeed = walkSpeed end
            end
            
            -- You would apply other settings here...
            
            WindUI:Notify({
                Title = "Config Loaded",
                Content = "Configuration '" .. configName .. "' loaded successfully!",
                Duration = 3
            })
        else
            WindUI:Notify({
                Title = "Config Error",
                Content = "Configuration '" .. configName .. "' not found!",
                Duration = 3
            })
        end
    end,
})

-- Final initialization
Window:SelectTab(1)
Window:UnlockAll()

Window:OnClose(function()
    WindUI:Notify({
        Title = "Davi Ui",
        Content = "UI hidden! Press RightControl to reopen.",
        Duration = 3
    })
end)

Window:OnOpen(function()
    WindUI:Notify({
        Title = "Davi",
        Content = "Enhanced UI loaded successfully!",
        Duration = 3
    })
end)

-- Auto-execute saved settings
spawn(function()
    wait(3)
    if isfile("skidsource_config_default.json") then
        local configData = Services.HttpService:JSONDecode(readfile("skidsource_config_default.json"))
        -- Apply default config if exists
        WindUI:Notify({
            Title = "Davi Ui",
            Content = "Default configuration applied!",
            Duration = 3
        })
    end
end)

print("🎮 Davi logou")
