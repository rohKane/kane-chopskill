# kane-chopskill
**NP 4.0 inspired alphabet typing minigame integration into fivem the whole minigame code is from [MaximilianAdF/NoPixel-MiniGames-4.0)](https://github.com/MaximilianAdF/NoPixel-MiniGames-4.0) so all credit goes to them and also the method that i used to do this integration is from [cinquina/five-repairkit](https://github.com/cinquina/five-repairkit/tree/main) so credit goes to them aswell.**

## Preview
![image](https://github.com/user-attachments/assets/990cd463-9405-48fe-9da1-54072b4f2b9b)

```
--- Single Minigame export method ---
RegisterCommand('testkanechop1', function() 
    local minigame = exports["kane-chopskill"]:Minigame()
    if minigame then 
        print('User won the minigame')
    else
        print('User lost the minigame')
    end
end)
```

```
--- Multiple Minigame export method ---
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
```

>**Please check out more of my scripts here thank you**
>* [[QBCore] Kne Mosley Job](https://forum.cfx.re/t/qbcore-kne-mosley-job/5220135)
>* [[Standalone] NP 4.0 Inspired Vehicle Control Menu](https://forum.cfx.re/t/standalone-inspired-vehicle-control-menu/5206672)
