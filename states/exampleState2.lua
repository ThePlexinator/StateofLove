local state = {}

function state:load() -- ran when the state is loaded with .newState()
    
end

function state:enter(...) -- ran when the state is moved INTO with .moveToState().
    print('second one!')
end

function state:exit(...) -- ran when the state is moved OUT OF with .moveToState().

end

function state:update(dt)

end

function state:draw()
    love.graphics.setBackgroundColor(1,1,1)

    love.graphics.setColor(0,0,0)
    love.graphics.print('You\'re in the second state!')
end

return state