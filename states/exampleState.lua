local state = {}

function state:load() -- ran when the state is loaded with .newState()

end

function state:enter(args) -- ran when the state is moved INTO with .moveToState().
    print('first one!')
end

function state:exit(args) -- ran when the state is moved OUT OF with .moveToState().
    
end

function state:keypressed(key,unicode,isRepeat)
    print(key,unicode,isRepeat)
end

function state:update(dt)

end

function state:draw()
    love.graphics.setBackgroundColor(0,0,0)

    love.graphics.setColor(1,1,1)
    love.graphics.print('You\'re in the first state!')
end

return state