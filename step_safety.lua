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

    
    local stepActions = {
        { animId = 6000, dir = AI_DIR_TYPE_F, angle = 0 },
        { animId = 6001, dir = AI_DIR_TYPE_B, angle = 180 },
        { animId = 6002, dir = AI_DIR_TYPE_L, angle = -90 },
        { animId = 6003, dir = AI_DIR_TYPE_R, angle = 90 },
    }
    local numDirs = table.getn(stepActions)

    local target = goal:GetParam(numDirs)
    local stepDist = goal:GetParam(numDirs + 1)
    local turnTime = goal:GetParam(numDirs + 2)
    local fallback = goal:GetParam(numDirs + 3)

    local sorted = {}
    for i = 0, numDirs - 1 do
        local param = goal:GetParam(i)
        if param >= 0 then
            local entry = { param = param, index = i + 1 }
            local insertAt = table.getn(sorted) + 1
            for j = 1, table.getn(sorted) do
                if sorted[j].param < param then
                    insertAt = j
                    break
                end
            end
            table.insert(sorted, insertAt, entry)
        end
    end

    local radius = ai:GetMapHitRadius(TARGET_SELF)
    for i = 1, table.getn(sorted) do
        local action = stepActions[sorted[i].index]
        local meshClear = stepDist <= ai:GetExistMeshOnLineDistEx(TARGET_SELF, action.dir, stepDist + 3, radius, radius)
        local chrClear = not ai:IsExistChrOnLineSpecifyAngle(TARGET_SELF, action.angle, stepDist, AI_SPA_DIR_TYPE_TargetF)
        if meshClear and chrClear then
            goal:SetNumber(0, 0)
            goal:AddSubGoal(GOAL_COMMON_SpinStep, goal:GetLife(), action.animId, target, turnTime, action.dir, -1)
            ai:SetLastTarget(target)
            return
        end
    end

    if fallback == 0 then
        goal:SetNumber(0, 1)
    end
    ai:SetLastTarget(target)
end

Goal.Update = function(self, ai, goal)
    if goal:GetSubGoalNum() <= 0 then
        if goal:GetNumber(0) == 1 then
            return GOAL_RESULT_Failed
        end
        return GOAL_RESULT_Success
    end
    return GOAL_RESULT_Continue
end