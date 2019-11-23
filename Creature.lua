Creature = Class{}

function Creature:init(x, y, radius)
    self.x = x 
    self.y = y
    self.dx = 0
    self.dy = 0
    self.radius = radius
    self.movementSpeed = 1.5
    self.distance = 0
    self.speedMulti = 1
    self.health = 100
end

function Creature:render()
    love.graphics.setColor(1,0,0)

    love.graphics.printf('## Boss ##', 0, 240, 200, "left" )
    love.graphics.printf('HP = ' .. self.health, 0, 260, 200, "left" )
    love.graphics.circle('fill', self.x, self.y, self.radius)
end

function Creature:update(dt)
    
end