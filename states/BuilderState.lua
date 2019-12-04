--[[
    State: BuilderState.lua
    Comments:
        This state is for creating the skills that the boss will use. The idea is to have a bunch of toggles, buttons, sliders, and inputs
        that will change the effect, timings, potency, and other various modifiers of the skill

        On the right hand side will be a panel to show what the skill currently looks like. 

        TODO: More design work needs to go into this feature. No real clue on how to implement this, just mucking around.
--]]

BuilderState = Class{__includes = BaseState}

function BuilderState:init()
    -- For the preview screen, I'll need a lot of the stuff from battle state, maybe its work making it a seperate class?
    camera = Camera()
    self.gui = {}
    self.abilities = {}
    self.creatures = {}

    -- Create the two entities. 
    boss = Creature(WINDOW_WIDTH/1.25,  WINDOW_HEIGHT/1.5, 20)
    dummy = Creature(WINDOW_WIDTH/1.25, (WINDOW_HEIGHT/1.5) -300, 5)
    table.insert(self.creatures, boss)
    table.insert(self.creatures, dummy)

    -- This myFuncs array will be used to set the callback functions on the buttons. Using an array so I can clear it easily at the end.
    local myFuncs = {}

    -- Definte the various callback functions. These will probably be replaced later with the dynamic skill callbacks. Not sure how to implement that yet so sticking with something basic.
    myFuncs['tornado'] = function() 
        self.abilities = {}
        table.insert(self.abilities, TornadoShot(10, boss.x, boss.y, boss.x, boss.y - 300))
        print('Pressed the Tornado Shot Button')
    end

    myFuncs['shockwave'] = function() 
        self.abilities = {}
        Shockwave(400, 400, 40, boss.x, boss.y)
        table.insert(self.abilities, Shockwave(400, 400, 40, boss.x, boss.y))
        print('Pressed the Shockwave Button')
    end
    
    -- Add the buttons to the gui table with their corresponding callback functions.
    table.insert(self.gui, Button("Tornado Shot Button", 10 , WINDOW_HEIGHT - 60, 100, 50, myFuncs['tornado']))
    table.insert(self.gui, Button("Shockwave Button", 120, WINDOW_HEIGHT - 60, 100, 50, myFuncs['shockwave']))

    myFuncs = {}
end

function BuilderState:update(dt)
    if love.keyboard.wasPressed('f1') then
        -- This currently toggles between battle state and builder state
        gStateMachine:change('battle') 
    end
    
    -- Update all elements in gui
    for key, element in pairs(self.gui) do
        element:update()
    end    

    if table.getn(self.abilities) ~= 0 then
        for k, ability in pairs(self.abilities) do

            -- Increase ability time.
            ability:update(dt, self.abilities)

            if ability.done then
                table.remove(self.abilities, k)
                print("removed ability")
            end
        end
    end

end

function BuilderState:render()
    camera:set()
    
    love.graphics.printf('This will be the Preview Area', WINDOW_WIDTH/1.25 - 400,  20, 800, "center" )

    -- Render all elements in gui
    for key, element in pairs(self.gui) do
        element:render()
    end

    for key, ability in pairs(self.abilities) do
        ability:render()
    end



    dummy:render()
    boss:render()

    camera:unset()
end

function BuilderState:enter()
end

function BuilderState:exit()
end
