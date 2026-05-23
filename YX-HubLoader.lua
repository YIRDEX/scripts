local function ShowErrorPrompt(title, message, shouldKick)
    local promptCode = [[
        local title, message, shouldKick = ...
        
        spawn(function()
            while true do
                pcall(function()
                    local CoreGui = game:GetService("CoreGui")
                    local prompt = CoreGui:FindFirstChild("RobloxPromptGui")
                    if prompt and prompt:FindFirstChild("promptOverlay") then
                        local overlay = prompt.promptOverlay
                        local errorPrompt = overlay:FindFirstChild("ErrorPrompt")
                        if errorPrompt then
                            local titleFrame = errorPrompt:FindFirstChild("TitleFrame")
                            if titleFrame and titleFrame:FindFirstChild("ErrorTitle") then
                                titleFrame.ErrorTitle.Text = title
                            end
                            local messageArea = errorPrompt:FindFirstChild("MessageArea")
                            if messageArea and messageArea:FindFirstChild("ErrorFrame") then
                                local errorFrame = messageArea.ErrorFrame
                                if errorFrame:FindFirstChild("ErrorMessage") then
                                    errorFrame.ErrorMessage.Text = message
                                end
                            end
                        end
                    end
                end)
                wait()
            end
        end)
        
        if shouldKick then
            game:GetService("Players").LocalPlayer:Kick(message)
        end
        
        while wait() do end
    ]]
    
    loadstring(promptCode)(title, message, shouldKick)
end

-- 目标服务器ID列表
local TARGET_PLACE_IDS = {
    114234929420007,
}

local currentPlaceId = game.PlaceId

local isBlocked = false
for _, id in ipairs(TARGET_PLACE_IDS) do
    if currentPlaceId == id then
        isBlocked = true
        break
    end
end

if isBlocked then

    ShowErrorPrompt("YX-脚本中心警告🚫", "该服务器已被禁止使用\n现以踢出防止封禁", true)
else

end

game:GetService("StarterGui"):SetCore("SendNotification", {
  Title = "YX-脚本中心",
  Text = "欢迎使用YX-脚本中心",
  Icon = "rbxassetid://127276339495788",
  Duration = 1,
  Callback = bindable,
  Button1 = "欢迎使用",
  Button2 = "持续更新",
})

local GlobalEnv = getgenv()
local FunctionEnv = getfenv()

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/obsidian_UI/main/Library.lua"))() 
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/obsidian_UI/refs/heads/main/ThemeManager.lua"))() 
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/DevSloPo/obsidian_UI/main/addons/SaveManager.lua"))()

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:WaitForChild("Humanoid")

local function LoadScript(scriptName, url)
    local startTime = tick()
    loadstring(game:HttpGet(url))()
    ShowScriptLoadedNotification(scriptName, tick() - startTime)
end

local Win = Library:CreateWindow({
	Title = "YX-脚本中心",
    Footer = "制作人：YirdeX，此脚本为脚本中心",
	Icon = 127276339495788,
	  Size = UDim2.fromOffset(750, 650),
    AutoShow = true,
    NotifySide = "Right",
    ShowCustomCursor = true,
    IconSize = UDim2.fromOffset(40, 40),
    Resizable = true,
    MobileButtonsSide = "Left",
    DisableSearch = false,
    SearchbarSize = UDim2.new(0.8, 0, 1, 0),
    GlobalSearch = false,
    
    Position = UDim2.fromOffset(100, 100),
    Center = true,
    
    EnableSidebarResize = true,
    EnableCompacting = true,
    SidebarCompacted = false,
    MinContainerWidth = 256,
})

local Tabs = {
    D = Win:AddTab({
        Name = "首页",
        Description = "[主要群聊:2152069753]",
        Icon = "house"
    }),
    K = Win:AddTab({
        Name = "其它脚本",
        Description = "汇聚优秀脚本",
        Icon = "code-xml"
    }),
    B = Win:AddTab({
        Name = "脚本中心",
        Description = "汇聚很多服务器优秀脚本",
        Icon = "bug"
    }),
    ["UI Settings"] = Win:AddTab({
        Name = "设置",
        Description = "界面设置与部分功能",
        Icon = "settings"
    }),
    C = Win:AddTab({
        Name = "外部插件",
        Description = "额外功能加入此脚本",
        Icon = "boxes"
    })
}

