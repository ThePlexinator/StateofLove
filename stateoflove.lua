local CURRENT_STATE = ''
local availableStates = {}

local stt = {}

------------------ STATE MANAGER ------------------
function stt.newState(pathToFile,identifier)
    if availableStates[identifier] then print('State w/ identifier "' .. identifier .. '" already exists!') return end

    local requiredState = require(pathToFile)
    requiredState:load()

    availableStates[identifier] = requiredState
end
function stt.removeState(identifier)
    local index = 0 -- used to remove the state
    for id,_ in pairs(availableStates) do
        index = index + 1

        if id == identifier then
            availableStates[identifier] = nil -- table.remove does not work here for whatever reason
            table.remove(availableStates,index)
            return true
        end
    end

    print(identifier .. ' not found while trying to remove')
end
function stt.moveToState(identifier,...)
    local oldState = availableStates[CURRENT_STATE]
    local newState = availableStates[identifier]
    if not newState then print('State w/ identifier "' .. identifier .. '" does not exist while trying to move') return end

    local args = {...}
    if oldState then oldState:exit(args) end
    newState:enter(args)

    CURRENT_STATE = identifier
end

------------------ UPDATE & DRAW ------------------
function stt.update(dt)
    availableStates[CURRENT_STATE]:update(dt)
end
function stt.draw()
    availableStates[CURRENT_STATE]:draw()
end

------------------ CALLBACKS ------------------
local function canCallbackRun(callback)
    local selectedState = availableStates[CURRENT_STATE]

    if not selectedState then print(CURRENT_STATE .. ' not found while trying to call ' .. callback .. '()!') return false end
    if not selectedState[callback] then print(callback .. '() does not exist in ' .. CURRENT_STATE .. '!') return false end
    
    return true
end

function stt.keypressed(key,unicode,isRepeat)
    local selectedState = availableStates[CURRENT_STATE]
    if not canCallbackRun('keypressed') then return end

    selectedState:keypressed(key,unicode,isRepeat)
end
function stt.keyreleased(key,unicode)
    local selectedState = availableStates[CURRENT_STATE]
    if not canCallbackRun('keyreleased') then return end

    selectedState:keyreleased(key,unicode)
end

function stt.mousepressed(x,y,button)
    local selectedState = availableStates[CURRENT_STATE]
    if not canCallbackRun('mousepressed') then return end

    selectedState:mousepressed(x,y,button)
end
function stt.mousereleased(x,y,button)
    local selectedState = availableStates[CURRENT_STATE]
    if not canCallbackRun('mousereleased') then return end

    selectedState:mousereleased(x,y,button)
end
function stt.mousemoved(x,y,dx,dy,isTouch)
    local selectedState = availableStates[CURRENT_STATE]
    if not canCallbackRun('mousemoved') then return end

    selectedState:mousemoved(x,y,dx,dy,isTouch)
end

------------------ FRUITFUL/MISC FUNCTIONS ------------------
function stt.getCurrentState(dataFile)
    if dataFile then return availableStates[CURRENT_STATE] end
    return CURRENT_STATE
end
function stt.getStates()
    return availableStates
end

return stt
