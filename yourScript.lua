-- Admin List (head admin으로 권한을 부여할 사용자들의 UserID나 Username을 적어주세요)
local adminList = {
    ["KR_skxbej"] = true,  -- KR_skxbej를 admin으로 설정
}

-- admin 명령어 처리
local function executeCommand(player, message)
    local args = string.split(message, " ")

    -- 사용자가 admin 권한을 가지고 있고, 명령어가 'kick'이면
    if adminList[player.Name] then
        if args[1]:lower() == "kick" and args[2] then
            local targetPlayer = game.Players:FindFirstChild(args[2])
            if targetPlayer then
                targetPlayer:Kick("You have been kicked by a head admin!")
            end
        end
    end
end

-- 플레이어가 채팅하는 메시지에 대해 처리
game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        executeCommand(player, message)
    end)
end)
