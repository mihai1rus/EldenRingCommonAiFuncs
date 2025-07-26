REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTargetToPathEnd, 0, "??????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTargetToPathEnd, 1, "???B???�c??", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTargetToPathEnd, 2, "??????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTargetToPathEnd, 3, "??????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTargetToPathEnd, 4, "?K?[?h???", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTargetToPathEnd, 5, "?K?[?h?I??????I??????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTargetToPathEnd, 6, "?K?[?h???????s??????????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTargetToPathEnd, 7, "?p?X?`?F?b?N???s??????", 0)

function LeaveTargetToPathEnd_Activate(ai, goal)
    local moveTarget = goal:GetParam(0)
    local stopDistance = goal:GetParam(1)
    local turnTarget = goal:GetParam(2)
    local walk = goal:GetParam(3)
    local guardStateId = goal:GetParam(4)
    local guardEndType = goal:GetParam(5)
    local guardSuccessOnEnd = goal:GetParam(6)
    goal:SetTimer(0, 1)
    local f1_local7 = goal:GetParam(1)
    goal:AddSubGoal(GOAL_COMMON_LeaveTarget, -1, moveTarget, stopDistance, turnTarget, walk, guardStateId, guardEndType, guardSuccessOnEnd)
    
end

function LeaveTargetToPathEnd_Update(ai, goal)
    local maxDistToWall = goal:GetParam(7)
    local result = GOAL_RESULT_Continue
    if true == goal:IsFinishTimer(0) then
        local hasSpace = SpaceCheck(ai, goal, 0, maxDistToWall)
        goal:SetTimer(0, 1)
        if hasSpace == false then
            result = GOAL_RESULT_Success
        end
    end
    return result
    
end

function LeaveTargetToPathEnd_Terminate(ai, goal)
    
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_LeaveTargetToPathEnd, true)

function LeaveTargetToPathEnd_Interupt(ai, goal)
    return false
    
end


