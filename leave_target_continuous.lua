REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTarget_Continuous, 0, "??????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTarget_Continuous, 1, "???B???�c??", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTarget_Continuous, 2, "??????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTarget_Continuous, 3, "??????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTarget_Continuous, 4, "?K?[?h???", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTarget_Continuous, 5, "?K?[?h?I??????I??????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTarget_Continuous, 6, "?K?[?h???????s??????????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_LeaveTarget_Continuous, 7, "?p?X?`?F?b?N???s??????", 0)

function LeaveTargetContinuous_Activate(ai, goal)
    local moveTarget = goal:GetParam(0)
    local stopDistance = goal:GetParam(1)
    local turnTarget = goal:GetParam(2)
    local walk = goal:GetParam(3)
    local guardStateId = goal:GetParam(4)
    local guardEndType = goal:GetParam(5)
    local guardSuccessOnEnd = goal:GetParam(6)
    local spaceCheckDistance = goal:GetParam(7)
    goal:SetNumber(0, 0)
    goal:AddSubGoal(GOAL_COMMON_LeaveTargetToPathEnd, -1, moveTarget, 9999, turnTarget, walk, guardStateId, guardEndType, guardSuccessOnEnd, spaceCheckDistance)
    
end

function LeaveTargetContinuous_Update(ai, goal)
    local target = goal:GetParam(0)
    local distance = goal:GetParam(1)
    local turnTarget = goal:GetParam(2)
    local walk = goal:GetParam(3)
    local guardStateId = goal:GetParam(4)
    local guardEndType = goal:GetParam(5)
    local guardSuccessOnEnd = goal:GetParam(6)
    local maxDistToWall = goal:GetParam(7)
    local result = GOAL_RESULT_Continue
    if distance < ai:GetDist(target) then
        return GOAL_RESULT_Success
    end
    if goal:GetSubGoalNum() <= 0 then
        if goal:GetNumber(0) == 0 then
            local orientation = {AI_DIR_TYPE_BL, AI_DIR_TYPE_BR, AI_DIR_TYPE_L, AI_DIR_TYPE_R}
            local directions = {225, 135, 270, 90}
            local hasSpace = false
            for i = 1, 4 do
                local random = ai:GetRandam_Int(1, table.getn(orientation))
                hasSpace = SpaceCheck(ai, goal, directions[random], maxDistToWall)
                ai:SetAIFixedMoveTarget(TARGET_SELF, orientation[random], 5)
                table.remove(orientation, random)
                table.remove(directions, random)
                if hasSpace == true then
                    break
                end
            end
            if hasSpace == true then
                goal:AddSubGoal(GOAL_COMMON_Turn, 3, POINT_AI_FIXED_POS)
            else
                ai:SetAIFixedMoveTarget(TARGET_SELF, AI_DIR_TYPE_B, 5)
                goal:AddSubGoal(GOAL_COMMON_Turn, 3, POINT_AI_FIXED_POS)
            end
            goal:SetNumber(0, 1)

        elseif goal:GetTimer(0) <= 0 then
            ai:SetAIFixedMoveTarget(TARGET_SELF, AI_DIR_TYPE_B, 1)
            goal:AddSubGoal(GOAL_COMMON_LeaveTargetToPathEnd, -1, POINT_AI_FIXED_POS, 9999, turnTarget, walk, guardStateId, guardEndType, guardSuccessOnEnd, maxDistToWall)
            goal:SetTimer(0, 1)
            goal:SetNumber(0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_NONE, 0, 0, 0)
        end
    end
    return result
    
end

function LeaveTargetContinuous_Terminate(ai, goal)
    
end

REGISTER_GOAL_NO_INTERUPT(GOAL_COMMON_LeaveTarget_Continuous, true)

function LeaveTargetContinuous_Interupt(ai, goal)
    return false
    
end


