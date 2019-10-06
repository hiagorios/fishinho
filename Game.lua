Game = Object:extend()

function Game:new()
    
    love.window.setMode( 1010, 720 )
    screenHeight = love.graphics.getHeight()
    screenWidth = love.graphics.getWidth()
    background = {img = love.graphics.newImage("assets/image/background.png")}

    fish = Fish(screenWidth/2, screenHeight/2, 0.1)
end

function Game:update(dt)
    fish:update(dt)
end

function Game:draw()
    love.graphics.draw(background.img, 0, background.y, 0)
    fish:draw()
end