function common10000_Logic(ai)
    COMMON_Initialize(ai)
    if COMMON_EasySetup_Initial(ai) == false then
        local event = ai:GetEventRequest()
        if event == 100 then
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 5, POINT_INITIAL, 0.5, TARGET_SELF, true, -1)
        elseif event == 110 then
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 5, POINT_INITIAL, 0.5, TARGET_SELF, false, -1)
        elseif event == 80 and ai:IsNpcPlayer() == true then
            local event1 = ai:GetEventRequest(1)
            ai:AddTopGoal(GOAL_COMMON_Wait, 0.5, TARGET_NONE)
            ai:AddTopGoal(GOAL_COMMON_WaitWithAnime, 10, 1000 + event1, TARGET_NONE)
        elseif RideRequest(ai, 10, 6) then
            ai:AddTopGoal(GOAL_COMMON_Mount, 4, 1.2)
        else
            COMMON_EasySetup3(ai)
        end
    end
end

function common10000_Interupt(ai, goal)
    return false 
end


