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


function errorAct(f3_arg0, ai, f3_arg2)
    ai:AddSubGoal(GOAL_COMMON_ErrorNotification, 5, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function Common_Battle_Activate_ForCommonNPC(ai, goal, probabilities, acts, actAfter)
    local f4_local0 = {}
    local f4_local1 = {}
    local max = 0
    local f4_local3 = 1
    for f4_local4 = 1, 500, 1 do
        if acts[f4_local4] ~= nil then
            f4_local0[f4_local4] = acts[f4_local4]
        else
            f4_local0[f4_local4] = REGIST_FUNC(ai, goal, errorAct)
        end
        if probabilities[f4_local4] ~= nil then
            if probabilities[f4_local4] < 0 then
                f4_local1[f4_local4] = 0
            else
                f4_local1[f4_local4] = probabilities[f4_local4]
                max = max + f4_local1[f4_local4]
            end
        else
        end
    end
    local f4_local4 = 0
    local f4_local5 = ai:DbgGetForceActIdx()
    if 0 < f4_local5 and f4_local5 <= 500 then
        f4_local4 = f4_local0[f4_local5]()
        ai:DbgSetLastActIdx(f4_local5)
    else
        local random = ai:GetRandam_Int(1, max)
        local f4_local7 = 0
        local f4_local8 = 1
        for f4_local9 = 1, 500, 1 do
            if f4_local1[f4_local9] ~= nil then
                f4_local7 = f4_local7 + f4_local1[f4_local9]
                if random <= f4_local7 then
                    f4_local4 = f4_local0[f4_local9]()
                    ai:DbgSetLastActIdx(f4_local9)
                    f4_local9 = 500
                else
                end
            end
        end
    end
    local random = ai:GetRandam_Int(1, 100)
    if f4_local4 == nil or actAfter == nil then
        f4_local4 = 0
    end
    if random <= f4_local4 then
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


