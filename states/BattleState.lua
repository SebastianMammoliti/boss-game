BattleState = Class{__includes = BaseState}

function BattleState:init()
    self.playerAbilities = {}
    self.creatures = {}
    player1 = Player(WINDOW_WIDTH/2,  WINDOW_HEIGHT/2, 5)
    boss = Creature(WINDOW_WIDTH/2,  WINDOW_HEIGHT/2, 20)
    camera = Camera()
    table.insert(self.creatures, boss)
end

function BattleState:update(dt)
    player1:update(dt)
    camera:update(player1)

    if love.keyboard.wasPressed('space') then
        -- If Space is Pressed

        -- Add a shockwave to the ability table
        table.insert(self.playerAbilities, Shockwave(400, 400, 40, player1.x, player1.y))

        print(table.getn(self.playerAbilities))
    end

    -- Update all player abilities and check for collisions with enemies
    if table.getn(self.playerAbilities) ~= 0 then
        for k, ability in pairs(self.playerAbilities) do

            -- Increase ability time.
            ability:update(dt)
            if (ability.hit ~= true) then
                for l, creature in pairs(self.creatures) do
                    
                    -- Get the distance between the ability and creature
                    dx = ability.x - creature.x
                    dy = ability.y - creature.y
                    distance = math.abs((dx^2 + dy^2)^(1/2))

                    if ability.radius + creature.radius > distance then
                        ability.hit = true
                        creature.health = creature.health -1
                    end      
                end
            end

            if ability.time == ability.maxTime then
                table.remove(self.playerAbilities, k)
                print("removed shockwave")
            end
        end
    end


end

function BattleState:render()
    -- Draw player
    camera:set()
    player1:render()
    boss:render()
    for key, ability in pairs(self.playerAbilities) do
        ability:render()
    end
    camera:unset()
end

function BattleState:enter()
end

function BattleState:exit()
end

