Pos = 1
local P = game:GetService("Players")
local LP = P.LocalPlayer
local PG = LP.PlayerGui
local RS = game:GetService("ReplicatedStorage")
local Remotes = RS:WaitForChild("Remotes")
local Remote = Remotes:WaitForChild("CommF_")
local RunS = game:GetService("RunService")
local Loop = RunS.RenderStepped
local Data = LP.Data
local WS = game:GetService("Workspace")
local WO = WS["_WorldOrigin"]
local VU = game:GetService("VirtualUser")
local EnemySpawns = WO.EnemySpawns
local Enemies = WS.Enemies
local CameraShaker = require(RS.Util.CameraShaker)
local GuideModule = require(RS.GuideModule)
local Quests = require(RS.Quests)
local VIM = game:service("VirtualInputManager")
repeat wait() until game:IsLoaded()
if PG.Main:FindFirstChild("ChooseTeam") and PG:WaitForChild("Main").ChooseTeam.Visible == true and LP.Team == nil then
    for i, v in pairs(getconnections(PG.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.Activated)) do
        v.Function()
    end
end 
local y = game.PlaceId
if y == 2753915549 then
    Sea1 = true
elseif y == 4442272183 then
    Sea2 = true
    elseif y == 7449423635 then
    Sea3 = true
end
CameraShaker:Stop()
RS.Assets.GUI.DamageCounter.Enabled = false
--PG.Notifications.Enabled = false
local codes = {
    "Enyo_is_Pro",
    "Magicbus",
    "MAGICBIS",
    "JCWK",
    "Starcodeheo",
    "Bluxxy",
    "fudd10_v2",
    "3BVISITS",
    "UPD16",
    "FUDD10",
    "BIGNEWS",
    "Sub2OfficialNoobie",
    "SUB2GAMERROBOT_EXP1",
    "StrawHatMaine",
    "SUB2NOOBMASTER123",
    "Sub2Daigrock",
    "Axiore",
    "TantaiGaming",
    "STRAWHATMAINE",
    "kittgaming",
    "Enyu_is_Pro",
    "THEGREATACE",
    "StrawHatMaine",
    "Sub2Fer999",
    "GAMERROBOT_YT",
    "TY_FOR_WATCHING",
    "STAFFBATTLE",
    "ADMIN_STRENGTH",
    "DRAGONABUSE"
}
for _, v in pairs(codes) do
    Remotes:WaitForChild("Redeem"):InvokeServer(v)
end
function Hop()
        local PlaceID = game.PlaceId
        local AllIDs = {}
        local foundAnything = ""
        local actualHour = os.date("!*t").hour
        local Deleted = false
        function TPReturner()
            local Site;
            if foundAnything == "" then
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
            else
                Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
            end
            local ID = ""
            if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
                foundAnything = Site.nextPageCursor
            end
            local num = 0;
            for i,v in pairs(Site.data) do
                local Possible = true
                ID = tostring(v.id)
                if tonumber(v.maxPlayers) > tonumber(v.playing) then
                    for _,Existing in pairs(AllIDs) do
                        if num ~= 0 then
                            if ID == tostring(Existing) then
                                Possible = false
                            end
                        else
                            if tonumber(actualHour) ~= tonumber(Existing) then
                                local delFile = pcall(function()
                                    AllIDs = {}
                                    table.insert(AllIDs, actualHour)
                                end)
                            end
                        end
                        num = num + 1
                    end
                    if Possible == true then
                        table.insert(AllIDs, ID)
                        wait()
                        pcall(function()
                            wait()
                            game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                        end)
                        wait(4)
                    end
                end
            end
        end
        function Teleport() 
            while wait() do
                pcall(function()
                    TPReturner()
                    if foundAnything ~= "" then
                        TPReturner()
                    end
                end)
            end
        end
        Teleport()
    end
function GetDistance(q)
    if typeof(q) == "CFrame" then
        return game.Players.LocalPlayer:DistanceFromCharacter(q.Position)
    elseif typeof(q) == "Vector3" then
        return game.Players.LocalPlayer:DistanceFromCharacter(q)
    end
