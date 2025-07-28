--**********************************************************************************************************--
-- Huge thanks to ElaDiDu for checking these out and making sure I didn't put out bad code :P 
-- The new funcs are at the end. Check the 789000_battle.lua file included to see how most of them are used.
--**********************************************************************************************************--

function RideRequest(ai, maxMountDist, minEnemyDist)
    if ai:IsRiding(TARGET_SELF) == true then
        return false
    end
    if ai:GetTimer(13) > 0 then
        return false
    end
    local hasTarget = ai:IsSearchTarget(TARGET_ENE_0)
    if minEnemyDist > 0 and hasTarget == true and ai:GetDist(TARGET_ENE_0) <= minEnemyDist then
        return false
    end
    if ai:HasSpecialEffectId(TARGET_SELF, PLAN_SP_EFFECT_HORSE_RIDE) == true then
        if ai:IsBattleState() == false and ai:IsSearchHighState() == false and ai:IsSearchLowState() == false and ai:IsCautionState() == false and ai:IsMemoryState() == false then
            return false
        end
    elseif ai:HasSpecialEffectId(TARGET_SELF, PLAN_SP_EFFECT_FACILITY_RIDE) == true then
        if ai:IsBattleState() == true or ai:IsSearchHighState() == true or ai:IsSearchLowState() == true or ai:IsCautionState() == true or ai:IsMemoryState() == true then
            return false
        end
    else
        return false
    end
    if ai:ReserveRide(maxMountDist) == true then
        return true
    end
    return false
end

function FearOfFire(ai, goal, idleType)
    if ai:HasSpecialEffectAttribute(TARGET_ENE_0, SP_EFFECT_TYPE_BEAST_REPELLENT) and 
       ai:HasSpecialEffectAttribute(TARGET_SELF, SP_EFFECT_TYPE_ENABLE_BEAST_REPELLENT) and 
       ai:HasSpecialEffectId(TARGET_SELF, PLAN_SP_EFFECT_BEAST_REPELLENT_UNDAMAGED) and 
       ai:GetStringIndexedNumber("DisableFearOfFire") == 0 then
        idleType = idleType or PLAN_SIDEWAYTYPE__NONE
        if idleType == PLAN_SIDEWAYTYPE__NONE then
            goal:AddSubGoal(GOAL_COMMON_SideWay_For_Fear_Of_Fire, -1, 10, -1, false)
        elseif idleType == PLAN_SIDEWAYTYPE__DEFAULT then
            goal:AddSubGoal(GOAL_COMMON_SideWay_For_Fear_Of_Fire, -1, 7, -1, true)
        elseif idleType == PLAN_SIDEWAYTYPE__GUARD then
            goal:AddSubGoal(GOAL_COMMON_SideWay_For_Fear_Of_Fire, -1, 7, 9910, true)
        elseif idleType == PLAN_SIDEWAYTYPE__PARRY then
            goal:AddSubGoal(GOAL_COMMON_SideWay_For_Fear_Of_Fire, -1, 7, 9920, true)
        end
        return true
    end
    return false
end

function CommonNPC_ChangeWepL1(ai, goal)
    local leftWeapon = ai:GetEquipWeaponIndex(ARM_L)
    if WEP_Primary ~= leftWeapon then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_ChangeWep_L1, TARGET_NONE, DIST_None)
    end
end

function CommonNPC_ChangeWepR1(ai, goal)
    local rightWeapon = ai:GetEquipWeaponIndex(ARM_R)
    if WEP_Primary ~= rightWeapon then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_ChangeWep_R1, TARGET_NONE, DIST_None)
    end
end

function CommonNPC_ChangeWepL2(ai, goal)
    local leftWeapon = ai:GetEquipWeaponIndex(ARM_L)
    if WEP_Secondary ~= leftWeapon then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_ChangeWep_L2, TARGET_NONE, DIST_None)
    end
end

function CommonNPC_ChangeWepR2(ai, goal)
    local rightWeapon = ai:GetEquipWeaponIndex(ARM_R)
    if WEP_Secondary ~= rightWeapon then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_ChangeWep_R2, TARGET_NONE, DIST_None)
    end
end

function CommonNPC_SwitchBothHandMode(ai, goal)
    if not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_ChangeStyleR, TARGET_NONE, DIST_None)
    end
    
end

function CommonNPC_SwitchOneHandMode(ai, goal)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_ChangeStyleR, TARGET_NONE, DIST_None)
    end
    
end

function NPC_Approach_Act_Flex(ai, goal, stopDistance, runChanceDistance, forceRunDistance, runChance, guardChance, walkLife, runLife)
    walkLife = walkLife or 3
    runLife = runLife or 8
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local shouldWalk = not (currentDistance >= forceRunDistance or
        (currentDistance >= runChanceDistance and random <= runChance))
    local guardRoll = ai:GetRandam_Int(1, 100)
    local guardStateId = guardRoll <= guardChance and 4 or -1
    if stopDistance <= currentDistance then
        local approachLife = shouldWalk and walkLife or runLife
        local distApproach = shouldWalk and "AddDistWalk" or "AddDistRun"
        stopDistance = stopDistance + ai:GetStringIndexedNumber(distApproach)
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, approachLife, TARGET_ENE_0, stopDistance, TARGET_SELF, shouldWalk, guardStateId)
    end
end


function NPC_KATATE_Switch(ai, goal)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_NonspinningComboAttack, 10, NPC_ATK_ChangeStyleR, TARGET_ENE_0, DIST_None, 0)
    end
    
end

function NPC_RYOUTE_Switch(ai, goal)
    if not ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_NonspinningComboAttack, 10, NPC_ATK_ChangeStyleR, TARGET_ENE_0, DIST_None, 0)
    end
    
end

function Damaged_StepCount_NPCPlayer(ai, goal, reactionDistance, reactionChance, followupChance, followupAnimation, stepBackChance, stepLeftChance, stepRightChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local stepDirectionRoll = ai:GetRandam_Int(1, 100)
    local followupRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_Damaged) and currentDistance < reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        if stepDirectionRoll <= stepBackChance then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_StepB, TARGET_ENE_0, DIST_None, 0)
        elseif stepDirectionRoll <= stepBackChance + stepLeftChance then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_StepL, TARGET_ENE_0, DIST_None, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_StepR, TARGET_ENE_0, DIST_None, 0)
        end
        if followupRoll <= followupChance then
            goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, followupAnimation, TARGET_ENE_0, DIST_Middle, 0)
        end
        return true
    end
end


