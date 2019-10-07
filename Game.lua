Game = Object:extend()

function Game:new()
    
    love.window.setMode( 1010, 720 )
    screenHeight = love.graphics.getHeight()
    screenWidth = love.graphics.getWidth()
    background = {img = love.graphics.newImage("assets/image/background.png")}

    fish = Fish(screenWidth/2, screenHeight/2, 0.2)
    enemiesTable = {Enemie(0, screenHeight/2, 0.2, 1)}
    gameStarted = false
end

function Game:update(dt)
    if gameStarted then 
        fish:update(dt)
        for i,enemie in pairs(enemiesTable) do
            enemie:update(dt)
        end
    elseif love.keyboard.isDown('return') then
        gameStarted = true
    end
end

function Game:draw()
    love.graphics.draw(background.img, 0, background.y, 0)
    if gameStarted then
        fish:draw()
        for i,enemie in pairs(enemiesTable) do
            enemie:draw()
        end
    else
        love.graphics.print('Press enter to start', screenWidth/3, screenHeight/2, 0, 2, 2)
    end
end