local ACD = Tabs.K:AddLeftGroupbox("各大脚本")
local AB = Tabs.D:AddRightGroupbox("信息")
local AA = Tabs.D:AddLeftGroupbox("人员名单","handshake")
local Addons = Tabs.C:AddLeftGroupbox("插件管理")

    Tabs.D:UpdateWarningBox({
        Title = '脚本信息',
        Text = '该脚本是由<font color=\"rgb(0, 255, 255)\">YirdeX</font>制作出来的<font color=\"rgb(0, 255, 255)\">Hub</font>脚本，为各位脚本玩家提供最为优质的脚本中心，同时搜寻网上所有的汉化脚本，让各位不用再为看不懂<font color=\"rgb(0, 255, 255)\">英文</font>而烦恼',
        IsNormal = true,
        Visible = true,
        LockSize = true,
    })
AA:AddLabel("[<font color=\"rgb(0, 255, 0)\">YirdeX</font>]制作者 | 所有者")

AB:AddLabel("复制<font color=\"rgb(0, 255, 255)\">YirdeX</font>视频平台账号")

AB:AddButton({
    Text = "复制我的QQ主群",
    Func = function()
    setclipboard("2152069753")
    Tooltip = "复制主群号",
    Library:Notify({
    Title = "YirdeX-提示",
    Description = "复制成功",
    Time = 2,
})
    end
})
AB:AddButton({
    Text = "复制我的快手号",
    Func = function()
    setclipboard("3839425043")
       Tooltip = "复制快手号",
       Library:Notify({
    Title = "YirdeX-提示",
    Description = "复制成功",
    Time = 2,
})
    end
})
AB:AddButton({
    Text = "复制我的B站lD",
    Func = function()
    setclipboard("UID:3493111925836628")
       Tooltip = "复制B站lD",
    Library:Notify({
    Title = "YirdeX-提示",
    Description = "复制成功",
    Time = 2,
})
    end
})

----------

ACD:AddButton({
    Text = "XK脚本",
    Func = function()
    loadstring(game:HttpGet(('https://github.com/devslopo/DVES/raw/main/XK%20Hub')))()
    end
})
ACD:AddButton({
    Text = "皮脚本",
    Func = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()
    end
})
ACD:AddButton({
    Text = "Rb脚本中心",
    Func = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Yungengxin/roblox/refs/heads/main/Rb-Hub"))()
    end
})
ACD:AddButton({
    Text = "Sky Hub",
    Func = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/Skyhub.lua"))()
    end
})
ACD:AddButton({
    Text = "BS黑洞中心",
    Func = function()
    loadstring(game:HttpGet("https://gitee.com/BS_script/script/raw/master/BS_Script.Luau"))()
    end
})
ACD:AddButton({
    Text = "Rb汉化中心",
    Func = function()
    loadstring(game:HttpGet("https://gitee.com/BS_script/script/raw/master/BS_Script.Luau"))()
    end
})
ACD:AddButton({
    Text = "AF Hub",
    Func = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fningna51-stack/-/main/%E7%A7%8B%E8%BE%9E%E7%BC%9D%E5%90%88%E8%84%9A%E6%9C%AC%E6%9C%80%E6%96%B0%E7%89%88%E6%96%B0ui"))()
    end
})
ACD:AddButton({
    Text = "复制AF Hub主群获取",
    Func = function()
    setclipboard("938714427")
    Tooltip = "复制AF Hub",
    Library:Notify({
    Title = "YirdeX-提示",
    Description = "复制成功",
    Time = 2,
})
    end
})
ACD:AddButton({
    Text = "霖溺脚本",
    Func = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ShenJiaoBen/ScriptLoader/refs/heads/main/Linni_FreeLoader.lua"))()
    end
})
ACD:AddLabel("-------通用脚本-------")
ACD:AddButton({
    Text = "Msploit汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Msploit"))()
    end
})
ACD:AddLabel("Msploit里面内置通用脚本")