function FindAttack_Step_NPCPlayer(ai, goal, reactionDistance, reactionChance, stepBackChance, stepLeftChance, stepRightChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local stepDirectionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_FindAttack) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        if stepDirectionRoll <= stepBackChance then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_StepB, TARGET_ENE_0, DIST_None, 0)
        elseif stepDirectionRoll <= stepBackChance + stepLeftChance then
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_StepL, TARGET_ENE_0, DIST_None, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_Attack, 10, NPC_ATK_StepR, TARGET_ENE_0, DIST_None, 0)
        end
        return true
    end
end

function FindAttack_Act(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_FindAttack) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end


function FindAttack_Step(ai, goal, reactionDistance, reactionChance, stepBackChance, stepLeftChance, stepRightChance, safetyDistance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local stepDirectionRoll = ai:GetRandam_Int(1, 100)
    local backChance = stepBackChance or 50
    local leftChance = stepLeftChance or 25
    local rightChance = stepRightChance or 25
    local minSafeDistance = safetyDistance or 3
    if ai:IsInterupt(INTERUPT_FindAttack) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        if stepDirectionRoll <= backChance then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, minSafeDistance)
        elseif stepDirectionRoll <= backChance + leftChance then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6002, TARGET_ENE_0, 0, AI_DIR_TYPE_L, minSafeDistance)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6003, TARGET_ENE_0, 0, AI_DIR_TYPE_R, minSafeDistance)
        end
        return true
    end
end

function FindAttack_Guard(ai, goal, reactionDistance, reactionChance, retreatChance, retreatDuration, retreatDistance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local retreatTypeRoll = ai:GetRandam_Int(1, 100)
    local retreatProbability = retreatChance or 40
    local life = retreatDuration or 4
    local safeDistance = retreatDistance or 3
    if ai:IsInterupt(INTERUPT_FindAttack) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        if retreatTypeRoll <= retreatProbability then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life, TARGET_ENE_0, safeDistance, TARGET_ENE_0, true, 9910)
        else
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life, TARGET_ENE_0, safeDistance, TARGET_ENE_0, true, 9910)
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, life, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
        end
        return true
    end
end

function FindAttack_Step_or_Guard(ai, goal, reactionDistance, reactionChance, stepChance, stepBackChance, stepLeftChance, stepRightChance, safetyDistance, retreatChance, retreatDuration, retreatDistance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local actionTypeRoll = ai:GetRandam_Int(1, 100)
    local stepDirectionRoll = ai:GetRandam_Int(1, 100)
    local backChance = stepBackChance or 50
    local leftChance = stepLeftChance or 25
    local rightChance = stepRightChance or 25
    local minSafeDistance = safetyDistance or 3
    local retreatProbability = retreatChance or 40
    local life = retreatDuration or 4
    local safeDistance = retreatDistance or 3
    if ai:IsInterupt(INTERUPT_FindAttack) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        if actionTypeRoll <= stepChance then
            goal:ClearSubGoal()
            if stepDirectionRoll <= backChance then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, minSafeDistance)
            elseif stepDirectionRoll <= backChance + leftChance then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6002, TARGET_ENE_0, 0, AI_DIR_TYPE_L, minSafeDistance)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6003, TARGET_ENE_0, 0, AI_DIR_TYPE_R, minSafeDistance)
            end
            return true
        else
            goal:ClearSubGoal()
            if stepDirectionRoll <= retreatProbability then
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life, TARGET_ENE_0, safeDistance, TARGET_ENE_0, true, 9910)
            else
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life, TARGET_ENE_0, safeDistance, TARGET_ENE_0, true, 9910)
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, life, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
            end
            return true
        end
    end
end

function Damaged_Act(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_Damaged) and currentDistance < reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end

function Damaged_Guard(ai, goal, reactionDistance, reactionChance, retreatChance, retreatDuration, retreatDistance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local retreatTypeRoll = ai:GetRandam_Int(1, 100)
    local retreatProbability = retreatChance or 40
    local life = retreatDuration or 4
    local safeDistance = retreatDistance or 3
    if ai:IsInterupt(INTERUPT_Damaged) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        if retreatTypeRoll <= retreatProbability then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life, TARGET_ENE_0, safeDistance, TARGET_ENE_0, true, 9910)
        else
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life, TARGET_ENE_0, safeDistance, TARGET_ENE_0, true, 9910)
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, life, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
        end
        return true
    end
end

function Damaged_Step(ai, goal, reactionDistance, reactionChance, stepBackChance, stepLeftChance, stepRightChance, safetyDistance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local stepDirectionRoll = ai:GetRandam_Int(1, 100)
    local backChance = stepBackChance or 50
    local leftChance = stepLeftChance or 25
    local rightChance = stepRightChance or 25
    local minSafeDistance = safetyDistance or 3
    if ai:IsInterupt(INTERUPT_Damaged) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        if stepDirectionRoll <= backChance then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, minSafeDistance)
        elseif stepDirectionRoll <= backChance + leftChance then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6002, TARGET_ENE_0, 0, AI_DIR_TYPE_L, minSafeDistance)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6003, TARGET_ENE_0, 0, AI_DIR_TYPE_R, minSafeDistance)
        end
        return true
    end
end

function Damaged_Step_or_Guard(ai, goal, reactionDistance, reactionChance, stepChance, stepBackChance, stepLeftChance, stepRightChance, safetyDistance, retreatChance, retreatDuration, retreatDistance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local actionTypeRoll = ai:GetRandam_Int(1, 100)
    local stepDirectionRoll = ai:GetRandam_Int(1, 100)
    local backChance = stepBackChance or 50
    local leftChance = stepLeftChance or 25
    local minSafeDistance = safetyDistance or 3
    local retreatProbability = retreatChance or 40
    local life = retreatDuration or 4
    local safeDistance = retreatDistance or 3
    if ai:IsInterupt(INTERUPT_Damaged) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        if actionTypeRoll <= stepChance then
            goal:ClearSubGoal()
            if stepDirectionRoll <= backChance then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, minSafeDistance)
            elseif stepDirectionRoll <= backChance + leftChance then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6002, TARGET_ENE_0, 0, AI_DIR_TYPE_L, minSafeDistance)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6003, TARGET_ENE_0, 0, AI_DIR_TYPE_R, minSafeDistance)
            end
            return true
        else
            goal:ClearSubGoal()
            if stepDirectionRoll <= retreatProbability then
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life, TARGET_ENE_0, safeDistance, TARGET_ENE_0, true, 9910)
            else
                goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life, TARGET_ENE_0, safeDistance, TARGET_ENE_0, true, 9910)
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, life, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, 9910)
            end
            return true
        end
    end
