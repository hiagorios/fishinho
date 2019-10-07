Enemie = Object:extend()

function Enemie:new(x, y, size, direction)
    self.x = x
    self.y = y
    self.speed = 200
    self.movementDt = 0
    self.size = size
    self.direction = direction
    self.images = {}
    table.insert(self.images, love.graphics.newImage("assets/image/fish_1.png"))
    table.insert(self.images, love.graphics.newImage("assets/image/fish_2.png"))
    table.insert(self.images, love.graphics.newImage("assets/image/fish_3.png"))
    table.insert(self.images, love.graphics.newImage("assets/image/fish_4.png"))
    table.insert(self.images, love.graphics.newImage("assets/image/fish_5.png"))
    self.img = self.images[1]
end

function Enemie:update(dt)
    --[[self.movementDt = self.movementDt + dt
    if self.movementDt % 2.0 == 0 then
        self.y = self.y + 0.5
        self.x = self.x + self.direction
    else
        self.y = self.y - 0.5
        self.x = self.x + self.direction
    end
    --]]
    self.x = self.x + (math.cos(math.rad(0)) * self.speed * dt)
    self.y = self.y + (math.sin(math.rad(90)) * self.speed * dt)
end

function Enemie:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, self.size, self.size)
    love.graphics.print('movementDt: '.. self.movementDt, 0, 10)
end