ACD:AddButton({
    Text = "通用汉化脚本",
    Func = function()
   loadstring(game:HttpGet(" https://raw.githubusercontent.com/fningna51-stack/-/main/%E7%9B%91%E7%8B%B1%E7%94%9F%E6%B4%BB%E8%84%9A%E6%9C%AC"))()
    end
})

ACD:AddButton({
    Text = "mobileaimbot汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/%E9%80%9A%E7%94%A8%E8%84%9A%E6%9C%ACmobileaimbot"))()
    end
})




----------





















local AGA = Tabs.B:AddLeftGroupbox("脚本中心1")
local A22 = Tabs.B:AddRightGroupbox("脚本中心2")



Tabs.B:UpdateWarningBox({
        Title = '脚本信息及<font color=\"rgb(255, 0, 0)\">警告!</font>',
        Text = '可能有些没有完全汉化，\n在一些反作弊系统强的服务器建议执行后立即删除脚本UI',
        IsNormal = true,
        Visible = true,
        LockSize = true,
    })

AGA:AddLabel("--------撕咬之夜--------")

AGA:AddButton({
    Text = "Msploit汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Msploit"))()
    end
})
AGA:AddButton({
    Text = "撕咬之夜殺脚本",
    Func = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/FengYu-X/Max/refs/heads/X/BBN.lua"))()
    end
})
AGA:AddButton({
    Text = "撕咬之夜RINGTA脚本",
    Func = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/RINGTA/bitesbynight"))()
    end
})
AGA:AddButton({
    Text = "撕咬之夜Cerberus汉化脚本",
    Func = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Cerberus"))()
    end
})


AGA:AddLabel("----------被遗弃--------")
AGA:AddButton({
    Text = "Msploit汉化脚本",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Msploit"))()
    end
})

AGA:AddButton({
    Text = "fartsaken汉化脚本",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/fartsaken"))()
    end
})

AGA:AddButton({
    Text = "RINGTA被遗弃汉化脚本",
    Func = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/RINGTA/forsaken"))()
    end
})


AGA:AddLabel("-------99夜生存--------")
AGA:AddButton({
    Text = "Foxname99汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Foxname99"))()
    end
})
AGA:AddButton({
    Text = "RINGTA汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/hdjsjjdgrhj/script-hub/refs/heads/main/99Nights"))()
    end
})
AGA:AddButton({
    Text = "NOT汉化脚本",
    Func = function()
   loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/asdfgh160/Chinese-localization/refs/heads/main/99nights"))()
    end
})
AGA:AddButton({
    Text = "void汉化脚本",
    Func = function()
   loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/asdfgh160/Chinese-localization/refs/heads/main/VapeVoidware"))()
    end
})
AGA:AddButton({
    Text = "霖溺99夜脚本",
    Func = function()
   loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/ShenJiaoBen/Partial-Server-Ribbon/refs/heads/main/LinniTeam_99NightsInTheForest.lua"))()
    end
})


AGA:AddLabel("-------最强的战场-------")

AGA:AddButton({
    Text = "角色扮演搜sans汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/asdfgh160/Chinese-localization/refs/heads/main/Merebennie"))()
    end
})
AGA:AddButton({
    Text = "Phantasm汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/asdfgh160/Chinese-localization/refs/heads/main/Phantasm"))()
    end
})
AGA:AddButton({
    Text = "AlanbeikersFF汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/AlanbeikersFF"))()
    end
})
AGA:AddButton({
    Text = "Combat汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Combat"))()
    end
})








AGA:AddLabel("-------死亡之死-------")

AGA:AddButton({
    Text = "Msploit汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Msploit"))()
    end
})













AGA:AddLabel("-------MM2--------")
AGA:AddButton({
    Text = "king汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/MM2King"))()
    end
})
AGA:AddButton({
    Text = "Foxname汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Foxnamemm2.lua"))()
    end
})

AGA:AddLabel("-------墨水游戏--------")

