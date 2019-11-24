
-- Include Class library
Class = require 'class'

-- Include StateMachine library, plus any other defined states
require 'StateMachine'
require 'states/BaseState'
require 'states/BattleState'
require 'abilities/Shockwave'
require 'abilities/TornadoShot'
require 'abilities/TornadoShotSecondary'
-- Require Classes
require 'Player'
require 'Creature'
require 'Camera'

-- Constant Variables
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

function love.load()
    -- Initialise Window
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    -- Initialise State Machine
    gStateMachine = StateMachine {
        ['battle'] = function() return BattleState() end,
    }
    gStateMachine:change('battle') 
    
    -- initialize input table
    love.keyboard.keysPressed = {}
end

function love.draw()

    -- Set color to white
    love.graphics.setColor(255,255,255,1)
    love.graphics.printf('Mouse X = ' .. love.mouse.getCameraX(), 0,0, 200, "left" )
    love.graphics.printf('Mouse Y = ' .. love.mouse.getCameraY(), 0,20, 200, "left" )

    -- Render state machine
    gStateMachine:render()
end

function love.update(dt)
    gStateMachine:update(dt)
    love.keyboard.keysPressed = {}
end

function love.keypressed(key)
    -- add to our table of keys pressed this frame
    love.keyboard.keysPressed[key] = true

    if key == 'escape' then
        love.event.quit()
    end
end

function love.keyboard.wasPressed(key)
    if love.keyboard.keysPressed[key] then
        return true
    else
        return false
    end
end

function love.mouse.getCameraX()
    return love.mouse.getX() * camera.scaleX + camera.x
end

function love.mouse.getCameraY()
    return love.mouse.getY() * camera.scaleY + camera.y
end
