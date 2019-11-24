TornadoShot = Class{}

function TornadoShot:init(speed, x, y, targetX, targetY)
    
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
    print("Tornado Shot Created init() " .. x .. " " .. y)
end

function TornadoShot:update(dt, playerAbilities)
    -- Move Projectile
    self.dx = self.x - self.targetX
    self.dy = self.y - self.targetY

    self.distance = math.abs((self.dx^2 + self.dy^2)^(1/2))

    -- Explode here
    if self.distance < 10 then

        -- Get a random point from the explosion
        proj1angle = math.random()*2*math.pi
        proj1dx = math.cos(proj1angle)*300
        proj1dy = math.sin(proj1angle)*300
        proj1tx = self.x + proj1dx
        proj1ty = self.y + proj1dy
        -- Get 2 more points 120 degrees each side

        proj2angle = proj1angle + (math.pi * 2 / 3)
        proj2dx = math.cos(proj2angle)*300
        proj2dy = math.sin(proj2angle)*300
        proj2tx = self.x + proj2dx
        proj2ty = self.y + proj2dy

        proj3angle = proj1angle - (math.pi * 2 / 3)
        proj3dx = math.cos(proj3angle)*300
        proj3dy = math.sin(proj3angle)*300
        proj3tx = self.x + proj3dx
        proj3ty = self.y + proj3dy

        -- Create 3 Projectiles
        table.insert(playerAbilities, TornadoShotSecondary(10, self.x, self.y, proj1tx, proj1ty))
        table.insert(playerAbilities, TornadoShotSecondary(10, self.x, self.y, proj2tx, proj2ty))
        table.insert(playerAbilities, TornadoShotSecondary(10, self.x, self.y, proj3tx, proj3ty))

        self.done = true
    end
    vx = ((self.speed / self.distance) * self.dx)
    vy = ((self.speed / self.distance) * self.dy)

    self.x = (self.x - vx)
    self.y = (self.y - vy)
end

function TornadoShot:render()
    love.graphics.setColor(0,0,1)
    love.graphics.printf('## TORNADO ##', 0, 200, 200, "left" )
    love.graphics.circle("line", self.x, self.y, self.radius, 100)

end