AGA:AddButton({
    Text = "AX汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/fningna51-stack/-/refs/heads/main/%E6%96%B0AX%E6%B1%89%E5%8C%96%E5%BA%93"))()
    end
})
AGA:AddButton({
    Text = "博伦汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Youfutongxiang1/unm-CN/refs/heads/main/README.md"))()
    end
})
AGA:AddButton({
    Text = "复制博伦脚本密钥",
    Func = function()
   setclipboard("ink50")
    Tooltip = "复制博伦脚本密钥",
    Library:Notify({
    Title = "YirdeX-提示",
    Description = "复制成功",
    Time = 2,
})
    end
})
AGA:AddButton({
    Text = "天使之翼汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/%E5%A4%A9%E4%BD%BF%E4%B9%8B%E7%BF%BC%E5%A2%A8%E6%B0%B4%E6%B8%B8%E6%88%8F%E6%B1%89%E5%8C%96"))()
    end
})
AGA:AddButton({
    Text = "复制天使之翼脚本密钥",
    Func = function()
   setclipboard("8J2X1A2-Skan")
    Tooltip = "复制天使之翼脚本密钥",
    Library:Notify({
    Title = "YirdeX-提示",
    Description = "复制成功",
    Time = 2,
})
    end
})


AGA:AddLabel("------竞争对手--------")
AGA:AddButton({
    Text = "竞争对手汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/fningna51-stack/-/main/竞争对手汉化脚本"))()
    end
})
-------------分开-------------
A22:AddLabel("-------ohio-------")

A22:AddLabel("-------偷走脑红-------")

A22:AddLabel("-------锻造-------")

A22:AddLabel("-------亡命速递-------")

A22:AddLabel("-------死铁轨-------")

A22:AddLabel("-------刀刃球-------")
A22:AddButton({
    Text = "NodeX刀刃剑",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/NodeX%E5%88%80%E5%88%83%E5%89%91.lua"))()
    end
})
A22:AddButton({
    Text = "Achaotic混沌刀刃剑",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/China/refs/heads/main/Achaotic%E5%88%80%E5%88%83%E7%90%83"))()
    end
})
























-------------分开-------------
local ABB = Tabs.K:AddLeftGroupbox("FE")
ABB:AddButton({
    Text = "MozCraft放方块汉化脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/asdfgh160/Chinese-localization/refs/heads/main/MozCraft"))()
    end
})
ABB:AddButton({
    Text = "摇尾巴动作脚本",
    Func = function()
   loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-physics-based-tail-animator-86591"))()
    end
})
ABB:AddLabel("这边推荐带有尾巴的饰品虚拟形象的人使用")

