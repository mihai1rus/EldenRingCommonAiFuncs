--****************************************************************************************************************************************************************************************************************************************--
-- I've increased the maximum number of acts from 50 to 500 (only for enemies, CommonNPC was always at 500 so don't change that) and replaced an i = 50 with a break in Common_Battle_Activate but everything else here should be the same. 
--****************************************************************************************************************************************************************************************************************************************--

function Common_Clear_Param(probabilities, acts)
    for actNum = 1, 500 do
        probabilities[actNum] = 0
        acts[actNum] = nil
    end
end

function Common_Battle_Activate(ai, goal, probabilities, acts, actAfter)
    local actionFuncs = {}
    local actionWeights = {}
    local totalWeight = 0
    local actMax = 500
    for i = 1, actMax do
        if acts[i] then
            actionFuncs[i] = acts[i]
        else
            actionFuncs[i] = REGIST_FUNC(ai, goal, errorAct)
        end
        actionWeights[i] = probabilities[i] or 0
        totalWeight = totalWeight + actionWeights[i]
    end

    local actionReturnValue = 0
    local forcedIndex = ai:DbgGetForceActIdx()
    if forcedIndex > 0 and forcedIndex <= actMax then
        actionReturnValue = actionFuncs[forcedIndex]()
        ai:DbgSetLastActIdx(forcedIndex)
    else
        local random = ai:GetRandam_Int(1, totalWeight)
        local cumulativeWeight = 0
        for i = 1, actMax do
            cumulativeWeight = cumulativeWeight + actionWeights[i]
            if random <= cumulativeWeight then
                actionReturnValue = actionFuncs[i]()
                ai:DbgSetLastActIdx(i)
                break
            end
        end
    end

    local actAfterChance = ai:GetRandam_Int(1, 100)
    if actionReturnValue == nil or actAfter == nil then
        actionReturnValue = 0
    end
    if actAfterChance <= actionReturnValue then
        actAfter()
    end
end

function errorAct(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_ErrorNotification, 5, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Common_Battle_Activate_ForCommonNPC(ai, goal, probabilities, acts, actAfter)
    local actionFuncs = {}
    local actionWeights = {}
    local totalWeight = 0
    local actMax = 500
    for i = 1, actMax do
        if acts[i] then
            actionFuncs[i] = acts[i]
        else
            actionFuncs[i] = REGIST_FUNC(ai, goal, errorAct)
        end
        actionWeights[i] = probabilities[i] or 0
        totalWeight = totalWeight + actionWeights[i]
    end

    local actionReturnValue = 0
    local forcedActionIndex = ai:DbgGetForceActIdx()
    if forcedActionIndex > 0 and forcedActionIndex <= actMax then
        actionReturnValue = actionFuncs[forcedActionIndex]()
        ai:DbgSetLastActIdx(forcedActionIndex)
    else
        local random = ai:GetRandam_Int(1, totalWeight)
        local cumulativeWeight = 0
        for i = 1, actMax do
            if actionWeights[i] ~= nil then
                cumulativeWeight = cumulativeWeight + actionWeights[i]
                if random <= cumulativeWeight then
                    actionReturnValue = actionFuncs[i]()
                    ai:DbgSetLastActIdx(i)
                    break
                end
            end
        end
    end

    local actAfterChance = ai:GetRandam_Int(1, 100)
    if actionReturnValue == nil or actAfter == nil then
        actionReturnValue = 0
    end
    if actAfterChance <= actionReturnValue then
        actAfter()
    end
end

function ResetActPerArr_ForCommonNPC(probabilities)
    for actNum = 1, 500, 1 do
        if probabilities[actNum] ~= nil then
            probabilities[actNum] = 0
        else
        end
    end
    return probabilities
    

end


