local repo = 'https://raw.githubusercontent.com/s4tc6yzmkn-glitch/myrepo/main/'
local LibrarySource = game:HttpGet(repo .. 'Library.lua')
local Library = loadstring(LibrarySource)()
local ThemeManager = loadstring(game:HttpGet(repo .. 'ThemeManager.lua'))()
local SaveManager  = loadstring(game:HttpGet(repo .. 'SaveManager.lua'))()
local Toggles = Library.Toggles
local Options = Library.Options
Library.Scheme.AccentColor = Color3.fromRGB(255, 255, 255) -- #ffffff
Library.Scheme.FontColor = Color3.fromRGB(255, 255, 255)   -- #ffffff
Library.Scheme.OutlineColor = Color3.fromRGB(27, 27, 27)   -- #1b1b1b
Library.Scheme.MainColor = Color3.fromRGB(12, 12, 12)      -- #0d0d0d
Library.Scheme.BackgroundColor = Color3.fromRGB(0, 0, 0)   -- #000000

local Players = game:GetService('Players')
local RunService = game:GetService('RunService')
local Workspace = game:GetService('Workspace')
local SoundService = game:GetService('SoundService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Lighting = game:GetService('Lighting')
local TweenService = game:GetService('TweenService')
local InsertService = game:GetService('InsertService')
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService('UserInputService')
local OLD_NOTIFY = Library.Notify

function Library:Notify(data)
    if type(data) ~= 'table' then
        data = { Description = tostring(data) }
    end
    data.Title = data.Title or '<b>!Notify</b>'
    data.BigIcon = data.BigIcon or 'rbxassetid://98343520718448'
    return OLD_NOTIFY(self, data)
end

local Window = Library:CreateWindow({
    Title = '<b>Title</b>',
    Icon = '98343520718448',
    Footer = 'Test.lua v1',
    DisableSearch = false,
    EnableCompacting = true,
    SidebarCompacted = true,
    EnableSidebarResize = true,
    CornerRadius = 30,
})

local Tabs = {
    MainTab = Window:AddTab('Main', 'home', 'Main menu'),
}

Library:Notify({
    Title = 'ここにタイトル',
    Description = 'ここに内容',
    Time = 3,
})

do
    local PlayerGroup = Tabs.MainTab:AddLeftGroupbox('player', "user")

    PlayerGroup:AddImage("test_Avatar", {
        Image = string.format("rbxthumb://type=AvatarHeadShot&id=%d&w=150&h=150", LocalPlayer.UserId),
        Height = 100,
        Callback = function() end,
    })

    PlayerGroup:AddLabel('<font color="rgb(255,255,255)" size="35">Test.lua v1</font>', true)

    PlayerGroup:AddLabel(
        '<font color="rgb(150,150,150)">user : @' .. LocalPlayer.Name .. '<br/>lol ui v1</font>', 
        true
    )
end