ABB:AddButton({
    Text = "免费动作脚本",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/sypcerr/scripts/refs/heads/main/c15.lua",true))()
    end
})
ABB:AddButton({Text="柳叶碰飞(墨水可以使用)",Func=function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

local Enabled = false
local targetPlayer = nil
local originalCFrame = nil

local function findPlayer(text)
    text = text:lower()
    for _, plr in pairs(Players:GetPlayers()) do
        if string.find(plr.Name:lower(), text) or string.find(plr.DisplayName:lower(), text) then
            return plr
        end
    end
end

lp.Chatted:Connect(function(msg)
    if not Enabled then return end
    if msg:sub(1,6):lower() == ";kill " then
        local name = msg:sub(7)
        local plr = findPlayer(name)
        if plr and plr.Character and plr.Character:FindFirstChild("Humanoid") then
            targetPlayer = plr
            if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                originalCFrame = lp.Character.HumanoidRootPart.CFrame
            end
            if statusLabel then
                statusLabel.Text = "已锁定 " .. plr.Name
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if not Enabled then continue end
        if not targetPlayer then continue end

        local char = targetPlayer.Character
        if not char or not char:FindFirstChild("Humanoid") then
            targetPlayer = nil
            if statusLabel then statusLabel.Text = "开启 (未锁定)" end
            continue
        end

        local hum = char.Humanoid
        if hum.Health <= 0 then
            targetPlayer = nil
            if statusLabel then statusLabel.Text = "开启 (未锁定)" end
            continue
        end

        local myChar = lp.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local targetHRP = char:FindFirstChild("HumanoidRootPart")

        if myHRP and targetHRP then
            local offset = targetHRP.Velocity.Magnitude < 0.1 and 0 or 7
            local goal = targetHRP.CFrame * CFrame.new(0,0,-offset) * CFrame.Angles(0, math.rad(-3), 0)
            myHRP.CFrame = myHRP.CFrame:Lerp(goal, 0.4)
            myHRP.Velocity = Vector3.new(0,0,0)
            myHRP.RotVelocity = Vector3.new(0,0,0)
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if not Enabled then continue end
        local hum = lp.Character and lp.Character:FindFirstChild("Humanoid")
        if hum then
            hum:Move(Vector3.one * 1e31)
        end
    end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlyOffGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = lp:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 130)
mainFrame.Position = UDim2.new(0.5, -110, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
mainFrame.BackgroundTransparency = 0.25
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = mainFrame

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(255, 255, 255)
stroke.Thickness = 1
stroke.Transparency = 0.8
stroke.Parent = mainFrame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 28)
title.BackgroundTransparency = 1
title.Text = "碰飞(碰到人就让对面甩飞)"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.Parent = mainFrame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 160, 0, 32)
toggleBtn.Position = UDim2.new(0.5, -80, 0, 38)
toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
toggleBtn.Text = "开启碰飞"
toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleBtn.Font = Enum.Font.GothamSemibold
toggleBtn.TextSize = 12
toggleBtn.Parent = mainFrame
local btnCorner = Instance.new("UICorner")
btnCorner.CornerRadius = UDim.new(0, 8)
btnCorner.Parent = toggleBtn

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 78)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "状态: 关闭"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 11
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 80, 0, 24)
closeBtn.Position = UDim2.new(0.5, -40, 0, 102)
closeBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
closeBtn.Text = "关闭甩飞脚本(关了需要重新加载)"
closeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
closeBtn.Font = Enum.Font.GothamSemibold
closeBtn.TextSize = 10
closeBtn.Parent = mainFrame
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

toggleBtn.MouseButton1Click:Connect(function()
    Enabled = not Enabled
    if Enabled then
        toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        toggleBtn.Text = "关闭碰飞"
        statusLabel.Text = "开启"
        targetPlayer = nil
    else
        toggleBtn.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
        toggleBtn.Text = "开启碰飞"
        statusLabel.Text = "状态: 关闭"
        targetPlayer = nil
        originalCFrame = nil
    end
end)

closeBtn.MouseButton1Click:Connect(function()
    Enabled = false
    targetPlayer = nil
    originalCFrame = nil
    screenGui:Destroy()
end)

Enabled = false
targetPlayer = nil

