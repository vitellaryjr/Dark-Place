return {

	dessbegin = function(cutscene)
		local dess = cutscene:getCharacter("dess")

		local YOU = cutscene:getCharacter("YOU")
		local kris = cutscene:getCharacter("kris")
		
		cutscene:showNametag("Dess Holiday?")
		cutscene:text("* Yo is that-", "condescending", "dess")
		Assets.playSound("lowqualityburp")
		cutscene:text("* (Low quality burp sound effect like that one time in Rick and Morty like what they do in the show)", "neutral", "dess")
		cutscene:text("* Is that the fuckin' uhh 'Kris where the hell are we' guy??", "condescending", "dess")
		
		cutscene:showNametag("Susie")
		cutscene:text("* ...", "annoyed", "susie")
		cutscene:text("* Well first of all I'm a girl,[wait:10] and second of all I never said that.", "nervous", "susie")
		cutscene:text("* Wait,[wait:5] how do you even know us??", "nervous_side", "susie")
		
		cutscene:showNametag("Dess")
		cutscene:text("* What do you mean I see you say it all the time on like", "condescending", "dess")
		cutscene:text("* Twitter memes", "condescending", "dess")
		
		cutscene:showNametag("Susie")
		cutscene:text("* What the hell is Twitter?", "annoyed", "susie")
		
		cutscene:showNametag("Dess")
		cutscene:text("* Man idk anymore", "condescending", "dess")
		cutscene:text("* Oh yeah can I join your team btw", "neutral", "dess")
		
		cutscene:hideNametag()
		cutscene:text("* (Can she join your team btw?)")
		cutscene:choicer({"Yes", "No"})
		
		cutscene:showNametag("Dess")
		if cutscene.choice == 1 then
			cutscene:text("* sick", "condescending", "dess")
		else
			cutscene:text("* Uhhh I don't care", "condescending", "dess")
		end
		cutscene:hideNametag()
		
		cutscene:detachFollowers()
		cutscene:detachCamera()
		cutscene:setAnimation(dess, "battle/attack")
		dess.flip_x = true
		cutscene:wait(0.2)
		local dessWalkPos = {0, 0}
		if YOU then
		
			dessWalkPos = {YOU.x, YOU.y}
			YOU:explode(0, 0, true)
			cutscene:slideTo(YOU, YOU.x - 700, YOU.y - 50, 1)
		
		elseif kris then
		
			dessWalkPos = {kris.x, kris.y}
			kris:explode(0, 0, true)
			cutscene:slideTo(kris, kris.x - 700, kris.y - 50, 1)
		
		end
		cutscene:wait(1.5)
		Game:addPartyMember("dess", 1)
		Game.world:spawnPlayer(dess.x, dess.y, "dess")
		dess:remove()
		
		if YOU then
			Game.world:removeFollower(YOU)
		elseif kris then
			Game.world:removeFollower(kris)
		end
		
		cutscene:walkTo("dess", dessWalkPos[1], dessWalkPos[2], 1, "left")
		cutscene:text("* Ok lets go", "neutral", "dess")
		
		
		cutscene:attachFollowers(1)
		cutscene:interpolateFollowers()
		cutscene:attachCamera(0.5)
		cutscene:wait(0.5)
		
		
		Game:setFlag("gotDess", true)
	
	
	
	end,
	
	
	dessgetoverhere = function(cutscene, origin)
		
		if Game:getFlag("gotDess") then

			
			cutscene:showNametag("Dess")
			cutscene:text("* Hey I can do a crazy impression watch this", "condescending", "dess")
			cutscene:text("* Look at meeee I'm FRISK from UNDERTALE lmao", "calm", "dess")
			
			cutscene:showNametag("Susie")
			cutscene:text("* ...", "annoyed", "susie")
			cutscene:text("* (We need to get rid of her as fast as possible.)", "annoyed", "susie")
			Game:setFlag("dessThingy", true)
			
			origin:remove()
			
		else
			
			local YOU = cutscene:getCharacter("YOU")
			local kris = cutscene:getCharacter("kris")
			
			if YOU then
				YOU.y = YOU.y + 4
			elseif kris then
				kris.y = kris.y + 4
			end
			
			cutscene:showNametag("???")
			cutscene:text("* Hey fucker you need to come talk to me first", "neutral", "dess")
		end
		
		cutscene:hideNametag()
	
	end,
	
	
	dessboss = function(cutscene)
	
		local boss = cutscene:getCharacter("ufoofdoom", 1)
		
		local susie = cutscene:getCharacter("susie")
		local kris = cutscene:getCharacter("kris")
		local YOU = cutscene:getCharacter("YOU")
		local dess = cutscene:getCharacter("dess")
		
		cutscene:detachFollowers()
		cutscene:detachCamera()
		
		cutscene:walkTo(YOU, dess.x, dess.y+16, 1, "up")
		cutscene:walkTo(susie, dess.x, dess.y+32, 1, "up")

		cutscene:showNametag("Susie")
		cutscene:text("* Ugh,[wait:10] alright,[wait:5] is this the last one?!", "angry", "susie")
		
		cutscene:showNametag("Dess")
		cutscene:text("* Yep", "neutral", "dess")
		
		cutscene:showNametag("Susie")
		cutscene:text("* Alright...[wait:10] let's finally get outta here.", "annoyed_down", "susie")
		cutscene:hideNametag()
		
		cutscene:wait(1)
		boss:shake(8, 0)
		cutscene:wait(2)
		
		cutscene:showNametag("Susie")
		cutscene:text("* Did you just see that??", "surprise_frown", "susie")
		cutscene:text("* Why did it just shake?", "shy_b", "susie")
		
		cutscene:showNametag("Dess")
		cutscene:text("* That's normal, all the other ones shake if you hit them", "neutral", "dess")
		
		boss:shake(8, 0)
		
		cutscene:showNametag("Susie")
		cutscene:text("* But...[wait:10] we didn't hit it!", "shock_down", "susie")
		
		boss:shake(16, 0)
		
		cutscene:showNametag("Dess")
		cutscene:text("* Yo wait you're right!", "wtf_b", "dess")
		
		boss:shake(8, 0)
		
		cutscene:showNametag("???")
		cutscene:text("* Hee...")
		boss:shake(16, 0)
		cutscene:text("* Uheeheehee!!")
		
		boss:fadeTo(0, 0.1, function() boss:fadeTo(1, 0.05, callback) end)
		cutscene:panTo(boss.x, boss.y+256, 2)
		boss:slideTo(boss.x, boss.y+256, 2, "in-out-quint")
		
		cutscene:wait(0.8)
		
		cutscene:look(susie, "down")
		cutscene:look(dess, "down")
		if YOU then
			cutscene:look(YOU, "down")
		else
			cutscene:look(kris, "down")
		end
		
		cutscene:wait(1.2)
		cutscene:text("* I'm sorry![wait:10]\n* I simply couldn't contain myself!")
		cutscene:text("* Uheehee!")
		
		cutscene:showNametag("Susie")
		cutscene:text("* Who the hell are you?!", "angry", "susie")
		
		cutscene:hideNametag()
		
		boss:fadeTo(0.2, 0.05)
		cutscene:wait(1)
		boss:setActor("susie")
		cutscene:look(boss, "up")
		boss:fadeTo(1, 0.05)
		cutscene:wait(1)
		cutscene:showNametag("???")
		cutscene:text("* YOU![wait:10] Well,[wait:5] just you.[wait:10] Not YOU.")
		
		cutscene:showNametag("Susie")
		cutscene:text("* Wha-?![wait:10] What the hell??", "surprise_frown", "susie")
		
		cutscene:hideNametag()
		
		boss:fadeTo(0.2, 0.05)
		cutscene:wait(1)
		boss:setActor("you")
		cutscene:look(boss, "up")
		boss:fadeTo(1, 0.05)
		cutscene:wait(1)
		cutscene:showNametag("???")
		cutscene:text("* Oh well,[wait:5] NOW I'm YOU!")
		cutscene:text("* Or Kris![wait:10] You couldn't tell from here![wait:10] Uheeheehee!")
		cutscene:hideNametag()
		
		boss:fadeTo(0.2, 0.05)
		cutscene:wait(1)
		boss:setActor("ufoofdoom")
		boss:fadeTo(1, 0.05)
		cutscene:showNametag("Dess")
		cutscene:text("* Whatever can we fight now", "condescending", "dess")
		
		cutscene:showNametag("???")
		cutscene:text("* ...OH![wait:10] I see!")
		cutscene:text("* ...Uheehee!")
		cutscene:text("* You're even worse than me! Uhee!")
		
		cutscene:showNametag("Susie")
		cutscene:text("* Uhh,[wait:10] what do they mean by that?", "nervous", "susie")
		
		cutscene:showNametag("???")
		cutscene:text("* Uheehee![wait:10] You're much better!")
		cutscene:text("* It's too easy to be who you want to be!")
		cutscene:text("* I know that is not the real Dess Holiday!")
		
		cutscene:showNametag("Susie")
		cutscene:text("* Huh???", "surprise_frown", "susie")
		
		cutscene:showNametag("???")
		cutscene:text("* Don't act all surprised!")
		cutscene:text("* I know that you aren't the real Susie either!")
		
		cutscene:showNametag("Susie")
		cutscene:text("* ...???", "suspicious", "susie")
		cutscene:text("* Uh.", "suspicious", "susie")
		cutscene:text("* Alright,[wait:5] let's smash this guy into a pulp.", "teeth_smile", "susie")
		
		cutscene:showNametag("Dess")
		cutscene:text("* Agreed", "neutral", "dess")
		
		cutscene:showNametag("???")
		cutscene:text("* Suit yourself![wait:5] Uheehee!")
		
		cutscene:hideNametag()
		
		cutscene:attachCamera(1)
		
		cutscene:startEncounter("mimicboss", true, boss)
		boss:remove()
		
		cutscene:attachFollowers(5)
		
		cutscene:wait(1)
		
		cutscene:showNametag("Dess")
		cutscene:text("* Wow,[wait:10] we really learned a lot about each-other while on this journey.", "genuine", "dess")
		
		cutscene:showNametag("Susie")
		cutscene:text("* WH-", "shock", "susie")
		cutscene:text("* NO!!", "angry", "susie")
		cutscene:text("* NO!!!!!", "angry_b", "susie")
		cutscene:text("* You are NOT making this a 'touching' moment!", "angry_c", "susie")
		
		cutscene:showNametag("Dess")
		cutscene:text("* No,[wait:5] I really think we really started to value our friendship there.", "genuine", "dess")
		cutscene:text("* Whaddya say,[wait:5] after this...", "genuine", "dess")
		cutscene:text("* You and I smoke a ciggie outside of a 7/11?", "kind", "dess")
		
		cutscene:showNametag("Susie")
		cutscene:text("* I just want you to know right now...", "suspicious", "susie")
		cutscene:text("* You are the absolute worst person I've ever met.", "suspicious", "susie")
		
		cutscene:showNametag("Dess")
		cutscene:text("* Alright but can I stay on the team?", "neutral", "dess")
		
		cutscene:showNametag("Susie")
		cutscene:text("* NO!", "teeth_b", "susie")
		
		cutscene:showNametag("Dess")
		cutscene:text("* ...", "neutral", "dess")
		cutscene:text("* Please?", "condescending", "dess")
		
		cutscene:showNametag("Susie")
		cutscene:text("* NO!!![wait:20] NO NO NO!", "teeth_b", "susie")
		
		cutscene:showNametag("Dess")
		cutscene:text("* If I do I'll give the other guy's position back as leader", "neutral", "dess")
		
		cutscene:showNametag("Susie")
		cutscene:text("* ...", "teeth_b", "susie")
		cutscene:text("* ALRIGHT, FINE!", "teeth_b", "susie")
		cutscene:text("* But I am NOT talking to you anymore!", "angry", "susie")
		
		cutscene:showNametag("Dess")
		cutscene:text("* Yippeee", "condescending", "dess")
		
		cutscene:detachFollowers()
		Game:movePartyMember("dess", 2)
		cutscene:attachFollowers(3)
		
		Game:setFlag("mimicBossDone", true)
		
		cutscene:hideNametag()
		
	end,
	
}