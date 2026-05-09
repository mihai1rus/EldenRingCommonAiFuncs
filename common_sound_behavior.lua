function COMMON_SoundBehavior_FlagInitialize(ai)
    if not ai:IsSearchLowState() and not ai:IsSearchHighState()
    and not ai:IsCautionState() and not ai:IsBattleState() then
        ai:SetStringIndexedNumber("COMMON_SoundBehavior_Arrived", 0)
        ai:SetStringIndexedNumber("COMMON_SoundBehavior_DoneFirstAct", 0)
    end
end

function COMMON_SoundBehavior(ai, soundBehaviour)
    
    if (soundBehaviour == 300000 or soundBehaviour == 431002) 
            and ai:IsFinishTimer(1) then

        ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 30, TARGET_SOUND, 1, TARGET_SELF, false, -1):TimingSetTimer(1, 999, AI_TIMING_SET__UPDATE_SUCCESS)
        return true
    end

    local soundDist = ai:GetDist(TARGET_SOUND)
    local random1 = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)

    if (soundBehaviour == 307000 or soundBehaviour == 410000 or soundBehaviour == 438300 or soundBehaviour == 438301 or soundBehaviour == 438302)
            and not ai:IsBattleState() then

        if soundDist >= 5 then
            if random1 <= 70 then
                ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_SOUND, 5, TARGET_SELF, false, -1)
            else
                ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_SOUND, 7, TARGET_SELF, true, -1)
            end
        else
            ai:AddTopGoal(GOAL_COMMON_Turn, 10, TARGET_SOUND, 0, 0, 0)
        end
    end

    if soundBehaviour == 337000 and not ai:IsBattleState()
    and ai:HasSpecialEffectId(13156) then
        ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_SOUND, 1, TARGET_SELF, false, -1)
        return true
    end

    if soundBehaviour == 356000 
            and ai:IsBattleState() 
            and not ai:HasSpecialEffectId(TARGET_SELF, 5039) then

        local random = ai:GetRandam_Int(1, 100)
        if ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 5) then
            if random <= 50 then
                ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3031, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                return true
            end
            return false
        elseif ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 10) then
            if random <= 50 then
                ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3032, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                return true
            end
            return false
        elseif ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 15) then
            if random <= 40 then
                if ai:IsInsideTargetCustom(TARGET_FRI_0, TARGET_SELF, AI_DIR_TYPE_BL, 90, 180, 100) then
                    ai:AddTopGoal(GOAL_COMMON_StepSafety, 2, -1, -1, 1, -1, TARGET_ENE_0, 0, 0, true)
                    ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3027, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                elseif ai:IsInsideTargetCustom(TARGET_FRI_0, TARGET_SELF, AI_DIR_TYPE_BR, 90, 180, 100) then
                    ai:AddTopGoal(GOAL_COMMON_StepSafety, 2, -1, -1, -1, 1, TARGET_ENE_0, 0, 0, true)
                    ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3027, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                else
                    ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3027, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                end
            else
                return false
            end
        end
    end

    if soundBehaviour == 357000 
            and ai:IsBattleState() 
            and not ai:HasSpecialEffectId(TARGET_SELF, 5039) then

        local random = ai:GetRandam_Int(1, 100)
        if ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 5) then
            if random <= 50 then
                ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3034, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                return true
            end
            return false
        elseif ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 10) then
            if random <= 40 then
                if ai:IsInsideTargetCustom(TARGET_FRI_0, TARGET_SELF, AI_DIR_TYPE_BL, 90, 180, 100) then
                    ai:AddTopGoal(GOAL_COMMON_StepSafety, 2, -1, -1, 1, -1, TARGET_ENE_0, 0, 0, true)
                    ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3027, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                elseif ai:IsInsideTargetCustom(TARGET_FRI_0, TARGET_SELF, AI_DIR_TYPE_BR, 90, 180, 100) then
                    ai:AddTopGoal(GOAL_COMMON_StepSafety, 2, -1, -1, -1, 1, TARGET_ENE_0, 0, 0, true)
                    ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3027, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                else
                    ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3027, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                end
            else
                return false
            end
        elseif ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 15) then
            if random <= 40 then
                if ai:IsInsideTargetCustom(TARGET_FRI_0, TARGET_SELF, AI_DIR_TYPE_BL, 90, 180, 100) then
                    ai:AddTopGoal(GOAL_COMMON_StepSafety, 2, -1, -1, 1, -1, TARGET_ENE_0, 0, 0, true)
                    ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3027, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                elseif ai:IsInsideTargetCustom(TARGET_FRI_0, TARGET_SELF, AI_DIR_TYPE_BR, 90, 180, 100) then
                    ai:AddTopGoal(GOAL_COMMON_StepSafety, 2, -1, -1, -1, 1, TARGET_ENE_0, 0, 0, true)
                    ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3027, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                else
                    ai:AddTopGoal(GOAL_COMMON_ComboFinal, 3, 3027, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                end
            else
                return false
            end
        end
    end

    if soundBehaviour == 357001 
            and ai:IsBattleState() 
            and not ai:HasSpecialEffectId(TARGET_SELF, 5039) 
            and ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 180, 30) then

        if random1 <= 99 then
            ai:AddTopGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(2, 2.5), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
            return true
        end
        return false
    end

    if soundBehaviour == 365000
            and not ai:HasSpecialEffectId(TARGET_SELF, 13301)
            and not ai:HasSpecialEffectId(TARGET_SELF, 13302)
            and not ai:HasSpecialEffectId(TARGET_SELF, 13303) then

        ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3031, TARGET_NONE, DIST_None, 0, 0)
    end

    if soundBehaviour == 366000 
            and ai:IsBattleState()
            and not ai:HasSpecialEffectId(TARGET_SELF, 5039) then

        local random = ai:GetRandam_Int(1, 100)
        if ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 5) then
            return false
        elseif ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 15) then
            if random <= 70 then
                local animId
                if ai:HasSpecialEffectId(TARGET_SELF, 14702) then
                    animId = 3022
                elseif ai:HasSpecialEffectId(TARGET_SELF, 14705) then
                    animId = 3024
                elseif ai:HasSpecialEffectId(TARGET_SELF, 14706) then
                    animId = 3025
                elseif ai:HasSpecialEffectId(TARGET_SELF, 14704) then
                    animId = 3023
                else
                    animId = 3020
                end
                ai:AddTopGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(0.5, 1), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
                ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animId, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                return true
            end
            return false
        end
    end

    if (soundBehaviour == 367000 or soundBehaviour == 367001 or soundBehaviour == 367002)
            and not ai:IsBattleState() then

        local dist = ai:GetDist(TARGET_SOUND)
        local random = ai:GetRandam_Int(1, 100)
        if ai:HasSpecialEffectId(TARGET_SELF, 17100) then
            if dist >= 5 then
                local approachDist = random <= 35 and 3 or random <= 70 and 5 or 7
                ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_SOUND, approachDist, TARGET_SELF, false, -1)
            end
        elseif dist >= 3 then
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_SOUND, 3, TARGET_SELF, false, -1)
        end
    end

    if soundBehaviour == 375000 
            and ai:IsBattleState()
            and not ai:HasSpecialEffectId(TARGET_SELF, 5039)
            and ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 360, 180, 30) then

        local radius = ai:GetMapHitRadius(TARGET_SELF)
        if ai:GetExistMeshOnLineDistEx(TARGET_SELF, AI_DIR_TYPE_B, 2, radius, 0) >= 2 then
            ai:AddTopGoal(GOAL_COMMON_LeaveTarget, 2, TARGET_ENE_0, 10, TARGET_ENE_0, false, -1)
        else
            ai:AddTopGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(2, 2.5), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
        end
    end

    if (soundBehaviour == 395000 or soundBehaviour == 431001) 
            and not ai:IsBattleState() then

        ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_SOUND, 1, TARGET_SELF, false, -1)
        return true
    end

    if (soundBehaviour == 400000 or soundBehaviour == 407001) 
            and not ai:IsBattleState() then
        ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 30, TARGET_SOUND, 5, TARGET_SELF, false, false)
    end

    if soundBehaviour == 400001 then

        local eneDist = ai:GetDist(TARGET_ENE_0)
        local dirType = ai:GetRandam_Int(AI_DIR_TYPE_ToBL, AI_DIR_TYPE_ToBR)
        local isRiding = ai:HasSpecialEffectId(TARGET_SELF, 10700)
        if isRiding then
            if eneDist <= 10 then
                ai:AddTopGoal(GOAL_COMMON_ApproachSettingDirection, 5, TARGET_ENE_0, 2, TARGET_SELF, false, -1, dirType, 25)
            end
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_B, 200) then
                ai:AddTopGoal(GOAL_COMMON_Turn, 2, TARGET_ENE_0, 90, 0, 0)
            end
            ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3024, TARGET_ENE_0, DIST_None, 0, 90)
        elseif not isRiding then
            ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3022, TARGET_ENE_0, DIST_None, 0, 90)
        end
    end

    if soundBehaviour == 400002 then
        local dist = ai:GetDist(TARGET_SOUND)
        if ai:IsInsideTarget(TARGET_SOUND, AI_DIR_TYPE_B, 90) then
            ai:AddTopGoal(GOAL_COMMON_Turn, 2, TARGET_SOUND, 90, 0, 0)
        end
        if dist >= 20 then
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_SOUND, 10, TARGET_SELF, false, -1)
        end
        ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3013, TARGET_SOUND, DIST_None, 0, 90)
    end

    if soundBehaviour == 407000 
            and not ai:HasSpecialEffectId(TARGET_SELF, 14570) then

        local random  = ai:GetRandam_Int(1, 100)
        local animation = random <= 50 and 3006 or 3009
        ai:AddTopGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0, 3), TARGET_NONE)
        ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 20, animation, TARGET_SOUND, 9999, 0, 0, 0, 0)
        return true
    end

    local spEffects = { [413000] = 10553, [413001] = 10573, [413004] = 10543 }
    if spEffects[soundBehaviour] 
            and not ai:HasSpecialEffectId(TARGET_SELF, spEffects[soundBehaviour]) then
        ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3036, TARGET_ENE_0, DIST_None, 0, 0)
    end

    local spEffectsTwo = { [413002] = 10554, [413003] = 10574 }
    if spEffectsTwo[soundBehaviour] 
            and not ai:HasSpecialEffectId(TARGET_SELF, spEffectsTwo[soundBehaviour]) then

        local random = ai:GetRandam_Int(1, 100)
        local animation = random <= 35 and 3031 or random <= 70 and 3032 or 3033
        ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animation, TARGET_SOUND, 999, 0, 0, 0, 0)
        ai:AddTopGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3037, TARGET_SOUND, 999, 0, 0)
        ai:ClearSubGoal()
    end

    if soundBehaviour == 413005 
            and not ai:HasSpecialEffectId(TARGET_SELF, 10544) then

        local random  = ai:GetRandam_Int(1, 100)
        local animation = random <= 50 and 3032 or 3033
        ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animation, TARGET_SOUND, 999, 0, 0, 0, 0)
        ai:AddTopGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3037, TARGET_SOUND, 999, 0, 0)
        ai:ClearSubGoal()
    end

    if soundBehaviour == 413006 
            and ai:IsBattleState()
            and not ai:HasSpecialEffectId(TARGET_SELF, 5039) then
        local random = ai:GetRandam_Int(1, 100)
        if ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 5) then
            return false
        elseif ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 10) then
            local animation = random <= 50 and 3022 or 3025
            ai:AddTopGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(0.5, 1), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animation, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
            return true
        end
    end

    if soundBehaviour == 418000 
            and ai:HasSpecialEffectId(TARGET_SELF, 14201) then

        ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 10, 3010, TARGET_SOUND, DIST_None, 0, 0)
        return true
    end

    if soundBehaviour == 420000 
            and not ai:IsBattleState() then

        ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 15, TARGET_SOUND, 10, TARGET_SELF, false, false)
    end

    if soundBehaviour == 420001 then

        ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 15, TARGET_SOUND, 10, TARGET_SELF, false, false)
    end

    if (soundBehaviour == 420100 or soundBehaviour == 420101 or soundBehaviour == 420102) 
            and ai:IsBattleState() then

        local animId
        if ai:HasSpecialEffectId(TARGET_SELF, 5400) then
            animId = 3001
        elseif ai:HasSpecialEffectId(TARGET_SELF, 5401) then
            animId = 3007
        end
        if animId then
            ai:AddTopGoal(GOAL_COMMON_Wait, ai:GetRandam_Float(0.1, 0.8), TARGET_ENE_0, 0, 0, 0)
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3.5, animId, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true
        end
    end

    if (soundBehaviour == 430000 or soundBehaviour == 430001 or soundBehaviour == 430002 or soundBehaviour == 430003 or soundBehaviour == 430004 or soundBehaviour == 430005)
            and not ai:IsBattleState() then

        local dist = ai:GetDist(TARGET_SOUND)
        local random = ai:GetRandam_Int(1, 100)
        if ai:HasSpecialEffectId(TARGET_SELF, 10101) then
            ai:AddTopGoal(GOAL_COMMON_Turn, 30, TARGET_SOUND, 0, 0, 0)
        else
            local runProb
            if dist >= 50 then 
                runProb = 90
            elseif dist >= 40 then 
                runProb = 80
            elseif dist >= 30 then 
                runProb = 70
            elseif dist >= 20 then 
                runProb = 60
            elseif dist >= 10 then 
                runProb = 50
            else                   
                runProb = 40
            end
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 30, TARGET_SOUND, 5, TARGET_SELF, random > runProb, -1)
        end
    end

    if soundBehaviour == 431000 then

        local eneDist = ai:GetDist(TARGET_ENE_0)
        local leaveDist = 50
        local moveSpeed = 12
        local runChance = 60
        local random = ai:GetRandam_Int(1, 100)
        local animId = random <= runChance and 9910 or -1
        if leaveDist <= eneDist then
            Approach_Act(ai, goal, leaveDist, moveSpeed, runChance, 3)
        end

        ai:AddTopGoal(GOAL_COMMON_LeaveTarget, 20, TARGET_ENE_0, leaveDist, TARGET_ENE_0, true, animId)
        return true
    end

    if soundBehaviour == 432100 
            and ai:IsCautionState() then

        ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 15, TARGET_SOUND, 3, TARGET_SELF, false, false)
        ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 15, 3030, TARGET_NONE, DIST_None, 0, 0)
    end

    if soundBehaviour == 450000 then

        if ai:GetStringIndexedNumber("COMMON_SoundBehavior_DoneFirstAct") ~= 1 then
            local approachRange = 10
            if ai:GetDist(TARGET_SOUND) < approachRange then
                ai:AddTopGoal(GOAL_COMMON_Turn, 5, TARGET_SOUND, 0, 0, 0)
            else
                ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 10, TARGET_SOUND, approachRange, TARGET_SELF, false, false)
            end
            ai:SetStringIndexedNumber("COMMON_SoundBehavior_DoneFirstAct", 1)
            return true
        end
        return false
    end

    if soundBehaviour == 450001 
            and not ai:HasSpecialEffectId(TARGET_SELF, 10292) then

        ai:AddTopGoal(GOAL_COMMON_Turn, 5, TARGET_SOUND, 10, 0, 0)
        ai:AddTopGoal(GOAL_COMMON_Wait, 0.1, TARGET_SOUND, 0, 0, 0)
        ai:SetAIFixedMoveTargetSpecifyAngle(TARGET_SOUND, 60, 1, AI_SPA_DIR_TYPE_TargetF)
        if ai:HasSpecialEffectId(TARGET_SELF, 5400) or ai:HasSpecialEffectId(TARGET_SELF, 5405) then
            local animation, animation1
            if random2 >= 75 then 
                animation, animation1 = 3023, 3025
            elseif random2 >= 50 then 
                animation, animation1 = 3022, 3025
            elseif random2 >= 25 then 
                animation, animation1 = 3022, 3024
            else                     
                animation, animation1 = 3023, 3024
            end
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animation, TARGET_SOUND, 999, 0, 0, 0, 0)
            ai:AddTopGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animation1, TARGET_SOUND, 999, 0, 0)

            local leaveDist
            if random2 <= 30 then 
                leaveDist = ai:GetRandam_Float(20, 30)
            elseif random2 <= 65 then 
                leaveDist = ai:GetRandam_Float(30, 40)
            else                     
                leaveDist = ai:GetRandam_Float(40, 50)
            end
            ai:AddTopGoal(GOAL_COMMON_LeaveTarget, 999, TARGET_SOUND, leaveDist, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3027, TARGET_SOUND, 999, 0, 0, 0, 0)

        elseif ai:HasSpecialEffectId(TARGET_SELF, 5402) then
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3021, TARGET_SOUND, 999, 0, 0, 0, 0)
            local leaveDist
            if random2 <= 30 then 
                leaveDist = ai:GetRandam_Float(20, 30)
            elseif random2 <= 65 then 
                leaveDist = ai:GetRandam_Float(30, 40)
            else                     
                leaveDist = ai:GetRandam_Float(40, 50)
            end
            ai:AddTopGoal(GOAL_COMMON_LeaveTarget, 999, TARGET_SOUND, leaveDist, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3027, TARGET_SOUND, 999, 0, 0, 0, 0)

        elseif ai:HasSpecialEffectId(TARGET_SELF, 5404) then
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3022, TARGET_SOUND, 999, 0, 0, 0, 0)
            local leaveDist
            if random2 <= 30 then 
                leaveDist = ai:GetRandam_Float(20, 30)
            elseif random2 <= 65 then 
                leaveDist = ai:GetRandam_Float(30, 40)
            else                     
                leaveDist = ai:GetRandam_Float(40, 50)
            end
            ai:AddTopGoal(GOAL_COMMON_LeaveTarget, 999, TARGET_SOUND, leaveDist, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3027, TARGET_SOUND, 999, 0, 0, 0, 0)
        end
        return true
    end

    if soundBehaviour == 430050 
            and not ai:HasSpecialEffectId(TARGET_SELF, 10292) then

        ai:SetAIFixedMoveTargetSpecifyAngle(TARGET_SOUND, 60, 1, AI_SPA_DIR_TYPE_TargetF)
        if ai:HasSpecialEffectId(TARGET_SELF, 5400) or ai:HasSpecialEffectId(TARGET_SELF, 5405) then
            local animation, animation1
            if random2 >= 75 then 
                animation, animation1 = 3023, 3025
            elseif random2 >= 50 then 
                animation, animation1 = 3022, 3025
            elseif random2 >= 25 then 
                animation, animation1 = 3022, 3024
            else                     
                animation, animation1 = 3023, 3024
            end
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animation, TARGET_SOUND, 999, 0, 0, 0, 0)
            ai:AddTopGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animation1, TARGET_SOUND, 999, 0, 0)
            ai:AddTopGoal(GOAL_COMMON_LeaveTarget, 999, TARGET_SOUND, ai:GetRandam_Float(60, 65), TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3027, TARGET_SOUND, 999, 0, 0, 0, 0)

        elseif ai:HasSpecialEffectId(TARGET_SELF, 5402) then
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3021, TARGET_SOUND, 999, 0, 0, 0, 0)
            ai:AddTopGoal(GOAL_COMMON_LeaveTarget, 999, TARGET_SOUND, ai:GetRandam_Float(60, 65), TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3027, TARGET_SOUND, 999, 0, 0, 0, 0)

        elseif ai:HasSpecialEffectId(TARGET_SELF, 5404) then
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3022, TARGET_SOUND, 999, 0, 0, 0, 0)
            ai:AddTopGoal(GOAL_COMMON_LeaveTarget, 999, TARGET_SOUND, ai:GetRandam_Float(60, 65), TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3027, TARGET_SOUND, 999, 0, 0, 0, 0)
        end

        return true
    end

    if soundBehaviour == 450002 
            and not ai:HasSpecialEffectId(TARGET_SELF, 14570) then

        ai:SetAIFixedMoveTargetSpecifyAngle(TARGET_SOUND, 60, 1, AI_SPA_DIR_TYPE_TargetF)
        if ai:HasSpecialEffectId(TARGET_SELF, 5160) then
            ai:AddTopGoal(GOAL_COMMON_LeaveTarget_Continuous, 2, TARGET_ENE_0, 200, TARGET_SELF, false, -1, GUARD_GOAL_DESIRE_RET_Continue, false, 2)
        else
            ai:AddTopGoal(GOAL_COMMON_LeaveTarget_Escape, 2, TARGET_ENE_0, 200, TARGET_SELF, false, 1.5)
        end
        return true
    end

    if soundBehaviour == 450003 
            and not ai:HasSpecialEffectId(TARGET_SELF, 14722) then

        ai:AddTopGoal(GOAL_COMMON_Turn, 5, TARGET_SOUND, 10, 0, 0)
        ai:AddTopGoal(GOAL_COMMON_Wait, 0.1, TARGET_SOUND, 0, 0, 0)
        ai:SetAIFixedMoveTargetSpecifyAngle(TARGET_SOUND, 60, 1, AI_SPA_DIR_TYPE_TargetF)
        if ai:HasSpecialEffectId(TARGET_SELF, 5400) or ai:HasSpecialEffectId(TARGET_SELF, 5401) then
            local animation, animation1
            if random2 >= 75 then 
                animation, animation1 = 3008, 3013
            elseif random2 >= 50 then 
                animation, animation1 = 3007, 3014
            elseif random2 >= 25 then 
                animation, animation1 = 3007, 3013
            else                     
                animation, animation1 = 3008, 3014
            end
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, animation, TARGET_SOUND, 999, 0, 0, 0, 0)
            ai:AddTopGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, animation1, TARGET_SOUND, 999, 0, 0)

            local leaveDist
            if random2 <= 30 then 
                leaveDist = ai:GetRandam_Float(20, 30)
            elseif random2 <= 65 then 
                leaveDist = ai:GetRandam_Float(30, 40)
            else                     
                leaveDist = ai:GetRandam_Float(40, 50)
            end
            ai:AddTopGoal(GOAL_COMMON_LeaveTarget, 999, TARGET_SOUND, leaveDist, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3018, TARGET_SOUND, 999, 0, 0, 0, 0)
        end
        return true
    end

    if soundBehaviour == 455000 
            and not ai:IsBattleState() then

        if ai:HasSpecialEffectId(TARGET_SELF, 14028) then
            local approachDist = ai:GetRandam_Float(5, 15)
            if not ai:HasSpecialEffectId(TARGET_SELF, 14013) then
                ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 15, 3023, TARGET_SOUND, DIST_None, 3, 60)
            end
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 30, TARGET_SOUND, approachDist, TARGET_SELF, false, -1)
            ai:AddTopGoal(GOAL_COMMON_WalkAround_Anywhere, 999, 10, 8, true, -1, 1.5, 10, true, false, true)
        end
        return true
    end

    if soundBehaviour == 455001 
            and not ai:IsBattleState() then

        local animId = ai:GetRandam_Int(0, 100) <= 50 and 20007 or 20000
        if not ai:HasSpecialEffectId(TARGET_SELF, 14007)
                and not ai:HasSpecialEffectId(TARGET_SELF, 5031) then

            ai:AddTopGoal(GOAL_COMMON_Turn, 5, TARGET_SOUND, 0, 0, 0)
            ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 15, animId, TARGET_NONE, DIST_None, 0, 0)
        elseif ai:HasSpecialEffectId(TARGET_SELF, 5031)
                and ai:HasSpecialEffectId(TARGET_SELF, 14010) then

            ai:AddTopGoal(GOAL_COMMON_Wait, 1, TARGET_SOUND)
        end

        return true
    end

    if soundBehaviour == 463000 
            and ai:IsCautionState() then

        ai:AddTopGoal(GOAL_COMMON_AttackTunableSpin, 15, 3030, TARGET_SOUND, 999, 0, 360, 180, 180)
        ai:AddTopGoal(GOAL_COMMON_LeaveTarget, 80, TARGET_SOUND, 999, TARGET_SELF, true, -1)
        return true
    end

    if soundBehaviour == 506100 
            and not ai:IsBattleState() then

        if ai:HasSpecialEffectId(TARGET_SELF, 20011073)
                and not ai:HasSpecialEffectId(TARGET_SELF, 20011075) then

            local radius = ai:GetMapHitRadius(TARGET_SELF)
            local warpDir = AI_DIR_TYPE_F
            local warpDist = 2
            local found = false
            local DIRS = {
                AI_DIR_TYPE_B, AI_DIR_TYPE_BR, AI_DIR_TYPE_BL,
                AI_DIR_TYPE_L,  AI_DIR_TYPE_R,  AI_DIR_TYPE_F,
            }
            for i = 1, table.getn(DIRS) do
                if ai:GetExistMeshOnLineDistEx(TARGET_SOUND, DIRS[i], 1 + radius, radius, 0) >= 3 then
                    warpDir = DIRS[i]
                    warpDist = 1
                    found = true
                    break
                end
            end

            if not found then
                if ai:GetExistMeshOnLineDistEx(TARGET_SOUND, AI_DIR_TYPE_B, 1 + radius, radius, 0) >= 1 then
                    warpDir = AI_DIR_TYPE_B
                    warpDist = 0.5
                    found = true
                elseif ai:GetExistMeshOnLineDistEx(TARGET_SOUND, AI_DIR_TYPE_F, 1 + radius, radius, 0) >= 1 then
                    warpDir = AI_DIR_TYPE_F
                    warpDist = 0.5
                    found = true
                end
            end

            if found then
                ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3010, TARGET_NONE, DIST_None, 0, 180, 180, 180)
                ai:AddTopGoal(GOAL_COMMON_ToTargetWarp, 10, TARGET_SOUND, warpDir, warpDist, TARGET_SOUND, -1, -1, 0)
                ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 10, 3013, TARGET_SOUND, DIST_None, 0, 180, 180, 180)
                return true
            end

            return false

        elseif not ai:IsSearchLowState() 
                or not ai:IsSearchHighState() then

            ai:AddTopGoal(GOAL_COMMON_Wait, 0.1, TARGET_NONE)
            return true
        end
        return false
    end

    if soundBehaviour == 508000 then

        local thinkAttr = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
        local eneDist = ai:GetDist(TARGET_ENE_0)
        local role = ai:GetTeamOrder(ORDER_TYPE_Role)
        if thinkAttr == 1 
                and role == ROLE_TYPE_Kankyaku then

            return false

        elseif thinkAttr == 1 
                and role == ROLE_TYPE_Torimaki then

            if ai:HasSpecialEffectId(TARGET_SELF, 20010769) then 
                return false 
            end

            if eneDist < 5.5 then
                ai:AddTopGoal(GOAL_COMMON_LeaveTarget, ai:GetRandam_Int(0.3, 1.3), TARGET_ENE_0, 10.5, appDist, true, -1)
            end

            ai:AddTopGoal(GOAL_COMMON_ComboRepeat, 5, 3037, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true

        elseif ai:HasSpecialEffectId(TARGET_SELF, 20010770)
                or ai:HasSpecialEffectId(TARGET_SELF, 20010776) then

            if ai:HasSpecialEffectId(TARGET_SELF, 20010768) then 
                return false 
            end

            if eneDist >= 5.5 then
                ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, 5.5, appDist, false, -1)
            end

            ai:AddTopGoal(GOAL_COMMON_ComboRepeat, 5, 3007, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true

        elseif ai:HasSpecialEffectId(TARGET_SELF, 20010771)
                or ai:HasSpecialEffectId(TARGET_SELF, 20010777) then

            if ai:HasSpecialEffectId(TARGET_SELF, 20010768) then 
                return false 
            end

            if eneDist >= 10.5 then
                ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, 10.5, appDist, false, -1)
            end

            ai:AddTopGoal(GOAL_COMMON_ComboRepeat, 5, 3012, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true
        end
    end

    if (soundBehaviour == 502000 or soundBehaviour == 502001)
            and not ai:HasSpecialEffectId(TARGET_SELF, 20010081) then

        if ai:HasSpecialEffectId(TARGET_SELF, 5401) then
            local onRight = ai:IsInsideTargetCustom(TARGET_FRI_0, TARGET_ENE_0, AI_DIR_TYPE_R, 180, 180, 100)
            local warpDist = soundBehaviour == 502000 and 11.5 or 0
            local animation
            if soundBehaviour == 502000 then
                animation = onRight and 3004 or 3006
            else
                animation = onRight and 3005 or 3003
            end

            ai:AddTopGoal(GOAL_COMMON_ToTargetWarp, 10, TARGET_FRI_0, AI_DIR_TYPE_F, warpDist, TARGET_ENE_0, -1, -1, 0)
            ai:AddTopGoal(GOAL_COMMON_ComboRepeat, 5, animation, TARGET_ENE_0, 999, 0, 0, 0, 0)
            ai:AddTopGoal(GOAL_COMMON_ComboRepeat, 5, 3000, TARGET_ENE_0, 999, 0, 0, 0, 0)
            return true
        end
        return false
    end

    if soundBehaviour == 502002 
            and ai:HasSpecialEffectId(TARGET_SELF, 5400) then
        ai:AddTopGoal(GOAL_COMMON_ComboRepeat, 5, 3037, TARGET_ENE_0, 999, 0, 0, 0, 0)
        return true
    end

    if soundBehaviour == 531000 
            or soundBehaviour == 532000 then

        local life = soundBehaviour == 531000 and ai:GetRandam_Float(10, 12) or ai:GetRandam_Float(2, 2)
        ai:AddTopGoal(GOAL_COMMON_SidewayMove, life, TARGET_ENE_0, ai:GetRandam_Int(0, 1), 180, true, true, -1)
        return true
    end

    if soundBehaviour == 545000 
            and ai:HasSpecialEffectId(TARGET_SELF, 20011150) then

        ai:AddTopGoal(GOAL_COMMON_ComboRepeat, 10, 3025, TARGET_SOUND, DIST_None, 1, 0)
        return true
    end

    if soundBehaviour == 900000 
            and ai:IsCautionState() then

        local searchDist = ai:GetRandam_Int(5, 20)
        local arrived = ai:GetStringIndexedNumber("COMMON_SoundBehavior_Arrived") == 1
        if arrived or soundDist < searchDist then
            ai:AddTopGoal(GOAL_COMMON_WalkAround_Anywhere, -1, 1, 5, true, 3031, 5, -1, true, false, false)
            ai:SetStringIndexedNumber("COMMON_SoundBehavior_Arrived", 1)
        else
            ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 30, TARGET_SOUND, searchDist, TARGET_SELF, true, false)
        end
        return true
    end

    if soundBehaviour == 901000 
            and not ai:HasSpecialEffectId(TARGET_SELF, 297103) then

        local useRun = ai:HasSpecialEffectId(TARGET_SELF, 297100)
        ai:AddTopGoal(GOAL_COMMON_ApproachTarget, 8, TARGET_SOUND, ai:GetRandam_Float(1.5, 3), TARGET_SELF, useRun, false)
        return true
    end

    if soundBehaviour == 902000 then
        
        if ai:IsBattleState() then
            if ai:HasSpecialEffectId(TARGET_SELF, 14476)
                    and ai:HasSpecialEffectId(TARGET_SELF, 14473) then

                if ai:HasSpecialEffectId(TARGET_SELF, 14458) then

                    if ai:HasSpecialEffectId(TARGET_SELF, 14454) then 
                        return false 
                    end

                    ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 4, 3032, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                    return true

                else
                    ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 5, 3032, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                    ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3035, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                    return true
                end

            elseif ai:HasSpecialEffectId(TARGET_SELF, 14476)
                    and ai:HasSpecialEffectId(TARGET_SELF, 14474) then

                local inRange = ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 5)
                local noCombo = ai:HasSpecialEffectId(TARGET_SELF, 14454)

                if inRange then
                    if not noCombo then
                        ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 4, 3032, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                    end
                    ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 15, 3033, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                    return true
                elseif noCombo then
                    return false
                else
                    ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 4, 3032, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
                    return true
                end
            end
        else
            if not ai:HasSpecialEffectId(TARGET_SELF, 14454) then
                ai:AddTopGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 4, 3032, TARGET_ENE_0, 999, TurnTime, FrontAngle, 0, 0)
            end
            return false
        end
    end

    return false
end
