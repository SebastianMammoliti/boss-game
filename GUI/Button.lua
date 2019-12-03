--[[
    Class: Button.lua
    Variables: 
        text: text of the button. Currently will display in the top right corner, left aligned
        originalText: original text that was supplied. Use this to change the text back if it changes on click or something
        x: x position of the button
        y: y postiion of the button
        w: width of the button
        h: height of the button
        func: function to be run on click
    Comments:
        This button class utilises a similar table that was implemented for the keyboard buttons. 
        It records whether or not the mouse was released on the last frame and which mouse button it was
--]]

Button = Class{}

-- Init Button Class with text, x, y, width, height, callback function for use with onClick
function Button:init(text, x, y, w, h, func) 
    self.text = text
    self.originalText = text
    self.x = x
    self.y = y
    self.w = w
    self.h = h
    self.func = func
end

-- Update Button Class. This is where it checks for hover and clicking. Calls self.func on click.
function Button:update(dt)
    -- Check if the mouse is on the button.
    if (love.mouse.getCameraX() > self.x) and (love.mouse.getCameraX() < self.x + self.w) and (love.mouse.getCameraY() > self.y) and (love.mouse.getCameraY() < self.y + self.h) then
        -- Check if it was clicked last frame and run the function
        if love.mouse.buttonsReleased[1] then
            self.text = "CLICKED"
            self.func()
        end
    else
        self.text = self.originalText
    end
end

function Button:render()
    love.graphics.setColor(1,1,1,1)
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    love.graphics.setColor(0.5,0.5,0.5,1)
    love.graphics.rectangle('fill', self.x+2, self.y+2, self.w-4, self.h-4)
    love.graphics.setColor(0,0,0)
    love.graphics.printf(self.text, self.x,self.y+2, self.w, "center" )
end
