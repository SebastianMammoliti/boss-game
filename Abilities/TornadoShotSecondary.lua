TornadoShotSecondary = Class{}

function TornadoShotSecondary:init(speed, x, y, targetX, targetY)
    self.speed = speed
    self.x = x
    self.y = y
    self.targetX = targetX
    self.targetY = targetY

    self.dx = 0
    self.dy = 0
    self.distance = 0

    self.radius = 10
    
    self.hit = false
    self.done = false

    print("Tornado Shot Secondary Created init() " .. speed .. " " ..  " " .. x .. " " .. y)
end

function TornadoShotSecondary:update(dt, playerAbilities)
    -- Move Projectile
    self.dx = self.x - self.targetX
    self.dy = self.y - self.targetY

    self.distance = math.abs((self.dx^2 + self.dy^2)^(1/2))

    -- Explode here
    if self.distance < 5 then
        self.done = true
    end

    vx = ((self.speed / self.distance) * self.dx)
    vy = ((self.speed / self.distance) * self.dy)

    self.x = (self.x - vx)
    self.y = (self.y - vy)
end

function TornadoShotSecondary:render()
    love.graphics.setColor(0,0,1)
    love.graphics.printf('## TORNADO ##', 0, 200, 200, "left" )
    love.graphics.circle("line", self.x, self.y, self.radius, 100)
end
