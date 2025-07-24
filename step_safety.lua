RegisterTableGoal(GOAL_COMMON_StepSafety, "StepSafety")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_COMMON_StepSafety, true)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_StepSafety, 0, "?O?X?e?b?v?D??x", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_StepSafety, 1, "??X?e?b?v?D??x", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_StepSafety, 2, "???X?e?b?v?D??x", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_StepSafety, 3, "?E?X?e?b?v?D??x", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_StepSafety, 4, "??????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_StepSafety, 5, "???S?`?F?b?N????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_StepSafety, 6, "?X?e?b?v?O??????", 0)
REGISTER_DBG_GOAL_PARAM(GOAL_COMMON_StepSafety, 7, "???s?s???????????????", 0)


Goal.Activate = function(self, ai, goal)
    local priorities = {}
    local directions = {} 
    local hopAnimations = {6000, 6001, 6002, 6003}
    local hopDirectionTypes = {AI_DIR_TYPE_F, AI_DIR_TYPE_B, AI_DIR_TYPE_L, AI_DIR_TYPE_R}
    local hopAngles = {0, 180, -90, 90}
    local cnt = table.getn(hopAnimations)
    local target = goal:GetParam(cnt)
    local desiredDistance = goal:GetParam(cnt + 1) 
    local turnTime = goal:GetParam(cnt + 2)
    local noHopFlag = goal:GetParam(cnt + 3)
    for i = 0, cnt - 1 do
        local priority = goal:GetParam(i)
        if priority >= 0 then
            local insertPos = table.getn(priorities) + 1
            for scanPos = 1, insertPos - 1 do
                if priorities[scanPos] < priority then
                    insertPos = scanPos
                    break
                end
            end
            table.insert(priorities, insertPos, priority)
            table.insert(directions, insertPos, i + 1)
        end
    end
    for i = 1, table.getn(priorities) do 
        local dirIdx = directions[i]
        local dirType = hopDirectionTypes[dirIdx]
        local mapRadius = ai:GetMapHitRadius(TARGET_SELF)
        local clearDist = ai:GetExistMeshOnLineDistEx(TARGET_SELF, dirType, desiredDistance + 3, mapRadius, mapRadius)
        local blockedByChr = ai:IsExistChrOnLineSpecifyAngle(TARGET_SELF, hopAngles[dirIdx], desiredDistance, AI_SPA_DIR_TYPE_TargetF)
        if desiredDistance <= clearDist and not blockedByChr then
            goal:SetNumber(0, 0)
            goal:AddSubGoal(GOAL_COMMON_SpinStep, goal:GetLife(), hopAnimations[dirIdx], target, turnTime, dirType, -1)
            return
        end
    end
    if noHopFlag == 0 then
        goal:SetNumber(0, 1)
    end
    ai:SetLastTarget(target)
end


Goal.Update = function (self, ai, goal)
    if goal:GetSubGoalNum() <= 0 then
        if goal:GetNumber(0) == 1 then
            return GOAL_RESULT_Failed
        end
        return GOAL_RESULT_Success
    end
    return GOAL_RESULT_Continue
    
end


