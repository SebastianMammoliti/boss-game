BuilderState = Class{__includes = BaseState}

function BuilderState:init()
    camera = Camera()
    self.gui = {}
    
    myFunc = function() print("asd") end

    table.insert(self.gui, Button("asd", 20, 20,100,20, myFunc))
    table.insert(self.gui, Button("Big Button", 200, 200, 100, 100, myFunc))
end

function BuilderState:update(dt)
    if love.keyboard.wasPressed('f1') then
        -- If q is Pressed
        -- Add a Tornado Shot to the ability table
        gStateMachine:change('battle') 
    end
    
    -- Update all elements in gui
    for key, element in pairs(self.gui) do
        element:update()
    end    

end

function BuilderState:render()
    camera:set()

    -- Render all elements in gui
    for key, element in pairs(self.gui) do
        element:render()
    end
    
    camera:unset()
end

function BuilderState:enter()
end

function BuilderState:exit()
end