end

function GuardBreak_Act(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_GuardBreak) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end

function GuardBreak_Attack(ai, goal, reactionDistance, reactionChance, attackAnimation)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_GuardBreak) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, attackAnimation, TARGET_ENE_0, DIST_Middle, 0)
        return true
    end
    return false
end

function MissSwing_Int(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_MissSwing) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end

function MissSwing_Attack(ai, goal, reactionDistance, reactionChance, attackAnimation)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_MissSwing) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, attackAnimation, TARGET_ENE_0, DIST_Middle, 0)
        return true
    end
    return false
end

function UseItem_Act(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_UseItem) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end

function Shoot_1kind(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_Shoot) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end

function Shoot_2dist(ai, goal, closeRangeDistance, midRangeDistance, closeRangeChance, midRangeChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_Shoot) then
        if currentDistance <= closeRangeDistance then
            if reactionRoll <= closeRangeChance then
                goal:ClearSubGoal()
                return 1
            end
        elseif currentDistance <= midRangeDistance then
            if reactionRoll <= midRangeChance then
                goal:ClearSubGoal()
                return 2
            end
        else
            return 0
        end
    end
    return 0
end

function MissSwingSelf_Step(ai, goal, reactionChance, stepBackChance, stepLeftChance, stepRightChance, safetyDistance)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local stepDirectionRoll = ai:GetRandam_Int(1, 100)
    local backChance = stepBackChance or 50
    local leftChance = stepLeftChance or 25
    local minSafeDistance = safetyDistance or 3
    if ai:IsInterupt(INTERUPT_MissSwingSelf) and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        if stepDirectionRoll <= backChance then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, minSafeDistance)
        elseif stepDirectionRoll <= backChance + leftChance then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6002, TARGET_ENE_0, 0, AI_DIR_TYPE_L, minSafeDistance)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6003, TARGET_ENE_0, 0, AI_DIR_TYPE_R, minSafeDistance)
        end
        return true
    end
end

function RebByOpGuard_Step(ai, goal, reactionChance, stepBackChance, stepLeftChance, stepRightChance, safetyDistance)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local stepDirectionRoll = ai:GetRandam_Int(1, 100)
    local backChance = stepBackChance or 50
    local leftChance = stepLeftChance or 25
    local minSafeDistance = safetyDistance or 3
    if ai:IsInterupt(INTERUPT_ReboundByOpponentGuard) and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        if stepDirectionRoll <= backChance then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, minSafeDistance)
        elseif stepDirectionRoll <= backChance + leftChance then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6002, TARGET_ENE_0, 0, AI_DIR_TYPE_L, minSafeDistance)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6003, TARGET_ENE_0, 0, AI_DIR_TYPE_R, minSafeDistance)
        end
        return true
    end
end

function SuccessGuard_Act(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_SuccessGuard) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end

function SuccessGuard_Attack(ai, goal, reactionDistance, reactionChance, attackAnimation)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_SuccessGuard) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, attackAnimation, TARGET_ENE_0, DIST_Middle, 0)
        return true
    end
    return false
end

function FarDamaged_Act(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_Damaged) and reactionDistance <= currentDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end

function MissSwing_Act(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_MissSwing) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end

function FindGuardBreak_Act(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_GuardBreak) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end

function FindGuardFinish_Act(ai, goal, reactionDistance, reactionChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_GuardFinish) and currentDistance <= reactionDistance and reactionRoll <= reactionChance then
        goal:ClearSubGoal()
        return true
    end
    return false
end

function FindShoot_Act(ai, goal, closeRangeChance, midRangeChance, farRangeChance, closeRangeDistance, midRangeDistance, farRangeDistance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    if ai:IsInterupt(INTERUPT_Shoot) then
        if currentDistance <= closeRangeDistance and reactionRoll <= closeRangeChance then
            goal:ClearSubGoal()
            return 1
        elseif currentDistance <= midRangeDistance and reactionRoll <= midRangeChance then
            goal:ClearSubGoal()
            return 2
        elseif currentDistance <= farRangeDistance and reactionRoll <= farRangeChance then
            goal:ClearSubGoal()
            return 3
        else
            goal:ClearSubGoal()
            return 0
        end
    end
    return 0
end

function BusyApproach_Act(ai, goal, stopDistance, runStartDistance, guardChance)
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    if runStartDistance <= currentDistance then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, stopDistance, TARGET_SELF, false, guardStateId)
    else
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, TARGET_ENE_0, stopDistance, TARGET_SELF, true, guardStateId)
    end
end

function Approach_and_Attack_Act(ai, goal, stopDistance, runStartDistance, guardChance, attackAnimation, successDistance, turnTime, turnAngle)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local shouldWalk = not (runStartDistance <= currentDistance)
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    local turnLife = turnTime or 1.5
    local turnAngleDegrees = turnAngle or 20
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, stopDistance, TARGET_SELF, shouldWalk, guardStateId)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 10, attackAnimation, TARGET_ENE_0, successDistance, turnLife, turnAngleDegrees)
end

function KeepDist_and_Attack_Act(ai, goal, minDistance, maxDistance, runStartDistance, guardChance, attackAnimation, successDistance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local shouldWalk = not (runStartDistance <= currentDistance)
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    goal:AddSubGoal(GOAL_COMMON_KeepDist, 10, TARGET_ENE_0, minDistance, maxDistance, TARGET_ENE_0, shouldWalk, guardStateId)
    goal:AddSubGoal(GOAL_COMMON_Attack, 10, attackAnimation, TARGET_ENE_0, successDistance, 0)
end

function Approach_and_GuardBreak_Act(ai, goal, stopDistance, runStartDistance, guardChance, guardBreakAnimation, guardBreakDistance, followupAnimation, followupDistance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local shouldWalk = not (runStartDistance <= currentDistance)
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_ENE_0, stopDistance, TARGET_SELF, shouldWalk, guardStateId)
    goal:AddSubGoal(GOAL_COMMON_GuardBreakAttack, 10, guardBreakAnimation, TARGET_ENE_0, guardBreakDistance, 0)
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, followupAnimation, TARGET_ENE_0, followupDistance, 0)
end

