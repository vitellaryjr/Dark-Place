local WhiteDoor, super = Class(Event)

function WhiteDoor:init(data)
    super.init(self, data)
    self.sprite = Sprite("objects/white_door")
    self.sprite:setScale(2)
	self.sprite:setOrigin(0.5, 1)
    self:addChild(self.sprite)

    self.solid = false
end

function WhiteDoor:onInteract(player, dir)
    Game.world:startCutscene(
        function(cutscene, event)
        cutscene:text("* A white door casts a faint shadow...")
        cutscene:text("* Will you enter it?")

        choice = cutscene:choicer({"Yes", "No"}, options)
        if choice == 1 then
            cutscene:text("* You opened the door...")
            cutscene:fadeOut(2, {color = {1, 1, 1}, music = true, blend = "add"})
            cutscene:wait(2)
            if Game.world.map.id == "room3" then
                cutscene:mapTransition("whitespace", "entry")
            elseif Game.world.map.id == "whitespace" then
                cutscene:mapTransition("room3", "exit_whitespace")
            end
            Game.fader.fade_color = {1,1,1}
            cutscene:look("down")
            cutscene:fadeIn(2, {color = {1, 1, 1}})
            cutscene:wait(2)
        else
            cutscene:text("* You doorn't.")
        end
    end)
end

return WhiteDoor