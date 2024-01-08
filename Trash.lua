_G.KaitunConfig = {
	["Auto Boost FPS"] = false,
	["Skip Level Farm"] = false,
	["Fast Attack Mode"] = "Fast Attack", -- "Fast Attack" , "More Then old Fast Attack" 
	["Hop If Can't Kill Player"] = true,
	["Block All Hop"] = false,
	
	["Start Kaitun"] = true,
	-- World 1
	["Auto Pole"] = true, -- จะตีเเค่ถ้ามันเกิดไม่ได้ตีจนกว่าจะได้
	["Auto Saber"] = true,
	["Auto Second World"] = false,
	-- World 2
	["Auto Rengoku"] = false,
	["Auto Quest Flower"] = false,
	["Auto V3 Race"] = false,
	["Auto Bartilo"] = false,
	["Auto Cursed Captain"] = false,
	["Auto Darkbeard"] = false,
	["Auto Factory"] = false,
	["Auto Third World"] = false,
	["Skip Get Item Guitar"] = false, -- จะไม่ หาของทำ soul guiter ในโลก 2 เบบ หาจนกว่าจะได้ will not find item until get all item for do soul guiter ( open recommend เเนะนำให้เปิด )
	["Allise Fruit"] = {"Dragon-Dragon","Spirit-Spirit","Venom-Venom","Dough-Dough"}, -- จะไม่ใช้ผลพวกนี้ในการเปิดประตูไปโลก3
	-- World 3
	["Auto Hallow Scythe"] = true,
	["Auto Buddy Sword"] = true,
	["Auto Dough King"] = false,
	["Auto Spikey Trident"] = false,
	["Auto Tushita"] = true,
	["Auto Elite Hunter"] = true,
	["Auto rip Indra"] = true,
	["Auto Yama"] = true,
	["Auto Canvander"] = true,
	["Auto Soul Guitar"] = true, 
	["Auto Rainbow Haki"] = true,
	["Auto Cursed Dual Katana"] = true,
	
	-- Fighting Style 
	
	["Auto God Human"] = false,
	["Auto Superhuman"] = false,
	["Auto Death Step"] = false,
	["Auto Sharkman Karate"] = false,
	["Auto Electric Claw"] = false,
	["Auto Dargon Talon"] = false,
	
	["Auto Mastery Devil Fruit"] = true,
	["Skill Setting"] = { -- ถ้าไม่ใส่จะใช้ mode auto
		-- ["Z"] = 0.1,
		-- ["X"] = 0.1,
		-- ["C"] = 0.1,
		-- ["V"] = 0.1, -- อันไหนไม่เอาลบออกไปเลย
	},
	["Auto Mastery Sword"] = true,
	["Sword Rarity Select"] = {"Mythical","Legendary"}, -- Common , Uncommon,Rare,Legendary,Mythical

	["Select Redeem Code Level"] = 1,

	-- Raids

	["Select Rate Fruit Rais"] = 1000000, -- if fruit price less u rate then we use it to auto raids
	["Limit Raids Fragments"] = 100000,

	-- Devil Fruit

	["Select Main Devil Fruit Sniper"] = {"Dragon-Dragon","Spirit-Spirit","Venom-Venom","Dough-Dough"}, -- ผลหลักที่จะกินเเทนผลรอง
	["Select Sub Devil Fruit Sinper"] = {"Ice-Ice","Sand-Sand","Dark-Dark","Quake-Quake","Light-Light"}, -- ผลรองจะกินไว้ก่อนเเล้วพอผลหลักมีก้จะเปลียนไปกินผิดหลัก
	["Allow Eat Fruit In Inventory"] = false,
	["Start Sniper"] = false,

	-- RAM

	["RAM Port"] = 7963,
	["RAM Password"] = "",
	["Auto Set Description"] = false,

	-- Webhook

	["Start Webhook"] = false,
	["Link Webhook"] = "",
	["Mode Webhook"] = "Send On Level Max", -- "Send Every 10 min","Send On Level Max","Send On Level Max And Every 10 min"

	-- CPU
	
	["Select Lock Fps"] = 20,
	["Lock Fps Now"] = false,
	["White Screen"] = false
}
_G.Key = "PGZ3J-BAVXB-G3O29"
_G.DiscordId = "1000396921615163423"
loadstring(game:HttpGet("https://raw.githubusercontent.com/Natsuhanaki/Royx_PC/main/loader.lua"))();
