
include("npc/nzu_tyrant_mrx.lua")
sound.AddSoundOverrides("lua/nzombies-unlimited/extensions/nzu_tyrant_mrx_special_enemy/sound/nzu_re2_footsteps_tyrant.lua")

util.PrecacheModel("models/roach_nzu/re2/tyrant.mdl")
util.PrecacheModel("models/roach/re2/tyrant_hat.mdl")

util.PrecacheSound("darksouls/npc/fsb.frpg_c2300/s230012302.wav.mp3")
util.PrecacheSound("re2/em6200/land.mp3")
for i=1,5 do 
	util.PrecacheSound("re2/em6200/attack_hit"..i..".mp3")
	util.PrecacheSound("re2/em6200/attack_swing"..i..".mp3")
	util.PrecacheSound("re2/em6200/step"..i..".mp3")
end
for i=1,2 do 
	util.PrecacheSound("re2/em6200/foley_adjust_hat"..i..".mp3")
	util.PrecacheSound("re2/em6200/foley_long"..i..".mp3")
	util.PrecacheSound("re2/em6200/foley_taunt"..i..".mp3")
	util.PrecacheSound("re2/em6200/foley"..i..".mp3")
	util.PrecacheSound("re2/em6200/hit"..i..".mp3")
end

hook.Add("nzu_RoundStart", "NZU_Mrx_HandleSpawning",function(round)
	if round == 1 then
		local ent = table.Random(nzu.GetActiveSpawners("special"))
		
		local mrx = ents.Create("npc_nzu_spec_tyrant")
		mrx:SetPos(ent:GetPos())
		mrx:SetAngles(ent:GetAngles())
		mrx:Spawn()
	end
end)