print("😝😝😝")
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});
ABB:AddButton({Text="有福同享超飞",Func=function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

local FLING_OFFSET = 0
local LERP_ALPHA = 1
local VELOCITY_BOOST = 200

local flingEnabled = false
local manualEnabled = false
local autoCycleActive = false
local previousFlingEnabled = false
local targetPlayer = nil
local originalCFrame = nil

local function findPlayer(text)
    text = text:lower()
    for _, plr in pairs(Players:GetPlayers()) do
        if string.find(plr.Name:lower(), text) or string.find(plr.DisplayName:lower(), text) then
            return plr
        end
    end
end

lp.Chatted:Connect(function(msg)
    if not manualEnabled then return end
    if msg:sub(1,6):lower() == ";kill " then
        local name = msg:sub(7)
        local plr = findPlayer(name)
        if plr and plr.Character and plr.Character:FindFirstChild("Humanoid") then
            targetPlayer = plr
            if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                originalCFrame = lp.Character.HumanoidRootPart.CFrame
            end
            if statusLabel then
                statusLabel.Text = "已锁定 " .. plr.Name
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.01) do
        if not flingEnabled then continue end
        if not targetPlayer then continue end

        local char = targetPlayer.Character
        if not char or not char:FindFirstChild("Humanoid") then
            targetPlayer = nil
            if statusLabel then statusLabel.Text = "开启 (未锁定)" end
            continue
        end

        local hum = char.Humanoid
        if hum.Health <= 0 then
            targetPlayer = nil
            if statusLabel then statusLabel.Text = "开启" end
            continue
        end

        local myChar = lp.Character
        local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local targetHRP = char:FindFirstChild("HumanoidRootPart")

        if myHRP and targetHRP then
            local offset = FLING_OFFSET
            local goal = targetHRP.CFrame * CFrame.new(0,0,-offset) * CFrame.Angles(0, math.rad(-3), 0)

            if LERP_ALPHA >= 1 then
                myHRP.CFrame = goal
            else
                myHRP.CFrame = myHRP.CFrame:Lerp(goal, LERP_ALPHA)
            end

            local dist = (targetHRP.Position - myHRP.Position).Magnitude
            if dist < 5 then
                local dir = (targetHRP.Position - myHRP.Position).Unit
                myHRP.Velocity = dir * VELOCITY_BOOST
            else
                myHRP.Velocity = Vector3.zero
            end
            myHRP.RotVelocity = Vector3.zero
        end
    end
end)

task.spawn(function()
    while task.wait() do
        if not flingEnabled then continue end
        local hum = lp.Character and lp.Character:FindFirstChild("Humanoid")
        if hum then
            hum:Move(Vector3.one * 1e31)
        end
    end
end)

local function startAutoCycle()
    previousFlingEnabled = flingEnabled
    flingEnabled = true
    autoCycleActive = true

    task.spawn(function()
        while autoCycleActive do
            local players = Players:GetPlayers()
            for _, plr in ipairs(players) do
                if plr == lp then continue end
                if not autoCycleActive then break end

                targetPlayer = plr
                if statusLabel then
                    statusLabel.Text = "自动: " .. plr.Name
                end

                local cam = workspace.CurrentCamera
                local hum = plr.Character and plr.Character:FindFirstChild("Humanoid")
                if hum then
                    cam.CameraSubject = hum
                    cam.CameraType = Enum.CameraType.Custom
                end

                local waited = 0
                while waited < 2 and autoCycleActive do
                    task.wait(0.1)
                    waited = waited + 0.1
                    if not plr.Character or not plr.Character:FindFirstChild("Humanoid") or plr.Character.Humanoid.Health <= 0 then
                        break
                    end
                end
            end
        end
        local cam = workspace.CurrentCamera
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            cam.CameraSubject = lp.Character.Humanoid
            cam.CameraType = Enum.CameraType.Custom
        end
        targetPlayer = nil
        if statusLabel then statusLabel.Text = "开启" end
    end)
end

local function stopAutoCycle()
    autoCycleActive = false
    flingEnabled = previousFlingEnabled
    if not flingEnabled then
        targetPlayer = nil
        if statusLabel then statusLabel.Text = "状态: 关闭" end
    end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlyOffGUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = lp:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 220, 0, 180)
mainFrame.Position = UDim2.new(0.5, -110, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
mainFrame.BackgroundTransparency = 0
mainFrame.BorderSizePixel = 1
mainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -30, 0, 28)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "超飞"
title.TextColor3 = Color3.fromRGB(0, 0, 0)
title.TextSize = 14
title.Font = Enum.Font.GothamBold
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = mainFrame

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 30, 0, 28)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
closeBtn.TextSize = 18
closeBtn.Font = Enum.Font.GothamBold
closeBtn.BorderSizePixel = 1
closeBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
closeBtn.Parent = mainFrame

local toggleBtn = Instance.new("TextButton")
toggleBtn.Size = UDim2.new(0, 160, 0, 32)
toggleBtn.Position = UDim2.new(0.5, -80, 0, 38)
toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
toggleBtn.Text = "开启触碰甩飞"
toggleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
toggleBtn.Font = Enum.Font.GothamSemibold
toggleBtn.TextSize = 12
toggleBtn.BorderSizePixel = 1
toggleBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
toggleBtn.Parent = mainFrame

