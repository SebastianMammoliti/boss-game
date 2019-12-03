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
    
    for key, element in pairs(self.gui) do
        element:update()

        if (love.mouse.getCameraX() > element.x) and (love.mouse.getCameraX() < element.x + element.w) and (love.mouse.getCameraY() > element.y) and (love.mouse.getCameraY() < element.y + element.h) then
            element.originalText= "asdasdasd"
        end 

    end    

end

function BuilderState:render()
    camera:set()
    for key, element in pairs(self.gui) do
        element:render()
    end
    camera:unset()
end

function BuilderState:enter()
end

function BuilderState:exit()
end