function GetWellSpace_Act(ai, goal, guardChance, noActionChance, sideStepChance, retreatChance, waitChance, backstepChance)
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    local actionRoll = ai:GetRandam_Int(1, 100)
    local sideStepDir = ai:GetRandam_Int(0, 1)
    local sideStepCount = ai:GetTeamRecordCount(COORDINATE_TYPE_SideWalk_L + sideStepDir, TARGET_ENE_0, 2)
    if actionRoll <= noActionChance then
    elseif actionRoll <= noActionChance + sideStepChance and sideStepCount < 2 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 2, TARGET_ENE_0, true, guardStateId)
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, sideStepDir, ai:GetRandam_Int(30, 45), true, true, guardStateId)
    elseif actionRoll <= noActionChance + sideStepChance + retreatChance then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 3, TARGET_ENE_0, true, guardStateId)
    elseif actionRoll <= noActionChance + sideStepChance + retreatChance + waitChance then
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1), 0, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
    end
end

function GetWellSpace_Act_IncludeSidestep(ai, goal, guardChance, noActionChance, sideStepChance, retreatChance, waitChance, backstepChance, sideStepBackChance)
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    local actionRoll = ai:GetRandam_Int(1, 100)
    local sideStepDir = ai:GetRandam_Int(0, 1)
    local sideStepCount = ai:GetTeamRecordCount(COORDINATE_TYPE_SideWalk_L + sideStepDir, TARGET_ENE_0, 2)
    if actionRoll <= noActionChance then
    elseif actionRoll <= noActionChance + sideStepChance and sideStepCount < 2 then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 2, TARGET_ENE_0, true, guardStateId)
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, sideStepDir, ai:GetRandam_Int(30, 45), true, true, guardStateId)
    elseif actionRoll <= noActionChance + sideStepChance + retreatChance then
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 2.5, TARGET_ENE_0, 3, TARGET_ENE_0, true, guardStateId)
    elseif actionRoll <= noActionChance + sideStepChance + retreatChance + waitChance then
        goal:AddSubGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.5, 1), 0, 0, 0, 0)
    elseif actionRoll <= noActionChance + sideStepChance + retreatChance + waitChance + backstepChance then
        goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6001, TARGET_ENE_0, 0, AI_DIR_TYPE_B, 4)
    else
        local sideStepRoll = ai:GetRandam_Int(1, 100)
        if sideStepRoll <= 50 then
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6002, TARGET_ENE_0, 0, AI_DIR_TYPE_L, 4)
        else
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 5, 6003, TARGET_ENE_0, 0, AI_DIR_TYPE_R, 4)
        end
    end
end

function Shoot_Act(ai, goal, primaryAnimation, secondaryAnimation, comboCount)
    if comboCount == 1 then
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, primaryAnimation, TARGET_ENE_0, DIST_None, 0)
        return
    end
    goal:AddSubGoal(GOAL_COMMON_ComboAttack, 10, primaryAnimation, TARGET_ENE_0, DIST_None, 0)
    for i = 3, math.min(comboCount, 5) do
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 10, secondaryAnimation, TARGET_ENE_0, DIST_None, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_ComboFinal, 10, secondaryAnimation, TARGET_ENE_0, DIST_None, 0)
end


function Approach_Act(ai, goal, stopDistance, runStartDistance, guardChance, life)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local shouldWalk = not (runStartDistance <= currentDistance)
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, life or 10, TARGET_ENE_0, stopDistance, TARGET_SELF, shouldWalk, guardStateId)
end

function Approach_or_Leave_Act(ai, goal, approachDistance, safeDistance, runStartDistance, guardChance)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local shouldWalk = not (runStartDistance ~= -1 and runStartDistance <= currentDistance)
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    if approachDistance <= currentDistance then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, approachDistance, TARGET_SELF, shouldWalk, guardStateId)
    else
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, safeDistance, TARGET_ENE_0, true, guardStateId)
    end
end

function Watching_Parry_Chance_Act(ai, goal)
    local firstDist = ai:GetRandam_Float(2, 4)
    local secondDist = ai:GetRandam_Float(2, 4)
    goal:AddSubGoal(GOAL_COMMON_KeepDist, 5, TARGET_ENE_0, firstDist, firstDist + 0.5, TARGET_ENE_0, true, 9920)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 5), TARGET_ENE_0, ai:GetRandam_Int(0, 1), 180, true, true, 9920)
    goal:AddSubGoal(GOAL_COMMON_KeepDist, 5, TARGET_ENE_0, secondDist, secondDist + 0.5, TARGET_ENE_0, true, 9920)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(3, 5), TARGET_ENE_0, ai:GetRandam_Int(0, 1), 180, true, true, 9920)
end

function Parry_Act(ai, goal, parryDistance, parryAngle, riposteDistance, riposteAngle)
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        if currentDistance <= parryDistance and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, parryAngle) and not ai:IsActiveGoal(GOAL_COMMON_Parry) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_Parry, 1.25, 4000, TARGET_SELF, 0)
            return true
        end
    elseif ai:IsInterupt(INTERUPT_SuccessParry) and currentDistance <= riposteDistance and ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_F, riposteAngle) then
        goal:ClearSubGoal()
        if currentDistance > 1 then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, 1, TARGET_SELF, false, -1)
        else
            local waitLife = 1
            goal:AddSubGoal(GOAL_COMMON_Wait, waitLife, TARGET_ENE_0)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, 3110, TARGET_ENE_0, 3, 0, -1)
        return true
    end
end

function ObserveAreaForBackstab(ai, observeId, observeAreaId, observeRadius, observeAngle)
    ai:AddObserveArea(observeAreaId, TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_B, observeAngle, observeRadius)
end

function Backstab_Act(ai, goal, observeAreaId, stopDistance, timerId, timerDuration)
    if ai:IsInterupt(INTERUPT_Inside_ObserveArea) and ai:IsThrowing() == false and ai:IsFinishTimer(timerId) == true and ai:IsInsideObserve(observeAreaId) then
        ai:SetTimer(timerId, timerDuration)
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, stopDistance, TARGET_SELF, false, -1)
        goal:AddSubGoal(GOAL_COMMON_Attack, 10, 3110, TARGET_ENE_0, 3, 0)
        return true
    end
end

function Torimaki_Act(ai, goal, guardChance)
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    if currentDistance >= 15 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, 4.5, TARGET_SELF, true, -1)
    elseif currentDistance >= 6 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, 4.5, TARGET_SELF, true, -1)
    elseif currentDistance >= 3 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, guardStateId)
    else
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 4, TARGET_ENE_0, true, guardStateId)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, guardStateId)
end

