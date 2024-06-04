--- Logic ---
local result = nil

exports('Minigame', function()
    result = nil
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = 'start'
    }) 
    while result == nil do 
        Wait(100)
    end
    SetNuiFocus(false, false)
    return result
end)

RegisterNUICallback('GetResult', function(data, cb)
    result = data
    cb()
end)



--- EXAMPLE LOL ---
RegisterCommand('testkanechop1', function() 
    local minigame = exports["kane-chopskill"]:Minigame()
    if minigame then 
        print('User won the minigame')
    else
        print('User lost the minigame')
    end
end)

local minigameCompletions = 0

RegisterCommand('testkanechop2', function() 
    local function RunMinigame()
        local minigame = exports["kane-chopskill"]:Minigame()
        if minigame then 
            minigameCompletions = minigameCompletions + 1
            if minigameCompletions == 2 then
                print('User won the minigame')
                minigameCompletions = 0 -- Reset completions for the next round
            else
                Citizen.Wait(1000)
                RunMinigame() -- Show another minigame
            end
        else
            minigameCompletions = 0 -- Reset completions for the next round
            print('User lost the minigame')
        end
    end

    RunMinigame() -- Start the first minigame
end)