local statusLabel = Instance.new("TextLabel")
statusLabel.Size = UDim2.new(1, 0, 0, 20)
statusLabel.Position = UDim2.new(0, 0, 0, 78)
statusLabel.BackgroundTransparency = 1
statusLabel.Text = "状态: 关闭"
statusLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
statusLabel.TextSize = 11
statusLabel.Font = Enum.Font.Gotham
statusLabel.Parent = mainFrame

local autoCycleBtn = Instance.new("TextButton")
autoCycleBtn.Size = UDim2.new(0, 160, 0, 32)
autoCycleBtn.Position = UDim2.new(0.5, -80, 0, 105)
autoCycleBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
autoCycleBtn.Text = "自动超飞别人"
autoCycleBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
autoCycleBtn.Font = Enum.Font.GothamSemibold
autoCycleBtn.TextSize = 12
autoCycleBtn.BorderSizePixel = 1
autoCycleBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
autoCycleBtn.Parent = mainFrame

local surpriseBtn = Instance.new("TextButton")
surpriseBtn.Size = UDim2.new(0, 80, 0, 24)
surpriseBtn.Position = UDim2.new(0.5, -40, 0, 145)
surpriseBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
surpriseBtn.Text = "点我有惊喜"
surpriseBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
surpriseBtn.Font = Enum.Font.GothamSemibold
surpriseBtn.TextSize = 10
surpriseBtn.BorderSizePixel = 1
surpriseBtn.BorderColor3 = Color3.fromRGB(0, 0, 0)
surpriseBtn.Parent = mainFrame

toggleBtn.MouseButton1Click:Connect(function()
    if autoCycleActive then
        stopAutoCycle()
        autoCycleBtn.Text = "循环超飞"
        autoCycleBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        flingEnabled = false
        manualEnabled = false
        toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        toggleBtn.Text = "开启触碰甩飞"
        statusLabel.Text = "状态: 关闭"
        targetPlayer = nil
        local cam = workspace.CurrentCamera
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            cam.CameraSubject = lp.Character.Humanoid
            cam.CameraType = Enum.CameraType.Custom
        end
        return
    end

    manualEnabled = not manualEnabled
    flingEnabled = manualEnabled
    if manualEnabled then
        toggleBtn.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
        toggleBtn.Text = "关闭触碰甩飞"
        statusLabel.Text = "开启"
        targetPlayer = nil
    else
        toggleBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        toggleBtn.Text = "开启触碰甩飞"
        statusLabel.Text = "状态: 关闭"
        targetPlayer = nil
        originalCFrame = nil
    end
end)

autoCycleBtn.MouseButton1Click:Connect(function()
    if autoCycleActive then
        stopAutoCycle()
        autoCycleBtn.Text = "自动超飞"
        autoCycleBtn.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
        local cam = workspace.CurrentCamera
        if lp.Character and lp.Character:FindFirstChild("Humanoid") then
            cam.CameraSubject = lp.Character.Humanoid
            cam.CameraType = Enum.CameraType.Custom
        end
    else
        autoCycleBtn.Text = "停止超飞"
        autoCycleBtn.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
        startAutoCycle()
    end
end)

surpriseBtn.MouseButton1Click:Connect(function()
    lp:Kick("嘿嘿")
end)

closeBtn.MouseButton1Click:Connect(function()
    flingEnabled = false
    manualEnabled = false
    autoCycleActive = false
    targetPlayer = nil
    originalCFrame = nil
    local cam = workspace.CurrentCamera
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        cam.CameraSubject = lp.Character.Humanoid
        cam.CameraType = Enum.CameraType.Custom
    end
    screenGui:Destroy()
end)

flingEnabled = false
manualEnabled = false
autoCycleActive = false
targetPlayer = nil

print(" Hi pig god I am dream")
        local Func = loadstring(ScriptContent);
        if Func then
                Func();
        end
end});

Tabs.C:UpdateWarningBox({
    Title = "警告！",
    Text = "小心！您放入YX-Hub-插件/Addons目录的任何脚本都会被执行器执行，我们建议您仅使用来自可信来源或开源的插件。对于插件造成的任何损害，我们概不负责，特此警告！",
    IsNormal = false,
    Visible = true,
    LockSize = true,
})
local HubFolder = "YX-Hub-插件"
local addonFolder = HubFolder.."/Addons"

