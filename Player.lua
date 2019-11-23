Player = Class{}

function Player:init(x, y, radius)
    self.x = x 
    self.y = y
    self.dx = 0
    self.dy = 0
    self.radius = radius
    self.movementSpeed = 1.5
    self.distance = 0
    self.speedMulti = 1
end

function Player:render()
    love.graphics.setColor(1,1,1)
    love.graphics.circle('fill', self.x, self.y, self.radius)

    -- Print debugging
    love.graphics.printf('## Player 1 ##', 0,60, 200, "left" )
    
    love.graphics.printf('Movement Speed = ' .. self.movementSpeed, 0,80, 400, "left" )
    love.graphics.printf(' x = ' .. self.x, 0,100, 400, "left" )
    love.graphics.printf(' y = ' .. self.y, 0,120, 400, "left" )
    love.graphics.printf('dx = ' .. self.dx, 0,140, 400, "left" )
    love.graphics.printf('dy = ' .. self.dy, 0,160, 400, "left" )

end

function Player:update(dt)

    -- Dash
    if love.mouse.isDown(2) then
        self.speedMulti = 5
    else 
        self.speedMulti = 1
    end
    
    -- Movement
    if love.mouse.isDown(1) or love.mouse.isDown(2) then
       
        self.dx = self.x - love.mouse.getCameraX()
        self.dy = self.y - love.mouse.getCameraY()

        self.distance = math.abs((self.dx^2 + self.dy^2)^(1/2))

        vx = ((self.movementSpeed / self.distance) * self.dx * self.speedMulti)
        vy = ((self.movementSpeed / self.distance) * self.dy * self.speedMulti)

        self.x = (self.x - vx)
        self.y = (self.y - vy)
    end  

    
end