function Kankyaku_Act(ai, goal, guardChance)
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    if currentDistance >= 15 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, 6.5, TARGET_SELF, true, -1)
    elseif currentDistance >= 8 then
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, 6.5, TARGET_SELF, true, -1)
    elseif currentDistance >= 4 then
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, guardStateId)
    else
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 5, TARGET_ENE_0, 6, TARGET_ENE_0, true, guardStateId)
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 3, TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, guardStateId)
end

function ClearTableParam(probabilities, acts)
    for actNum = 1, 500, 1 do
        probabilities[actNum] = 0
        acts[actNum] = {}
    end
end

function SelectOddsIndex(ai, probabilities)
    local tableSize = table.getn(probabilities)
    local totalWeight = 0
    for i = 1, tableSize do
        totalWeight = totalWeight + probabilities[i]
    end
    local random = ai:GetRandam_Int(0, totalWeight - 1)
    for j = 1, tableSize do
        local currentWeight = probabilities[j]
        if random < currentWeight then
            return j
        end
        random = random - currentWeight
    end
    return -1
end

function SelectFunc(ai, probabilities, acts)
    local selectedIndex = SelectOddsIndex(ai, probabilities)
    if selectedIndex < 1 then
        return nil
    end
    return acts[selectedIndex]
end

function SelectGoalFunc(ai, goal, probabilities, funcTable)
    local goalFuncTable = _GetGoalActFuncTable(ai)
    return SelectFunc(ai, probabilities, goalFuncTable)
end

-- Deprecated in favour of Common_Battle_Activate
function CallAttackAndAfterFunc(ai, goal, probabilities, paramTable, afterFuncTable, afterParam)
    local selectedIndex = SelectOddsIndex(ai, probabilities)
    local afterChance = 0
    if selectedIndex >= 1 then
        local goalFuncTable = _GetGoalActFuncTable(ai)
        local afterFunc = nil
        if afterFuncTable ~= nil then
            afterFunc = afterFuncTable[selectedIndex]
        end
        afterChance = goalFuncTable[selectedIndex](ai, goal, paramTable, afterFunc)
    end
    local afterRoll = ai:GetRandam_Int(1, 100)
    if afterRoll <= afterChance then
        if ai.ActAfter ~= nil then
            ai.ActAfter(ai, goal, afterParam)
        else
            HumanCommon_ActAfter_AdjustSpace(goal, afterParam)
        end
    end
end

function _GetGoalActFuncTable(ai)
    return {
        ai.Act01, ai.Act02, ai.Act03, ai.Act04, ai.Act05, 
        ai.Act06, ai.Act07, ai.Act08, ai.Act09, ai.Act10,
        ai.Act11, ai.Act12, ai.Act13, ai.Act14, ai.Act15,
        ai.Act16, ai.Act17, ai.Act18, ai.Act19, ai.Act20
    }
end

function GetTargetAngle(ai, target)
    if ai:IsInsideTarget(target, AI_DIR_TYPE_F, 90) then
        if ai:IsInsideTarget(target, AI_DIR_TYPE_F, 90) then
            return TARGET_ANGLE_FRONT
        elseif ai:IsInsideTarget(target, AI_DIR_TYPE_L, 180) then
            return TARGET_ANGLE_LEFT
        else
            return TARGET_ANGLE_RIGHT
        end
    end
    if ai:IsInsideTarget(target, AI_DIR_TYPE_L, 90) then
        return TARGET_ANGLE_LEFT
    elseif ai:IsInsideTarget(target, AI_DIR_TYPE_R, 90) then
        return TARGET_ANGLE_RIGHT
    else
        return TARGET_ANGLE_BACK
    end
end

function GetCurrentTimeType(ai)
    local sixAM = 360
    local tenAM = 600
    local sixPM = 1080
    local eightPM = 1200
    local threeAM = 180
    local currentTime = ai:GetAreaMinute() + ai:GetAreaHour() * 60
    if sixAM <= currentTime and currentTime < tenAM then
        return PLAN_TIME_TYPE_MORNING
    elseif tenAM <= currentTime and currentTime < sixPM then
        return PLAN_TIME_TYPE_DAYTIME
    elseif sixPM <= currentTime and currentTime < eightPM then
        return PLAN_TIME_TYPE_EVENING
    elseif eightPM <= currentTime and currentTime < 1440 or currentTime >= 0 and currentTime < threeAM then
        return PLAN_TIME_TYPE_NIGHT
    elseif threeAM <= currentTime and currentTime < sixAM then
        return PLAN_TIME_TYPE_MIDNIGHT
    else
        return nil
    end
end

function IsTargetTimeZone(ai, timeType)
    local sixAM = 360
    local tenAM = 600
    local sixPM = 1080
    local eightPM = 1200
    local threeAM = 180
    local currentTime = ai:GetAreaMinute() + ai:GetAreaHour() * 60
    if timeType == PLAN_TIME_TYPE_MORNING then
        return sixAM <= currentTime and currentTime < tenAM
    elseif timeType == PLAN_TIME_TYPE_DAYTIME then
        return tenAM <= currentTime and currentTime < sixPM
    elseif timeType == PLAN_TIME_TYPE_EVENING then
        return sixPM <= currentTime and currentTime < eightPM
    elseif timeType == PLAN_TIME_TYPE_NIGHT then
        return eightPM <= currentTime and currentTime < 1440 or currentTime >= 0 and currentTime < threeAM
    elseif timeType == PLAN_TIME_TYPE_MIDNIGHT then
        return threeAM <= currentTime and currentTime < sixAM
    else
        return false
    end
end

function IsInsideTargetTimeZone(ai, timeZoneStart, timeZoneEnd)
    local loopStarted = false
    local loopEnded = false
    local timeZones = {}
    local timeZoneCount = 5
    timeZones[PLAN_TIME_TYPE_MORNING] = false
    timeZones[PLAN_TIME_TYPE_DAYTIME] = false
    timeZones[PLAN_TIME_TYPE_EVENING] = false
    timeZones[PLAN_TIME_TYPE_NIGHT] = false
    timeZones[PLAN_TIME_TYPE_MIDNIGHT] = false
    local currentType = 0
    repeat
        if currentType == timeZoneStart then
            loopStarted = true
        end
        if loopStarted then
            timeZones[currentType] = true
            if currentType == timeZoneEnd then
                loopEnded = true
            end
        end
        if currentType == timeZoneCount - 1 then
            currentType = 0
        else
            currentType = currentType + 1
        end
    until loopEnded
    return timeZones[GetCurrentTimeType(ai)]
end

function GET_PARAM_IF_NIL_DEF(param, defaultValue)
    if param ~= nil then
        return param
    end
    return defaultValue
end

