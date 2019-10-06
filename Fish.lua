Fish = Object:extend()

function Fish:new(x, y, size)
    self.x = x
    self.y = y
    self.size = size
    self.img = love.graphics.newImage("assets/image/fish_1.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()

    -- used to make the fish face the direction according to the arrow key used
    self.direction = 1
end

function Fish:update(dt)
    if love.keyboard.isDown('up') then
        self.y = self.y - dt*100
    elseif love.keyboard.isDown('down') then
        self.y = self.y + dt*100
    end

    if love.keyboard.isDown('left') then
        self.x = self.x - dt*100
        if (self.direction == 1) then
            self.direction = -1
            self.x = self.x + self.width*self.size
        end
    elseif love.keyboard.isDown('right') then
        self.x = self.x + dt*100
        if (self.direction == -1) then
            self.direction = 1
            self.x = self.x - self.width*self.size
        end
    end
end

function Fish:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, self.size*self.direction, self.size)
    love.graphics.print('Width:' .. self.width, 0,0 )
end