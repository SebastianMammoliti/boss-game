Shockwave = Class{}

function Shockwave:init(maxRadius, speed, time, x, y)
    self.maxRadius = maxRadius
    self.speed = speed
    self.maxTime = time
    self.time = 0
    self.x = x
    self.y = y
    self.radius = 0
    self.hit = false
    print("Shockwave Created init() " .. maxRadius .. " " .. speed .. " " .. time .. " " .. x .. " " .. y)
end

function Shockwave:update(dt)
    self.time = self.time + 1
    self.radius = self.radius + self.speed * dt
end

function Shockwave:render()
    love.graphics.setColor(0,1,0)
    love.graphics.printf('## SHOCKWAVE ##', 0, 200, 200, "left" )
    love.graphics.circle("line", self.x, self.y, self.radius, 100)
    print("Draw Shockwave")
end