function REGIST_FUNC(ai, goal, act, paramTable)
    return function()
        return act(ai, goal, paramTable)
    end
end

function Approach_Act_Flex(ai, goal, stopDistance, runChanceDistance, forceRunDistance, runChance, guardChance, walkLife, runLife)
    walkLife = walkLife or 3
    runLife = runLife or 8
    local currentDistance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local shouldWalk = not (currentDistance >= forceRunDistance or
        (currentDistance >= runChanceDistance and random <= runChance))
    local guardRoll = ai:GetRandam_Int(1, 100) 
    local guardStateId = guardRoll <= guardChance and 9910 or -1
    local approachLife = shouldWalk and walkLife or runLife
    local distanceAdjustment = 0
    if stopDistance <= currentDistance then
        local approachLife = shouldWalk and walkLife or runLife
        local distApproach = shouldWalk and "AddDistWalk" or "AddDistRun"
        stopDistance = stopDistance + ai:GetStringIndexedNumber(distApproach)
        goal:AddSubGoal(GOAL_COMMON_ApproachTarget, approachLife, TARGET_ENE_0, stopDistance, TARGET_SELF, shouldWalk, guardStateId)
    end
end

function SpaceCheck(ai, radius, direction, distance)
    local hitRadius = ai:GetMapHitRadius(TARGET_SELF)
    local hitDistance = ai:GetExistMeshOnLineDistSpecifyAngleEx(TARGET_SELF, direction, distance + hitRadius, AI_SPA_DIR_TYPE_TargetF, hitRadius, 0)
    return distance * 0.95 <= hitDistance
end

function InsideRange(ai, goal, angleStart, angleWidth, minDist, maxDist)
    return YSD_InsideRangeEx(ai, goal, angleStart, angleWidth, minDist, maxDist)
    
end

function InsideDir(ai, goal, angleStart, angleWidth)
    return YSD_InsideRangeEx(ai, goal, angleStart, angleWidth, -999, 999)
    
end

function YSD_InsideRangeEx(ai, goal, angleStart, angleWidth, minDist, maxDist)
    local distance = ai:GetDist(TARGET_ENE_0)
    if minDist <= distance and distance <= maxDist then
        local angleToTarget = ai:GetToTargetAngle(TARGET_ENE_0)
        local angleSign = 0
        angleSign = angleStart < 0 and -1 or 1
        return (angleStart + angleWidth / -2 <= angleToTarget and angleToTarget <= angleStart + angleWidth / 2) or
           (angleStart + angleWidth / -2 <= angleToTarget + 360 * angleSign and angleToTarget + 360 * angleSign <= angleStart + angleWidth / 2)
    else
        return false
    end
    
end

function SetCoolTime(actor, goals, animationIds, coolDowns, weight, weightReplan)
    coolDowns = actor:RegistAttackTimeInterval(animationIds, coolDowns)
    if weight <= 0 then
        return 0
    elseif actor:GetAttackPassedTime(animationIds) <= coolDowns then
        return weightReplan
    end
    return weight
    
end

function Counter_Act(ai, goal, baseIncrement, counterAnimation)
    baseIncrement = baseIncrement or 4
    local random = ai:GetRandam_Int(1, 100)
    local currentIncrement = ai:GetNumber(15)
    if ai:IsInterupt(INTERUPT_Damaged) then
        ai:SetTimer(15, 5)
        if currentIncrement == 0 then
            currentIncrement = baseIncrement
        end
        ai:SetNumber(15, currentIncrement * 2)
    end
    if currentIncrement >= 100 then
        ai:SetNumber(15, 100)
    end
    if ai:IsInterupt(INTERUPT_Damaged) and random <= ai:GetNumber(15) and ai:GetTimer(14) <= 0 then
        ai:SetTimer(14, 3)
        ai:SetNumber(15, 0)
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_EndureAttack, 0.5, counterAnimation, TARGET_ENE_0, DIST_None, 0, 180, 0, 0)
        return true
    end
    return false
end

function ReactBackstab_Act(ai, goal, reactionType, counterAnimation, counterChance)
    local reactionRoll = ai:GetRandam_Int(1, 100)
    local directionRoll = ai:GetRandam_Int(1, 100)
    local backStepAnim = 6000
    local leftStepAnim = 6002
    local rightStepAnim = 6003
    if counterAnimation == nil then
        counterChance = 0
    end
    if ai:IsInterupt(INTERUPT_BackstabRisk) then
        if reactionRoll <= counterChance then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_StabCounterAttack, 3, counterAnimation, TARGET_ENE_0, DIST_None, 0, 180, 0, 0)
        elseif reactionType == 1 then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, backStepAnim, TARGET_SELF, 0, AI_DIR_TYPE_F, 0)
        elseif reactionType == 2 then
            goal:ClearSubGoal()
            if directionRoll <= 50 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, leftStepAnim, TARGET_SELF, 0, AI_DIR_TYPE_L, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, rightStepAnim, TARGET_SELF, 0, AI_DIR_TYPE_R, 0)
            end
        elseif reactionType == 3 then
            goal:ClearSubGoal()
            if directionRoll <= 33 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, backStepAnim, TARGET_SELF, 0, AI_DIR_TYPE_F, 0)
            elseif directionRoll <= 66 then
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, leftStepAnim, TARGET_SELF, 0, AI_DIR_TYPE_L, 0)
            else
                goal:AddSubGoal(GOAL_COMMON_SpinStep, 3, rightStepAnim, TARGET_SELF, 0, AI_DIR_TYPE_R, 0)
            end
        end
        return false
    end
end

function Init_Pseudo_Global(ai, goal)
    ai:SetStringIndexedNumber("Dist_SideStep", 5)
    ai:SetStringIndexedNumber("Dist_BackStep", 5)
    ai:SetStringIndexedNumber("AddDistWalk", 0)
    ai:SetStringIndexedNumber("AddDistRun", 0)
    Init_AfterAttackAct(ai, goal)
    
end