end
function CheckNearestTeleporter(P)
    local min = math.huge
    local min2 = math.huge
    local choose 
    if Sea3 then
        TableLocations = {
            ["1"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["2"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["3"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["4"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["5"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["6"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    elseif Sea2 then
        TableLocations = {
            ["1"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["2"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["3"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["4"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif Sea1 then
        TableLocations = {
            ["1"] = Vector3.new(-7894.6201171875, 5545.49169921875, -380.2467346191406),
            ["2"] = Vector3.new(-4607.82275390625, 872.5422973632812, -1667.556884765625),
            ["3"] = Vector3.new(61163.8515625, 11.759522438049316, 1819.7841796875),
            ["4"] = Vector3.new(3876.280517578125, 35.10614013671875, -1939.3201904296875)
        }
    end
    TableLocations2 = {}
    for r, v in pairs(TableLocations) do
        TableLocations2[r] = (v - P.Position).Magnitude
    end
    for r, v in pairs(TableLocations2) do
        if v < min then
            min = v
            min2 = v
        end
    end    
    for r, v in pairs(TableLocations2) do
        if v <= min then
            choose = TableLocations[r]
        end
    end
    if min2 <= GetDistance(P) then
        return choose
    end
end
function TpEntrance(P)
    Remote:InvokeServer("requestEntrance", P)
    LP.Character.PrimaryPart.CFrame = CFrame.new(LP.Character.PrimaryPart.CFrame.X, LP.Character.PrimaryPart.CFrame.Y + 50, LP.Character.PrimaryPart.CFrame.Z)
    wait(0.5)
end

function TP(P)
   if LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 then
       if not Speed or typeof(Speed) ~= "number" then
           Speed = 325
       end
        Dis = GetDistance(P)       
        if Dis <= 300 then
            LP.Character.PrimaryPart.CFrame = P
        end
        tween = game:GetService("TweenService"):Create(LP.Character.PrimaryPart,TweenInfo.new(Dis/Speed, Enum.EasingStyle.Linear),{CFrame = P})
        local ac = CheckNearestTeleporter(P)
        if ac then
            pcall(function()
                tween:Cancel()
            end)
            TpEntrance(ac)
        end
        tween:Play()
     end
end
function RemoveLvTitle(mob)
    mob = mob:gsub(" %pLv. %d+%p", "")
    return mob
end
function CheckQuest()
    local Lvl = Data.Level.Value
    local IgnoreQuests = {"BartiloQuest", "Trainees", "MarineQuest", "CitizenQuest"}
    local Quest = {}
    local LevelReq = 0
    for i,v in pairs(Quests) do
		for a,b in pairs(v) do
		    for j, k in pairs(b["Task"]) do
		    	if b["LevelReq"] <= Lvl and b["LevelReq"] >= LevelReq and not table.find(IgnoreQuests, i) and k > 1 then		            
			    	Quest["QuestName"] = i
			        Quest["ID"] = a
			        Quest["MobName"] = j
                    LevelReq = b["LevelReq"]
		        end
			end	
		end
	end
	if LevelReq >= 700 and Sea1 then
        Quest["MobName"] = "Galley Captain"
        Quest["QuestName"] = "FountainQuest"
        Quest["ID"] = 2
    elseif LevelReq >= 1450 and Sea2 then
        Quest["MobName"] = "Water Fighter"
        Quest["QuestName"] = "ForgottenQuest"
        Quest["ID"] = 2
    end
	return Quest
end
function QuestDungKo(mob)
    if GuideModule["Data"]["QuestData"]["Name"] == mob then
        return true
    end
    return false
end
for i, v in pairs(CheckQuest()) do
    if typeof(v) ~= "table" then
        print(i, v)
    else
        print(i, #v)
    end
end
function GetMob()
    
end
function GetPosMob(Mob)
    local CFrameTab = {}
	if EnemySpawns:FindFirstChild(Mob) then
    	for i, v in pairs(EnemySpawns:GetChildren()) do
    	    if v:IsA("Part") and v.Name == Mob then
	            table.insert(CFrameTab, v.CFrame)
	        end
	    end
	end
	return CFrameTab
end
function NPCPos()
    for i,v in pairs(GuideModule["Data"]["NPCList"]) do
		if v["NPCName"] == GuideModule["Data"]["LastClosestNPC"] then
			return i["CFrame"]
		end
	end
end
function GetQuest()
    local Distance = GetDistance(NPCPos())
    local questname, id = CheckQuest()["QuestName"], CheckQuest()["ID"]
    if Distance <= 20 then
        Remote:InvokeServer("StartQuest", questname, id)
    else
            TP(NPCPos())
    end
    Remote:InvokeServer("SetSpawnPoint")
end
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Hirimi Hub ",
    SubTitle = "by Hutao",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true,
    Theme = "Darker",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://14299284116" })
local Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
local Misc = Window:AddTab({ Title = "Misc Farm", Icon = "rbxassetid://14299284116" })
local Options = Fluent.Options

Main:AddParagraph({Title = "Time", Content = os.date("%A"..", ".."%B".." ".."%d"..", ".."%Y") })
local AutoFarmLevel = Main:AddToggle("Auto Farm Level", {
    Title = "Auto Farm Level",  
    Callback = function(v)
        getgenv()["Kaitun"] = v
        getgenv()["NoClip"] = v
    end 
})
    
    AutoFarmLevel:SetValue(false)
    
local SelectTool = Main:AddDropdown("SelectTool",{
    Title = "Select Tool",
    Values = {"Melee", "Sword"},
    Multi = false,
    Callback = function(v)
        getgenv()["Tool"] = v
    end
})
    
SelectTool:SetValue("Melee")

local AutoClick = Main:AddToggle("Auto Click", {
    Title = "Auto Click",  
    Callback = function(v)
        getgenv()["AutoClick"] = v
    end 
})
    
    AutoClick:SetValue(false)
local AutoSea2 = Misc:AddToggle("Auto Sea 2", {
    Title = "Auto Sea 2",
    Callback = function(v)
        getgenv()["AutoSea2"] = v
    end
})
AutoSea2:SetValue(false)
local AutoSea3 = Misc:AddToggle("Auto Sea 3", {
    Title = "Auto Sea 3",
    Callback = function(v)
        getgenv()["AutoSea3"] = v
    end
})
AutoSea3:SetValue(false)
SaveManager:SetLibrary(Fluent)InterfaceManager:SetLibrary(Fluent)SaveManager:IgnoreThemeSettings()InterfaceManager:SetFolder("HirimiHub")InterfaceManager:BuildInterfaceSection(Settings)Window:SelectTab(1)SaveManager:LoadAutoloadConfig()
function Click()
    VU:CaptureController()
    VU:ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
end
function SendKey(key, hold)
    if not hold then
        VIM:SendKeyEvent(true, key, false, game)
        wait()
    	VIM:SendKeyEvent(false, key, false, game)
    else
        VIM:SendKeyEvent(true, key, false, game)
        wait(hold)
    	VIM:SendKeyEvent(false, key, false, game)
    end
end
function EquipTool(ToolSe)
    if LP.Backpack:FindFirstChild(ToolSe) then
        wait(.5)
        Tool = LP.Backpack:FindFirstChild(ToolSe)
         wait(.5)
         LP.Character.Humanoid:EquipTool(Tool)
    end
end
function Buso()
    if LP.Character and not LP.Character:FindFirstChild("HasBuso") then
        Remote:InvokeServer("Buso")
    end
end
function FastFarm()
    local cframefarm = CFrame.new(-7894.6176757813, 5547.1416015625, -380.29119873047)
    if LP:DistanceFromCharacter(cframefarm.Position) > 1500 then
        Remote:InvokeServer("requestEntrance",Vector3.new(-7894.6176757813, 5547.1416015625, -380.29119873047))
    end
    if Enemies:FindFirstChild("Shanda") then     
        for i,v in pairs(Enemies:GetChildren()) do
            if v.Name == "Shanda" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0  and v.Parent then
                    EquipTool(getgenv().SelectedWeapon)                                                                                                                    
                    Buso()
                    TP(v.HumanoidRootPart.CFrame * CFrame.new(5, 30, 5))               
                    PosMon = v.HumanoidRootPart.CFrame                                                                       
                    v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                    v.HumanoidRootPart.Transparency = 1
                     v.HumanoidRootPart.CanCollide = false
                     v.Head.CanCollide = false
                     v.Humanoid.JumpPower = 0
                     v.Humanoid.WalkSpeed = 0
                     if v.Humanoid:FindFirstChild("Animator") then
                         v.Humanoid.Animator:Destroy()
                     end
                     v.Humanoid:ChangeState(11)
                     v.Humanoid:ChangeState(14)
                      sethiddenproperty(LP, "SimulationRadius",  math.huge)
                      BringMob = true
                      wait(.2)
                      AutoAttack = true                                                            
                  else
                      BringMob = false
                      AutoAttack = false
                end
            end
        else
            if Pos == nil or Pos == "" or Pos > #MobPos("Shanda") then
                Pos = 1
            end
            TP(MobPos("Shanda")[Pos] * CFrame.new(5, 30, 5))
            Pos = Pos + 1
            wait(2)
        end 
end
CheckPlayer = 0
function HuntPlayer()
    local Players = game:GetService("Players"):GetPlayers()
    local Quest = PG.Main.Quest
    local mylevel = Data.Level.Value
    local QuestTitle = Quest.Container.QuestTitle.Title.Text
    if Quest.Visible == true then
        if string.find(QuestTitle, "Defeat") then
            getgenv().Ply = string.split(QuestTitle," ")[2]
            for i, v in pairs(Players) do
	            if v.Name == getgenv().Ply and v.Character.Humanoid.Health > 0 then
	                if v.Data.Level.Value < 20 or v.Data.Level.Value > mylevel * 5 then
	                    Remote:InvokeServer("PlayerHunter")
	                end
                    if PG.Main.PvpDisabled.Visible == true then
                        Remote:InvokeServer("EnablePvp")                   
		           end
		           EquipTool(getgenv().SelectedWeapon)
	               Buso()	            
		           TP(v.Character.PrimaryPart.CFrame * CFrame.new(5, 5, 5))
		            v.Character.PrimaryPart.Size = Vector3.new(200,200,200)
		            if v:DistanceFromCharacter(LP.Character.PrimaryPart.Position) <= 200 then		    
		                getgenv().AutoAttack = true
	    	            SendKey("Z")
	                    wait(1)
		                SendKey("X")
                    end
                end
            end
        else
            Remote:InvokeServer("PlayerHunter")
        end
    else                
        if Remote:InvokeServer("PlayerHunter") == "I don't have anything for you right now. Come back later." then
            CheckPlayer = CheckPlayer + 1
            end
    end
    if CheckPlayer >= 12 and Quest.Visible == false and not string.find(QuestTitle, "Defeat") then
        Hop()
    end
end
Loop:Connect(function()
if Data.Points.Value ~= 0 then
            local meleeLevel = Data.Stats.Melee.Level.Value
            local defenseLevel = Data.Stats.Defense.Level.Value
            local swordLevel = Data.Stats.Sword.Level.Value
            if meleeLevel < 2550 then 
                Remote:InvokeServer("AddPoint", "Melee", Data.Points.Value)
            elseif meleeLevel >= 2550 and defenseLevel < 2550 then 
                Remote:InvokeServer("AddPoint", "Defense", Data.Points.Value)
            elseif meleeLevel >= 2550 and defenseLevel >= 2550 and swordLevel < 2550 then
                Remote:InvokeServer("AddPoint", "Sword", Data.Points.Value)
            end
        end
if getgenv().NoClip and LP.Character and LP.Character:FindFirstChild("Humanoid") then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            LP.Character.Humanoid:ChangeState(11)
            if not LP.Character.PrimaryPart:FindFirstChild("BodyClip") then
		        local Body = Instance.new("BodyVelocity")
			        Body.Name = "BodyClip"
        			Body.Parent = LP.Character.PrimaryPart
        			Body.MaxForce = Vector3.new(100000,100000,100000)
	        		Body.Velocity = Vector3.new(0,0,0)
	            end
                for _, v in pairs(LP.Character:GetDescendants()) do
		            if v:IsA("BasePart") then
		                v.CanCollide = false    		        
	                end
	            end     
            elseif not getgenv().Kaitun and LP.Character.PrimaryPart:FindFirstChild("BodyClip") then
                LP.Character.PrimaryPart:FindFirstChild("BodyClip"):Destroy()    
        end    
    if BringMob then
                for i,v in pairs(Enemies:GetChildren()) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and GetDistance(v.HumanoidRootPart.Position) <= 350 then                            
                            v.HumanoidRootPart.CFrame = PosMon
                            v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)                                                  
                            v.HumanoidRootPart.Transparency = 1
                            v.HumanoidRootPart.CanCollide = false
                            v.Head.CanCollide = false
                            v.Humanoid.JumpPower = 0
                            v.Humanoid.WalkSpeed = 0
                            if v.Humanoid:FindFirstChild("Animator") then
                                v.Humanoid.Animator:Destroy()
                            end
                            v.Humanoid:ChangeState(11)
                            v.Humanoid:ChangeState(14)
                            sethiddenproperty(LP, "SimulationRadius",  math.huge)
                end
            end            
        end
        for i, v in pairs(LP.Backpack:GetChildren())do
            if v:IsA("Tool") and v.ToolTip == getgenv().Tool then
                getgenv().SelectedWeapon = v.Name
            end
        end
    end)
spawn(function()
    while wait() do
        if getgenv().Kaitun then
        local mylevel = Data.Level.Value
        if mylevel >= 15 and mylevel < 60 then
            FastFarm()
        elseif mylevel >= 60 and mylevel < 300 then
            HuntPlayer()     
        else           
            local Quest = PG.Main.Quest
            if Quest.Visible == true then
                if not QuestDungKo(CheckQuest()["MobName"]) then
                    Remote:InvokeServer("AbandonQuest")
                else       
                    if Enemies:FindFirstChild(CheckQuest()["MobName"]) then     
                        for i,v in pairs(Enemies:GetChildren()) do
                            if v.Name == CheckQuest()["MobName"] and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0  then
                                EquipTool(getgenv().SelectedWeapon)                                                                                                                    
                                Buso()
                                TP(v.HumanoidRootPart.CFrame * CFrame.new(5, 30, 5))
                                PosMon = v.HumanoidRootPart.CFrame                                                                                                                        
                                 v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                                 v.HumanoidRootPart.Transparency = 1
                                 v.HumanoidRootPart.CanCollide = false
                                 v.Head.CanCollide = false
                                 v.Humanoid.JumpPower = 0
                                 v.Humanoid.WalkSpeed = 0
                                 if v.Humanoid:FindFirstChild("Animator") then
                                     v.Humanoid.Animator:Destroy()
                                end
                                v.Humanoid:ChangeState(11)
                                v.Humanoid:ChangeState(14)
                                sethiddenproperty(LP, "SimulationRadius",  math.huge)       
                                BringMob = true
                                wait(.2)
                                AutoAttack = true                                            
                             else
                                 BringMob = false
                                 AutoAttack = false
                            end
                        end
                    else
                        pcall(function()
                             TP(CheckQuest()["Position"][CheckQuest().MobName .. tostrinh(Pos)] * CFrame.new(5, 30, 5))
                         end)
                         Pos = Pos + 1
                         wait(1.2)
                    end
                end   
            else
                GetQuest()
            end
        end
    end
    end
end)
spawn(function()
    while wait() do
        if getgenv().AutoSea2 and LP.Data.Level.Value >= 700 then
            local bag = LP.Backpack or LP.Character
            local b = Enemies or RS
    if Remote:InvokeServer("DressrosaQuestProgress").UsedKey == false then
        if not bag:FindFirstChild("Key") then
            Remote:InvokeServer("DressrosaQuestProgress","Detective")
        end
        if LP.Backpack:FindFirstChild("Key") then
            LP.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack["Key"])
                TP(CFrame.new(1349.697265625, 37.34928512573242, -1328.8309326171875))
            WS.Map.Ice.Door.Size = Vector3.new(30, 30, 30)
        end
    else 
        if Remote:InvokeServer("DressrosaQuestProgress").KilledIceBoss == false then
            if b:FindFirstChild("Ice Admiral") then
                for i, v in pairs(b:GetChildren()) do
                     if v.Name == "Ice Admiral" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 and v.Parent then
                         EquipTool(getgenv().SelectedWeapon)                                                                                                                    
                         Buso()
                         PosMon = v.HumanoidRootPart.CFrame                   
                         TP(v.HumanoidRootPart.CFrame * CFrame.new(5, 30, 5))     
                          v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                          v.HumanoidRootPart.Transparency = 1
                          v.HumanoidRootPart.CanCollide = false
                          v.Head.CanCollide = false
                          v.Humanoid.JumpPower = 0
                          v.Humanoid.WalkSpeed = 0
                           if v.Humanoid:FindFirstChild("Animator") then
                               v.Humanoid.Animator:Destroy()
                           end
                           v.Humanoid:ChangeState(11)
                           v.Humanoid:ChangeState(14)
                           sethiddenproperty(LP, "SimulationRadius",  math.huge)
                            BringMob = true
                            wait(.2)
                            AutoAttack = true                                                                    
                         else
                             BringMob = false
                             AutoAttack = false
                          end
                     end
                 end
        else
            Remote:InvokeServer("TravelDressrosa")
        end
    end
        end
    end
end)    
spawn(function()
    while task.wait() do
        if getgenv().AutoSea3 then
            pcall(function()
                if game.Players.LocalPlayer.Data.Level.Value >= 1500 then
                    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 3 then
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess ~= nil then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                            if game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "General") == 0 then
                                if game.Workspace.Enemies:FindFirstChild("rip_indra [Lv. 1500] [Boss]") then
                                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            if v.Name == "rip_indra [Lv. 1500] [Boss]" then
                                                repeat
                                                    task.wait()
                                                    EquipTool(getgenv().SelectedWeapon)                                                                                                                    
                         Buso()
                         PosMon = v.HumanoidRootPart.CFrame                   
                         TP(v.HumanoidRootPart.CFrame * CFrame.new(5, 30, 5))     
                          v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                          v.HumanoidRootPart.Transparency = 1
                          v.HumanoidRootPart.CanCollide = false
                          v.Head.CanCollide = false
                          v.Humanoid.JumpPower = 0
                          v.Humanoid.WalkSpeed = 0
                           if v.Humanoid:FindFirstChild("Animator") then
                               v.Humanoid.Animator:Destroy()
                           end
                           v.Humanoid:ChangeState(11)
                           v.Humanoid:ChangeState(14)
                           sethiddenproperty(LP, "SimulationRadius",  math.huge)
                            BringMob = true
                            wait(.2)
                            AutoAttack = true     
                                                until not getgenv().AutoSea3 or not v.Parent or v.Humanoid.Health <= 0
                                                BringMob = false
                             AutoAttack = false
                                                wait(.5)
                                                General = 2
                                                repeat
                                                    task.wait()
                                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                        "TravelZou")
                                                until General == 1
                                            end
                                        end
                                    end
                                else
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress",
                                        "General")
                                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ZQuestProgress",
                                        "Begin")
                                end
                            elseif game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("ZQuestProgress", "General") == 1 then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
                            else
                                if game.Workspace.Enemies:FindFirstChild("Don Swan") then
                                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            if v.Name == "Don Swan" then
                                                repeat
                                                    task.wait()
                                                    EquipTool(getgenv().SelectedWeapon)                                                                                                                    
                         Buso()
                         PosMon = v.HumanoidRootPart.CFrame                   
                         TP(v.HumanoidRootPart.CFrame * CFrame.new(5, 30, 5))     
                          v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                          v.HumanoidRootPart.Transparency = 1
                          v.HumanoidRootPart.CanCollide = false
                          v.Head.CanCollide = false
                          v.Humanoid.JumpPower = 0
                          v.Humanoid.WalkSpeed = 0
                           if v.Humanoid:FindFirstChild("Animator") then
                               v.Humanoid.Animator:Destroy()
                           end
                           v.Humanoid:ChangeState(11)
                           v.Humanoid:ChangeState(14)
                           sethiddenproperty(LP, "SimulationRadius",  math.huge)
                            BringMob = true
                            wait(.2)
                            AutoAttack = true     
                                                until not getgenv().AutoSea3 or not v.Parent or v.Humanoid.Health <= 0
                                                BringMob = false
                             AutoAttack = false
                                            end
                                        end
                                    end
                                else
                                TP(CFrame.new(2288.802, 15.1870775, 863.034607))
                            end
                            end
                        else
                            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                TabelDevilFruitStore = {}
                                TabelDevilFruitOpen = {}

                                for i, v in pairs(game:GetService("ReplicatedStorage").Remotes["CommF_"]:InvokeServer("getInventoryFruits")) do
                                    for i1, v1 in pairs(v) do
                                        if i1 == "Name" then
                                            table.insert(TabelDevilFruitStore, v1)
                                        end
                                    end
                                end
                                for i, v in next, game.ReplicatedStorage:WaitForChild("Remotes").CommF_:InvokeServer("GetFruits") do
                                    if v.Price >= 1000000 then
                                        table.insert(TabelDevilFruitOpen, v.Name)
                                    end
                                end
                                for i, DevilFruitOpenDoor in pairs(TabelDevilFruitOpen) do
                                    for i1, DevilFruitStore in pairs(TabelDevilFruitStore) do
                                        if DevilFruitOpenDoor == DevilFruitStore and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("GetUnlockables").FlamingoAccess == nil then
                                            if not game.Players.LocalPlayer.Backpack:FindFirstChild(DevilFruitStore) then
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                    "LoadFruit", DevilFruitStore)
                                            else
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                    "TalkTrevor", "1")
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                    "TalkTrevor", "2")
                                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(
                                                    "TalkTrevor", "3")
                                            end
                                        end
                                    end
                                end
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "1")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "2")
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor", "3")
                            end
                        end
                    else
                        if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 0 then
                            if string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirates") and string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "50") and game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                                if game.Workspace.Enemies:FindFirstChild("Swan Pirate") then
                                    for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                        if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                            if v.Name == "Swan Pirate" then
                                                pcall(function()
                                                    repeat
                                                    task.wait()
                                                    EquipTool(getgenv().SelectedWeapon)                                                                                                                    
                         Buso()
                         PosMon = v.HumanoidRootPart.CFrame                   
                         TP(v.HumanoidRootPart.CFrame * CFrame.new(5, 30, 5))     
                          v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                          v.HumanoidRootPart.Transparency = 1
                          v.HumanoidRootPart.CanCollide = false
                          v.Head.CanCollide = false
                          v.Humanoid.JumpPower = 0
                          v.Humanoid.WalkSpeed = 0
                           if v.Humanoid:FindFirstChild("Animator") then
                               v.Humanoid.Animator:Destroy()
                           end
                           v.Humanoid:ChangeState(11)
                           v.Humanoid:ChangeState(14)
                           sethiddenproperty(LP, "SimulationRadius",  math.huge)
                            BringMob = true
                            wait(.2)
                            AutoAttack = true     
                                                until not getgenv().AutoSea3 or not v.Parent or v.Humanoid.Health <= 0
                                                BringMob = false
                             AutoAttack = false
                                                end)
                                            end
                                        end
                                    end
                                else
                                        TP(CFrame.new(1057.92761, 137.614319, 1242.08069))
                                end
                            else                               
                                    TP(CFrame.new(-456.28952, 73.0200958, 299.895966))
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 1 then
                            if game.Workspace.Enemies:FindFirstChild("Jeremy") then
                                for i, v in pairs(game.Workspace.Enemies:GetChildren()) do
                                    if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
                                        if v.Name == "Jeremy" then
                                                repeat
                                                    task.wait()
                                                    EquipTool(getgenv().SelectedWeapon)                                                                                                                    
                         Buso()
                         PosMon = v.HumanoidRootPart.CFrame                   
                         TP(v.HumanoidRootPart.CFrame * CFrame.new(5, 30, 5))     
                          v.HumanoidRootPart.Size = Vector3.new(1, 1, 1)
                          v.HumanoidRootPart.Transparency = 1
                          v.HumanoidRootPart.CanCollide = false
                          v.Head.CanCollide = false
                          v.Humanoid.JumpPower = 0
                          v.Humanoid.WalkSpeed = 0
                           if v.Humanoid:FindFirstChild("Animator") then
                               v.Humanoid.Animator:Destroy()
                           end
                           v.Humanoid:ChangeState(11)
                           v.Humanoid:ChangeState(14)
                           sethiddenproperty(LP, "SimulationRadius",  math.huge)
                            BringMob = true
                            wait(.2)
                            AutoAttack = true     
                                                until not getgenv().AutoSea3 or not v.Parent or v.Humanoid.Health <= 0
                                                BringMob = false
                             AutoAttack = false
                                        end
                                    end
                                end
                            else
                                    TP(CFrame.new(2099.88159, 448.931, 648.997375))
                            end
                        elseif game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress", "Bartilo") == 2 then
                            CFrameThird = CFrame.new(-1836.1412353515625, 10.458294868469238, 1692.491943359375)
                            if (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFrameThird.Position).Magnitude > 1500 then
                                    TP(CFrameThird)
                            else
                                wait(.5)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1850.49329,
                                    13.1789551, 1750.89685)
                                wait(.1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.87305,
                                    19.3777466, 1712.01807)
                                wait(.1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1803.94324,
                                    16.5789185, 1750.89685)
                                wait(.1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1858.55835,
                                    16.8604317, 1724.79541)
                                wait(.1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1869.54224,
                                    15.987854, 1681.00659)
                                wait(.1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1800.0979,
                                    16.4978027, 1684.52368)
                                wait(.1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1819.26343,
                                    14.795166, 1717.90625)
                                wait(.1)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1813.51843,
                                    14.8604736, 1724.79541)
                                    end
                                    end
                    end
                end
            end)
        end
    end
end)
spawn(function()
    RunS.Stepped:Connect(function()
        if getgenv().Kaitun and AutoAttack then
            pcall(function()
                local a=game.Players.LocalPlayer;local b=getupvalues(require(a.PlayerScripts.CombatFramework))[2]function GetCurrentBlade()local c=b.activeController;local d=c.blades[1]if not d then return end;while d.Parent~=game.Players.LocalPlayer.Character do d=d.Parent end;return d end;local e=b.activeController;for f=1,1 do local g=require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(a.Character,{a.Character.HumanoidRootPart},60)local h={}local i={}for j,k in pairs(g)do if k.Parent:FindFirstChild("HumanoidRootPart")and not i[k.Parent]then table.insert(h,k.Parent.HumanoidRootPart)i[k.Parent]=true end end;g=h;if#g>0 then local l=debug.getupvalue(e.attack,5)local m=debug.getupvalue(e.attack,6)local n=debug.getupvalue(e.attack,4)local o=debug.getupvalue(e.attack,7)local p=(l*798405+n*727595)%m;local q=n*798405(function()p=(p*m+q)%1099511627776;l=math.floor(p/m)n=p-l*m end)()o=o+1;debug.setupvalue(e.attack,5,l)debug.setupvalue(e.attack,6,m)debug.setupvalue(e.attack,4,n)debug.setupvalue(e.attack,7,o)pcall(function()if a.Character:FindFirstChildOfClass("Tool")and e.blades and e.blades[1]then e.animator.anims.basic[1]:Play(0.01,0.01,0.01)game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(p/1099511627776*16777215),o)game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit",g,f,"")end end)end end;b.activeController.timeToNextAttack=-math.huge;b.activeController.attacking=false;b.activeController.timeToNextBlock=0;b.activeController.humanoid.AutoRotate=80;b.activeController.increment=4;b.activeController.blocking=false;b.activeController.hitboxMagnitude=200               
            end)
            if getgenv().AutoClick then
                Click()
            end
        end
    end)
end)