if not isfolder(HubFolder) then
    makefolder(HubFolder)
end

if not isfolder(addonFolder) then
    makefolder(addonFolder)
end

AddonsFolder = AddonsFolder or {}
AddonsFolder.Addons = {}

for _, file in ipairs(listfiles(addonFolder)) do
    if file:sub(-4) == ".lua" or file:sub(-4) == ".txt" then
        local success, addon = pcall(function()
            return loadstring(readfile(file))()
        end)
        if success and type(addon) == "table" then
            table.insert(AddonsFolder.Addons, addon)
            
            if addon.Text then
                if addon.Callback then
                    Addons:AddToggle(addon.Text, {
                        Text = addon.Text,
                        Default = addon.Default or false,
                        Tooltip = addon.Tooltip or "",
                        Callback = addon.Callback
                    })
                elseif addon.Func then
                    Addons:AddButton({
                        Text = addon.Text,
                        Tooltip = addon.Tooltip or "",
                        Func = addon.Func
                    })
                elseif addon.Default and addon.Min and addon.Max and addon.Rounding then
                    Addons:AddSlider(addon.Text, {
                        Text = addon.Text,
                        Default = addon.Default,
                        Min = addon.Min,
                        Max = addon.Max,
                        Rounding = addon.Rounding,
                        Tooltip = addon.Tooltip or "",
                        Callback = addon.Callback
                    })
                elseif addon.Values then
                    Addons:AddDropdown(addon.Text, {
                        Values = addon.Values,
                        Default = addon.Default or 1,
                        Multi = addon.Multi or false,
                        Text = addon.Text,
                        Tooltip = addon.Tooltip or "",
                        Searchable = addon.Searchable or false,
                        Callback = addon.Callback
                    })
                elseif addon.Numeric ~= nil then
                    Addons:AddInput(addon.Text, {
                        Default = addon.Default or "",
                        Numeric = addon.Numeric,
                        Finished = addon.Finished or false,
                        ClearTextOnFocus = addon.ClearTextOnFocus or false,
                        Text = addon.Text,
                        Tooltip = addon.Tooltip or "",
                        Placeholder = addon.Placeholder or "",
                        Callback = addon.Callback
                    })
                else
                    Addons:AddLabel(addon.Text)
                end
            end
        end
    end
end
local MenuGroup = Tabs["UI Settings"]:AddLeftGroupbox("界面设置")

MenuGroup:AddCheckbox("ShowCustomCursor", {
    Text = "自定义光标",
    Default = true,
    Callback = function(Value)
        Library.ShowCustomCursor = Value
    end,
})
MenuGroup:AddDropdown("NotificationSide", {
    Values = { "左侧", "右侧" },
    Default = "右侧",
    Text = "通知位置",
    Callback = function(Value)
        Library:SetNotifySide(Value)
    end,
})
MenuGroup:AddDropdown("DPIDropdown", {
    Values = { "25%", "50%", "75%", "100%", "125%", "150%", "175%", "200%" },
    Default = "100%",
    Text = "界面大小",
    Callback = function(Value)
        Value = Value:gsub("%%", "")
        local DPI = tonumber(Value)
        Library:SetDPIScale(DPI)
    end,
})
MenuGroup:AddDivider()  
MenuGroup:AddLabel("菜单")  
    :AddKeyPicker("MenuKeybind", { 
        Default = "RightShift",  
        NoUI = true,            
        Text = "快捷键"    
    })

MenuGroup:AddButton("卸载界面", function()
    Library:Unload()  
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)   
SaveManager:IgnoreThemeSettings() 
SaveManager:SetIgnoreIndexes({ "MenuKeybind" })  
ThemeManager:SetFolder("MyScriptHub")            
SaveManager:SetFolder("MyScriptHub/specific-game")  
SaveManager:SetSubFolder("specific-place")       
SaveManager:BuildConfigSection(Tabs["UI Settings"])  
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()