function Init_AfterAttackAct(ai, goal)
    ai:SetStringIndexedNumber("DistMin_AAA", -999)
    ai:SetStringIndexedNumber("DistMax_AAA", 999)
    ai:SetStringIndexedNumber("BaseDir_AAA", AI_DIR_TYPE_F)
    ai:SetStringIndexedNumber("Angle_AAA", 360)
    ai:SetStringIndexedNumber("Odds_Guard_AAA", 0)
    ai:SetStringIndexedNumber("Odds_NoAct_AAA", 0)
    ai:SetStringIndexedNumber("Odds_BackAndSide_AAA", 0)
    ai:SetStringIndexedNumber("Odds_Back_AAA", 0)
    ai:SetStringIndexedNumber("Odds_Backstep_AAA", 0)
    ai:SetStringIndexedNumber("Odds_Sidestep_AAA", 0)
    ai:SetStringIndexedNumber("Odds_BitWait_AAA", 0)
    ai:SetStringIndexedNumber("Odds_BsAndSide_AAA", 0)
    ai:SetStringIndexedNumber("Odds_BsAndSs_AAA", 0)
    ai:SetStringIndexedNumber("DistMin_Inter_AAA", -999)
    ai:SetStringIndexedNumber("DistMax_Inter_AAA", 999)
    ai:SetStringIndexedNumber("BaseAng_Inter_AAA", 0)
    ai:SetStringIndexedNumber("Ang_Inter_AAA", 360)
    ai:SetStringIndexedNumber("BackAndSide_BackLife_AAA", 2)
    ai:SetStringIndexedNumber("BackAndSide_SideLife_AAA", ai:GetRandam_Float(2.5, 3.5))
    ai:SetStringIndexedNumber("BackLife_AAA", ai:GetRandam_Float(2, 3))
    ai:SetStringIndexedNumber("BsAndSide_SideLife_AAA", ai:GetRandam_Float(2.5, 3.5))
    ai:SetStringIndexedNumber("BackAndSide_BackDist_AAA", 1.5)
    ai:SetStringIndexedNumber("BackDist_AAA", ai:GetRandam_Float(2.5, 3.5))
    ai:SetStringIndexedNumber("BackAndSide_SideDir_AAA", ai:GetRandam_Int(45, 60))
    ai:SetStringIndexedNumber("BsAndSide_SideDir_AAA", ai:GetRandam_Int(45, 60))
    
end

function Update_Default_NoSubGoal(self, ai, goal)
    if goal:GetSubGoalNum() <= 0 then
        return GOAL_RESULT_Success
    end
    return GOAL_RESULT_Continue
    
end

function GuardGoalSubFunc_Activate(ai, goal, ezState)
    if 0 < ezState then
        ai:DoEzAction(goal, ezState)
    end
    
end

function GuardGoalSubFunc_Update(ai, goal, ezState, successResult, successResultOnLifeEnd)
    if 0 < ezState then
        if goal:GetNumber(0) ~= 0 then
            return GOAL_RESULT_Failed
        elseif goal:GetNumber(1) ~= 0 then
            return successResult
        end
    end
    if goal:GetLife() <= 0 then
        if successResultOnLifeEnd then
            return GOAL_RESULT_Success
        else
            return GOAL_RESULT_Failed
        end
    end
    return GOAL_RESULT_Continue
    
end

function GuardGoalSubFunc_Interrupt(ai, goal, ezState, successResult)
    if 0 < ezState then
        if ai:IsInterupt(INTERUPT_Damaged) then
            goal:SetNumber(0, 1)
        elseif ai:IsInterupt(INTERUPT_SuccessGuard) and successResult ~= GOAL_RESULT_Continue then
            goal:SetNumber(1, 1)
        end
    end
    return false
end



--                      Some new common funcs                               
--*************************************************************************--
-- Check the included 789000_battle.lua to see usage of most of these funcs
--*************************************************************************--




-- Original ACVI function EZOP_CActLot
function ActLotOriginal(probabilities, act, weightConditionsTrue, weightConditionsFalse, conditionOne, conditionTwo, conditionThree, conditionFour, conditionFive, conditionSix, conditionSeven, conditionEight, conditionNine, conditionTen)
    if conditionOne == nil then
        conditionOne = true
    end
    if conditionTwo == nil then
        conditionTwo = true
    end
    if conditionThree == nil then
        conditionThree = true
    end
    if conditionFour == nil then
        conditionFour = true
    end
    if conditionFive == nil then
        conditionFive = true
    end
    if conditionSix == nil then
        conditionSix = true
    end
    if conditionSeven == nil then
        conditionSeven = true
    end
    if conditionEight == nil then
        conditionEight = true
    end
    if conditionNine == nil then
        conditionNine = true
    end
    if conditionTen == nil then
        conditionTen = true
    end
    if conditionOne and conditionTwo and conditionThree and conditionFour and conditionFive and conditionSix and conditionSeven and conditionEight and conditionNine and conditionTen then
        probabilities[act] = weightConditionsTrue
    else
        probabilities[act] = weightConditionsFalse
    end
    
end

-- Simple function that allows you to assign two different weights based on up to 10 conditions. Condition inputs can be nil.
function ActLot(probabilities, act, weightConditionsTrue, weightConditionsFalse,
    c1, c2, c3, c4, c5, c6, c7, c8, c9, c10)
    local allConditionsMet = not (c1 == false or c2 == false or c3 == false
                or c4 == false or c5 == false or c6 == false
                or c7 == false or c8 == false or c9 == false
                or c10 == false)
    probabilities[act] = allConditionsMet and weightConditionsTrue or weightConditionsFalse
end

-- Allows you to remove the observe for SpEffects in a range.
function DeleteObservedSpEffectRange(ai, baseId, startId, endId, target)
    target = target or TARGET_SELF
    for i = startId, endId do
        ai:DeleteObserveSpecialEffectAttribute(target, baseId + i)
    end
end

-- Allows you to add the observe for SpEffects in a range.
function AddObservedSpEffectRange(ai, baseId, startId, endId, target)
    target = target or TARGET_SELF
    for i = startId, endId do
        ai:AddObserveSpecialEffectAttribute(target, baseId + i)
    end
end

