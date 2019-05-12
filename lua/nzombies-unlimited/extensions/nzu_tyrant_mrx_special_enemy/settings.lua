
local settings = {
	["Health"] = {
		Type = TYPE_NUMBER,
		Default = 5000,
	},
	["NumRounds"] = {
		Type = TYPE_NUMBER,
		Default = 2,
	}
}

if CLIENT then
	-- Pre-register these as their files are located in the gamemode, not appearing in sandbox

	local labelledsettings = {
		{"Health", "Starting Health"},
		{"NumRounds", "Rounds to stay down for"}
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