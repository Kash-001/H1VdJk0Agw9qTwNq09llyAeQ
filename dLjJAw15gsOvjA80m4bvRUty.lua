-- LOCAL
local player = game.Players.LocalPlayer
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fz-YZF/fA65r2U_NyPT4AR/refs/heads/main/Module.lua"))()
local baits = workspace.Parent:GetService("ReplicatedStorage").playerstats:FindFirstChild(player.Name).Stats.bait
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

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
			print('Ingredient trouver')
			game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
			child.PickupPrompt.HoldDuration = 0
			local ESP = Instance.new("Highlight")
			ESP.FillTransparency = 0
			ESP.Parent = child
			local POS = child.PrimaryPart.Position
			game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(POS))
			wait(3)
		end
	end
	game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(LastPos))
	game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
end

-- MAIN
local UI = Material.Load({
	Title = "El patron of FISCH",
	Style = 3,
	SizeX = 300,
	SizeY = 180,
	Theme = "Dark",
})

local Page = UI.New({
	Title = "Functions"
})

local Page2 = UI.New({
	Title = "Islands TPs"
})

local Page3 = UI.New({
	Title = "MISC TPs"
})

Page.Button({
	Text = "SELL INVENTORY",
	Callback = function()
		workspace.Parent:GetService("ReplicatedStorage").events.selleverything:InvokeServer()
	end
})

Page.Button({
	Text = "GET ALL BAITS",
	Callback = function()
		for _, bait in baits:GetChildren() do
			bait.Value = 99
		end
	end
})

IsOn = false

local B = Page.Toggle({
	Text = "AUTO SHAKE",
	Callback = function(Value)
		if Value == true then
			IsOn = true
			while IsOn == true do
				checkForShakeUI()
				wait(0.1)
			end
		elseif Value == false then
			IsOn = false
		end
	end,
	Enabled = false
})

Page.Button({
	Text = "GET INGREDIENTS",
	Callback = function()
		GetIngredients()
	end
})

Page2.Button({
	Text = "Moosewood",
	Callback = function()
		local teleportPosition = Vector3.new(491.800537109375, 152.99990844726562 , 343.6178283691406)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

Page2.Button({
	Text = "Terrapin Island",
	Callback = function()
		local teleportPosition = Vector3.new(-107.57418060302734, 172.06167602539062, 2001.5711669921875)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

Page2.Button({
	Text = "Sunstone Island",
	Callback = function()
		local teleportPosition = Vector3.new(-960.9772338867188, 232.12721252441406, -1031.8193359375)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

Page2.Button({
	Text = "Roslit Bay",
	Callback = function()
		local teleportPosition = Vector3.new(-1547.0203857421875, 140, 697.5581665039062)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

Page2.Button({
	Text = "SnowCap Island",
	Callback = function()
		local teleportPosition = Vector3.new(2726.198486328125, 156.32211303710938, 2425.17626952125)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

Page2.Button({
	Text = "Mushgrove Swamp",
	Callback = function()
		local teleportPosition = Vector3.new(2633.779541015625, 131.00286865234375, -638.99365234375)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})

Page3.Button({
	Text = "Keepers Altar",
	Callback = function()
		local teleportPosition = Vector3.new(1368.342529296875, -765.7269287109375, -76.91497039794922)
		player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
	end
})