-- [[
--    params:
--    {
--        dist (mandatory)
--        stopDistMin (default: dist)
--        stopDistMax (default: dist + 25)
--        runChance (default: 100)
--        observeEffect (default: nil)
--        observeEffectRange (default: nil)
--        startId (default: 0)
--        endId (default: 0)
--        observeTarget (default: TARGET_SELF)
--        comboRep (default: GOAL_COMMON_ComboTunable_SuccessAngle180)
--        animId (mandatory)
--        target (default: TARGET_ENE_0)
--        successDist (default: 999)
--        turnTime (default: 0)
--        turnAngle (default: 0)
--        GetWellSpacedOdds (default: 0)
--    }
-- ]]
-- Meant to act as a template for acts. This comes with an Approach_Act_Flex call to make the ai approach their target. By default it is set to sprint.
function SetupApproach(ai, goal, params)
    local stopDist = params.dist - ai:GetMapHitRadius(TARGET_SELF)
    Approach_Act_Flex(ai, goal, stopDist, params.stopDistMin or stopDist, params.stopDistMax or (stopDist + 25), params.runChance or 100, 0, 3, 3)
    local observeEffect = params.observeEffect or nil
    local observeEffectRange = params.observeEffectRange or nil
    local startId = params.startId or 0
    local endId = params.endId or 0
    if observeEffectRange then
        AddObservedSpEffectRange(ai, observeEffectRange, startId, endId, params.observeTarget or TARGET_SELF)
    elseif observeEffect then
        ai:AddObserveSpecialEffectAttribute(params.observeTarget or TARGET_SELF, observeEffect)
    end
    goal:AddSubGoal(params.comboRep and GOAL_COMMON_ComboRepeat_SuccessAngle180 or 
                   GOAL_COMMON_ComboTunable_SuccessAngle180, 
                   15, params.animId, params.target or TARGET_ENE_0, params.successDist or 999, 
                   params.turnTime or 0, params.turnAngle or 0, 0, 0)
    return params.GetWellSpacedOdds or 0
end

-- [[
--    params:
--    {
--        observeEffect (default: nil)
--        observeEffectRange (default: nil)
--        startId (default: 0)
--        endId (default: 0)
--        observeTarget (default: TARGET_SELF)
--        comboRep (default: GOAL_COMMON_ComboTunable_SuccessAngle180)
--        animId (mandatory)
--        target (default: TARGET_ENE_0)
--        successDist (default: 999)
--        turnTime (default: 0)
--        turnAngle (default: 0)
--        GetWellSpacedOdds (default: 0)
--    }
-- ]]
-- Meant to act as a template for acts. 
function SetupAttack(ai, goal, params)
    local observeEffect = params.observeEffect or nil
    local observeEffectRange = params.observeEffectRange or nil
    local startId = params.startId or 0
    local endId = params.endId or 0
    if observeEffectRange then
        AddObservedSpEffectRange(ai, observeEffectRange, startId, endId, params.observeTarget or TARGET_SELF)
    elseif observeEffect then
        ai:AddObserveSpecialEffectAttribute(params.observeTarget or TARGET_SELF, observeEffect)
    end
    goal:AddSubGoal(params.comboRep and GOAL_COMMON_ComboRepeat_SuccessAngle180 or 
                   GOAL_COMMON_ComboTunable_SuccessAngle180, 
                   15, params.animId, params.target or TARGET_ENE_0, params.successDist or 999, 
                   params.turnTime or 0, params.turnAngle or 0, 0, 0)
    return params.GetWellSpacedOdds or 0
end

-- Allows the user to set a cooldown for an act relative to multiple animations at once. 
function SetCoolTimeMultiple(actor, goals, animationIds, cooldowns, weight, weightReplan)
    local animIds = type(animationIds) == "table" and animationIds or {animationIds}
    local cdList = type(cooldowns) == "table" and cooldowns or {cooldowns}    
    if weight <= 0 then
        return 0
    end
    for i, animId in ipairs(animIds) do
        local cooldown = cdList[i] or cdList[1]
        actor:RegistAttackTimeInterval(animId, cooldown)        
        if actor:GetAttackPassedTime(animId) <= cooldown then
            return weightReplan
        end
    end   
    return weight
end

-- Processes cooldowns in order to simplify the process of setting them.
function ApplyCooldowns(ai, goal, probabilities, cooldowns)
    for act, cdData in pairs(cooldowns) do
        local animationIds, cds, weightReplan = cdData[1], cdData[2], cdData[3]
        local weight = probabilities[act]
        if type(animationIds) == "table" then
            probabilities[act] = SetCoolTimeMultiple(ai, goal, animationIds, cds, weight, weightReplan)
        else
            probabilities[act] = SetCoolTime(ai, goal, animationIds, cds, weight, weightReplan)
        end
    end
end

-- Makeshift Common_Battle_Activate function meant only to process and assign weights to acts.
function SelectSubGoal(ai, goal, probabilities)
    local totalWeight, cumulativeWeight = 0, 0
    local selectedAct = nil
    local random = nil
    for act, weight in pairs(probabilities) do
        totalWeight = totalWeight + weight
    end
    if totalWeight == 0 then 
        return nil 
    end
    random = ai:GetRandam_Int(1, totalWeight)
    for act, weight in pairs(probabilities) do
        cumulativeWeight = cumulativeWeight + weight
        if random <= cumulativeWeight then
            selectedAct = act
            break
        end
    end
    return selectedAct
end

-- Simple function meant to shorten the process of registering acts. Remember that your act names must start from Act1, not Act01 for this to work and keep your acts in order.
function RegisterEnemyActs(ai, goal, baseName, actCount, probabilities, paramTbls, acts)
    for i = 1, actCount do
        local actName = baseName.."_Act"..i
        if _G[actName] then
            acts[i] = REGIST_FUNC(ai, goal, _G[actName])
        end
    end
    local actAfter = REGIST_FUNC(ai, goal, baseName.."_ActAfter_AdjustSpace")
    Common_Battle_Activate(ai, goal, probabilities, acts, actAfter, paramTbls)
end

-- Equivalent func to one of the templates FromSoft uses for warping. 
function ControlledWarp(ai, goal, options, target)
    goal:ClearSubGoal()
    local targetRadius = ai:GetMapHitRadius(TARGET_SELF)
    for _, dirData in ipairs(options.directions) do
        if ai:GetExistMeshOnLineDistEx(target, dirData.dir, dirData.dist + targetRadius, targetRadius, 0) <= dirData.dist then
            dirData.weight = 0
        end
    end
    local totalWeight = 0
    for _, dirData in ipairs(options.directions) do
        totalWeight = totalWeight + dirData.weight
    end
    local selectedDir = AI_DIR_TYPE_F
    local selectedDist = 0
    if totalWeight > 0 then
        local random = ai:GetRandam_Int(0, totalWeight)
        local accumulatedWeight = 0
        for _, dirData in ipairs(options.directions) do
            accumulatedWeight = accumulatedWeight + dirData.weight
            if random <= accumulatedWeight then
                selectedDir = dirData.dir
                selectedDist = dirData.dist
                break
            end
        end
    end
    goal:AddSubGoal(GOAL_COMMON_ToTargetWarp, 10, target, selectedDir, selectedDist, TARGET_ENE_0)
    return true
end

-- Executes an AI script on certain actions. Essentially for Hot-Reloading AI.
function ScriptReload(ai, goal, condition, filePath)
    if condition then
        local script = loadfile(filePath)
        if script then
            script()
        end
    end
end