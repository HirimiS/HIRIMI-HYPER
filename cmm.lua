local P = game.Players
local LP = P.LocalPlayer
local WS = game:GetService("Workspace")
local WO = WS["_WorldOrigin"]
if game.PlaceId == 2753915549 then
    Main = true
elseif game.PlaceId == 4442272183 then
    Dressora = true
elseif game.PlaceId == 7449423635 then
    Zou = true
end 
function GetDistance(q)
    if typeof(q) == "CFrame" then
        return LP:DistanceFromCharacter(q.Position)
    elseif typeof(q) == "Vector3" then
        return LP:DistanceFromCharacter(q)
    end
end
function CheckNearestTeleporter(P)
    local min = math.huge
    local min2 = math.huge
    local choose 
    if Zou then
        TableLocations = {
            ["1"] = Vector3.new(-5058.77490234375, 314.5155029296875, -3155.88330078125),
            ["2"] = Vector3.new(5756.83740234375, 610.4240112304688, -253.9253692626953),
            ["3"] = Vector3.new(-12463.8740234375, 374.9144592285156, -7523.77392578125),
            ["4"] = Vector3.new(28282.5703125, 14896.8505859375, 105.1042709350586),
            ["5"] = Vector3.new(-11993.580078125, 334.7812805175781, -8844.1826171875),
            ["6"] = Vector3.new(5314.58203125, 25.419387817382812, -125.94227600097656)
        }
    elseif Dressora then
        TableLocations = {
            ["1"] = Vector3.new(-288.46246337890625, 306.130615234375, 597.9988403320312),
            ["2"] = Vector3.new(2284.912109375, 15.152046203613281, 905.48291015625),
            ["3"] = Vector3.new(923.21252441406, 126.9760055542, 32852.83203125),
            ["4"] = Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422)
        }
    elseif Main then
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
function ToTween(Positions)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") and LP.Character.Humanoid.Health > 0 then
        if not Speed or typeof(Speed) ~= "number" then
            Speed = 325
        end
        Dis = GetDistance(Positions)       
        if Dis <= 300 then
            LP.Character.PrimaryPart.CFrame = Positions
        end
        tween = game:GetService("TweenService"):Create(LP.Character.PrimaryPart,TweenInfo.new(Dis/Speed, Enum.EasingStyle.Linear),{CFrame = Positions})
        local ac = CheckNearestTeleporter(Positions)
        if ac then
            pcall(function()
                tween:Cancel()
            end)
            TpEntrance(ac)
        end
        tween:Play()
    end
end
ToTween(WO.EnemySpawns:FindFirstChild("Cookie Crafter [Lv. 2200]").CFrame * CFrame.new(0,30,0))
