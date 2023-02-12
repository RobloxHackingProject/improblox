local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/improblox/main/lib/CustomSolarisLib.lua"))()

local win = SolarisLib:New({
  Name = "ImproBlox",
  FolderToSave = "ImproBloxStuff"
})


--Extra code to make sure some modules work
for _,v in ipairs(game.Workspace:GetChildren()) do
if v:IsA("Part") then
if v.CFrame == CFrame.new(-138.5, 0.5, -284, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
v.Name = 'SpawnFloor1'
elseif v.CFrame == CFrame.new(-138.5, 0.5, -250, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
v.Name = 'SpawnFloor2'
elseif v.CFrame == CFrame.new(-122.375, 0.5, -331.375, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
v.Name = 'SpawnFloor3'
elseif v.CFrame == CFrame.new(-122.375, 0.5, -326, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
v.Name = 'SpawnFloor4'
elseif v.CFrame == CFrame.new(-117.75, 0.5, -331.5, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
v.Name = 'SpawnFloor5'
elseif v.CFrame == CFrame.new(-115.5, 8.75, -273.75, 1, 0, 0, 0, 1, 0, 0, 0, 1) then
v.Name = 'BreakableGlass'
end
end
end

--Adds in the brokenglass texture to the other side as well
if not game.Workspace.BreakableGlass:FindFirstChild('newdecal') then
local broken = game.Workspace.BreakableGlass.Decal:Clone()
broken.Face = Enum.NormalId.Right
broken.Parent = game.Workspace.BreakableGlass
broken.Name = "newdecal"
end

--Main UI
local tab = win:Tab("Main")
local tab2 = win:Tab("Settings")

local sec = tab:Section("UI Related")
local sec2 = tab:Section("Map Related")

local sec2_2 = tab2:Section("Main Settings")

local toggle = sec:Toggle("Disable Ask A Friend UI", true,"frienduidisabler", function(bool)
if bool then
local runService = game:GetService("RunService")
event = runService.RenderStepped:Connect(function()
pcall(function()
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Friends").Enabled = not bool
end)
end)
end
if not bool then
event:Disconnect()
end
end)

local toggle = sec:Toggle("Remove Unnecessary UI", true,"removeui", function(bool)
if bool then
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Game_Version").Enabled = false
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Sprint").Enabled = false
end
if not bool then
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Game_Version").Enabled = true
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Sprint").Enabled = true
end
end)

local toggle = sec:Toggle("Better HealthCounter", true,"healthUI", function(bool)
if bool then
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Health").Enabled = false
end
if not bool then
pcall(function()
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Health").Enabled = true
game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("betterhealth"):Destroy()
end)
end
end)

local toggle = sec2:Toggle("Give the entire lobby floor the same texture", false,"lobbytexture", function(bool)
if bool then
game.Workspace.SpawnFloor1.Texture.Color3 = Color3.new(0.486275, 0.486275, 0.486275)
game.Workspace.SpawnFloor2.Texture.Color3 = Color3.new(0.486275, 0.486275, 0.486275)
game.Workspace.SpawnFloor3.Texture.Color3 = Color3.new(0.486275, 0.486275, 0.486275)
game.Workspace.SpawnFloor4.Texture.Color3 = Color3.new(0.486275, 0.486275, 0.486275)
game.Workspace.SpawnFloor5.Texture.Color3 = Color3.new(0.486275, 0.486275, 0.486275)
end
if not bool then
game.Workspace.SpawnFloor1.Texture.Color3 = Color3.new(1,1,1)
game.Workspace.SpawnFloor2.Texture.Color3 = Color3.new(1,1,1)
game.Workspace.SpawnFloor3.Texture.Color3 = Color3.new(1,1,1)
game.Workspace.SpawnFloor4.Texture.Color3 = Color3.new(1,1,1)
game.Workspace.SpawnFloor5.Texture.Color3 = Color3.new(1,1,1)
end
end)

local toggle = sec2:Toggle("Ability to break the glass window at spawn", false,"glassbreaker", function(bool)
if bool then
local glass = game.Workspace.BreakableGlass

local prox = Instance.new("ProximityPrompt", glass)--Proximity Prompt
prox.Name = "v"
prox.HoldDuration = 0.5
prox.ActionText = "Break Glass"
prox.MaxActivationDistance = 8

local sound = Instance.new("Sound", glass)
sound.Name = "sound"
sound.SoundId = "rbxassetid://9116264426"
sound.Volume = 1

glass.v.Triggered:Connect(function() --Prompt triggered code
glass.v.Enabled = false
glass.sound:Play()
glass.Transparency = 1
glass.CanCollide = false
glass.Decal.Transparency = 1
glass.newdecal.Transparency = 1
end)
end
if not bool then
pcall(function()
local glass = game.Workspace.BreakableGlass --Reset everything changed
glass:FindFirstChild('v'):Destroy()
glass:FindFirstChild('sound'):Destroy()
glass.Transparency = 0.8
glass.CanCollide = true
glass.Decal.Transparency = 0.5
glass.newdecal.Transparency = 0.5
end)
end
end)



local toggle = sec2_2:Toggle("Get CFrame of part clicked on", false,"debug", function(bool)
if bool then
local mouse = game.Players.LocalPlayer:GetMouse()

mouse.Button1Up:Connect(function()
    if mouse.Target then
        local targeted = tostring(mouse.Target.CFrame)
        setclipboard(targeted)
    end
end)
end
end)

sec2_2:Bind("Toggle UI", Enum.KeyCode.LeftAlt, false, "binder", function()
pcall(function() --Toggle UI
local coregui = game:GetService('CoreGui')
if coregui:FindFirstChild("notiHolder") then coregui:FindFirstChild("notiHolder").Enabled = not coregui:FindFirstChild("notiHolder").Enabled end
if coregui:FindFirstChild("Solarisgui") then coregui:FindFirstChild("Solarisgui").Enabled = not coregui:FindFirstChild("Solarisgui").Enabled end
end)
end)
