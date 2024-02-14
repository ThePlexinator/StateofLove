function love.load()
    StateOfLove = require 'stateoflove' -- load library

    StateOfLove.newState('states.exampleState','exampleState') -- load all example states
    StateOfLove.newState('states.exampleState2','exampleState2')

    StateOfLove.moveToState('exampleState') -- !! MAKE SURE YOU RUN THIS !!

    timer = 0 -- dt timer
end

function love.keypressed(key,unicode,isRepeat)
    if key == 'escape' then love.event.quit() return end -- quit on "escape" input
    StateOfLove.keypressed(key,unicode,isRepeat) -- keypressed callback
end

function love.update(dt)
    timer = timer + dt
    if timer >= 2 then -- switches to the other state every 2 seconds
        timer = 0

        if StateOfLove.getCurrentState() == 'exampleState' then
            StateOfLove.moveToState('exampleState2')
        else
            StateOfLove.moveToState('exampleState')
        end
    end

    StateOfLove.update(dt) -- update w/ dt
end

function love.draw()
    StateOfLove.draw() -- draw
end
