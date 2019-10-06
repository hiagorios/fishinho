Fish = Object:extend()

function Fish:new(x, y, size)
    self.x = x
    self.y = y
    self.size = size
    self.img = love.graphics.newImage("assets/image/fish.png")
end

function Fish:update(dt)
    if love.keyboard.isDown('up') then
        self.y = self.y - dt*100
    elseif love.keyboard.isDown('down') then
        self.y = self.y + dt*100
    end

    if love.keyboard.isDown('left') then
        self.x = self.x - dt*100
    elseif love.keyboard.isDown('right') then
        self.x = self.x + dt*100
    end
end

function Fish:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, self.size, self.size)
end