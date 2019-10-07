Fish = Object:extend()

function Fish:new(x, y, size)
    self.x = x
    self.y = y
    self.size = size
    self.img = love.graphics.newImage("assets/image/fish_1.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.velX = 0
    self.velY = 0
    self.acelX = 0
    self.acelY = 0
    self.dtAnim = 1

    -- used to make the fish face the direction according to the arrow key used
    self.direction = 1
end

function Fish:update(dt)    
    self.velX = (self.velX * 0.95) + self.acelX * dt
    self.velY = (self.velY * 0.95) + self.acelY * dt
    self.x = self.x + self.velX * dt
    self.y = self.y + self.velY * dt    

    if love.keyboard.isDown("down") and not love.keyboard.isDown("up") then
        self.acelY = 750
    elseif love.keyboard.isDown("up") and not love.keyboard.isDown("down") then
        self.acelY = -750
    elseif not love.keyboard.isDown("down") and not love.keyboard.isDown("up") then
        self.acelY = 300
    end
    if love.keyboard.isDown("right") and not love.keyboard.isDown("left") then
        self.acelX = 750
        self.direction = 1
        self.dtAnim = self.dtAnim + dt
    elseif love.keyboard.isDown("left") and not love.keyboard.isDown("right") then
        self.acelX = -750
        self.direction = -1
        self.dtAnim = self.dtAnim - dt
    elseif not love.keyboard.isDown("left") and not love.keyboard.isDown("right") then
        self.acelX = 0
    end
    
    self.dtAnim = self.dtAnim + (0.02 * self.direction)
    self.dtAnim = self.dtAnim < -1.0 and -1.0 or self.dtAnim
    self.dtAnim = self.dtAnim > 1.0 and 1.0 or self.dtAnim

    if self.x - self.width < 0 and self.direction == -1 then
        self.x = self.width
    elseif self.x < 0 and self.direction == 1 then
        self.x = 0
    elseif self.x > love.graphics.getWidth() - self.width then
        self.x = love.graphics.getWidth() - self.width
    end

    if self.y < 0 then
        self.y = 0
    elseif self.y > love.graphics.getHeight() - self.height then
        self.y = love.graphics.getHeight() - self.height
    end
end

function Fish:draw()
    love.graphics.draw(self.img, self.x, self.y, 0, self.size*(self.direction * 0.2 +(self.dtAnim * 0.8)), self.size)
    love.graphics.print('Width:' .. self.width, 0,0 )
end
