Enemie = Object:extend()

function Enemie:new(x, y, size, direction)
    self.x = x
    self.y = y
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
    -- TODO: make enemies movie like the're oscillating
    self.x = self.x + self.direction*dt*100
end

function Enemie:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, self.size, self.size)
end