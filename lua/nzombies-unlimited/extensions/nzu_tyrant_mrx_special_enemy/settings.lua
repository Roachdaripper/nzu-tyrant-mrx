
local settings = {
	["StartHealth"] = {
		Type = "Number",
		Default = 5000,
		Parse = function(n) return math.Round(n) end
	},
	["NumRounds"] = {
		Type = "Number",
		Default = 2,
		Parse = function(n) return math.Round(n) end
	},
	["PointsHat"] = {
		Type = "Number",
		Default = 50,
		Parse = function(n) return math.Round(n) end
	},
	["PointsTakedown"] = {
		Type = "Number",
		Default = 500,
		Parse = function(n) return math.Round(n) end
	}
}

if CLIENT then
	-- Pre-register these as their files are located in the gamemode, not appearing in sandbox

	local labelledsettings = {
		{"StartHealth", "Starting Health"},
		{"NumRounds", "Rounds to stay down for"},
		{"PointsHat", "Num. Points for shooting off hat"},
		{"PointsTakedown", "Num. Points for taking down"}
	}

	local panelfunc = function(p, SettingPanel)
		for k,v in pairs(labelledsettings) do
			local pnl = vgui.Create("Panel", p)
			pnl:SetTall(25)
			pnl:Dock(TOP)
			pnl:DockPadding(5,2,5,2)

			local lbl = pnl:Add("DLabel")
			lbl:SetText(v[2])
			lbl:Dock(LEFT)
			lbl:SetWide(125)
			lbl:DockMargin(0,0,10,0)

			local st = SettingPanel(v[1],pnl)
			st:Dock(FILL)
		end
		return p
	end
	return settings, panelfunc
end

return settings