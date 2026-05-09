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
	  Size = UDim2.fromOffset(750, 650),          -- 修改尺寸为 800x650
    AutoShow = true,                           -- 不自动显示
    NotifySide = "Right",                       -- 通知在右侧
    ShowCustomCursor = true,                    -- 显示自定义光）
    IconSize = UDim2.fromOffset(40, 40),        -- 图标大小40x40
    Resizable = true,                           -- 可调整大小
    MobileButtonsSide = "Left",                 -- 移动端按钮在左侧
    DisableSearch = false,                      -- 不禁用搜索
    SearchbarSize = UDim2.new(0.8, 0, 1, 0),    -- 搜索框宽度80%
    GlobalSearch = false,                       -- 不全局搜索
    
    -- 添加更多配置选项
    Position = UDim2.fromOffset(100, 100),      -- 窗口位置
    Center = true,                              -- 居中显示
    
    -- 侧边栏相关配置
    EnableSidebarResize = true,                 -- 允许调整侧边栏宽度
    EnableCompacting = true,                    -- 启用紧凑模式
    SidebarCompacted = false,                   -- 初始不紧凑
    MinContainerWidth = 256,                    -- 最小容器宽度
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
    Text = "碰飞脚本（墨水可用）",
    Func = function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/YIRDEX/Miscs/refs/heads/main/%E7%A2%B0%E9%A3%9E"))()
    end
})










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
