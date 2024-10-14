dofile(minetest.get_modpath("chakram") .. "/wood.lua")
dofile(minetest.get_modpath("chakram") .. "/steel.lua")
dofile(minetest.get_modpath("chakram") .. "/mese.lua")
pvp=minetest.settings:get_bool("enable_pvp")
chakramshot_user=""
chakramshot_user_name=""
chakram_shot_chakram={}
chakram_max_number=10

function chakram_max(add)
	local c=0
	for i in pairs(chakram_shot_chakram) do
		c=c+1
		if chakram_shot_chakram[i]:get_pos()==nil then
			table.remove(chakram_shot_chakram,c)
			c=c-1
		end
	end
	if c+1>chakram_max_number  then return false end
	if add then
		table.insert(chakram_shot_chakram,add)
		return true
	end
	return true
end

function chakram_def(pos,def)
	local n=minetest.registered_nodes[minetest.get_node(pos).name]
	return n and n[def]
end

minetest.register_craft({
	output = "chakram:chakram",
	recipe = {
		{"default:steel_ingot","","default:steel_ingot"},
		{"","default:steelblock",""},
		{"default:steel_ingot","","default:steel_ingot"},
	}
})

minetest.register_craft({
	output = "chakram:chakram_mese",
	recipe = {
		{"default:mese_crystal","","default:mese_crystal"},
		{"","default:mese",""},
		{"default:mese_crystal","","default:mese_crystal"},
	}
})

minetest.register_craft({
	output = "chakram:chakram_wood",
	recipe = {
		{"default:stick","","default:stick"},
		{"","group:wood",""},
		{"default:stick","","default:stick"},
	}
})
function chakram_drops(name)
	return minetest.get_node_drops(name)[1] or "air"
end