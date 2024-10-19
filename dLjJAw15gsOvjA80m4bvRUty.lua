-- LOADSTRING
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Kash-001/H1VdJk0Agw9qTwNq09llyAeQ/refs/heads/main/dLjJAw15gsOvjA80m4bvRUty.lua"))()


-- LOCAL
local player = game.Players.LocalPlayer
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kash-001/H1VdJk0Agw9qTwNq09llyAeQ/refs/heads/main/ui-lib.lua"))()
local baits = workspace.Parent:GetService("ReplicatedStorage").playerstats:FindFirstChild(player.Name).Stats.bait
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local noclipEnabled = false
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:FindFirstChildOfClass("Humanoid")
local hrp = character:FindFirstChild("HumanoidRootPart")

-- FUNCTIONS
local function checkForShakeUI()
	local shakeUI = player:WaitForChild("PlayerGui"):FindFirstChild("shakeui", true)
	if shakeUI then
		local button = shakeUI:FindFirstChildWhichIsA("ImageButton", true)
		if button then
			local buttonPosition = button.AbsolutePosition
			local buttonSize = button.AbsoluteSize
			local centerPosition = Vector2.new(buttonPosition.X + buttonSize.X / 2, buttonPosition.Y + buttonSize.Y / 2)
			VirtualInputManager:SendMouseButtonEvent(centerPosition.X, centerPosition.Y, 0, true, game, 0)
			wait(0.1)
			VirtualInputManager:SendMouseButtonEvent(centerPosition.X, centerPosition.Y, 0, false, game, 0)
		end
	end
end

local function GetIngredients()
	local path = workspace.Parent:GetService("Workspace").active
	local LastPos = game.Players.LocalPlayer.Character.PrimaryPart.Position
	for _, child in path:GetChildren() do
		if child:FindFirstChild("PickupPrompt") then
			child.PickupPrompt.HoldDuration = 0
			local ESP = Instance.new("Highlight")
			ESP.FillTransparency = 0
			ESP.Parent = child
			wait(0.2)
		end
	end
	game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(LastPos))
	game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end

-- MAIN
local UI = Material.Load({
	Title = "FishSploit",
	Style = 3,
	SizeX = 300,
	SizeY = 300,
	Theme = "Jester",
})

local functions_page = UI.New({
	Title = "Functions"
})

local ilsandstps_page = UI.New({
	Title = "Islands TPs"
})

local misctps_page = UI.New({
	Title = "Misc TPs"
})

local player_page = UI.New({
	Title = "Player"
})

functions_page.Button({
	Text = "SELL INVENTORY",
	Callback = function()
		workspace.Parent:GetService("ReplicatedStorage").events.selleverything:InvokeServer()
	end
})

functions_page.Button({
	Text = "GET ALL BAITS",
	Callback = function()
		for _, bait in baits:GetChildren() do
			bait.Value = 99
		end
	end
})

functions_page.Toggle({
	Text = "AUTO SHAKE",
	Callback = function(Value)
		if Value then
			while Value do
				checkForShakeUI()
				wait(0.1)
				if not Value then break end
			end
		end
	end,
	Enabled = false
})


-- IsOn = true
-- local B = functions_page.Toggle({
-- 	Text = "AUTO SHAKE",
-- 	Callback = function(Value)
-- 		if Value == true then
-- 			IsOn = true
-- 			while Value do
-- 				checkForShakeUI()
-- 				wait(0.1)
-- 			end
-- 		elseif Value == false then
-- 			IsOn = false
-- 		end
-- 	end,
-- 	Enabled = false
-- })

functions_page.Button({
	Text = "GET INGREDIENTS",
	Callback = function()
		GetIngredients()
	end
})



------------------------------------------------------------------------------
----------------------------------ISLANDS-------------------------------------
------------------------------------------------------------------------------

ilsandstps_page.Button({
	Text = "Moosewood",
	Callback = function()
		local teleportPosition = Vector3.new(491.800537109375, 152.99990844726562 , 343.6178283691406)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

ilsandstps_page.Button({
	Text = "Terrapin Island",
	Callback = function()
		local teleportPosition = Vector3.new(-107.57418060302734, 172.06167602539062, 2001.5711669921875)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

ilsandstps_page.Button({
	Text = "Sunstone Island",
	Callback = function()
		local teleportPosition = Vector3.new(-960.9772338867188, 232.12721252441406, -1031.8193359375)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

ilsandstps_page.Button({
	Text = "Roslit Bay",
	Callback = function()
		local teleportPosition = Vector3.new(-1547.0203857421875, 140, 697.5581665039062)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

ilsandstps_page.Button({
	Text = "SnowCap Island",
	Callback = function()
		local teleportPosition = Vector3.new(2726.198486328125, 156.32211303710938, 2425.17626952125)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

ilsandstps_page.Button({
	Text = "Mushgrove Swamp",
	Callback = function()
		local teleportPosition = Vector3.new(2633.779541015625, 131.00286865234375, -638.99365234375)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})





------------------------------------------------------------------------------
------------------------------------MISC--------------------------------------
------------------------------------------------------------------------------

misctps_page.Button({
	Text = "Keepers Altar",
	Callback = function()
		local teleportPosition = Vector3.new(1368.342529296875, -765.7269287109375, -76.91497039794922)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})


------------------------------------------------------------------------------
----------------------------------PLAYERS-------------------------------------
------------------------------------------------------------------------------

player_page.Toggle({
	Text = "Noclip",
	Callback = function(Value)
		if Value == true then
            noclipEnabled = state
		elseif Value == false then
			noclipEnabled = state
		end
	end,
})

player_page.Slider({
	Text = "Player Walkspeed",
	Callback = function(Value)
		if humanoid then
            humanoid.WalkSpeed = Value
        end
	end,
	Min = 16,
	Max = 200,
	Def = 16
})

player_page.Slider({
	Text = "Player Jumppower",
	Callback = function(Value)
		if humanoid then
            humanoid.JumpPower = Value
        end
	end,
	Min = 50,
	Max = 500,
	Def = 50
})

-- Noclip functionality
game:GetService("RunService").Stepped:Connect(function()
    if noclipEnabled then
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            for _, part in ipairs(character:GetDescendants()) do
                if part:IsA("BasePart") then
                    part.CanCollide = false
                end
            end
        end
    end
end)