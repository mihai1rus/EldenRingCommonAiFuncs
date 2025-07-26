RegisterTableGoal(GOAL_CommonNPCTest29999_Battle, "CommonNPCTest29999_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_CommonNPCTest29999_Battle, true)

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
    
end

Goal.Activate = function (self, ai, goal)
    ai:DeleteObserve(0)
    ai:DeleteObserve(1)
    ai:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5635)
    if ai:GetBehaviorStateId(PLAN_IDX_AINOTE_STATETYPE) == PLAN_STATETYPE_JUMP_NONATTACK then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 0)
        return
    end
    if ExecWeaponChange(self, ai, goal) == 1 then
        return
    end
    if ExecFirstAction(self, ai, goal) == 1 then
        return
    end
    local f2_local0 = {}
    local f2_local1 = {[1] = REGIST_FUNC(ai, goal, GeneralNPC_Act01), [2] = REGIST_FUNC(ai, goal, GeneralNPC_Act02), [3] = REGIST_FUNC(ai, goal, GeneralNPC_Act03), [4] = REGIST_FUNC(ai, goal, GeneralNPC_Act04), [5] = REGIST_FUNC(ai, goal, GeneralNPC_Act05), [6] = REGIST_FUNC(ai, goal, GeneralNPC_Act06), [7] = REGIST_FUNC(ai, goal, GeneralNPC_Act07), [8] = REGIST_FUNC(ai, goal, GeneralNPC_Act08), [9] = REGIST_FUNC(ai, goal, GeneralNPC_Act09), [11] = REGIST_FUNC(ai, goal, GeneralNPC_Act11), [12] = REGIST_FUNC(ai, goal, GeneralNPC_Act12), [21] = REGIST_FUNC(ai, goal, GeneralNPC_Act21), [22] = REGIST_FUNC(ai, goal, GeneralNPC_Act22), [23] = REGIST_FUNC(ai, goal, GeneralNPC_Act23), [24] = REGIST_FUNC(ai, goal, GeneralNPC_Act24), [25] = REGIST_FUNC(ai, goal, GeneralNPC_Act25), [26] = REGIST_FUNC(ai, goal, GeneralNPC_Act26), [27] = REGIST_FUNC(ai, goal, GeneralNPC_Act27), [28] = REGIST_FUNC(ai, goal, GeneralNPC_Act28), [29] = REGIST_FUNC(ai, goal, GeneralNPC_Act29), [30] = REGIST_FUNC(ai, goal, GeneralNPC_Act30), [31] = REGIST_FUNC(ai, goal, GeneralNPC_Act31), [32] = REGIST_FUNC(ai, goal, GeneralNPC_Act32), [33] = REGIST_FUNC(ai, goal, GeneralNPC_Act33), [35] = REGIST_FUNC(ai, goal, GeneralNPC_Act35), [36] = REGIST_FUNC(ai, goal, GeneralNPC_Act36), [41] = REGIST_FUNC(ai, goal, GeneralNPC_Act41), [42] = REGIST_FUNC(ai, goal, GeneralNPC_Act42), [43] = REGIST_FUNC(ai, goal, GeneralNPC_Act43), [44] = REGIST_FUNC(ai, goal, GeneralNPC_Act44), [45] = REGIST_FUNC(ai, goal, GeneralNPC_Act45), [46] = REGIST_FUNC(ai, goal, GeneralNPC_Act46), [47] = REGIST_FUNC(ai, goal, GeneralNPC_Act47), [48] = REGIST_FUNC(ai, goal, GeneralNPC_Act48), [49] = REGIST_FUNC(ai, goal, GeneralNPC_Act49), [50] = REGIST_FUNC(ai, goal, GeneralNPC_Act50), [51] = REGIST_FUNC(ai, goal, GeneralNPC_Act51), [52] = REGIST_FUNC(ai, goal, GeneralNPC_Act52), [61] = REGIST_FUNC(ai, goal, GeneralNPC_Act61), [62] = REGIST_FUNC(ai, goal, GeneralNPC_Act62), [63] = REGIST_FUNC(ai, goal, GeneralNPC_Act63), [64] = REGIST_FUNC(ai, goal, GeneralNPC_Act64), [65] = REGIST_FUNC(ai, goal, GeneralNPC_Act65), [66] = REGIST_FUNC(ai, goal, GeneralNPC_Act66), [67] = REGIST_FUNC(ai, goal, GeneralNPC_Act67), [68] = REGIST_FUNC(ai, goal, GeneralNPC_Act68), [69] = REGIST_FUNC(ai, goal, GeneralNPC_Act69), [70] = REGIST_FUNC(ai, goal, GeneralNPC_Act70), [71] = REGIST_FUNC(ai, goal, GeneralNPC_Act71), [72] = REGIST_FUNC(ai, goal, GeneralNPC_Act72), [73] = REGIST_FUNC(ai, goal, GeneralNPC_Act73), [101] = REGIST_FUNC(ai, goal, GeneralNPC_Act101), [102] = REGIST_FUNC(ai, goal, GeneralNPC_Act102), [103] = REGIST_FUNC(ai, goal, GeneralNPC_Act103), [104] = REGIST_FUNC(ai, goal, GeneralNPC_Act104), [105] = REGIST_FUNC(ai, goal, GeneralNPC_Act105), [106] = REGIST_FUNC(ai, goal, GeneralNPC_Act106), [107] = REGIST_FUNC(ai, goal, GeneralNPC_Act107), [108] = REGIST_FUNC(ai, goal, GeneralNPC_Act108), [109] = REGIST_FUNC(ai, goal, GeneralNPC_Act109), [110] = REGIST_FUNC(ai, goal, GeneralNPC_Act110), [111] = REGIST_FUNC(ai, goal, GeneralNPC_Act111), [112] = REGIST_FUNC(ai, goal, GeneralNPC_Act112), [120] = REGIST_FUNC(ai, goal, GeneralNPC_Act120), [121] = REGIST_FUNC(ai, goal, GeneralNPC_Act121), [150] = REGIST_FUNC(ai, goal, GeneralNPC_Act150), [151] = REGIST_FUNC(ai, goal, GeneralNPC_Act151), [152] = REGIST_FUNC(ai, goal, GeneralNPC_Act152), [153] = REGIST_FUNC(ai, goal, GeneralNPC_Act153), [154] = REGIST_FUNC(ai, goal, GeneralNPC_Act154), [200] = REGIST_FUNC(ai, goal, GeneralNPC_Act200), [210] = REGIST_FUNC(ai, goal, GeneralNPC_Act210), [220] = REGIST_FUNC(ai, goal, GeneralNPC_Act220), [230] = REGIST_FUNC(ai, goal, GeneralNPC_Act230), [231] = REGIST_FUNC(ai, goal, GeneralNPC_Act231), [232] = REGIST_FUNC(ai, goal, GeneralNPC_Act232)}
    Common_NPC_AI(self, ai, goal)
    f2_local0 = MakeNPCProbArr(self, ai, goal, 1)
    local f2_local2 = REGIST_FUNC(ai, goal, GeneralNPC_AdjustSpace)
    Common_Battle_Activate_ForCommonNPC(ai, goal, f2_local0, f2_local1, f2_local2)
    if goal:GetSubGoalNum() <= 0 then
        GeneralNPC_Act_onNoSubGoal(ai, goal)
    end
    
end

Goal.Update = function (self, ai, goal)
    if ai:GetStringIndexedNumber("IsExistSpAtPlanning") == 1 and ai:GetSp(TARGET_SELF) <= 0 then
        ai:SetStringIndexedNumber("IsExistSpAtPlanning", 0)
        goal:ClearSubGoal()
        ai:Replaning()
    end
    if goal:IsFinishTimer(0) == true and ai:GetBehaviorStateId(PLAN_IDX_AINOTE_STATETYPE) == PLAN_STATETYPE_CHARGEMAGIC then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_ENE_0)
    end
    return Update_Default_NoSubGoal(self, ai, goal)
    
end

Goal.Terminate = function (self, ai, goal)
    
end

Goal.Interrupt = function (self, ai, goal)
    local f5_local0 = {}
    if ai:IsLadderAct(TARGET_SELF) then
        return false
    end
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) and ai:GetSpecialEffectActivateInterruptId(5635) then
        ai:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5635)
        goal:ClearSubGoal()
        local animationId = NPC_ATK_R2
        local f5_local2 = ai:GetNPCActProb(9030)
        local random = ai:GetRandam_Int(1, 100)
        if ai:GetWeaponBothHandState(TARGET_SELF) == -1 and GetDualAttackType(ai, goal) == 1 and f5_local2 >= fate then
            animationId = NPC_ATK_L1
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 4, 0, 0)
        return true
    end
    if ai:IsInterupt(INTERUPT_Damaged) then
        Common_NPC_AI(self, ai, goal)
        f5_local0 = MakeNPCProbArr(self, ai, goal, 2)
        local random = ai:GetRandam_Int(1, 100)
        if random <= f5_local0[1201] then
            goal:ClearSubGoal()
            GeneralNPC_Act01(ai, goal)
            return true
        elseif random <= f5_local0[1201] + f5_local0[1202] then
            goal:ClearSubGoal()
            GeneralNPC_Act101(ai, goal)
            return true
        elseif random <= f5_local0[1201] + f5_local0[1202] + f5_local0[1203] then
            goal:ClearSubGoal()
            GeneralNPC_Act102(ai, goal)
            return true
        elseif random <= f5_local0[1201] + f5_local0[1202] + f5_local0[1203] + f5_local0[1204] then
            goal:ClearSubGoal()
            GeneralNPC_Act103(ai, goal)
            return true
        elseif random <= f5_local0[1201] + f5_local0[1202] + f5_local0[1203] + f5_local0[1204] + f5_local0[1205] then
            goal:ClearSubGoal()
            GeneralNPC_Act104(ai, goal)
            return true
        elseif random <= f5_local0[1201] + f5_local0[1202] + f5_local0[1203] + f5_local0[1204] + f5_local0[1205] + f5_local0[1206] then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, TARGET_ENE_0, 1, TARGET_SELF, false, NPC_ATK_L1)
            return true
        elseif random <= f5_local0[1201] + f5_local0[1202] + f5_local0[1203] + f5_local0[1204] + f5_local0[1205] + f5_local0[1206] + f5_local0[1207] then
            goal:ClearSubGoal()
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, 0, ai:GetRandam_Int(75, 90), true, false, NPC_ATK_L1)
            else
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, 1, ai:GetRandam_Int(75, 90), true, false, NPC_ATK_L1)
            end
            return true
        elseif random <= f5_local0[1201] + f5_local0[1202] + f5_local0[1203] + f5_local0[1204] + f5_local0[1205] + f5_local0[1206] + f5_local0[1207] + f5_local0[1208] then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 1, TARGET_ENE_0, 3, TARGET_ENE_0, true, NPC_ATK_L1)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Shoot) then
        Common_NPC_AI(self, ai, goal)
        f5_local0 = MakeNPCProbArr(self, ai, goal, 3)
        local random = ai:GetRandam_Int(1, 100)
        if random <= f5_local0[1301] then
            goal:ClearSubGoal()
            GeneralNPC_Act102(ai, goal)
            return true
        elseif random <= f5_local0[1301] + f5_local0[1302] then
            goal:ClearSubGoal()
            GeneralNPC_Act103(ai, goal)
            return true
        elseif random <= f5_local0[1301] + f5_local0[1302] + f5_local0[1303] then
            goal:ClearSubGoal()
            GeneralNPC_Act104(ai, goal)
            return true
        elseif random <= f5_local0[1301] + f5_local0[1302] + f5_local0[1303] + f5_local0[1304] then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, 1, TARGET_SELF, false, NPC_ATK_L1)
            return true
        elseif random <= f5_local0[1301] + f5_local0[1302] + f5_local0[1303] + f5_local0[1304] + f5_local0[1305] then
            goal:ClearSubGoal()
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, 0, ai:GetRandam_Int(75, 90), true, false, NPC_ATK_L1)
            else
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, 1, ai:GetRandam_Int(75, 90), true, false, NPC_ATK_L1)
            end
            return true
        elseif random <= f5_local0[1301] + f5_local0[1302] + f5_local0[1303] + f5_local0[1304] + f5_local0[1305] + f5_local0[1306] then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, 1, TARGET_SELF, false, NPC_ATK_L1)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_FindAttack) then
        Common_NPC_AI(self, ai, goal)
        f5_local0 = MakeNPCProbArr(self, ai, goal, 4)
        local random = ai:GetRandam_Int(1, 100)
        if random <= f5_local0[1401] then
            goal:ClearSubGoal()
            GeneralNPC_Act101(ai, goal)
            return true
        elseif random <= f5_local0[1401] + f5_local0[1402] then
            goal:ClearSubGoal()
            GeneralNPC_Act102(ai, goal)
            return true
        elseif random <= f5_local0[1401] + f5_local0[1402] + f5_local0[1403] then
            goal:ClearSubGoal()
            GeneralNPC_Act103(ai, goal)
            return true
        elseif random <= f5_local0[1401] + f5_local0[1402] + f5_local0[1403] + f5_local0[1404] then
            goal:ClearSubGoal()
            GeneralNPC_Act104(ai, goal)
            return true
        elseif random <= f5_local0[1401] + f5_local0[1402] + f5_local0[1403] + f5_local0[1404] + f5_local0[1405] then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, 1, TARGET_SELF, false, NPC_ATK_L1)
            return true
        elseif random <= f5_local0[1401] + f5_local0[1402] + f5_local0[1403] + f5_local0[1404] + f5_local0[1405] + f5_local0[1406] then
            goal:ClearSubGoal()
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) then
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, 0, ai:GetRandam_Int(75, 90), true, false, NPC_ATK_L1)
            else
                goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, 1, ai:GetRandam_Int(75, 90), true, false, NPC_ATK_L1)
            end
            return true
        elseif random <= f5_local0[1401] + f5_local0[1402] + f5_local0[1403] + f5_local0[1404] + f5_local0[1405] + f5_local0[1406] + f5_local0[1407] then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_Guard, 1.2, NPC_ATK_L1, TARGET_ENE_0, GUARD_GOAL_DESIRE_RET_Continue, true)
            return true
        elseif random <= f5_local0[1401] + f5_local0[1402] + f5_local0[1403] + f5_local0[1404] + f5_local0[1405] + f5_local0[1406] + f5_local0[1407] + f5_local0[1408] then
            goal:ClearSubGoal()
            GeneralNPC_Act120(ai, goal)
        elseif random <= f5_local0[1401] + f5_local0[1402] + f5_local0[1403] + f5_local0[1404] + f5_local0[1405] + f5_local0[1406] + f5_local0[1407] + f5_local0[1408] + f5_local0[1409] then
            goal:ClearSubGoal()
            ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5635)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L2, TARGET_ENE_0, 999, 0, 0)
        end
    end
    if ai:IsInterupt(INTERUPT_TargetOutOfRange) and ai:IsTargetOutOfRangeInterruptSlot(0) then
        Common_NPC_AI(self, ai, goal)
        f5_local0 = MakeNPCProbArr(self, ai, goal, 5)
        local random = ai:GetRandam_Int(1, 100)
        if random <= f5_local0[1501] then
            goal:ClearSubGoal()
            GeneralNPC_Act105(ai, goal)
            return true
        elseif random <= f5_local0[1501] + f5_local0[1502] then
            goal:ClearSubGoal()
            GeneralNPC_Act103(ai, goal)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_SuccessGuard) then
        Common_NPC_AI(self, ai, goal)
        f5_local0 = MakeNPCProbArr(self, ai, goal, 6)
        local random = ai:GetRandam_Int(1, 100)
        if random <= f5_local0[1601] then
            goal:ClearSubGoal()
            GeneralNPC_Act101(ai, goal)
            return true
        elseif random <= f5_local0[1601] + f5_local0[1602] then
            goal:ClearSubGoal()
            GeneralNPC_Act121(ai, goal)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_SuccessParry) then
        Common_NPC_AI(self, ai, goal)
        f5_local0 = MakeNPCProbArr(self, ai, goal, 7)
        local random = ai:GetRandam_Int(1, 100)
        if random <= f5_local0[1701] then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, -1, TARGET_SELF, false, 0):SetLifeEndSuccess(true)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, 999, 0, -1)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_GuardBreak) then
        Common_NPC_AI(self, ai, goal)
        f5_local0 = MakeNPCProbArr(self, ai, goal, 8)
        local random = ai:GetRandam_Int(1, 100)
        if random <= f5_local0[1801] then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, -1, TARGET_SELF, false, 0):SetLifeEndSuccess(true)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, 999, 0, -1)
            return true
        elseif random <= f5_local0[1801] + f5_local0[1802] then
            goal:ClearSubGoal()
            GeneralNPC_Act03(ai, goal)
            return true
        elseif random <= f5_local0[1801] + f5_local0[1802] + f5_local0[1803] then
            goal:ClearSubGoal()
            GeneralNPC_Act21(ai, goal)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_UseItem) then
        Common_NPC_AI(self, ai, goal)
        f5_local0 = MakeNPCProbArr(self, ai, goal, 9)
        local random = ai:GetRandam_Int(1, 100)
        if random <= f5_local0[1901] then
            goal:ClearSubGoal()
            GeneralNPC_Act03(ai, goal)
            return true
        elseif random <= f5_local0[1901] + f5_local0[1902] then
            goal:ClearSubGoal()
            GeneralNPC_Act153()
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_ParryTiming) then
        Common_NPC_AI(self, ai, goal)
        f5_local0 = MakeNPCProbArr(self, ai, goal, 10)
        local random = ai:GetRandam_Int(1, 100)
        if random <= f5_local0[2001] then
            if CanExecArts_Immediately(self, ai, goal, 42) == 1 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.2, NPC_ATK_L2, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        elseif random <= f5_local0[2001] + f5_local0[2002] then
            goal:ClearSubGoal()
            GeneralNPC_Act102(ai, goal)
            return true
        elseif random <= f5_local0[2001] + f5_local0[2002] + f5_local0[2003] then
            goal:ClearSubGoal()
            GeneralNPC_Act103(ai, goal)
            return true
        elseif random <= f5_local0[2001] + f5_local0[2002] + f5_local0[2003] + f5_local0[2004] then
            goal:ClearSubGoal()
            GeneralNPC_Act104(ai, goal)
            return true
        elseif random <= f5_local0[2001] + f5_local0[2002] + f5_local0[2003] + f5_local0[2004] + f5_local0[2005] then
            goal:ClearSubGoal()
            GeneralNPC_Act07(ai, goal)
            return true
        elseif random <= f5_local0[2001] + f5_local0[2002] + f5_local0[2003] + f5_local0[2004] + f5_local0[2005] + f5_local0[2006] then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_Guard, 1.2, NPC_ATK_L1, TARGET_ENE_0, GUARD_GOAL_DESIRE_RET_Continue, true)
            return true
        end
    end
    if ai:IsInterupt(INTERUPT_Outside_ObserveArea) then
        goal:ClearSubGoal()
        ai:DeleteObserve(0)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    end
    if ai:IsInterupt(INTERUPT_Inside_ObserveArea) then
        if ai:IsInsideObserve(1) then
            goal:ClearSubGoal()
            ai:DeleteObserve(1)
            goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 20018641) then
            goal:AddSubGoal(GOAL_COMMON_Wait, 0.3, TARGET_ENE_0)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R2, TARGET_ENE_0, 0, 0, 0, 0, 0)
        end
    end
    if ai:IsInterupt(INTERUPT_FindUnfavorableFailedPoint) or ai:IsInterupt(INTERUPT_MovedEnd_OnFailedPath) then
        ai:SetStringIndexedNumber("IsUnreachMode", 1)
        return true
    end
    return false
    
end

function ExecWeaponChange(f6_arg0, f6_arg1, f6_arg2)
    local f6_local0 = f6_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f6_local1 = f6_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f6_local2 = f6_arg1:GetEquipWeaponIndex(ARM_R)
    local f6_local3 = f6_arg1:GetEquipWeaponIndex(ARM_L)
    local f6_local4 = f6_arg1:GetEquipWeaponId(TARGET_SELF, ARM_R, WEP_Primary)
    local f6_local5 = f6_arg1:GetEquipWeaponId(TARGET_SELF, ARM_R, WEP_Secondary)
    local f6_local6 = f6_arg1:GetEquipWeaponId(TARGET_SELF, ARM_R, WEP_Tertiary)
    local f6_local7 = f6_arg1:GetEquipWeaponId(TARGET_SELF, ARM_L, WEP_Primary)
    local f6_local8 = f6_arg1:GetEquipWeaponId(TARGET_SELF, ARM_L, WEP_Secondary)
    local f6_local9 = f6_arg1:GetEquipWeaponId(TARGET_SELF, ARM_L, WEP_Tertiary)
    if f6_arg1:HasSpecialEffectId(TARGET_SELF, 18678) then
        if f6_local2 == WEP_Primary then
            if f6_arg1:HasSpecialEffectId(TARGET_ENE_0, 1898) or f6_arg1:GetTimer(11) > 0 then
                f6_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.1, NPC_ATK_ArrowKeyRight, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
                f6_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0)
                return 1
            end
        elseif f6_arg1:HasSpecialEffectId(TARGET_ENE_0, 1898) == false and f6_arg1:GetTimer(11) <= 0 then
            f6_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.1, NPC_ATK_ArrowKeyRight, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
            f6_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0)
            return 1
        end
    end
    if f6_local0 == 110000 and (f6_local4 ~= 110000 or f6_local5 ~= 110000 or f6_local6 ~= 110000) then
        f6_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.1, NPC_ATK_ArrowKeyRight, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
        f6_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0)
        return 1
    end
    if f6_local1 == 110000 and (f6_local7 ~= 110000 or f6_local8 ~= 110000 or f6_local9 ~= 110000) then
        f6_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.1, NPC_ATK_ArrowKeyLeft, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
        f6_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0)
        return 1
    end
    local f6_local10 = -1
    if f6_arg1:HasSpecialEffectId(TARGET_SELF, 19393) then
        f6_local10 = 0.7
    elseif f6_arg1:HasSpecialEffectId(TARGET_SELF, 19394) then
        f6_local10 = 0.5
    elseif f6_arg1:HasSpecialEffectId(TARGET_SELF, 19395) then
        f6_local10 = 0.3
    end
    if f6_local10 >= 0 and f6_arg1:GetHpRate(TARGET_SELF) <= f6_local10 then
        if f6_local6 ~= 110000 and f6_local2 ~= WEP_Tertiary then
            f6_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.1, NPC_ATK_ArrowKeyRight, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
            f6_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0)
            return 1
        end
        if f6_local9 ~= 110000 and f6_local3 ~= WEP_Tertiary then
            f6_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.1, NPC_ATK_ArrowKeyLeft, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
            f6_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0)
            return 1
        end
    end
    return 0
    
end

function ExecFirstAction(f7_arg0, f7_arg1, f7_arg2)
    if f7_arg1:HasSpecialEffectId(TARGET_SELF, 18678) and f7_arg1:GetTimer(11) <= 0 and f7_arg1:GetEquipWeaponIndex(ARM_R) == WEP_Primary then
        f7_arg1:SetTimer(11, 20)
        GeneralNPC_Act232(f7_arg1, f7_arg2, paramTbl)
        return 1
    end
    return 0
    
end

function Common_NPC_AI(f8_arg0, f8_arg1, f8_arg2)
    f8_arg1:ResetNPCActProb()
    local f8_local0 = {}
    Common_NPC_AI_GetWeponParam(f8_arg0, f8_arg1, f8_arg2, ARM_R)
    Common_NPC_AI_GetWeponParam(f8_arg0, f8_arg1, f8_arg2, ARM_L)
    local f8_local1 = f8_arg1:GetStringIndexedNumber("R_WeaponType")
    local f8_local2 = f8_arg1:GetStringIndexedNumber("L_WeaponType")
    local distance = f8_arg1:GetDist(TARGET_ENE_0)
    if f8_local1 == 12 and f8_local2 ~= 10 then
        f8_local1 = 11
    end
    local f8_local4 = 0
    if distance > 7 then
        f8_local4 = 4
    elseif distance > 5 then
        f8_local4 = 3
    elseif distance > 3 then
        f8_local4 = 2
    elseif distance > 1 then
        f8_local4 = 1
    else
        f8_local4 = 0
    end
    local f8_local5 = 0
    if f8_local1 == 1 then
        f8_local5 = 10
    elseif f8_local1 == 2 then
        f8_local5 = 20
    elseif f8_local1 == 11 then
        f8_local5 = 30
    elseif f8_local1 == 12 then
        f8_local5 = 40
    elseif f8_local1 == 13 then
        f8_local5 = 50
    elseif f8_local1 == 30 and CheckMagicType(f8_arg0, f8_arg1, f8_arg2) == 1 then
        f8_local5 = 100
    elseif f8_local1 == 30 and CheckMagicType(f8_arg0, f8_arg1, f8_arg2) == 2 then
        f8_local5 = 110
    elseif f8_local1 == 30 and CheckMagicType(f8_arg0, f8_arg1, f8_arg2) == 3 then
        f8_local5 = 120
    elseif f8_local1 == 20 then
        f8_local5 = 200
    end
    f8_local5 = f8_local5 + f8_local4
    f8_arg1:AddNPCActProb(f8_local5)
    local f8_local6 = 0
    if f8_local2 == 1 then
        f8_local6 = 500
    elseif f8_local2 == 2 then
        f8_local6 = 510
    elseif f8_local2 == 20 then
        f8_local6 = 600
    elseif f8_local2 == 30 then
        f8_local6 = 700
    elseif f8_local2 == 10 or f8_local2 == 11 then
        f8_local6 = 800
    end
    f8_local6 = f8_local6 + f8_local4
    f8_arg1:AddNPCActProb(f8_local6)
    local f8_local7 = f8_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f8_local8 = f8_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f8_local9 = f8_arg1:GetWeaponBehaviorVarID(f8_local7)
    local f8_local10 = f8_arg1:GetWeaponBehaviorVarID(f8_local8)
    if f8_local9 >= 1600 and f8_local9 <= 1899 and f8_local9 >= 3000 and f8_local9 <= 3299 then
        f8_arg1:AddNPCActProb(1000 + f8_local4)
    end
    if f8_local9 >= 1200 and f8_local9 <= 1299 then
        f8_arg1:AddNPCActProb(1010 + f8_local4)
    end
    local f8_local11 = GetCondNum_ForArts(f8_arg1, ARM_R)
    local f8_local12 = GetCondNum_ForArts(f8_arg1, ARM_L)
    if f8_local11 > 0 then
        f8_local11 = f8_local11 + f8_local4
        f8_arg1:AddNPCActProb(f8_local11)
    end
    if f8_local12 > 0 and f8_local12 ~= f8_local11 then
        f8_local12 = f8_local12 + f8_local4
        f8_arg1:AddNPCActProb(f8_local12)
    end
    if f8_arg1:IsTargetGuard(TARGET_ENE_0) == true then
        f8_arg1:AddNPCActProb(3000)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_ENE_0, PLAN_SP_EFFECT_ANIME_SLEEPING) == true then
        f8_arg1:AddNPCActProb(3100)
    end
    if f8_arg1:IsInsideTargetCustom(TARGET_SELF, TARGET_FRI_0, AI_DIR_TYPE_F, 360, 180, 45) then
    else
        f8_arg1:AddNPCActProb(3500)
    end
    if f8_arg1:GetHpRate(TARGET_FRI_0) >= 0.5 then
        f8_arg1:AddNPCActProb(3500)
    end
    local f8_local13 = f8_arg1:GetWeightType(TARGET_SELF)
    if f8_local13 == AI_TARGET_WEIGHT_TYPE_WeightOver then
        f8_arg1:AddNPCActProb(4000)
    elseif f8_local13 == AI_TARGET_WEIGHT_TYPE_Heavy then
        f8_arg1:AddNPCActProb(4010)
    elseif f8_local13 == AI_TARGET_WEIGHT_TYPE_Normal then
        f8_arg1:AddNPCActProb(4020)
    elseif f8_local13 == AI_TARGET_WEIGHT_TYPE_Light then
        f8_arg1:AddNPCActProb(4030)
    end
    if f8_arg1:GetHpRate(TARGET_SELF) >= 0.5 then
        f8_arg1:AddNPCActProb(4100)
    end
    if f8_arg1:GetSp(TARGET_SELF) <= 1 then
        f8_arg1:AddNPCActProb(4200)
        f8_arg1:SetStringIndexedNumber("IsExistSpAtPlanning", 0)
    else
        f8_arg1:SetStringIndexedNumber("IsExistSpAtPlanning", 1)
    end
    if HasSpelltypeX(f8_arg0, f8_arg1, f8_arg2, 12) == false then
        f8_arg1:AddNPCActProb(6000)
    end
    if HasSpelltypeX(f8_arg0, f8_arg1, f8_arg2, 11) == false then
        f8_arg1:AddNPCActProb(6010)
    end
    if HasSpelltypeX(f8_arg0, f8_arg1, f8_arg2, 10) == false then
        f8_arg1:AddNPCActProb(6020)
    end
    if HasSpelltypeX(f8_arg0, f8_arg1, f8_arg2, 20) == false then
        f8_arg1:AddNPCActProb(6030)
    end
    if HasSpelltypeX(f8_arg0, f8_arg1, f8_arg2, 21) == false then
        f8_arg1:AddNPCActProb(6031)
    end
    if HasSpelltypeX(f8_arg0, f8_arg1, f8_arg2, 30) == false then
        f8_arg1:AddNPCActProb(6040)
    end
    if HasSpelltypeX(f8_arg0, f8_arg1, f8_arg2, 50) == false then
        f8_arg1:AddNPCActProb(6050)
    end
    local f8_local14 = true
    local f8_local15 = true
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 12, f8_local7) == false then
        f8_arg1:AddNPCActProb(6400)
    else
        f8_local14 = false
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 11, f8_local7) == false then
        f8_arg1:AddNPCActProb(6410)
    else
        f8_local14 = false
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 10, f8_local7) == false then
        f8_arg1:AddNPCActProb(6420)
    else
        f8_local14 = false
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 20, f8_local7) == false then
        f8_arg1:AddNPCActProb(6430)
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 21, f8_local7) == false then
        f8_arg1:AddNPCActProb(6431)
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 30, f8_local7) == false then
        f8_arg1:AddNPCActProb(6440)
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 50, f8_local7) == false then
        f8_arg1:AddNPCActProb(6450)
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 12, f8_local8) == false then
        f8_arg1:AddNPCActProb(6600)
    else
        f8_local15 = false
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 11, f8_local8) == false then
        f8_arg1:AddNPCActProb(6610)
    else
        f8_local15 = false
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 10, f8_local8) == false then
        f8_arg1:AddNPCActProb(6620)
    else
        f8_local15 = false
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 20, f8_local8) == false then
        f8_arg1:AddNPCActProb(6630)
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 21, f8_local8) == false then
        f8_arg1:AddNPCActProb(6631)
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 30, f8_local8) == false then
        f8_arg1:AddNPCActProb(6640)
    end
    if HasSpelltypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 50, f8_local8) == false then
        f8_arg1:AddNPCActProb(6650)
    end
    if f8_arg1:GetStringIndexedNumber("R_WeaponType") == 30 and f8_local14 == true then
        f8_arg1:AddNPCActProb(6800)
    end
    local f8_local16 = 1
    local f8_local17 = f8_arg1:GetToTargetAngle(TARGET_ENE_0)
    local f8_local18 = f8_arg1:GetExistMeshOnLineDistSpecifyAngle(TARGET_SELF, f8_local17 + 90, f8_local16, AI_SPA_DIR_TYPE_TargetF)
    local f8_local19 = f8_arg1:GetExistMeshOnLineDistSpecifyAngle(TARGET_SELF, f8_local17 - 90, f8_local16, AI_SPA_DIR_TYPE_TargetF)
    local f8_local20 = f8_arg1:GetExistMeshOnLineDistSpecifyAngle(TARGET_SELF, f8_local17 - 180, f8_local16, AI_SPA_DIR_TYPE_TargetF)
    if f8_local20 < f8_local16 then
        f8_arg1:AddNPCActProb(7000)
    end
    if f8_local18 < f8_local16 and f8_local19 < f8_local16 then
        f8_arg1:AddNPCActProb(7010)
    end
    if f8_arg1:GetStringIndexedNumber("IsUnreachMode") == 1 then
        if f8_arg1:IsFinishTimer(10) then
            f8_arg1:SetTimer(10, 1)
            if f8_arg1:CheckDoesExistPath(TARGET_ENE_0, AI_DIR_TYPE_CENTER, 0) == true then
                f8_arg1:SetStringIndexedNumber("IsUnreachMode", 0)
            else
                f8_arg1:AddNPCActProb(7800)
            end
        else
            f8_arg1:AddNPCActProb(7800)
        end
    end
    if HasItemtypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 10) == false then
        f8_arg1:AddNPCActProb(8000)
    end
    if HasItemtypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 20) == false then
        f8_arg1:AddNPCActProb(8010)
    end
    if HasItemtypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 30) == false then
        f8_arg1:AddNPCActProb(8020)
    end
    if HasItemtypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 31) == false then
        f8_arg1:AddNPCActProb(8030)
    end
    if HasItemtypeX_CanUse(f8_arg0, f8_arg1, f8_arg2, 50) == false then
        f8_arg1:AddNPCActProb(8040)
    end
    local f8_local21 = f8_arg1:GetWeaponBehaviorVarID(f8_arg1:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Arrow, 0))
    local f8_local22 = f8_arg1:GetWeaponBehaviorVarID(f8_arg1:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Arrow, 1))
    local f8_local23 = f8_arg1:GetWeaponBehaviorVarID(f8_arg1:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Bolt, 0))
    local f8_local24 = f8_arg1:GetWeaponBehaviorVarID(f8_arg1:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Bolt, 1))
    local f8_local25 = GetBowType(f8_local9)
    local f8_local26 = GetBowType(f8_local10)
    local f8_local27 = GetArrowType(f8_local21)
    local f8_local28 = GetArrowType(f8_local22)
    local f8_local29 = GetBoltType(f8_local23)
    local f8_local30 = GetBoltType(f8_local24)
    local f8_local31 = false
    local f8_local32 = false
    if f8_local25 == 40 then
        if f8_local27 ~= 50 then
            f8_arg1:AddNPCActProb(8400)
        end
        if f8_local28 ~= 50 then
            f8_arg1:AddNPCActProb(8401)
        end
        if f8_local27 ~= 50 and f8_local28 ~= 50 then
            f8_local31 = true
        end
    elseif f8_local25 == 42 then
        if f8_local27 ~= 51 then
            f8_arg1:AddNPCActProb(8400)
        end
        if f8_local28 ~= 51 then
            f8_arg1:AddNPCActProb(8401)
        end
        if f8_local27 ~= 51 and f8_local28 ~= 51 then
            f8_local31 = true
        end
    elseif f8_local25 == 43 then
        if f8_local29 ~= 52 then
            f8_arg1:AddNPCActProb(8400)
        end
        if f8_local30 ~= 52 then
            f8_arg1:AddNPCActProb(8401)
        end
        if f8_local29 ~= 52 and f8_local30 ~= 52 then
            f8_local31 = true
        end
    elseif f8_local25 == 44 then
        if f8_local29 ~= 53 then
            f8_arg1:AddNPCActProb(8400)
        end
        if f8_local30 ~= 53 then
            f8_arg1:AddNPCActProb(8401)
        end
        if f8_local29 ~= 53 and f8_local30 ~= 53 then
            f8_local31 = true
        end
    end
    if f8_local26 == 40 then
        if f8_local27 ~= 50 then
            f8_arg1:AddNPCActProb(8410)
        end
        if f8_local28 ~= 50 then
            f8_arg1:AddNPCActProb(8411)
        end
        if f8_local27 ~= 50 and f8_local28 ~= 50 then
            f8_local32 = true
        end
    elseif f8_local26 == 42 then
        if f8_local27 ~= 51 then
            f8_arg1:AddNPCActProb(8410)
        end
        if f8_local28 ~= 51 then
            f8_arg1:AddNPCActProb(8411)
        end
        if f8_local27 ~= 51 and f8_local28 ~= 51 then
            f8_local32 = true
        end
    elseif f8_local26 == 43 then
        if f8_local29 ~= 52 then
            f8_arg1:AddNPCActProb(8410)
        end
        if f8_local30 ~= 52 then
            f8_arg1:AddNPCActProb(8411)
        end
        if f8_local29 ~= 52 and f8_local30 ~= 52 then
            f8_local32 = true
        end
    elseif f8_local26 == 44 then
        if f8_local29 ~= 53 then
            f8_arg1:AddNPCActProb(8410)
        end
        if f8_local30 ~= 53 then
            f8_arg1:AddNPCActProb(8411)
        end
        if f8_local29 ~= 53 and f8_local30 ~= 53 then
            f8_local31 = true
        end
    end
    local f8_local33 = false
    if f8_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_R or f8_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        f8_arg1:AddNPCActProb(9000)
    elseif f8_arg1:GetStringIndexedNumber("L_WeaponType") ~= 10 then
        f8_arg1:AddNPCActProb(9000)
    end
    if CanExecArts_Immediately(f8_arg0, f8_arg1, f8_arg2, 40) == 0 and CanExecArts_Immediately(f8_arg0, f8_arg1, f8_arg2, 41) == 0 then
        f8_arg1:AddNPCActProb(9005)
    end
    if f8_arg1:GetTimer(5) > 0 then
        f8_arg1:AddNPCActProb(9010)
    end
    if f8_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        f8_arg1:AddNPCActProb(9020)
    elseif f8_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        f8_arg1:AddNPCActProb(9021)
    else
        f8_arg1:AddNPCActProb(9022)
    end
    if GetDualAttackType(f8_arg1, f8_arg2) >= 0 then
        f8_arg1:AddNPCActProb(9100)
    end
    if GetArtsUsageParam(f8_arg1, ARM_L) == 90000000 then
        f8_arg1:AddNPCActProb(9120)
    end
    if f8_arg1:GetTimer(3) > 0 then
        f8_arg1:AddNPCActProb(9503)
    end
    if f8_arg1:GetTimer(4) > 0 then
        f8_arg1:AddNPCActProb(9504)
    end
    if f8_arg1:GetTimer(6) > 0 then
        f8_arg1:AddNPCActProb(9506)
    end
    if f8_arg1:GetTimer(7) > 0 then
        f8_arg1:AddNPCActProb(9507)
    end
    if f8_arg1:GetTimer(8) > 0 then
        f8_arg1:AddNPCActProb(9508)
    end
    if f8_arg1:GetTimer(9) > 0 then
        f8_arg1:AddNPCActProb(9509)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018726) then
        f8_arg1:AddNPCActProb(9510)
    end
    if f8_arg1:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer) == 1 then
        local f8_local34 = f8_arg1:GetTeamOrder(ORDER_TYPE_Role)
        if f8_local34 == ROLE_TYPE_Torimaki then
            f8_arg1:AddNPCActProb(9600)
        elseif f8_local34 == ROLE_TYPE_Kankyaku then
            f8_arg1:AddNPCActProb(9700)
        end
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 5020) then
        f8_arg1:AddNPCActProb(15020)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 5021) then
        f8_arg1:AddNPCActProb(15021)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 5022) then
        f8_arg1:AddNPCActProb(15022)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 5023) then
        f8_arg1:AddNPCActProb(15023)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 5024) then
        f8_arg1:AddNPCActProb(15024)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18690) then
        f8_arg1:AddNPCActProb(15030)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18691) then
        f8_arg1:AddNPCActProb(15031)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18692) then
        f8_arg1:AddNPCActProb(15032)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18693) then
        f8_arg1:AddNPCActProb(15033)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18694) then
        f8_arg1:AddNPCActProb(15034)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18695) then
        f8_arg1:AddNPCActProb(15035)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18650) then
        f8_arg1:AddNPCActProb(15036)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18651) then
        f8_arg1:AddNPCActProb(15037)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18652) then
        f8_arg1:AddNPCActProb(15038)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18653) then
        f8_arg1:AddNPCActProb(15039)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18654) then
        f8_arg1:AddNPCActProb(15040)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18655) then
        f8_arg1:AddNPCActProb(15041)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18656) then
        f8_arg1:AddNPCActProb(15042)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18657) then
        f8_arg1:AddNPCActProb(15043)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18658) then
        f8_arg1:AddNPCActProb(15044)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18659) then
        f8_arg1:AddNPCActProb(15045)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18660) then
        f8_arg1:AddNPCActProb(15046)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18661) then
        f8_arg1:AddNPCActProb(15047)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18662) then
        f8_arg1:AddNPCActProb(15048)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18663) then
        f8_arg1:AddNPCActProb(15049)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18664) then
        f8_arg1:AddNPCActProb(15050)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18665) then
        f8_arg1:AddNPCActProb(15051)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18666) then
        f8_arg1:AddNPCActProb(15052)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18667) then
        f8_arg1:AddNPCActProb(15053)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18668) then
        f8_arg1:AddNPCActProb(15054)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18669) then
        f8_arg1:AddNPCActProb(15055)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18670) then
        f8_arg1:AddNPCActProb(15056)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 18671) then
        f8_arg1:AddNPCActProb(15057)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 19384) then
        f8_arg1:AddNPCActProb(15058)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018660) then
        f8_arg1:AddNPCActProb(15100)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018661) then
        f8_arg1:AddNPCActProb(15101)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018662) then
        f8_arg1:AddNPCActProb(15102)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018663) then
        f8_arg1:AddNPCActProb(15103)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018664) then
        f8_arg1:AddNPCActProb(15104)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018665) then
        f8_arg1:AddNPCActProb(15105)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018666) then
        f8_arg1:AddNPCActProb(15106)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018667) then
        f8_arg1:AddNPCActProb(15107)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018668) then
        f8_arg1:AddNPCActProb(15108)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018672) then
        f8_arg1:AddNPCActProb(15109)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018673) then
        f8_arg1:AddNPCActProb(15110)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018674) then
        f8_arg1:AddNPCActProb(15111)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018675) then
        f8_arg1:AddNPCActProb(15112)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018676) then
        f8_arg1:AddNPCActProb(15113)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018677) then
        f8_arg1:AddNPCActProb(15114)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018678) then
        f8_arg1:AddNPCActProb(15115)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018679) then
        f8_arg1:AddNPCActProb(15116)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018680) then
        f8_arg1:AddNPCActProb(15117)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018681) then
        f8_arg1:AddNPCActProb(15119)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018684) then
        f8_arg1:AddNPCActProb(15121)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018647) then
        f8_arg1:AddNPCActProb(15124)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018689) then
        f8_arg1:AddNPCActProb(15124)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018685) then
        f8_arg1:AddNPCActProb(15122)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018686) then
        f8_arg1:AddNPCActProb(15123)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018692) then
        f8_arg1:AddNPCActProb(15125)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018693) then
        f8_arg1:AddNPCActProb(15126)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018694) then
        f8_arg1:AddNPCActProb(15127)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018695) then
        f8_arg1:AddNPCActProb(15128)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018696) then
        f8_arg1:AddNPCActProb(15129)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018697) then
        f8_arg1:AddNPCActProb(15130)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018698) then
        f8_arg1:AddNPCActProb(15131)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018699) then
        f8_arg1:AddNPCActProb(15132)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018700) then
        f8_arg1:AddNPCActProb(15133)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018701) then
        f8_arg1:AddNPCActProb(15134)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018702) then
        f8_arg1:AddNPCActProb(15135)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018703) then
        f8_arg1:AddNPCActProb(15136)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018704) then
        f8_arg1:AddNPCActProb(15137)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018705) then
        f8_arg1:AddNPCActProb(15138)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018706) then
        f8_arg1:AddNPCActProb(15139)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018707) then
        f8_arg1:AddNPCActProb(15140)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018708) then
        f8_arg1:AddNPCActProb(15141)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018709) then
        f8_arg1:AddNPCActProb(15142)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018710) then
        f8_arg1:AddNPCActProb(15143)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018711) then
        f8_arg1:AddNPCActProb(15144)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018712) then
        f8_arg1:AddNPCActProb(15145)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018713) then
        f8_arg1:AddNPCActProb(15146)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018714) then
        f8_arg1:AddNPCActProb(15147)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018715) then
        f8_arg1:AddNPCActProb(15148)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018716) then
        f8_arg1:AddNPCActProb(15149)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018717) then
        f8_arg1:AddNPCActProb(15150)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018718) then
        f8_arg1:AddNPCActProb(15151)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018719) then
        f8_arg1:AddNPCActProb(15118)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018720) then
        f8_arg1:AddNPCActProb(15152)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018721) then
        f8_arg1:AddNPCActProb(15153)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018722) then
        f8_arg1:AddNPCActProb(15154)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018724) then
        f8_arg1:AddNPCActProb(15155)
    end
    if f8_arg1:HasSpecialEffectId(TARGET_SELF, 20018725) then
        f8_arg1:AddNPCActProb(15156)
    end
    f8_arg1:SetStringIndexedNumber("IsUselessWeapon", 0)
    if (f8_arg1:GetStringIndexedNumber("R_WeaponType") == 30 and f8_local14 == true or f8_arg1:GetStringIndexedNumber("R_WeaponType") == 20 and f8_local31 == true or f8_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R) == 110000) and (f8_arg1:GetStringIndexedNumber("L_WeaponType") == 30 and f8_local15 == true or f8_arg1:GetStringIndexedNumber("L_WeaponType") == 20 and f8_local32 == true or f8_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L) == 110000) then
        f8_arg1:SetStringIndexedNumber("IsUselessWeapon", 1)
    end
    
end

function MakeNPCProbArr(f9_arg0, f9_arg1, f9_arg2, f9_arg3)
    local f9_local0 = {}
    local f9_local1 = 0
    if f9_arg3 == 1 then
        for f9_local2 = 1, 300, 1 do
            f9_local0[f9_local2] = math.max(0, f9_arg1:GetNPCActProb(f9_local2))
        end
    end
    if f9_arg3 == 2 then
        for f9_local2 = 1200, 1210, 1 do
            f9_local0[f9_local2] = math.max(0, f9_arg1:GetNPCActProb(f9_local2))
        end
    end
    if f9_arg3 == 3 then
        for f9_local2 = 1300, 1310, 1 do
            f9_local0[f9_local2] = math.max(0, f9_arg1:GetNPCActProb(f9_local2))
        end
    end
    if f9_arg3 == 4 then
        for f9_local2 = 1400, 1410, 1 do
            f9_local0[f9_local2] = math.max(0, f9_arg1:GetNPCActProb(f9_local2))
        end
    end
    if f9_arg3 == 5 then
        for f9_local2 = 1500, 1510, 1 do
            f9_local0[f9_local2] = math.max(0, f9_arg1:GetNPCActProb(f9_local2))
        end
    end
    if f9_arg3 == 6 then
        for f9_local2 = 1600, 1610, 1 do
            f9_local0[f9_local2] = math.max(0, f9_arg1:GetNPCActProb(f9_local2))
        end
    end
    if f9_arg3 == 7 then
        for f9_local2 = 1700, 1710, 1 do
            f9_local0[f9_local2] = math.max(0, f9_arg1:GetNPCActProb(f9_local2))
        end
    end
    if f9_arg3 == 8 then
        for f9_local2 = 1800, 1810, 1 do
            f9_local0[f9_local2] = math.max(0, f9_arg1:GetNPCActProb(f9_local2))
        end
    end
    if f9_arg3 == 9 then
        for f9_local2 = 1900, 1910, 1 do
            f9_local0[f9_local2] = math.max(0, f9_arg1:GetNPCActProb(f9_local2))
        end
    end
    if f9_arg3 == 10 then
        for f9_local2 = 2000, 2010, 1 do
            f9_local0[f9_local2] = math.max(0, f9_arg1:GetNPCActProb(f9_local2))
        end
    end
    return f9_local0
    
end

function GetBowType(f10_arg0)
    local f10_local0 = -1
    if f10_arg0 >= 4000 and f10_arg0 <= 4199 then
        f10_local0 = 40
    elseif f10_arg0 >= 4200 and f10_arg0 <= 4299 then
        f10_local0 = 42
    elseif f10_arg0 >= 4300 and f10_arg0 <= 4399 then
        f10_local0 = 43
    elseif f10_arg0 >= 4400 and f10_arg0 <= 4449 then
        f10_local0 = 44
    end
    return f10_local0
    
end

function GetArrowType(f11_arg0)
    local f11_local0 = -1
    if f11_arg0 >= 5000 and f11_arg0 <= 5099 then
        f11_local0 = 50
    end
    if f11_arg0 >= 5100 and f11_arg0 <= 5199 then
        f11_local0 = 51
    end
    return f11_local0
    
end

function GetBoltType(f12_arg0)
    local f12_local0 = -1
    if f12_arg0 >= 5200 and f12_arg0 <= 5299 then
        f12_local0 = 52
    end
    if f12_arg0 >= 5300 and f12_arg0 <= 5399 then
        f12_local0 = 53
    end
    return f12_local0
    
end

function GetUsageId_AA(f13_arg0, f13_arg1)
    return math.floor(f13_arg1 / 1000000)
    
end

function GetUsageId_X(f14_arg0, f14_arg1)
    return math.floor(f14_arg0:Mod(f14_arg1, 1000000) / 100000)
    
end

function GetUsageId_B(f15_arg0, f15_arg1)
    return math.floor(f15_arg0:Mod(f15_arg1, 100000) / 10000)
    
end

function GetUsageId_CC(f16_arg0, f16_arg1)
    return math.floor(f16_arg0:Mod(f16_arg1, 10000) / 100)
    
end

function GetUsageId_DD(f17_arg0, f17_arg1)
    return math.floor(f17_arg0:Mod(f17_arg1, 100))
    
end

function GetArtsUsageParam(f18_arg0, f18_arg1)
    local f18_local0 = f18_arg0:GetAIUsageParam(2, f18_arg0:GetArtsID(f18_arg1))
    local f18_local1 = f18_arg0:GetCurrentEquipWeaponId(TARGET_SELF, f18_arg1)
    local f18_local2 = f18_arg0:GetWeaponBehaviorVarID(f18_local1)
    local f18_local3 = GetBowType(f18_local2)
    local f18_local4 = f18_arg0:GetWeaponBehaviorVarID(f18_arg0:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Arrow, 0))
    local f18_local5 = f18_arg0:GetWeaponBehaviorVarID(f18_arg0:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Arrow, 1))
    local f18_local6 = GetArrowType(f18_local4)
    local f18_local7 = GetArrowType(f18_local5)
    if f18_local1 == 110000 or GetDualAttackType(f18_arg0, goal) >= 0 and f18_arg1 == ARM_L then
        f18_local0 = 90000000
    end
    if f18_local3 == 40 then
        if f18_local6 ~= 50 and f18_local7 ~= 50 then
            f18_local0 = -1
        end
    elseif f18_local3 == 42 and f18_local6 ~= 51 and f18_local7 ~= 51 then
        f18_local0 = -1
    end
    return f18_local0
    
end

function GetCondNum_ForArts(f19_arg0, f19_arg1)
    local f19_local0 = GetArtsUsageParam(f19_arg0, f19_arg1)
    local f19_local1 = GetUsageId_AA(f19_arg0, f19_local0)
    local f19_local2 = GetUsageId_X(f19_arg0, f19_local0)
    local f19_local3 = -1
    if f19_local2 == 2 and f19_arg0:GetTimer(2) > 0 then
        return -1
    end
    if f19_local1 == 12 then
        f19_local3 = 2000
    elseif f19_local1 == 11 then
        f19_local3 = 2010
    elseif f19_local1 == 10 then
        f19_local3 = 2020
    elseif f19_local1 == 20 then
        f19_local3 = 2030
    elseif f19_local1 == 30 then
        local f19_local4 = GetUsageId_B(f19_arg0, f19_local0)
        if f19_local4 == 0 then
            if f19_arg0:HasSpecialEffectCategory(TARGET_SELF, 156) == false and f19_arg0:HasSpecialEffectCategory(TARGET_SELF, 160) == false and f19_arg0:HasSpecialEffectCategory(TARGET_SELF, 1001) == false then
                f19_local3 = 2040
            end
        elseif f19_local4 == 1 then
            if f19_arg0:HasSpecialEffectCategory(TARGET_SELF, 162) == false and f19_arg0:HasSpecialEffectCategory(TARGET_SELF, 163) == false then
                f19_local3 = 2040
            end
        elseif f19_local4 == 8 and f19_arg0:HasSpecialEffectId(TARGET_ENE_0, 1897) == false then
            f19_local3 = 2040
        end
    elseif f19_local1 == 40 then
        f19_local3 = 2050
    elseif f19_local1 == 41 then
        f19_local3 = 2060
    elseif f19_local1 == 42 then
        f19_local3 = 2070
    elseif f19_local1 == 50 then
        local f19_local4 = GetUsageId_B(f19_arg0, f19_local0)
        if f19_local4 == 0 then
            f19_local3 = 2080
        elseif f19_local4 == 1 and f19_arg0:HasSpecialEffectId(TARGET_ENE_0, 1897) == false then
            f19_local3 = 2080
        end
    end
    return f19_local3
    
end

function CheckMagicType(f20_arg0, f20_arg1, f20_arg2)
    local f20_local0 = 0
    local f20_local1 = 0
    local f20_local2 = 0
    local f20_local3 = {[12] = 0, [11] = 0, [10] = 0}
    for f20_local4 = 0, 6, 1 do
        f20_local1 = f20_arg1:GetEquipMagicId(TARGET_SELF, f20_local4)
        f20_local2 = GetSpellType(f20_arg0, f20_arg1, f20_local1)
        if f20_local2 == 12 or f20_local2 == 11 or f20_local2 == 10 then
            f20_local3[f20_local2] = f20_local3[f20_local2] + 1
        end
    end
    if f20_local3[10] >= f20_local3[11] and f20_local3[10] >= f20_local3[12] then
        return 1
    elseif f20_local3[11] >= f20_local3[12] and f20_local3[11] > f20_local3[10] then
        return 2
    else
        return 3
    end
    

end

function HasSpelltypeX(f21_arg0, f21_arg1, f21_arg2, f21_arg3)
    local f21_local0 = -1
    local f21_local1 = -1
    local f21_local2 = false
    local f21_local3 = nil
    for f21_local4 = 0, 9, 1 do
        f21_local0 = f21_arg1:GetEquipMagicId(TARGET_SELF, f21_local4)
        f21_local1 = GetSpellType(f21_arg0, f21_arg1, f21_local0)
        if f21_local1 == f21_arg3 then
            f21_local2 = true
        end
    end
    return f21_local2
    

end

function HasSpelltypeX_CanUse(f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4)
    local f22_local0 = -1
    local f22_local1 = -1
    local f22_local2 = false
    local f22_local3 = nil
    for f22_local4 = 0, 9, 1 do
        f22_local0 = f22_arg1:GetEquipMagicId(TARGET_SELF, f22_local4)
        f22_local1 = GetSpellType(f22_arg0, f22_arg1, f22_local0)
        if f22_local1 == f22_arg3 and CanUseSpell(f22_arg0, f22_arg1, f22_arg2, f22_local0, f22_arg4) == true then
            f22_local2 = true
        end
    end
    return f22_local2
    

end

function CanUseSpell(f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4)
    local f23_local0 = -1
    local f23_local1 = -1
    local f23_local2 = -1
    local f23_local3 = false
    local f23_local4 = f23_arg1:GetMagicCategory(f23_arg3)
    if f23_arg1:CanShootMagicByType(f23_arg4, f23_local4) == false then
        return false
    end
    f23_local0 = f23_arg1:GetAIUsageParam(0, f23_arg3)
    f23_local1 = GetUsageId_AA(f23_arg1, f23_local0)
    f23_local2 = GetUsageId_B(f23_arg1, f23_local0)
    X_UsageId = GetUsageId_X(f23_arg1, f23_local0)
    if X_UsageId == 1 and f23_arg1:GetTimer(1) > 0 then
        return false
    end
    if f23_local1 == 10 then
        f23_local3 = true
    elseif f23_local1 == 11 then
        f23_local3 = true
    elseif f23_local1 == 12 then
        f23_local3 = true
    elseif f23_local1 == 20 then
        f23_local3 = true
    elseif f23_local1 == 21 then
        f23_local3 = true
    elseif f23_local1 == 30 then
        if f23_local2 == 0 then
            if f23_arg1:HasSpecialEffectCategory(TARGET_SELF, 151) == false and f23_arg1:HasSpecialEffectCategory(TARGET_SELF, 156) == false and f23_arg1:HasSpecialEffectCategory(TARGET_SELF, 160) == false and f23_arg1:HasSpecialEffectId(TARGET_SELF, 1676000) == false and f23_arg1:HasSpecialEffectId(TARGET_SELF, 21490000) == false and f23_arg1:HasSpecialEffectCategory(TARGET_SELF, 1001) == false then
                f23_local3 = true
            end
        elseif f23_local2 == 1 then
            if f23_arg1:HasSpecialEffectCategory(TARGET_SELF, 162) == false and f23_arg1:CanWeaponEnhance(f23_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)) then
                f23_local3 = true
            end
        elseif f23_local2 == 2 and f23_arg1:HasSpecialEffectCategory(TARGET_SELF, 163) == false and f23_arg1:GetStringIndexedNumber("L_WeaponType") == 10 == true then
            f23_local3 = true
        end
    elseif f23_local1 == 50 then
        f23_local3 = true
    end
    return f23_local3
    
end

function GetSpellType(f24_arg0, f24_arg1, f24_arg2)
    local f24_local0 = -1
    local f24_local1 = -1
    local f24_local2 = -1
    if f24_arg2 ~= -1 then
        f24_local1 = f24_arg1:GetAIUsageParam(0, f24_arg2)
        f24_local2 = GetUsageId_AA(f24_arg1, f24_local1)
    end
    return f24_local2
    
end

function GetRandomSpellId_ByType(f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4)
    local f25_local0 = 0
    local f25_local1 = 0
    local f25_local2 = 0
    local f25_local3 = 0
    local f25_local4 = {}
    local f25_local5 = {}
    local f25_local6 = nil
    for f25_local7 = 0, 9, 1 do
        f25_local0 = f25_arg1:GetEquipMagicId(TARGET_SELF, f25_local7)
        f25_local1 = GetSpellType(f25_arg0, f25_arg1, f25_local0)
        if f25_local1 == f25_arg3 and CanUseSpell(f25_arg0, f25_arg1, f25_arg2, f25_local0, f25_arg4) == true then
            f25_local4[f25_local7] = f25_local0
            f25_local3 = f25_local3 + 1
            f25_local5[f25_local3] = f25_local7
        end
    end
    local random = f25_arg1:GetRandam_Int(1, 100)
    local f25_local8 = 0
    if f25_local3 ~= 0 then
        for f25_local9 = 1, f25_local3, 1 do
            f25_local8 = f25_local8 + 1 / f25_local3 * 100
            if random <= f25_local8 then
                f25_local2 = f25_local4[f25_local5[f25_local9]]
                break
            elseif f25_local9 == f25_local3 then
                f25_local2 = f25_local4[f25_local5[f25_local9]]
            end
        end
    end
    return f25_local2
    

end

function HasItemtypeX(f26_arg0, f26_arg1, f26_arg2, f26_arg3)
    local f26_local0 = -1
    local f26_local1 = -1
    local f26_local2 = false
    local f26_local3 = nil
    for f26_local4 = 0, 9, 1 do
        f26_local0 = f26_arg1:GetEquipItemId(TARGET_SELF, f26_local4, ITEM_SLOTTYPE_SHORTCUT)
        f26_local1 = GetItemType(f26_arg0, f26_arg1, f26_local0)
        if f26_local1 == f26_arg3 then
            f26_local2 = true
            break
        end
    end
    if f26_local2 == false then
        for f26_local4 = 0, 5, 1 do
            f26_local0 = f26_arg1:GetEquipItemId(TARGET_SELF, f26_local4, ITEM_SLOTTYPE_TOOLBOX)
            f26_local1 = GetItemType(f26_arg0, f26_arg1, f26_local0)
            if f26_local1 == f26_arg3 then
                f26_local2 = true
                break
            end
        end
    end
    return f26_local2
    

end

function HasItemtypeX_CanUse(f27_arg0, f27_arg1, f27_arg2, f27_arg3)
    local f27_local0 = -1
    local f27_local1 = -1
    local f27_local2 = false
    local f27_local3 = nil
    for f27_local4 = 0, 9, 1 do
        f27_local0 = f27_arg1:GetEquipItemId(TARGET_SELF, f27_local4, ITEM_SLOTTYPE_SHORTCUT)
        f27_local1 = GetItemType(f27_arg0, f27_arg1, f27_local0)
        if f27_local1 == f27_arg3 and CanUseItem(f27_arg0, f27_arg1, f27_arg2, f27_local0) == true then
            f27_local2 = true
            break
        end
    end
    if f27_local2 == false then
        for f27_local4 = 0, 5, 1 do
            f27_local0 = f27_arg1:GetEquipItemId(TARGET_SELF, f27_local4, ITEM_SLOTTYPE_TOOLBOX)
            f27_local1 = GetItemType(f27_arg0, f27_arg1, f27_local0)
            if f27_local1 == f27_arg3 and CanUseItem(f27_arg0, f27_arg1, f27_arg2, f27_local0) == true then
                f27_local2 = true
                break
            end
        end
    end
    return f27_local2
    

end

function GetItemType(f28_arg0, f28_arg1, f28_arg2)
    local f28_local0 = -1
    local f28_local1 = -1
    local f28_local2 = -1
    if f28_arg2 ~= -1 then
        f28_local1 = f28_arg1:GetAIUsageParam(1, f28_arg2)
        f28_local2 = GetUsageId_AA(f28_arg1, f28_local1)
    end
    return f28_local2
    
end

function CanUseItem(f29_arg0, f29_arg1, f29_arg2, f29_arg3)
    local f29_local0 = -1
    local f29_local1 = -1
    local f29_local2 = -1
    local f29_local3 = -1
    local f29_local4 = false
    f29_local0 = f29_arg1:GetAIUsageParam(1, f29_arg3)
    f29_local1 = GetUsageId_AA(f29_arg1, f29_local0)
    f29_local3 = GetUsageId_X(f29_arg1, f29_local0)
    f29_local2 = GetUsageId_B(f29_arg1, f29_local0)
    if f29_local3 == 2 and f29_arg1:GetTimer(2) > 0 then
        return -1
    end
    if f29_local1 == 10 then
        if f29_local2 == 9 then
            if f29_arg1:GetStringIndexedNumber("IsUselessWeapon") == 1 then
                f29_local4 = true
            end
        else
            f29_local4 = true
        end
    elseif f29_local1 == 20 then
        if f29_local2 == 7 then
            if f29_arg1:HasSpecialEffectAttribute(TARGET_SELF, 154) == false then
                f29_local4 = true
            end
        elseif f29_local2 == 8 then
            if f29_arg1:HasSpecialEffectId(TARGET_SELF, 5630) == false then
                f29_local4 = true
            end
        else
            f29_local4 = true
        end
    elseif f29_local1 == 30 then
        if f29_local2 == 0 then
            if f29_arg1:HasSpecialEffectCategory(TARGET_SELF, 151) == false and f29_arg1:HasSpecialEffectCategory(TARGET_SELF, 156) == false and f29_arg1:HasSpecialEffectCategory(TARGET_SELF, 160) == false and f29_arg1:HasSpecialEffectId(TARGET_SELF, 503501) == false and f29_arg1:HasSpecialEffectCategory(TARGET_SELF, 1001) == false then
                f29_local4 = true
            end
        elseif f29_local2 == 1 then
            if f29_arg1:CanWeaponEnhance(f29_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)) and f29_arg1:CanWeaponEnhance(f29_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)) and f29_arg1:HasSpecialEffectCategory(TARGET_SELF, 163) == false then
                f29_local4 = true
            elseif f29_arg1:CanWeaponEnhance(f29_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)) and f29_arg1:HasSpecialEffectCategory(TARGET_SELF, 162) == false and f29_arg1:HasSpecialEffectCategory(TARGET_SELF, 10000) == false then
                f29_local4 = true
            end
        end
    elseif f29_local1 == 31 then
        if f29_arg1:HasSpecialEffectCategory(TARGET_SELF, 162) == false and f29_arg1:HasSpecialEffectCategory(TARGET_SELF, 10000) == false and f29_arg1:CanWeaponEnhance(f29_arg1:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)) then
            f29_local4 = true
        end
    elseif f29_local1 == 50 then
        f29_local4 = true
    end
    return f29_local4
    
end

function ChangeEquipItem_ById(f30_arg0, f30_arg1, f30_arg2, f30_arg3)
    local f30_local0 = 0
    local f30_local1 = 0
    local f30_local2 = false
    for f30_local3 = 0, 9, 1 do
        f30_local1 = f30_arg1:GetEquipItemId(TARGET_SELF, f30_local3, ITEM_SLOTTYPE_SHORTCUT)
        if f30_local1 == f30_arg3 then
            f30_arg1:ChangeEquipItem(f30_local3, ITEM_SLOTTYPE_SHORTCUT)
            f30_local2 = true
            break
        end
    end
    if f30_local2 == false then
        for f30_local3 = 0, 5, 1 do
            f30_local1 = f30_arg1:GetEquipItemId(TARGET_SELF, f30_local3, ITEM_SLOTTYPE_TOOLBOX)
            if f30_local1 == f30_arg3 then
                f30_arg1:ChangeEquipItem(f30_local3, ITEM_SLOTTYPE_TOOLBOX)
                f30_local2 = true
                break
            end
        end
    end
    return f30_local2
    

end

function GetRandomItemId_ByType(f31_arg0, f31_arg1, f31_arg2, f31_arg3)
    local f31_local0 = 0
    local f31_local1 = 0
    local f31_local2 = 0
    local f31_local3 = 0
    local f31_local4 = {}
    local f31_local5 = nil
    for f31_local6 = 0, 9, 1 do
        f31_local0 = f31_arg1:GetEquipItemId(TARGET_SELF, f31_local6, ITEM_SLOTTYPE_SHORTCUT)
        f31_local1 = GetItemType(f31_arg0, f31_arg1, f31_local0)
        if f31_local1 == f31_arg3 and CanUseItem(f31_arg0, f31_arg1, f31_arg2, f31_local0) == true then
            f31_local3 = f31_local3 + 1
            f31_local4[f31_local3] = f31_local0
        end
    end
    for f31_local6 = 0, 5, 1 do
        f31_local0 = f31_arg1:GetEquipItemId(TARGET_SELF, f31_local6, ITEM_SLOTTYPE_TOOLBOX)
        f31_local1 = GetItemType(f31_arg0, f31_arg1, f31_local0)
        if f31_local1 == f31_arg3 and CanUseItem(f31_arg0, f31_arg1, f31_arg2, f31_local0) == true then
            f31_local3 = f31_local3 + 1
            f31_local4[f31_local3] = f31_local0
        end
    end
    if f31_local3 ~= 0 then
        local random = f31_arg1:GetRandam_Int(1, 100)
        local f31_local7 = 0
        for f31_local8 = 1, f31_local3, 1 do
            f31_local7 = f31_local7 + 1 / f31_local3 * 100
            if random <= f31_local7 then
                f31_local2 = f31_local4[f31_local8]
                break
            elseif f31_local8 == f31_local3 then
                f31_local2 = f31_local4[f31_local8]
            end
        end
    end
    return f31_local2
    


end

function GetDualAttackType(f32_arg0, f32_arg1)
    local f32_local0 = f32_arg0:GetWepCategoryNo(ARM_R)
    local f32_local1 = f32_arg0:GetWepCategoryNo(ARM_L)
    local f32_local2 = f32_arg0:GetWepSpAtkCategoryNo(ARM_L)
    local f32_local3 = -1
    if f32_local0 == PLAN_WEAPON_CATEGORY_SHORT_SWORD then
        if f32_local0 == f32_local1 and f32_local2 ~= 104 then
            f32_local3 = 0
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_CLAW then
        if f32_local0 == f32_local1 then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_STRAIGHT_SWORD then
        if f32_local0 == f32_local1 then
            f32_local3 = 0
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_TWINBLADE then
        if f32_local0 == f32_local1 then
            f32_local3 = 0
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_LARGE_SWORD then
        if f32_local0 == f32_local1 then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_EXTRALARGE_SWORD then
        if f32_local0 == f32_local1 then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_RAPIER then
        if f32_local0 == f32_local1 then
            f32_local3 = 0
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_CURVEDSWORD then
        if f32_local0 == f32_local1 then
            f32_local3 = 0
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_KATANA then
        if f32_local0 == f32_local1 or f32_local2 == 104 then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_AX or f32_local0 == PLAN_WEAPON_CATEGORY_HAMMER then
        if f32_local1 == PLAN_WEAPON_CATEGORY_AX or f32_local1 == PLAN_WEAPON_CATEGORY_HAMMER then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_EXTRALARGE_AXHAMMER then
        if f32_local0 == f32_local1 then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_LARGE_AX or f32_local0 == PLAN_WEAPON_CATEGORY_LARGE_HAMMER then
        if f32_local1 == PLAN_WEAPON_CATEGORY_LARGE_AX or f32_local1 == PLAN_WEAPON_CATEGORY_LARGE_HAMMER then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_FLAIL then
        if f32_local0 == f32_local1 then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_SPEAR then
        if f32_local0 == f32_local1 then
            f32_local3 = 0
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_LARGE_SPEAR or f32_local0 == PLAN_WEAPON_CATEGORY_LARGE_RAPIER then
        if f32_local1 == PLAN_WEAPON_CATEGORY_LARGE_SPEAR or f32_local1 == PLAN_WEAPON_CATEGORY_LARGE_RAPIER then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_HALBERD then
        if f32_local0 == f32_local1 then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_LARGE_CURVEDSWORD then
        if f32_local0 == f32_local1 then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_FIST then
        if f32_local0 == f32_local1 and f32_arg0:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R) ~= 110000 and f32_arg0:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L) ~= 110000 then
            f32_local3 = 1
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_WHIP then
        if f32_local0 == f32_local1 then
            f32_local3 = 0
        end
    elseif f32_local0 == PLAN_WEAPON_CATEGORY_LARGE_SCYTHE and f32_local0 == f32_local1 then
        f32_local3 = 1
    end
    return f32_local3
    
end

function ChangeBothHand_ForArts(f33_arg0, f33_arg1, f33_arg2, f33_arg3)
    local f33_local0 = GetArtsUsageParam(f33_arg1, ARM_R)
    local f33_local1 = GetArtsUsageParam(f33_arg1, ARM_L)
    local f33_local2 = GetUsageId_AA(f33_arg1, f33_local0)
    local f33_local3 = GetUsageId_AA(f33_arg1, f33_local1)
    local f33_local4 = ARM_R
    local f33_local5 = 0
    if f33_local3 == 90 then
        f33_local5 = 1
        f33_local3 = -1
    end
    if f33_arg3 == f33_local2 and f33_arg3 == f33_local3 then
        if f33_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
            f33_local4 = ARM_R
        elseif f33_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
            f33_local4 = ARM_L
        elseif f33_local5 == 0 then
            f33_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f33_local4 = ARM_R
        else
            f33_local4 = ARM_R
        end
    elseif f33_arg3 == f33_local2 then
        if f33_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
            f33_local4 = ARM_R
        elseif f33_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
            f33_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f33_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f33_local4 = ARM_R
        elseif f33_local5 == 0 then
            f33_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f33_local4 = ARM_R
        else
            f33_local4 = ARM_R
        end
    elseif f33_arg3 == f33_local3 then
        if f33_arg1:HasSpecialEffectId(TARGET_SELF, 20018025) then
            if f33_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
                f33_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
            end
            f33_local4 = ARM_L
        elseif f33_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
            f33_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
            f33_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
            f33_local4 = ARM_L
        elseif f33_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
            f33_local4 = ARM_L
        else
            f33_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
            f33_local4 = ARM_L
        end
    else
        f33_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_SELF)
        return -1
    end
    return f33_local4
    
end

function CanExecArts_Immediately(f34_arg0, f34_arg1, f34_arg2, f34_arg3)
    local f34_local0 = GetArtsUsageParam(f34_arg1, ARM_R)
    local f34_local1 = GetArtsUsageParam(f34_arg1, ARM_L)
    local f34_local2 = GetUsageId_AA(f34_arg1, f34_local0)
    local f34_local3 = GetUsageId_AA(f34_arg1, f34_local1)
    local f34_local4 = 0
    if f34_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        if f34_local2 == f34_arg3 then
            f34_local4 = 1
        end
    elseif f34_arg1:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        if f34_local3 == f34_arg3 then
            f34_local4 = 1
        end
    else
        local f34_local5 = f34_arg1:GetArtsID(ARM_L)
        if f34_local5 >= 300 and f34_local5 <= 399 or f34_local5 == 117 or f34_local5 == 223 or f34_local5 == 701 or f34_local5 == 702 or f34_local5 == 1001 or f34_local5 == 1002 or f34_local5 == 1007 or f34_local5 == 1195 or f34_local5 == 1196 or f34_local5 == 1197 or f34_local5 >= 400 and f34_local5 <= 499 then
            if f34_local3 == f34_arg3 then
                f34_local4 = 1
            end
        elseif f34_local2 == f34_arg3 then
            f34_local4 = 1
        end
    end
    return f34_local4
    
end

function ArtsAction_ByCC(f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4)
    local f35_local0 = GetArtsUsageParam(f35_arg1, f35_arg3)
    local f35_local1 = GetUsageId_AA(f35_arg1, f35_local0)
    local f35_local2 = GetUsageId_CC(f35_arg1, f35_local0)
    local f35_local3 = GetUsageId_X(f35_arg1, f35_local0)
    local successDistance = f35_arg4
    local f35_local5 = f35_arg4 + 2
    local f35_local6 = f35_arg4 + 2
    local f35_local7 = 50
    local f35_local8 = 1.8
    local f35_local9 = 2
    local f35_local10 = 0
    if f35_arg1:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f35_local7 = 100
        f35_local5 = 0
        f35_local6 = 0.1
    end
    if f35_local1 < 20 and f35_local2 ~= 40 and f35_local2 ~= 41 and f35_local2 ~= 42 then
        NPC_Approach_Act_Flex(f35_arg1, f35_arg2, f35_arg4, f35_local5, f35_local6, f35_local7, f35_local10, f35_local8, f35_local9)
    end
    if f35_local2 == 0 then
        f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0)
    elseif f35_local2 == 10 then
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0, 0, 0)
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0)
    elseif f35_local2 == 11 then
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0, 0, 0)
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance, 0, 0)
    elseif f35_local2 == 12 then
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0, 0, 0)
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0, 0)
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0)
    elseif f35_local2 == 14 then
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0, 0, 0)
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0, 0)
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0)
    elseif f35_local2 == 15 then
        successDistance = successDistance + 5
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0, 0, 0)
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0)
    elseif f35_local2 == 16 then
        successDistance = successDistance + 5
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0, 0, 0)
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance, 0, 0)
    elseif f35_local2 == 17 then
        successDistance = successDistance + 5
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0, 0, 0)
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboRepeat, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0, 0)
        f35_arg2:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L2, TARGET_ENE_0, successDistance, 0, 0)
    elseif f35_local2 == 20 then
        local random = f35_arg1:GetRandam_Float(1, 3.5)
        f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_L2Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        f35_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    elseif f35_local2 == 30 then
        if f35_arg1:HasSpecialEffectId(TARGET_SELF, 20018674) then
            f35_arg1:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 3.2)
            f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, NPC_ATK_L2Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
            f35_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
        elseif f35_local1 == 12 then
            f35_arg1:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
            f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, NPC_ATK_L2Hold, TARGET_ENE_0, -99, 0, 0, 0, 0):SetLifeEndSuccess(true)
            f35_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
        else
            f35_arg1:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
            f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, NPC_ATK_L2Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
            f35_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
        end
    elseif f35_local2 == 40 then
        local animationId = NPC_ATK_L2Hold_R1
        if f35_arg1:GetRandam_Int(0, 1) == 1 then
            animationId = NPC_ATK_L2Hold_R2
        end
        if f35_arg4 < f35_arg1:GetDist(TARGET_ENE_0) then
            f35_arg2:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, f35_arg4, TARGET_ENE_0, true, NPC_ATK_L2Hold, GUARD_GOAL_DESIRE_RET_Failed, false)
        else
            f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L2Hold, TARGET_ENE_0, 999, 0, 0, 0, 0)
        end
        f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, animationId, TARGET_ENE_0, successDistance, 0, 0, 0, 0)
    elseif f35_local2 == 41 then
        local animationId = GetArtsShotButton(f35_arg1, f35_arg3, NPC_ATK_L2Hold_R1, NPC_ATK_L2Hold_R2)
        if animationId == NPC_ATK_DownHold_L2Hold then
            f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1.5, animationId, TARGET_ENE_0, 999, 0, 0, 0, 0)
        else
            f35_arg2:AddSubGoal(GOAL_COMMON_NpcStanceAttack_WithMove, 20, TARGET_ENE_0, animationId, 3, 0, 0, 0, 0)
        end
    elseif f35_local2 == 42 then
        local f35_local11 = GetArtsShotButton(f35_arg1, f35_arg3, NPC_ATK_L2Hold_R1, NPC_ATK_L2Hold_R2)
        if f35_arg1:HasSpecialEffectId(TARGET_SELF, 20018702) or f35_arg1:HasSpecialEffectId(TARGET_SELF, 20018721) then
            f35_local11 = NPC_ATK_L2Hold_R1
        end
        f35_arg1:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        if f35_local11 == NPC_ATK_DownHold_L2Hold then
            f35_arg2:AddSubGoal(GOAL_COMMON_LeaveTarget, 0.1, TARGET_ENE_0, 8, TARGET_ENE_0, true, -1)
        else
            f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L2Hold, TARGET_ENE_0, 999, 0, 0, 0, 0):SetLifeEndSuccess(true)
            f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, f35_arg1:GetRandam_Float(3, 4), f35_local11, TARGET_ENE_0, 999, 0, 0, 0, 0):SetLifeEndSuccess(true)
            f35_arg2:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_SELF)
        end
    else
        f35_arg2:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, 999, 0, 0)
    end
    if f35_local3 == 2 then
        f35_arg1:SetTimer(2, 10)
    end
    
end

function GetArtsShotButton(f36_arg0, f36_arg1, f36_arg2, f36_arg3)
    local f36_local0 = f36_arg0:GetCurrentEquipWeaponId(TARGET_SELF, f36_arg1)
    local f36_local1 = f36_arg0:GetWeaponBehaviorVarID(f36_local0)
    local f36_local2 = f36_arg0:GetWeaponBehaviorVarID(f36_arg0:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Arrow, 0))
    local f36_local3 = f36_arg0:GetWeaponBehaviorVarID(f36_arg0:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Arrow, 1))
    local f36_local4 = f36_arg0:GetWeaponBehaviorVarID(f36_arg0:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Bolt, 0))
    local f36_local5 = f36_arg0:GetWeaponBehaviorVarID(f36_arg0:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Bolt, 1))
    local f36_local6 = GetBowType(f36_local1)
    local f36_local7 = GetArrowType(f36_local2)
    local f36_local8 = GetArrowType(f36_local3)
    local f36_local9 = GetBoltType(f36_local4)
    local f36_local10 = GetBoltType(f36_local5)
    local f36_local11 = 1
    local f36_local12 = 1
    if f36_local6 == 40 then
        if f36_local7 ~= 50 then
            f36_local11 = 0
        end
        if f36_local8 ~= 50 then
            f36_local12 = 0
        end
    elseif f36_local6 == 42 then
        if f36_local7 ~= 51 then
            f36_local11 = 0
        end
        if f36_local8 ~= 51 then
            f36_local12 = 0
        end
    elseif f36_local6 == 43 then
        if f36_local9 ~= 52 then
            f36_local11 = 0
        end
        if f36_local10 ~= 52 then
            f36_local12 = 0
        end
    elseif f36_local6 == 44 then
        if f36_local9 ~= 53 then
            f36_local11 = 0
        end
        if f36_local10 ~= 53 then
            f36_local12 = 0
        end
    end
    if f36_local11 == 1 and f36_local12 == 1 then
        if f36_arg0:GetRandam_Int(0, 1) == 1 then
            return f36_arg2
        else
            return f36_arg3
        end
    elseif f36_local11 == 1 and f36_local12 == 0 then
        return f36_arg2
    elseif f36_local11 == 0 and f36_local12 == 1 then
        return f36_arg3
    end
    return NPC_ATK_DownHold_L2Hold
    
end

function GeneralNPC_Act01(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local random4 = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local successDistance = 0
    local successDistance2 = 0
    local f37_local7 = ai:GetNPCActProb(9020)
    local f37_local8 = ai:GetNPCActProb(9000)
    local f37_local9 = ai:GetNPCActProb(9030)
    local animationId = NPC_ATK_R1
    local f37_local11 = 50
    local f37_local12 = ai:GetStringIndexedNumber("R_ComboNum_R1")
    local f37_local13 = false
    local f37_local14 = false
    local f37_local15 = false
    local f37_local16 = false
    if random4 <= f37_local9 then
        f37_local14 = true
        animationId = NPC_ATK_L1
    elseif random <= f37_local8 then
        f37_local15 = true
    else
        f37_local15 = false
    end
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        if f37_local14 == true then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f37_local16 = false
        elseif f37_local15 == true then
            f37_local16 = true
        elseif distance >= 1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f37_local16 = false
        else
            f37_local16 = true
        end
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        if f37_local14 == true then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f37_local16 = false
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            if f37_local15 == true then
                if distance >= 1 then
                    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
                    f37_local16 = true
                else
                    f37_local16 = false
                end
            else
                f37_local16 = false
            end
        end
    elseif f37_local14 == true then
        f37_local16 = false
    elseif f37_local15 == true then
        if distance >= 1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f37_local16 = true
        else
            f37_local16 = false
        end
    else
        f37_local16 = false
    end
    if f37_local16 == true then
        successDistance = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_First")
        successDistance2 = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_Second")
        f37_local13 = false
    else
        successDistance = ai:GetStringIndexedNumber("R_Dist_OneHandR1_First")
        successDistance2 = ai:GetStringIndexedNumber("R_Dist_OneHandR1_Second")
        if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
            f37_local13 = true
        else
            f37_local13 = false
        end
    end
    if f37_local13 == false then
        ai:AddNPCActProb(9000)
        f37_local7 = ai:GetNPCActProb(9020)
    end
    local f37_local17 = false
    if random3 <= f37_local7 then
        f37_local17 = true
        f37_local7 = 100
    end
    local f37_local18 = successDistance
    local f37_local19 = successDistance + 2
    local f37_local20 = successDistance + 2
    local f37_local21 = 50
    local f37_local22 = 1.8
    local f37_local23 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f37_local21 = 100
        f37_local19 = 0
        f37_local20 = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, f37_local18, f37_local19, f37_local20, f37_local21, f37_local7, f37_local22, f37_local23)
    if successDistance <= distance and random2 <= f37_local11 and f37_local17 == true then
        if ai:IsInsideTargetCustom(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_L, 180, 180, 10) == true then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, 1, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
        else
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, 0, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
        end
    end
    if f37_local12 >= 6 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, animationId, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f37_local12 == 5 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, animationId, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f37_local12 == 4 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f37_local12 == 3 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, animationId, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f37_local12 == 2 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, animationId, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, animationId, TARGET_ENE_0, successDistance2, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, animationId, TARGET_ENE_0, successDistance, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act02(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local successDistance = 0
    local successDistance2 = 0
    local f38_local6 = ai:GetNPCActProb(9020)
    local f38_local7 = ai:GetNPCActProb(9010)
    local f38_local8 = 50
    local f38_local9 = ai:GetStringIndexedNumber("R_ComboNum_R2")
    local f38_local10 = false
    local f38_local11 = false
    local f38_local12 = false
    if random <= f38_local7 then
        f38_local11 = true
    else
        f38_local11 = false
    end
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        if f38_local11 == true then
            f38_local12 = true
        elseif distance >= 1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f38_local12 = false
        else
            f38_local12 = true
        end
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        if f38_local11 == true then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            if distance >= 1 then
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
                f38_local12 = true
            else
                f38_local12 = false
            end
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f38_local12 = false
        end
    elseif f38_local11 == true then
        if distance >= 1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f38_local12 = true
        else
            f38_local12 = false
        end
    else
        f38_local12 = false
    end
    if f38_local12 == true then
        successDistance = ai:GetStringIndexedNumber("R_Dist_TwoHandR2_First")
        successDistance2 = ai:GetStringIndexedNumber("R_Dist_TwoHandR2_Second")
        f38_local10 = false
    else
        successDistance = ai:GetStringIndexedNumber("R_Dist_OneHandR2_First")
        successDistance2 = ai:GetStringIndexedNumber("R_Dist_OneHandR2_Second")
        if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
            f38_local10 = true
        else
            f38_local10 = false
        end
    end
    if f38_local10 == false then
        ai:AddNPCActProb(9000)
        f38_local6 = ai:GetNPCActProb(9020)
    end
    local f38_local13 = false
    if random3 <= f38_local6 then
        f38_local13 = true
        f38_local6 = 100
    end
    local f38_local14 = successDistance
    local f38_local15 = successDistance + 2
    local f38_local16 = successDistance + 2
    local f38_local17 = 50
    local f38_local18 = 1.8
    local f38_local19 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f38_local17 = 100
        f38_local15 = 0
        f38_local16 = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, f38_local14, f38_local15, f38_local16, f38_local17, f38_local6, f38_local18, f38_local19)
    if successDistance <= distance and random2 <= f38_local8 and f38_local13 == true then
        if ai:IsInsideTargetCustom(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_L, 180, 180, 10) == true then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, 1, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
        else
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, 0, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
        end
    end
    local random4 = ai:GetRandam_Int(1, 100)
    if f38_local9 == 2 then
        if random4 <= 80 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance2, 0, 0)
        elseif random4 <= 90 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R2Hold, TARGET_ENE_0, successDistance2, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R2Hold, TARGET_ENE_0, successDistance, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance2, 0, 0)
        end
    elseif random4 <= 80 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R2Hold, TARGET_ENE_0, successDistance, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act03(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local random4 = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local f39_local5 = ai:GetStringIndexedNumber("R_Dist_DashR1")
    local f39_local6 = -1
    local f39_local7 = ai:GetNPCActProb(9020)
    local f39_local8 = false
    local animationId = NPC_ATK_DashR1
    local f39_local10 = ai:GetNPCActProb(9030)
    local f39_local11 = false
    if random3 <= 50 then
        animationId = NPC_ATK_DashR1
        if random4 <= f39_local10 then
            f39_local11 = true
            animationId = NPC_ATK_DashL1
        end
    else
        animationId = NPC_ATK_DashR2
    end
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        if f39_local11 == true then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        end
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
            f39_local8 = true
        end
    elseif ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f39_local8 = true
    end
    if f39_local8 == false then
        ai:AddNPCActProb(9000)
        f39_local7 = ai:GetNPCActProb(9020)
    end
    if random <= f39_local7 then
        f39_local6 = NPC_ATK_L1
    end
    goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, f39_local5, TARGET_SELF, f39_local6)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, animationId, TARGET_ENE_0, 999, 0, 0)
    
end

function GeneralNPC_Act04(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local isR1DualWield = false
    local f40_local5 = false
    local r1AttackRange = ai:GetStringIndexedNumber("R_Dist_RollingR1")
    local r2AttackRange = ai:GetStringIndexedNumber("R_Dist_RollingR2")
    local f40_local8 = ai:GetNPCActProb(9030)
    local f40_local9 = ai:GetNPCActProb(9040)
    if random2 <= f40_local8 then
        isR1DualWield = true
    end
    if random3 <= f40_local9 then
        f40_local5 = true
        isR1DualWield = false
    end
    if f40_local5 == false then
        if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R and isR1DualWield == true then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        else
        end
    end
    local animationId = NPC_ATK_NONE
    local f40_local11 = NPC_ATK_UpLeft_ButtonXmark
    local f40_local12 = NPC_ATK_UpRight_ButtonXmark
    local f40_local13 = NPC_ATK_Up_ButtonXmark
    if f40_local5 == true then
        f40_local11 = NPC_ATK_UpLeft_L2
        f40_local12 = NPC_ATK_UpRight_L2
        f40_local13 = NPC_ATK_Up_L2
    end
    if distance >= 5 and SpaceCheck(ai, goal, 0, 5) == true then
        animationId = f40_local13
    elseif SpaceCheck(ai, goal, -45, 5) == true then
        if SpaceCheck(ai, goal, 45, 5) == true then
            if random <= 50 then
                animationId = f40_local11
            else
                animationId = f40_local12
            end
        else
            animationId = f40_local12
        end
    elseif SpaceCheck(ai, goal, 45, 5) == true then
        animationId = f40_local12
    else
    end
    if animationId ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        local random4 = ai:GetRandam_Int(1, 100)
        local random5 = 0
        R1Rate = 100
        if random4 <= 55 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
        else
            random5 = ai:GetRandam_Int(1, 100)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
        if random5 <= 55 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
        end
    end
    local ifBothR1Odds = 50
    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 3, TARGET_ENE_0, r1AttackRange, r2AttackRange, ifBothR1Odds, isR1DualWield)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act05(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local isR1DualWield = false
    local f41_local5 = false
    local r1AttackRange = ai:GetStringIndexedNumber("R_Dist_RollingR1")
    local r2AttackRange = ai:GetStringIndexedNumber("R_Dist_RollingR2")
    local f41_local8 = ai:GetNPCActProb(9030)
    local f41_local9 = ai:GetNPCActProb(9040)
    if random2 <= f41_local8 then
        isR1DualWield = true
    end
    if random3 <= f41_local9 then
        f41_local5 = true
        isR1DualWield = false
    end
    if f41_local5 == false then
        if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R and isR1DualWield == true then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        else
        end
    end
    local animationId = NPC_ATK_NONE
    local f41_local11 = NPC_ATK_Left_ButtonXmark
    local f41_local12 = NPC_ATK_Right_ButtonXmark
    if f41_local5 == true then
        f41_local11 = NPC_ATK_Left_L2
        f41_local12 = NPC_ATK_Right_L2
    end
    if SpaceCheck(ai, goal, -90, 5) == true then
        if SpaceCheck(ai, goal, 90, 5) == true then
            if random <= 50 then
                animationId = f41_local11
            else
                animationId = f41_local12
            end
        else
            animationId = f41_local11
        end
    elseif SpaceCheck(ai, goal, 90, 5) == true then
        animationId = f41_local12
    else
    end
    if animationId ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        local random4 = ai:GetRandam_Int(1, 100)
        local random5 = 0
        R1Rate = 100
        if random4 <= 55 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
        else
            random5 = ai:GetRandam_Int(1, 100)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
        if random5 <= 55 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
        end
    end
    local ifBothR1Odds = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        ifBothR1Odds = 100
    end
    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 3, TARGET_ENE_0, r1AttackRange, r2AttackRange, ifBothR1Odds, isR1DualWield)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act06(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local isR1DualWield = false
    local f42_local5 = false
    local r1AttackRange = ai:GetStringIndexedNumber("R_Dist_RollingR1")
    local r2AttackRange = ai:GetStringIndexedNumber("R_Dist_RollingR2")
    local f42_local8 = ai:GetNPCActProb(9030)
    local f42_local9 = ai:GetNPCActProb(9040)
    if random2 <= f42_local8 then
        isR1DualWield = true
    end
    if random3 <= f42_local9 then
        f42_local5 = true
        isR1DualWield = false
    end
    if f42_local5 == false then
        if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R and isR1DualWield == true then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        else
        end
    end
    local animationId = NPC_ATK_NONE
    local f42_local11 = NPC_ATK_DownLeft_ButtonXmark
    local f42_local12 = NPC_ATK_DownRight_ButtonXmark
    local f42_local13 = NPC_ATK_Down_ButtonXmark
    if f42_local5 == true then
        f42_local11 = NPC_ATK_DownLeft_L2
        f42_local12 = NPC_ATK_DownRight_L2
        f42_local13 = NPC_ATK_Down_L2
    end
    if distance <= 1 and SpaceCheck(ai, goal, 180, 5) == true then
        animationId = f42_local13
    elseif SpaceCheck(ai, goal, -135, 5) == true then
        if SpaceCheck(ai, goal, 135, 5) == true then
            if random <= 50 then
                animationId = f42_local11
            else
                animationId = f42_local12
            end
        else
            animationId = f42_local11
        end
    elseif SpaceCheck(ai, goal, 135, 5) == true then
        animationId = f42_local12
    else
    end
    if animationId ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        local random4 = ai:GetRandam_Int(1, 100)
        local random5 = 0
        if random4 <= 55 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
        else
            random5 = ai:GetRandam_Int(1, 100)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
        if random5 <= 55 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
        end
    end
    local ifBothR1Odds = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        ifBothR1Odds = 100
    end
    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 3, TARGET_ENE_0, r1AttackRange, r2AttackRange, ifBothR1Odds, isR1DualWield)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act07(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local isR1DualWield = false
    local r1AttackRange = ai:GetStringIndexedNumber("R_Dist_BackStepR1")
    local r2AttackRange = ai:GetStringIndexedNumber("R_Dist_BackStepR2")
    local f43_local6 = ai:GetNPCActProb(9030)
    if random2 <= f43_local6 then
        isR1DualWield = true
    end
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R and isR1DualWield == true then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    else
    end
    if SpaceCheck(ai, goal, 180, 5) == true then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_ButtonXmark, TARGET_ENE_0, 999, 0, 0)
    end
    local ifBothR1Odds = 50
    if Button ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, Button, TARGET_ENE_0, 999, 0, 0)
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        local random3 = ai:GetRandam_Int(1, 100)
        local random4 = 0
        ifBothR1Odds = 100
        if random3 <= 55 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, Button, TARGET_ENE_0, 999, 0, 0)
        else
            random4 = ai:GetRandam_Int(1, 100)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
        if random4 <= 55 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, Button, TARGET_ENE_0, 999, 0, 0)
        end
    end
    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 3, TARGET_ENE_0, r1AttackRange, r2AttackRange, ifBothR1Odds, isR1DualWield)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act08(ai, goal, paramTbl)
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    else
    end
    local f44_local0 = 4
    local f44_local1 = 0
    local f44_local2 = 4
    local f44_local3 = 100
    local f44_local4 = 0
    local f44_local5 = 1.8
    local f44_local6 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f44_local3 = 100
        f44_local1 = 0
        f44_local2 = 0.1
    end
    local f44_local7 = 0
    local f44_local8 = false
    local animationId2 = NPC_ATK_R2
    local f44_local10 = ai:GetNPCActProb(9030)
    local random = ai:GetRandam_Int(1, 100)
    local animationId = NPC_ATK_Up_Jump
    if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f44_local8 = true
    else
        f44_local8 = false
    end
    if f44_local8 == false then
        ai:AddNPCActProb(9000)
        f44_local7 = ai:GetNPCActProb(9020)
    end
    if GetDualAttackType(ai, goal) == 1 and random <= f44_local10 then
        animationId2 = NPC_ATK_L1
    end
    NPC_Approach_Act_Flex(ai, goal, f44_local0, f44_local1, f44_local2, f44_local3, f44_local7, f44_local5, f44_local6)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018035) then
        animationId = NPC_ATK_Down_Jump
        animationId2 = NPC_ATK_R1
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.5, animationId, TARGET_ENE_0, 999, 0, 90)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, animationId2, TARGET_ENE_0, 999, 0, 90)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018035) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
    end
    
end

function GeneralNPC_Act09(ai, goal, paramTbl)
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    else
    end
    local f45_local0 = 6.8
    local f45_local1 = 0
    local f45_local2 = false
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local f45_local5 = ai:GetNPCActProb(9030)
    local animationId = NPC_ATK_R2
    local f45_local7 = -1
    if GetDualAttackType(ai, goal) == 1 and random2 <= f45_local5 then
        animationId = NPC_ATK_L1
    end
    if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f45_local2 = true
    else
        f45_local2 = false
    end
    if f45_local2 == false then
        ai:AddNPCActProb(9000)
        f45_local1 = ai:GetNPCActProb(9020)
    end
    if random <= f45_local1 then
        f45_local7 = NPC_ATK_L1
    end
    goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, f45_local0, TARGET_SELF, f45_local7)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018035) then
        animationId = NPC_ATK_R1
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.5, NPC_ATK_Dash_Jump, TARGET_ENE_0, 999, 0, 90)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, animationId, TARGET_ENE_0, 999, 0, 90)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018035) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
    end
    
end

function GeneralNPC_Act11(ai, goal, paramTbl)
    local f46_local0 = 10
    local random = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local f46_local3 = 90
    local f46_local4 = GetBowType(ai:GetWeaponBehaviorVarID(ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)))
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        if f46_local4 ~= 43 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        end
    elseif f46_local4 ~= 43 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    local f46_local5 = 0
    local f46_local6 = 30
    local f46_local7 = 0
    local f46_local8 = 30
    local f46_local9 = 50
    local f46_local10 = 1.8
    local f46_local11 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f46_local9 = 100
        f46_local7 = 0
        f46_local8 = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, f46_local6, f46_local7, f46_local8, f46_local9, f46_local5, f46_local10, f46_local11)
    if f46_local4 == 43 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R1, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R1Hold, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act12(ai, goal, paramTbl)
    local f47_local0 = 10
    local random = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local f47_local3 = 90
    local f47_local4 = GetBowType(ai:GetWeaponBehaviorVarID(ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)))
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        if f47_local4 ~= 43 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        end
    elseif f47_local4 ~= 43 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    local f47_local5 = 0
    local f47_local6 = 30
    local f47_local7 = 0
    local f47_local8 = 30
    local f47_local9 = 50
    local f47_local10 = 1.8
    local f47_local11 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f47_local9 = 100
        f47_local7 = 0
        f47_local8 = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, f47_local6, f47_local7, f47_local8, f47_local9, f47_local5, f47_local10, f47_local11)
    if f47_local4 == 43 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2Hold, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act21(ai, goal, paramTbl)
    local f48_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f48_local1 = GetRandomSpellId_ByType(self, ai, goal, 12, f48_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f48_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f48_local3 = ai:GetAIUsageParam(0, f48_local1)
    local f48_local4 = GetUsageId_CC(ai, f48_local3)
    local f48_local5 = GetUsageId_X(ai, f48_local3)
    ai:ChangeEquipMagicByMagicParamId(f48_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    local f48_local6 = successDistance
    local f48_local7 = successDistance
    local f48_local8 = successDistance + 6
    local f48_local9 = 0
    local f48_local10 = 0
    local f48_local11 = 1.8
    local f48_local12 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f48_local9 = 100
        f48_local7 = 0
        f48_local8 = 0.1
    end
    local f48_local13 = ai:GetNPCActProb(9020)
    local f48_local14 = false
    if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f48_local14 = true
    else
        f48_local14 = false
    end
    if f48_local14 == false then
        ai:AddNPCActProb(9000)
        f48_local13 = ai:GetNPCActProb(9020)
    end
    NPC_Approach_Act_Flex(ai, goal, f48_local6, f48_local7, f48_local8, f48_local9, f48_local13, f48_local11, f48_local12)
    if f48_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f48_local16 = 20
        local f48_local17 = 30
        local f48_local18 = 30
        local f48_local19 = 20
        local f48_local20 = 0
        local f48_local21 = 0
        local f48_local22 = 0
        local comboStage = 1
        local animationId1 = NPC_ATK_Up_R1
        if random <= f48_local16 then
            comboStage = 2
        elseif random <= f48_local16 + f48_local17 then
            comboStage = 3
        elseif random <= f48_local16 + f48_local17 + f48_local18 then
            comboStage = 4
        elseif random <= f48_local16 + f48_local17 + f48_local18 + f48_local19 then
            comboStage = 5
        elseif random <= f48_local16 + f48_local17 + f48_local18 + f48_local19 + f48_local20 then
            comboStage = 6
        elseif random <= f48_local16 + f48_local17 + f48_local18 + f48_local19 + f48_local20 + f48_local21 then
            comboStage = 7
        elseif random <= f48_local16 + f48_local17 + f48_local18 + f48_local19 + f48_local20 + f48_local21 + f48_local22 then
            comboStage = 8
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f48_local0 >= 2530000 and f48_local0 <= 2539999 then
            local f48_local25 = nil
            f48_local25 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, animationId1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_F, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f48_local4 == 2 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f48_local0 >= 2530000 and f48_local0 <= 2539999 then
            NPC_ATK_Up_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f48_local4 == 3 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f48_local0 >= 2530000 and f48_local0 <= 2539999 then
            NPC_ATK_Up_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f48_local0 >= 2530000 and f48_local0 <= 2539999 then
            NPC_ATK_Up_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Up_R1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 7, 2)
    if f48_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act22(ai, goal, paramTbl)
    local f49_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f49_local1 = GetRandomSpellId_ByType(self, ai, goal, 12, f49_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f49_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f49_local3 = ai:GetAIUsageParam(0, f49_local1)
    local f49_local4 = GetUsageId_CC(ai, f49_local3)
    local f49_local5 = GetUsageId_X(ai, f49_local3)
    ai:ChangeEquipMagicByMagicParamId(f49_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f49_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f49_local7 = 20
        local f49_local8 = 30
        local f49_local9 = 30
        local f49_local10 = 20
        local f49_local11 = 0
        local f49_local12 = 0
        local f49_local13 = 0
        local comboStage = 1
        if random <= f49_local7 then
            comboStage = 2
        elseif random <= f49_local7 + f49_local8 then
            comboStage = 3
        elseif random <= f49_local7 + f49_local8 + f49_local9 then
            comboStage = 4
        elseif random <= f49_local7 + f49_local8 + f49_local9 + f49_local10 then
            comboStage = 5
        elseif random <= f49_local7 + f49_local8 + f49_local9 + f49_local10 + f49_local11 then
            comboStage = 6
        elseif random <= f49_local7 + f49_local8 + f49_local9 + f49_local10 + f49_local11 + f49_local12 then
            comboStage = 7
        elseif random <= f49_local7 + f49_local8 + f49_local9 + f49_local10 + f49_local11 + f49_local12 + f49_local13 then
            comboStage = 8
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f49_local0 >= 2530000 and f49_local0 <= 2539999 then
            local f49_local15 = NPC_ATK_R2
            local f49_local16 = NPC_ATK_R2
            f49_local15 = NPC_ATK_R2
            f49_local16 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Left_R1, NPC_ATK_Right_R1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, comboStage, 2, 0, 0, -1, -1)
    elseif f49_local4 == 2 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f49_local0 >= 2530000 and f49_local0 <= 2539999 then
            NPC_ATK_Left_R1Hold = NPC_ATK_R2Hold
            NPC_ATK_Left_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_R1Hold, NPC_ATK_Right_R1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f49_local4 == 3 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f49_local0 >= 2530000 and f49_local0 <= 2539999 then
            NPC_ATK_Left_R1Hold = NPC_ATK_R2Hold
            NPC_ATK_Right_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_R1Hold, NPC_ATK_Right_R1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f49_local0 >= 2530000 and f49_local0 <= 2539999 then
            NPC_ATK_Left_R1 = NPC_ATK_R2
            NPC_ATK_Right_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 1, NPC_ATK_Left_R1, NPC_ATK_Right_R1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 7, 2)
    if f49_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act23(ai, goal, paramTbl)
    local f50_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f50_local1 = GetRandomSpellId_ByType(self, ai, goal, 12, f50_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f50_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f50_local3 = ai:GetAIUsageParam(0, f50_local1)
    local f50_local4 = GetUsageId_CC(ai, f50_local3)
    local f50_local5 = GetUsageId_X(ai, f50_local3)
    ai:ChangeEquipMagicByMagicParamId(f50_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f50_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f50_local7 = 20
        local f50_local8 = 30
        local f50_local9 = 30
        local f50_local10 = 20
        local f50_local11 = 0
        local f50_local12 = 0
        local f50_local13 = 0
        local comboStage = 1
        if random <= f50_local7 then
            comboStage = 2
        elseif random <= f50_local7 + f50_local8 then
            comboStage = 3
        elseif random <= f50_local7 + f50_local8 + f50_local9 then
            comboStage = 4
        elseif random <= f50_local7 + f50_local8 + f50_local9 + f50_local10 then
            comboStage = 5
        elseif random <= f50_local7 + f50_local8 + f50_local9 + f50_local10 + f50_local11 then
            comboStage = 6
        elseif random <= f50_local7 + f50_local8 + f50_local9 + f50_local10 + f50_local11 + f50_local12 then
            comboStage = 7
        elseif random <= f50_local7 + f50_local8 + f50_local9 + f50_local10 + f50_local11 + f50_local12 + f50_local13 then
            comboStage = 8
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f50_local0 >= 2530000 and f50_local0 <= 2539999 then
            NPC_ATK_Down_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Down_R1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_B, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f50_local4 == 2 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f50_local0 >= 2530000 and f50_local0 <= 2539999 then
            NPC_ATK_Down_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f50_local4 == 3 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f50_local0 >= 2530000 and f50_local0 <= 2539999 then
            NPC_ATK_Down_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f50_local0 >= 2530000 and f50_local0 <= 2539999 then
            NPC_ATK_Down_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Down_R1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 7, 2)
    if f50_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act24(ai, goal, paramTbl)
    local f51_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f51_local1 = GetRandomSpellId_ByType(self, ai, goal, 11, f51_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f51_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f51_local3 = ai:GetAIUsageParam(0, f51_local1)
    local f51_local4 = GetUsageId_CC(ai, f51_local3)
    local f51_local5 = GetUsageId_X(ai, f51_local3)
    ai:ChangeEquipMagicByMagicParamId(f51_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    local f51_local6 = successDistance
    local f51_local7 = successDistance
    local f51_local8 = successDistance + 6
    local f51_local9 = 0
    local f51_local10 = 0
    local f51_local11 = 1.8
    local f51_local12 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f51_local9 = 100
        f51_local7 = 0
        f51_local8 = 0.1
    end
    local f51_local13 = ai:GetNPCActProb(9020)
    local f51_local14 = false
    if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f51_local14 = true
    else
        f51_local14 = false
    end
    if f51_local14 == false then
        ai:AddNPCActProb(9000)
        f51_local13 = ai:GetNPCActProb(9020)
    end
    NPC_Approach_Act_Flex(ai, goal, f51_local6, f51_local7, f51_local8, f51_local9, f51_local13, f51_local11, f51_local12)
    if f51_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f51_local16 = 20
        local f51_local17 = 30
        local f51_local18 = 30
        local f51_local19 = 20
        local f51_local20 = 0
        local f51_local21 = 0
        local f51_local22 = 0
        local comboStage = 1
        if random <= f51_local16 then
            comboStage = 2
        elseif random <= f51_local16 + f51_local17 then
            comboStage = 3
        elseif random <= f51_local16 + f51_local17 + f51_local18 then
            comboStage = 4
        elseif random <= f51_local16 + f51_local17 + f51_local18 + f51_local19 then
            comboStage = 5
        elseif random <= f51_local16 + f51_local17 + f51_local18 + f51_local19 + f51_local20 then
            comboStage = 6
        elseif random <= f51_local16 + f51_local17 + f51_local18 + f51_local19 + f51_local20 + f51_local21 then
            comboStage = 7
        elseif random <= f51_local16 + f51_local17 + f51_local18 + f51_local19 + f51_local20 + f51_local21 + f51_local22 then
            comboStage = 8
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f51_local0 >= 2530000 and f51_local0 <= 2539999 then
            NPC_ATK_Up_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Up_R1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_F, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f51_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f51_local0 >= 2530000 and f51_local0 <= 2539999 then
            NPC_ATK_Up_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f51_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f51_local0 >= 2530000 and f51_local0 <= 2539999 then
            NPC_ATK_Up_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f51_local0 >= 2530000 and f51_local0 <= 2539999 then
            NPC_ATK_Up_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Up_R1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 8, 2)
    if f51_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act25(ai, goal, paramTbl)
    local f52_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f52_local1 = GetRandomSpellId_ByType(self, ai, goal, 11, f52_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f52_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f52_local3 = ai:GetAIUsageParam(0, f52_local1)
    local f52_local4 = GetUsageId_CC(ai, f52_local3)
    local f52_local5 = GetUsageId_X(ai, f52_local3)
    ai:ChangeEquipMagicByMagicParamId(f52_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f52_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f52_local7 = 20
        local f52_local8 = 30
        local f52_local9 = 30
        local f52_local10 = 20
        local f52_local11 = 0
        local f52_local12 = 0
        local f52_local13 = 0
        local comboStage = 1
        if random <= f52_local7 then
            comboStage = 2
        elseif random <= f52_local7 + f52_local8 then
            comboStage = 3
        elseif random <= f52_local7 + f52_local8 + f52_local9 then
            comboStage = 4
        elseif random <= f52_local7 + f52_local8 + f52_local9 + f52_local10 then
            comboStage = 5
        elseif random <= f52_local7 + f52_local8 + f52_local9 + f52_local10 + f52_local11 then
            comboStage = 6
        elseif random <= f52_local7 + f52_local8 + f52_local9 + f52_local10 + f52_local11 + f52_local12 then
            comboStage = 7
        elseif random <= f52_local7 + f52_local8 + f52_local9 + f52_local10 + f52_local11 + f52_local12 + f52_local13 then
            comboStage = 8
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f52_local0 >= 2530000 and f52_local0 <= 2539999 then
            NPC_ATK_Left_R1 = NPC_ATK_R2
            NPC_ATK_Right_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Left_R1, NPC_ATK_Right_R1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, comboStage, 2, 0, 0, -1, -1)
    elseif f52_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f52_local0 >= 2530000 and f52_local0 <= 2539999 then
            NPC_ATK_Left_R1Hold = NPC_ATK_R2Hold
            NPC_ATK_Right_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_R1Hold, NPC_ATK_Right_R1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f52_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f52_local0 >= 2530000 and f52_local0 <= 2539999 then
            NPC_ATK_Left_R1Hold = NPC_ATK_R2Hold
            NPC_ATK_Right_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_R1Hold, NPC_ATK_Right_R1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f52_local0 >= 2530000 and f52_local0 <= 2539999 then
            NPC_ATK_Left_R1 = NPC_ATK_R2
            NPC_ATK_Right_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 1, NPC_ATK_Left_R1, NPC_ATK_Right_R1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 8, 2)
    if f52_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act26(ai, goal, paramTbl)
    local f53_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f53_local1 = GetRandomSpellId_ByType(self, ai, goal, 11, f53_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f53_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f53_local3 = ai:GetAIUsageParam(0, f53_local1)
    local f53_local4 = GetUsageId_CC(ai, f53_local3)
    local f53_local5 = GetUsageId_X(ai, f53_local3)
    ai:ChangeEquipMagicByMagicParamId(f53_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f53_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f53_local7 = 20
        local f53_local8 = 30
        local f53_local9 = 30
        local f53_local10 = 20
        local f53_local11 = 0
        local f53_local12 = 0
        local f53_local13 = 0
        local comboStage = 1
        if random <= f53_local7 then
            comboStage = 2
        elseif random <= f53_local7 + f53_local8 then
            comboStage = 3
        elseif random <= f53_local7 + f53_local8 + f53_local9 then
            comboStage = 4
        elseif random <= f53_local7 + f53_local8 + f53_local9 + f53_local10 then
            comboStage = 5
        elseif random <= f53_local7 + f53_local8 + f53_local9 + f53_local10 + f53_local11 then
            comboStage = 6
        elseif random <= f53_local7 + f53_local8 + f53_local9 + f53_local10 + f53_local11 + f53_local12 then
            comboStage = 7
        elseif random <= f53_local7 + f53_local8 + f53_local9 + f53_local10 + f53_local11 + f53_local12 + f53_local13 then
            comboStage = 8
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f53_local0 >= 2530000 and f53_local0 <= 2539999 then
            NPC_ATK_Down_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Down_R1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_B, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f53_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f53_local0 >= 2530000 and f53_local0 <= 2539999 then
            NPC_ATK_Down_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f53_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f53_local0 >= 2530000 and f53_local0 <= 2539999 then
            NPC_ATK_Down_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f53_local0 >= 2530000 and f53_local0 <= 2539999 then
            NPC_ATK_Down_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Down_R1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 8, 2)
    if f53_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act27(ai, goal, paramTbl)
    local f54_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f54_local1 = GetRandomSpellId_ByType(self, ai, goal, 10, f54_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f54_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f54_local3 = ai:GetAIUsageParam(0, f54_local1)
    local f54_local4 = GetUsageId_CC(ai, f54_local3)
    local f54_local5 = GetUsageId_X(ai, f54_local3)
    ai:ChangeEquipMagicByMagicParamId(f54_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    local f54_local6 = successDistance
    local f54_local7 = successDistance
    local f54_local8 = successDistance + 6
    local f54_local9 = 0
    local f54_local10 = 0
    local f54_local11 = 1.8
    local f54_local12 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f54_local9 = 100
        f54_local7 = 0
        f54_local8 = 0.1
    end
    local f54_local13 = ai:GetNPCActProb(9020)
    local f54_local14 = false
    if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f54_local14 = true
    else
        f54_local14 = false
    end
    if f54_local14 == false then
        ai:AddNPCActProb(9000)
        f54_local13 = ai:GetNPCActProb(9020)
    end
    NPC_Approach_Act_Flex(ai, goal, f54_local6, f54_local7, f54_local8, f54_local9, f54_local13, f54_local11, f54_local12)
    if f54_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f54_local16 = 20
        local f54_local17 = 30
        local f54_local18 = 30
        local f54_local19 = 20
        local f54_local20 = 0
        local f54_local21 = 0
        local f54_local22 = 0
        local comboStage = 1
        if random <= f54_local16 then
            comboStage = 2
        elseif random <= f54_local16 + f54_local17 then
            comboStage = 3
        elseif random <= f54_local16 + f54_local17 + f54_local18 then
            comboStage = 4
        elseif random <= f54_local16 + f54_local17 + f54_local18 + f54_local19 then
            comboStage = 5
        elseif random <= f54_local16 + f54_local17 + f54_local18 + f54_local19 + f54_local20 then
            comboStage = 6
        elseif random <= f54_local16 + f54_local17 + f54_local18 + f54_local19 + f54_local20 + f54_local21 then
            comboStage = 7
        elseif random <= f54_local16 + f54_local17 + f54_local18 + f54_local19 + f54_local20 + f54_local21 + f54_local22 then
            comboStage = 8
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 20018033) then
            comboStage = 3
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f54_local0 >= 2530000 and f54_local0 <= 2539999 then
            NPC_ATK_Up_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Up_R1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_F, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f54_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f54_local0 >= 2530000 and f54_local0 <= 2539999 then
            NPC_ATK_Up_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f54_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f54_local0 >= 2530000 and f54_local0 <= 2539999 then
            NPC_ATK_Up_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f54_local0 >= 2530000 and f54_local0 <= 2539999 then
            NPC_ATK_Up_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Up_R1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 9, 2)
    if f54_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act28(ai, goal, paramTbl)
    local f55_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f55_local1 = GetRandomSpellId_ByType(self, ai, goal, 10, f55_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f55_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f55_local3 = ai:GetAIUsageParam(0, f55_local1)
    local f55_local4 = GetUsageId_CC(ai, f55_local3)
    local f55_local5 = GetUsageId_X(ai, f55_local3)
    ai:ChangeEquipMagicByMagicParamId(f55_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f55_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f55_local7 = 20
        local f55_local8 = 30
        local f55_local9 = 30
        local f55_local10 = 20
        local f55_local11 = 0
        local f55_local12 = 0
        local f55_local13 = 0
        local comboStage = 1
        if random <= f55_local7 then
            comboStage = 2
        elseif random <= f55_local7 + f55_local8 then
            comboStage = 3
        elseif random <= f55_local7 + f55_local8 + f55_local9 then
            comboStage = 4
        elseif random <= f55_local7 + f55_local8 + f55_local9 + f55_local10 then
            comboStage = 5
        elseif random <= f55_local7 + f55_local8 + f55_local9 + f55_local10 + f55_local11 then
            comboStage = 6
        elseif random <= f55_local7 + f55_local8 + f55_local9 + f55_local10 + f55_local11 + f55_local12 then
            comboStage = 7
        elseif random <= f55_local7 + f55_local8 + f55_local9 + f55_local10 + f55_local11 + f55_local12 + f55_local13 then
            comboStage = 8
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 20018033) then
            comboStage = 3
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f55_local0 >= 2530000 and f55_local0 <= 2539999 then
            NPC_ATK_Left_R1 = NPC_ATK_R2
            NPC_ATK_Right_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Left_R1, NPC_ATK_Right_R1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, comboStage, 2, 0, 0, -1, -1)
    elseif f55_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f55_local0 >= 2530000 and f55_local0 <= 2539999 then
            NPC_ATK_Left_R1Hold = NPC_ATK_R2Hold
            NPC_ATK_Right_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_R1Hold, NPC_ATK_Right_R1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f55_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f55_local0 >= 2530000 and f55_local0 <= 2539999 then
            NPC_ATK_Left_R1Hold = NPC_ATK_R2Hold
            NPC_ATK_Right_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_R1Hold, NPC_ATK_Right_R1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f55_local0 >= 2530000 and f55_local0 <= 2539999 then
            NPC_ATK_Left_R1 = NPC_ATK_R2
            NPC_ATK_Right_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 1, NPC_ATK_Left_R1, NPC_ATK_Right_R1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 9, 2)
    if f55_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act29(ai, goal, paramTbl)
    local f56_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f56_local1 = GetRandomSpellId_ByType(self, ai, goal, 10, f56_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f56_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f56_local3 = ai:GetAIUsageParam(0, f56_local1)
    local f56_local4 = GetUsageId_CC(ai, f56_local3)
    local f56_local5 = GetUsageId_X(ai, f56_local3)
    ai:ChangeEquipMagicByMagicParamId(f56_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f56_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f56_local7 = 20
        local f56_local8 = 30
        local f56_local9 = 30
        local f56_local10 = 20
        local f56_local11 = 0
        local f56_local12 = 0
        local f56_local13 = 0
        local comboStage = 1
        if random <= f56_local7 then
            comboStage = 2
        elseif random <= f56_local7 + f56_local8 then
            comboStage = 3
        elseif random <= f56_local7 + f56_local8 + f56_local9 then
            comboStage = 4
        elseif random <= f56_local7 + f56_local8 + f56_local9 + f56_local10 then
            comboStage = 5
        elseif random <= f56_local7 + f56_local8 + f56_local9 + f56_local10 + f56_local11 then
            comboStage = 6
        elseif random <= f56_local7 + f56_local8 + f56_local9 + f56_local10 + f56_local11 + f56_local12 then
            comboStage = 7
        elseif random <= f56_local7 + f56_local8 + f56_local9 + f56_local10 + f56_local11 + f56_local12 + f56_local13 then
            comboStage = 8
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 20018033) then
            comboStage = 3
        end
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f56_local0 >= 2530000 and f56_local0 <= 2539999 then
            NPC_ATK_Down_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Down_R1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_B, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f56_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f56_local0 >= 2530000 and f56_local0 <= 2539999 then
            NPC_ATK_Down_R1Hold = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f56_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f56_local0 >= 2530000 and f56_local0 <= 2539999 then
            local f56_local7 = NPC_ATK_R2Hold
            f56_local7 = NPC_ATK_R2Hold
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_R1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f56_local0 >= 2530000 and f56_local0 <= 2539999 then
            NPC_ATK_Down_R1 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Down_R1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 9, 2)
    if f56_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act30(ai, goal, paramTbl)
    local f57_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f57_local1 = GetRandomSpellId_ByType(self, ai, goal, 20, f57_local0)
    ai:ChangeEquipMagicByMagicParamId(f57_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f57_local0 >= 2530000 and f57_local0 <= 2539999 then
        NPC_ATK_R1 = NPC_ATK_R2
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_R1, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    
end

function GeneralNPC_Act31(ai, goal, paramTbl)
    local f58_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f58_local1 = GetRandomSpellId_ByType(self, ai, goal, 30, f58_local0)
    ai:ChangeEquipMagicByMagicParamId(f58_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f58_local0 >= 2530000 and f58_local0 <= 2539999 then
        NPC_ATK_R1 = NPC_ATK_R2
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_R1, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    
end

function GeneralNPC_Act32(ai, goal, paramTbl)
    local f59_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local f59_local1 = GetRandomSpellId_ByType(self, ai, goal, 50, f59_local0)
    ai:ChangeEquipMagicByMagicParamId(f59_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f59_local0 >= 2530000 and f59_local0 <= 2539999 then
        NPC_ATK_R1 = NPC_ATK_R2
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_R1, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    ai:SetTimer(4, 30)
    
end

function GeneralNPC_Act33(ai, goal, paramTbl)
    local f60_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local distance = ai:GetDist(TTARGET_FRI_0)
    local f60_local2 = GetRandomSpellId_ByType(self, ai, goal, 21, f60_local0)
    ai:ChangeEquipMagicByMagicParamId(f60_local2)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and f60_local0 >= 2530000 and f60_local0 <= 2539999 then
        NPC_ATK_R1 = NPC_ATK_R2
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_R1, TARGET_FRI_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    ai:AddNPCActProb(3500)
    
end

function GeneralNPC_Act35(ai, goal, paramTbl)
    
end

function GeneralNPC_Act36(ai, goal, paramTbl)
    
end

function GeneralNPC_Act41(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local successDistance = ai:GetStringIndexedNumber("L_Dist_TwoHandR1_First")
    local successDistance2 = ai:GetStringIndexedNumber("L_Dist_TwoHandR1_Second")
    local f63_local6 = 50
    local f63_local7 = ai:GetStringIndexedNumber("L_ComboNum_R1")
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end
    local f63_local8 = ai:GetNPCActProb(9020)
    local f63_local9 = false
    ai:AddNPCActProb(9000)
    f63_local8 = ai:GetNPCActProb(9020)
    local f63_local10 = false
    if random3 <= f63_local8 then
        f63_local10 = true
        f63_local8 = 100
    end
    local f63_local11 = successDistance
    local f63_local12 = successDistance + 2
    local f63_local13 = successDistance + 2
    local f63_local14 = 50
    local f63_local15 = 1.8
    local f63_local16 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f63_local14 = 100
        f63_local12 = 0
        f63_local13 = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, f63_local11, f63_local12, f63_local13, f63_local14, f63_local8, f63_local15, f63_local16)
    if successDistance <= distance and random2 <= f63_local6 and f63_local10 == true then
        if ai:IsInsideTargetCustom(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_L, 180, 180, 10) == true then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, 1, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
        else
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, 0, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
        end
    end
    if f63_local7 >= 6 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f63_local7 == 5 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f63_local7 == 4 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f63_local7 == 3 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f63_local7 == 2 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act42(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local successDistance = ai:GetStringIndexedNumber("L_Dist_TwoHandR2_First")
    local successDistance2 = ai:GetStringIndexedNumber("L_Dist_TwoHandR2_Second")
    local f64_local6 = 100
    local f64_local7 = 50
    local f64_local8 = ai:GetStringIndexedNumber("L_ComboNum_R1")
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end
    local f64_local9 = ai:GetNPCActProb(9020)
    ai:AddNPCActProb(9000)
    f64_local9 = ai:GetNPCActProb(9020)
    local f64_local10 = successDistance
    local f64_local11 = successDistance + 2
    local f64_local12 = successDistance + 2
    local f64_local13 = 50
    local f64_local14 = 1.8
    local f64_local15 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f64_local13 = 100
        f64_local11 = 0
        f64_local12 = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, f64_local10, f64_local11, f64_local12, f64_local13, f64_local9, f64_local14, f64_local15)
    if successDistance <= distance and random2 <= f64_local7 and UseGuard == true then
        if ai:IsInsideTargetCustom(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_L, 180, 180, 10) == true then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, 1, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
        else
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, 0, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
        end
    end
    local random4 = ai:GetRandam_Int(1, 100)
    if f64_local8 == 2 then
        if random4 <= 80 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance2, 0, 0)
        elseif random4 <= 90 then
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R2Hold, TARGET_ENE_0, successDistance2, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_R2Hold, TARGET_ENE_0, successDistance, 0, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance2, 0, 0)
        end
    elseif random4 <= 80 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R2, TARGET_ENE_0, successDistance, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R2Hold, TARGET_ENE_0, successDistance, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act43(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local successDistance = ai:GetStringIndexedNumber("L_Dist_OneHandL2")
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    else
    end
    local f65_local2 = ai:GetNPCActProb(9020)
    ai:AddNPCActProb(9000)
    f65_local2 = ai:GetNPCActProb(9020)
    local f65_local3 = successDistance
    local f65_local4 = successDistance + 2
    local f65_local5 = successDistance + 2
    local f65_local6 = 50
    local f65_local7 = 1.8
    local f65_local8 = 2
    local f65_local9 = ai:GetStringIndexedNumber("R_ComboNum_R1")
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f65_local6 = 100
        f65_local4 = 0
        f65_local5 = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, f65_local3, f65_local4, f65_local5, f65_local6, f65_local2, f65_local7, f65_local8)
    if f65_local9 >= 6 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
    elseif f65_local9 == 5 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
    elseif f65_local9 == 4 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
    elseif f65_local9 == 3 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
    elseif f65_local9 == 2 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L1, TARGET_ENE_0, AttDist_Second, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_L1, TARGET_ENE_0, successDistance, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act44(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local f66_local4 = ai:GetStringIndexedNumber("L_Dist_DashR1")
    local f66_local5 = -1
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end
    local f66_local6 = ai:GetNPCActProb(9020)
    local f66_local7 = false
    ai:AddNPCActProb(9000)
    f66_local6 = ai:GetNPCActProb(9020)
    if random <= f66_local6 then
        f66_local5 = NPC_ATK_L1
    end
    if random3 <= 50 then
        goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, f66_local4, TARGET_SELF, f66_local5)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_DashR1, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, f66_local4, TARGET_SELF, f66_local5)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_DashR2, TARGET_ENE_0, 999, 0, 0)
    end
    
end

function GeneralNPC_Act45(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local r1AttackRange = ai:GetStringIndexedNumber("L_Dist_RollingR1")
    local r2AttackRange = ai:GetStringIndexedNumber("L_Dist_RollingR2")
    local f67_local5 = false
    local f67_local6 = ai:GetNPCActProb(9040)
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end
    if random2 <= f67_local6 then
        f67_local5 = true
    end
    local animationId = NPC_ATK_NONE
    local f67_local8 = NPC_ATK_UpLeft_ButtonXmark
    local f67_local9 = NPC_ATK_UpRight_ButtonXmark
    local f67_local10 = NPC_ATK_Up_ButtonXmark
    if f67_local5 == true then
        f67_local8 = NPC_ATK_UpLeft_L2
        f67_local9 = NPC_ATK_UpRight_L2
        f67_local10 = NPC_ATK_Up_L2
    end
    if distance >= 5 and SpaceCheck(ai, goal, 0, 5) == true then
        animationId = f67_local10
    elseif SpaceCheck(ai, goal, -45, 5) == true then
        if SpaceCheck(ai, goal, 45, 5) == true then
            if random <= 50 then
                animationId = f67_local8
            else
                animationId = f67_local9
            end
        else
            animationId = f67_local9
        end
    elseif SpaceCheck(ai, goal, 45, 5) == true then
        animationId = f67_local9
    else
    end
    if animationId ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
    end
    local ifBothR1Odds = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        ifBothR1Odds = 100
        r2AttackRange = 0
    end
    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 3, TARGET_ENE_0, r1AttackRange, r2AttackRange, ifBothR1Odds)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act46(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local r1AttackRange = ai:GetStringIndexedNumber("L_Dist_RollingR1")
    local r2AttackRange = ai:GetStringIndexedNumber("L_Dist_RollingR2")
    local f68_local5 = false
    local f68_local6 = ai:GetNPCActProb(9040)
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end
    if random2 <= f68_local6 then
        f68_local5 = true
    end
    local animationId = NPC_ATK_NONE
    local f68_local8 = NPC_ATK_Left_ButtonXmark
    local f68_local9 = NPC_ATK_Right_ButtonXmark
    if f68_local5 == true then
        f68_local8 = NPC_ATK_Left_L2
        f68_local9 = NPC_ATK_Right_L2
    end
    if SpaceCheck(ai, goal, -90, 5) == true then
        if SpaceCheck(ai, goal, 90, 5) == true then
            if random <= 50 then
                animationId = f68_local8
            else
                animationId = f68_local9
            end
        else
            animationId = f68_local8
        end
    elseif SpaceCheck(ai, goal, 90, 5) == true then
        animationId = f68_local9
    else
    end
    if animationId ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
    end
    local ifBothR1Odds = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        ifBothR1Odds = 100
        r2AttackRange = 0
    end
    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 3, TARGET_ENE_0, r1AttackRange, r2AttackRange, ifBothR1Odds)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act47(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local r1AttackRange = ai:GetStringIndexedNumber("L_Dist_RollingR1")
    local r2AttackRange = ai:GetStringIndexedNumber("L_Dist_RollingR2")
    local f69_local5 = false
    local f69_local6 = ai:GetNPCActProb(9040)
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end
    if random2 <= f69_local6 then
        f69_local5 = true
    end
    local animationId = NPC_ATK_NONE
    local f69_local8 = NPC_ATK_DownLeft_ButtonXmark
    local f69_local9 = NPC_ATK_DownRight_ButtonXmark
    local f69_local10 = NPC_ATK_Down_ButtonXmark
    if f69_local5 == true then
        f69_local8 = NPC_ATK_DownLeft_L2
        f69_local9 = NPC_ATK_DownRight_L2
        f69_local10 = NPC_ATK_Down_L2
    end
    if distance <= 1 and SpaceCheck(ai, goal, 180, 5) == true then
        animationId = f69_local10
    elseif SpaceCheck(ai, goal, -135, 5) == true then
        if SpaceCheck(ai, goal, 135, 5) == true then
            if random <= 50 then
                animationId = f69_local8
            else
                animationId = f69_local9
            end
        else
            animationId = f69_local8
        end
    elseif SpaceCheck(ai, goal, 135, 5) == true then
        animationId = f69_local9
    else
    end
    if animationId ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
    end
    local ifBothR1Odds = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        ifBothR1Odds = 100
        r2AttackRange = 0
    end
    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 3, TARGET_ENE_0, r1AttackRange, r2AttackRange, ifBothR1Odds)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act48(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local r1AttackRange = ai:GetStringIndexedNumber("L_Dist_BackStepR1")
    local r2AttackRange = ai:GetStringIndexedNumber("L_Dist_BackStepR2")
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end
    if SpaceCheck(ai, goal, 180, 5) == true then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_ButtonXmark, TARGET_ENE_0, 999, 0, 0)
    end
    local ifBothR1Odds = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        ifBothR1Odds = 100
        r2AttackRange = 0
    end
    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 1, TARGET_ENE_0, r1AttackRange, r2AttackRange, ifBothR1Odds)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act49(ai, goal, paramTbl)
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end
    local f71_local0 = 4
    local f71_local1 = 0
    local f71_local2 = 4
    local f71_local3 = 100
    local f71_local4 = 0
    local f71_local5 = 1.8
    local f71_local6 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f71_local3 = 100
        f71_local1 = 0
        f71_local2 = 0.1
    end
    local f71_local7 = 0
    local f71_local8 = false
    if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f71_local8 = true
    else
        f71_local8 = false
    end
    if f71_local8 == false then
        ai:AddNPCActProb(9000)
        f71_local7 = ai:GetNPCActProb(9020)
    end
    NPC_Approach_Act_Flex(ai, goal, f71_local0, f71_local1, f71_local2, f71_local3, f71_local7, f71_local5, f71_local6)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018035) then
        local f71_local9 = NPC_ATK_Down_Jump
        local f71_local10 = NPC_ATK_R1
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.5, NPC_ATK_Up_Jump, TARGET_ENE_0, 999, 0, 90)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018035) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
    end
    
end

function GeneralNPC_Act50(ai, goal, paramTbl)
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end
    local f72_local0 = 6.8
    local f72_local1 = 0
    local f72_local2 = false
    local random = ai:GetRandam_Int(1, 100)
    local f72_local4 = -1
    if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f72_local2 = true
    else
        f72_local2 = false
    end
    if f72_local2 == false then
        ai:AddNPCActProb(9000)
        f72_local1 = ai:GetNPCActProb(9020)
    end
    if random <= f72_local1 then
        f72_local4 = NPC_ATK_L1
    end
    goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, f72_local0, TARGET_SELF, f72_local4)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018035) then
        InputKey = NPC_ATK_Down_Jump
        AttackButton = NPC_ATK_R1
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.5, NPC_ATK_Dash_Jump, TARGET_ENE_0, 999, 0, 90)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018035) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
    end
    
end

function GeneralNPC_Act51(ai, goal, paramTbl)
    local f73_local0 = 10
    local random = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random2 = ai:GetRandam_Int(0, 1)
    local f73_local4 = 90
    local f73_local5 = false
    local f73_local6 = GetBowType(ai:GetWeaponBehaviorVarID(ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)))
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        f73_local5 = true
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
        if f73_local6 ~= 43 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
            f73_local5 = true
        end
    elseif f73_local6 ~= 43 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
        f73_local5 = true
    end
    local f73_local7 = 0
    local f73_local8 = 30
    local f73_local9 = 0
    local f73_local10 = 30
    local f73_local11 = 50
    local f73_local12 = 1.8
    local f73_local13 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f73_local11 = 100
        f73_local9 = 0
        f73_local10 = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, f73_local8, f73_local9, f73_local10, f73_local11, f73_local7, f73_local12, f73_local13)
    if f73_local6 == 43 then
        local f73_local14 = NPC_ATK_L1
        if f73_local5 == true then
            f73_local14 = NPC_ATK_R1
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, f73_local14, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, f73_local14, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R1Hold, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    end
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act52(ai, goal, paramTbl)
    local f74_local0 = 10
    local random = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random2 = ai:GetRandam_Int(0, 1)
    local f74_local4 = 90
    local f74_local5 = false
    local f74_local6 = GetBowType(ai:GetWeaponBehaviorVarID(ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)))
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        f74_local5 = true
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
        if f74_local6 ~= 43 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
            f74_local5 = true
        end
    elseif f74_local6 ~= 43 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
        f74_local5 = true
    end
    local f74_local7 = 0
    local f74_local8 = 30
    local f74_local9 = 0
    local f74_local10 = 30
    local f74_local11 = 50
    local f74_local12 = 1.8
    local f74_local13 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f74_local11 = 100
        f74_local9 = 0
        f74_local10 = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, f74_local8, f74_local9, f74_local10, f74_local11, f74_local7, f74_local12, f74_local13)
    if f74_local6 == 43 then
        local f74_local14 = NPC_ATK_L2
        if f74_local5 == true then
            f74_local14 = NPC_ATK_R2
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, f74_local14, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, f74_local14, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2Hold, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    end
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act61(ai, goal, paramTbl)
    local f75_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f75_local1 = GetRandomSpellId_ByType(self, ai, goal, 12, f75_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f75_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f75_local3 = ai:GetAIUsageParam(0, f75_local1)
    local f75_local4 = GetUsageId_CC(ai, f75_local3)
    local f75_local5 = GetUsageId_X(ai, f75_local3)
    ai:ChangeEquipMagicByMagicParamId(f75_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    local f75_local6 = successDistance
    local f75_local7 = successDistance
    local f75_local8 = successDistance + 6
    local f75_local9 = 0
    local f75_local10 = 0
    local f75_local11 = 1.8
    local f75_local12 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f75_local9 = 100
        f75_local7 = 0
        f75_local8 = 0.1
    end
    local f75_local13 = 0
    NPC_Approach_Act_Flex(ai, goal, f75_local6, f75_local7, f75_local8, f75_local9, f75_local13, f75_local11, f75_local12)
    if f75_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f75_local15 = 20
        local f75_local16 = 30
        local f75_local17 = 30
        local f75_local18 = 20
        local f75_local19 = 0
        local f75_local20 = 0
        local f75_local21 = 0
        local comboStage = 1
        if random <= f75_local15 then
            comboStage = 2
        elseif random <= f75_local15 + f75_local16 then
            comboStage = 3
        elseif random <= f75_local15 + f75_local16 + f75_local17 then
            comboStage = 4
        elseif random <= f75_local15 + f75_local16 + f75_local17 + f75_local18 then
            comboStage = 5
        elseif random <= f75_local15 + f75_local16 + f75_local17 + f75_local18 + f75_local19 then
            comboStage = 6
        elseif random <= f75_local15 + f75_local16 + f75_local17 + f75_local18 + f75_local19 + f75_local20 then
            comboStage = 7
        elseif random <= f75_local15 + f75_local16 + f75_local17 + f75_local18 + f75_local19 + f75_local20 + f75_local21 then
            comboStage = 8
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Up_L1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_F, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f75_local4 == 2 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f75_local4 == 3 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Up_L1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 7, 2)
    if f75_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act62(ai, goal, paramTbl)
    local f76_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f76_local1 = GetRandomSpellId_ByType(self, ai, goal, 12, f76_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f76_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f76_local3 = ai:GetAIUsageParam(0, f76_local1)
    local f76_local4 = GetUsageId_CC(ai, f76_local3)
    local f76_local5 = GetUsageId_X(ai, f76_local3)
    ai:ChangeEquipMagicByMagicParamId(f76_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f76_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f76_local7 = 20
        local f76_local8 = 30
        local f76_local9 = 30
        local f76_local10 = 20
        local f76_local11 = 0
        local f76_local12 = 0
        local f76_local13 = 0
        local comboStage = 1
        if random <= f76_local7 then
            comboStage = 2
        elseif random <= f76_local7 + f76_local8 then
            comboStage = 3
        elseif random <= f76_local7 + f76_local8 + f76_local9 then
            comboStage = 4
        elseif random <= f76_local7 + f76_local8 + f76_local9 + f76_local10 then
            comboStage = 5
        elseif random <= f76_local7 + f76_local8 + f76_local9 + f76_local10 + f76_local11 then
            comboStage = 6
        elseif random <= f76_local7 + f76_local8 + f76_local9 + f76_local10 + f76_local11 + f76_local12 then
            comboStage = 7
        elseif random <= f76_local7 + f76_local8 + f76_local9 + f76_local10 + f76_local11 + f76_local12 + f76_local13 then
            comboStage = 8
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Left_L1, NPC_ATK_Right_L1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, comboStage, 2, 0, 0, -1, -1)
    elseif f76_local4 == 2 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_L1Hold, NPC_ATK_Right_L1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f76_local4 == 3 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_L1Hold, NPC_ATK_Right_L1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 1, NPC_ATK_Left_L1, NPC_ATK_Right_L1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 7, 2)
    if f76_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act63(ai, goal, paramTbl)
    local f77_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f77_local1 = GetRandomSpellId_ByType(self, ai, goal, 12, f77_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f77_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f77_local3 = ai:GetAIUsageParam(0, f77_local1)
    local f77_local4 = GetUsageId_CC(ai, f77_local3)
    local f77_local5 = GetUsageId_X(ai, f77_local3)
    ai:ChangeEquipMagicByMagicParamId(f77_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f77_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f77_local7 = 20
        local f77_local8 = 30
        local f77_local9 = 30
        local f77_local10 = 20
        local f77_local11 = 0
        local f77_local12 = 0
        local f77_local13 = 0
        local comboStage = 1
        if random <= f77_local7 then
            comboStage = 2
        elseif random <= f77_local7 + f77_local8 then
            comboStage = 3
        elseif random <= f77_local7 + f77_local8 + f77_local9 then
            comboStage = 4
        elseif random <= f77_local7 + f77_local8 + f77_local9 + f77_local10 then
            comboStage = 5
        elseif random <= f77_local7 + f77_local8 + f77_local9 + f77_local10 + f77_local11 then
            comboStage = 6
        elseif random <= f77_local7 + f77_local8 + f77_local9 + f77_local10 + f77_local11 + f77_local12 then
            comboStage = 7
        elseif random <= f77_local7 + f77_local8 + f77_local9 + f77_local10 + f77_local11 + f77_local12 + f77_local13 then
            comboStage = 8
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Down_L1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_B, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f77_local4 == 2 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f77_local4 == 3 then
        ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Down_L1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 7, 2)
    if f77_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act64(ai, goal, paramTbl)
    local f78_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f78_local1 = GetRandomSpellId_ByType(self, ai, goal, 11, f78_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f78_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f78_local3 = ai:GetAIUsageParam(0, f78_local1)
    local f78_local4 = GetUsageId_CC(ai, f78_local3)
    local f78_local5 = GetUsageId_X(ai, f78_local3)
    ai:ChangeEquipMagicByMagicParamId(f78_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    local f78_local6 = successDistance
    local f78_local7 = successDistance
    local f78_local8 = successDistance + 6
    local f78_local9 = 0
    local f78_local10 = 0
    local f78_local11 = 1.8
    local f78_local12 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f78_local9 = 100
        f78_local7 = 0
        f78_local8 = 0.1
    end
    local f78_local13 = ai:GetNPCActProb(9020)
    NPC_Approach_Act_Flex(ai, goal, f78_local6, f78_local7, f78_local8, f78_local9, f78_local13, f78_local11, f78_local12)
    if f78_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f78_local15 = 20
        local f78_local16 = 30
        local f78_local17 = 30
        local f78_local18 = 20
        local f78_local19 = 0
        local f78_local20 = 0
        local f78_local21 = 0
        local comboStage = 1
        if random <= f78_local15 then
            comboStage = 2
        elseif random <= f78_local15 + f78_local16 then
            comboStage = 3
        elseif random <= f78_local15 + f78_local16 + f78_local17 then
            comboStage = 4
        elseif random <= f78_local15 + f78_local16 + f78_local17 + f78_local18 then
            comboStage = 5
        elseif random <= f78_local15 + f78_local16 + f78_local17 + f78_local18 + f78_local19 then
            comboStage = 6
        elseif random <= f78_local15 + f78_local16 + f78_local17 + f78_local18 + f78_local19 + f78_local20 then
            comboStage = 7
        elseif random <= f78_local15 + f78_local16 + f78_local17 + f78_local18 + f78_local19 + f78_local20 + f78_local21 then
            comboStage = 8
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Up_L1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_F, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f78_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f78_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Up_L1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 8, 2)
    if f78_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act65(ai, goal, paramTbl)
    local f79_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f79_local1 = GetRandomSpellId_ByType(self, ai, goal, 11, f79_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f79_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f79_local3 = ai:GetAIUsageParam(0, f79_local1)
    local f79_local4 = GetUsageId_CC(ai, f79_local3)
    local f79_local5 = GetUsageId_X(ai, f79_local3)
    ai:ChangeEquipMagicByMagicParamId(f79_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f79_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f79_local7 = 20
        local f79_local8 = 30
        local f79_local9 = 30
        local f79_local10 = 20
        local f79_local11 = 0
        local f79_local12 = 0
        local f79_local13 = 0
        local comboStage = 1
        if random <= f79_local7 then
            comboStage = 2
        elseif random <= f79_local7 + f79_local8 then
            comboStage = 3
        elseif random <= f79_local7 + f79_local8 + f79_local9 then
            comboStage = 4
        elseif random <= f79_local7 + f79_local8 + f79_local9 + f79_local10 then
            comboStage = 5
        elseif random <= f79_local7 + f79_local8 + f79_local9 + f79_local10 + f79_local11 then
            comboStage = 6
        elseif random <= f79_local7 + f79_local8 + f79_local9 + f79_local10 + f79_local11 + f79_local12 then
            comboStage = 7
        elseif random <= f79_local7 + f79_local8 + f79_local9 + f79_local10 + f79_local11 + f79_local12 + f79_local13 then
            comboStage = 8
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Left_L1, NPC_ATK_Right_L1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, comboStage, 2, 0, 0, -1, -1)
    elseif f79_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_L1Hold, NPC_ATK_Right_L1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f79_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_L1Hold, NPC_ATK_Right_L1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 1, NPC_ATK_Left_L1, NPC_ATK_Right_L1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 8, 2)
    if f79_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act66(ai, goal, paramTbl)
    local f80_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f80_local1 = GetRandomSpellId_ByType(self, ai, goal, 11, f80_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f80_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f80_local3 = ai:GetAIUsageParam(0, f80_local1)
    local f80_local4 = GetUsageId_CC(ai, f80_local3)
    local f80_local5 = GetUsageId_X(ai, f80_local3)
    ai:ChangeEquipMagicByMagicParamId(f80_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f80_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f80_local7 = 20
        local f80_local8 = 30
        local f80_local9 = 30
        local f80_local10 = 20
        local f80_local11 = 0
        local f80_local12 = 0
        local f80_local13 = 0
        local comboStage = 1
        if random <= f80_local7 then
            comboStage = 2
        elseif random <= f80_local7 + f80_local8 then
            comboStage = 3
        elseif random <= f80_local7 + f80_local8 + f80_local9 then
            comboStage = 4
        elseif random <= f80_local7 + f80_local8 + f80_local9 + f80_local10 then
            comboStage = 5
        elseif random <= f80_local7 + f80_local8 + f80_local9 + f80_local10 + f80_local11 then
            comboStage = 6
        elseif random <= f80_local7 + f80_local8 + f80_local9 + f80_local10 + f80_local11 + f80_local12 then
            comboStage = 7
        elseif random <= f80_local7 + f80_local8 + f80_local9 + f80_local10 + f80_local11 + f80_local12 + f80_local13 then
            comboStage = 8
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Down_L1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_B, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f80_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f80_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Down_L1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 8, 2)
    if f80_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act67(ai, goal, paramTbl)
    local f81_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f81_local1 = GetRandomSpellId_ByType(self, ai, goal, 10, f81_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f81_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f81_local3 = ai:GetAIUsageParam(0, f81_local1)
    local f81_local4 = GetUsageId_CC(ai, f81_local3)
    local f81_local5 = GetUsageId_X(ai, f81_local3)
    ai:ChangeEquipMagicByMagicParamId(f81_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    local f81_local6 = successDistance
    local f81_local7 = successDistance
    local f81_local8 = successDistance + 6
    local f81_local9 = 0
    local f81_local10 = 0
    local f81_local11 = 1.8
    local f81_local12 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f81_local9 = 100
        f81_local7 = 0
        f81_local8 = 0.1
    end
    local f81_local13 = 0
    NPC_Approach_Act_Flex(ai, goal, f81_local6, f81_local7, f81_local8, f81_local9, f81_local13, f81_local11, f81_local12)
    if f81_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f81_local15 = 20
        local f81_local16 = 30
        local f81_local17 = 30
        local f81_local18 = 20
        local f81_local19 = 0
        local f81_local20 = 0
        local f81_local21 = 0
        local comboStage = 1
        if random <= f81_local15 then
            comboStage = 2
        elseif random <= f81_local15 + f81_local16 then
            comboStage = 3
        elseif random <= f81_local15 + f81_local16 + f81_local17 then
            comboStage = 4
        elseif random <= f81_local15 + f81_local16 + f81_local17 + f81_local18 then
            comboStage = 5
        elseif random <= f81_local15 + f81_local16 + f81_local17 + f81_local18 + f81_local19 then
            comboStage = 6
        elseif random <= f81_local15 + f81_local16 + f81_local17 + f81_local18 + f81_local19 + f81_local20 then
            comboStage = 7
        elseif random <= f81_local15 + f81_local16 + f81_local17 + f81_local18 + f81_local19 + f81_local20 + f81_local21 then
            comboStage = 8
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Up_L1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_F, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f81_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f81_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Up_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Up_L1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 9, 2)
    if f81_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act68(ai, goal, paramTbl)
    local f82_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f82_local1 = GetRandomSpellId_ByType(self, ai, goal, 10, f82_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f82_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f82_local3 = ai:GetAIUsageParam(0, f82_local1)
    local f82_local4 = GetUsageId_CC(ai, f82_local3)
    local f82_local5 = GetUsageId_X(ai, f82_local3)
    ai:ChangeEquipMagicByMagicParamId(f82_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f82_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f82_local7 = 20
        local f82_local8 = 30
        local f82_local9 = 30
        local f82_local10 = 20
        local f82_local11 = 0
        local f82_local12 = 0
        local f82_local13 = 0
        local comboStage = 1
        if random <= f82_local7 then
            comboStage = 2
        elseif random <= f82_local7 + f82_local8 then
            comboStage = 3
        elseif random <= f82_local7 + f82_local8 + f82_local9 then
            comboStage = 4
        elseif random <= f82_local7 + f82_local8 + f82_local9 + f82_local10 then
            comboStage = 5
        elseif random <= f82_local7 + f82_local8 + f82_local9 + f82_local10 + f82_local11 then
            comboStage = 6
        elseif random <= f82_local7 + f82_local8 + f82_local9 + f82_local10 + f82_local11 + f82_local12 then
            comboStage = 7
        elseif random <= f82_local7 + f82_local8 + f82_local9 + f82_local10 + f82_local11 + f82_local12 + f82_local13 then
            comboStage = 8
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Left_L1, NPC_ATK_Right_L1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, comboStage, 2, 0, 0, -1, -1)
    elseif f82_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_L1Hold, NPC_ATK_Right_L1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f82_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, NPC_ATK_Left_L1Hold, NPC_ATK_Right_L1Hold, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 1, NPC_ATK_Left_L1, NPC_ATK_Right_L1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_L, AI_DIR_TYPE_R, 1, 2, 0, 0, -1, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 9, 2)
    if f82_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act69(ai, goal, paramTbl)
    local f83_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f83_local1 = GetRandomSpellId_ByType(self, ai, goal, 10, f83_local0)
    Common_NPC_AI_GetSpellUseDist(self, ai, goal, f83_local1)
    local successDistance = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local f83_local3 = ai:GetAIUsageParam(0, f83_local1)
    local f83_local4 = GetUsageId_CC(ai, f83_local3)
    local f83_local5 = GetUsageId_X(ai, f83_local3)
    ai:ChangeEquipMagicByMagicParamId(f83_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    if f83_local4 == 1 then
        local random = ai:GetRandam_Int(1, 100)
        local f83_local7 = 20
        local f83_local8 = 30
        local f83_local9 = 30
        local f83_local10 = 20
        local f83_local11 = 0
        local f83_local12 = 0
        local f83_local13 = 0
        local comboStage = 1
        if random <= f83_local7 then
            comboStage = 2
        elseif random <= f83_local7 + f83_local8 then
            comboStage = 3
        elseif random <= f83_local7 + f83_local8 + f83_local9 then
            comboStage = 4
        elseif random <= f83_local7 + f83_local8 + f83_local9 + f83_local10 then
            comboStage = 5
        elseif random <= f83_local7 + f83_local8 + f83_local9 + f83_local10 + f83_local11 then
            comboStage = 6
        elseif random <= f83_local7 + f83_local8 + f83_local9 + f83_local10 + f83_local11 + f83_local12 then
            comboStage = 7
        elseif random <= f83_local7 + f83_local8 + f83_local9 + f83_local10 + f83_local11 + f83_local12 + f83_local13 then
            comboStage = 8
        end
        goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, NPC_ATK_Down_L1, -1, TARGET_ENE_0, successDistance, AI_DIR_TYPE_B, -1, comboStage, 2, 0, 0, -1, -1)
    elseif f83_local4 == 2 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 2.2)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    elseif f83_local4 == 3 then
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        local random = ai:GetRandam_Float(1, 4)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_Down_L1Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_Down_L1, TARGET_ENE_0, successDistance, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, 9, 2)
    if f83_local5 == 1 then
        ai:SetTimer(1, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act70(ai, goal, paramTbl)
    local f84_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f84_local1 = GetRandomSpellId_ByType(self, ai, goal, 20, f84_local0)
    ai:ChangeEquipMagicByMagicParamId(f84_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L1, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    
end

function GeneralNPC_Act71(ai, goal, paramTbl)
    local f85_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f85_local1 = GetRandomSpellId_ByType(self, ai, goal, 30, f85_local0)
    ai:ChangeEquipMagicByMagicParamId(f85_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L1, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    
end

function GeneralNPC_Act72(ai, goal, paramTbl)
    local f86_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f86_local1 = GetRandomSpellId_ByType(self, ai, goal, 50, f86_local0)
    ai:ChangeEquipMagicByMagicParamId(f86_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L1, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    ai:SetTimer(4, 30)
    
end

function GeneralNPC_Act73(ai, goal, paramTbl)
    local f87_local0 = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local f87_local1 = GetRandomSpellId_ByType(self, ai, goal, 21, RWepId)
    ai:ChangeEquipMagicByMagicParamId(f87_local1)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L1, TARGET_FRI_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    ai:AddNPCActProb(3500)
    
end

function GeneralNPC_Act101(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    if SpaceCheck(ai, goal, 180, 5) == true then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ButtonXmark, TARGET_ENE_0, 999, 0, 0)
    end
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act102(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local f89_local4 = false
    local f89_local5 = ai:GetNPCActProb(9040)
    if random3 <= f89_local5 then
        f89_local4 = true
    end
    local animationId = NPC_ATK_NONE
    local f89_local7 = NPC_ATK_Up_ButtonXmark
    local f89_local8 = NPC_ATK_UpLeft_ButtonXmark
    local f89_local9 = NPC_ATK_UpRight_ButtonXmark
    if f89_local4 == true then
        f89_local7 = NPC_ATK_Up_L2
        f89_local8 = NPC_ATK_UpLeft_L2
        f89_local9 = NPC_ATK_UpRight_L2
    end
    if distance >= 5 and SpaceCheck(ai, goal, 0, 5) == true then
        animationId = f89_local7
    elseif SpaceCheck(ai, goal, -45, 5) == true then
        if SpaceCheck(ai, goal, 45, 5) == true then
            if random <= 50 then
                animationId = f89_local8
            else
                animationId = f89_local9
            end
        else
            animationId = f89_local8
        end
    elseif SpaceCheck(ai, goal, 45, 5) == true then
        animationId = f89_local9
    else
    end
    if animationId ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, animationId, TARGET_ENE_0, 999, 0, 0)
        ai:SetTimer(6, 1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act103(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local f90_local4 = false
    local f90_local5 = ai:GetNPCActProb(9040)
    if random3 <= f90_local5 then
        f90_local4 = true
    end
    local animationId = NPC_ATK_NONE
    local f90_local7 = NPC_ATK_Left_ButtonXmark
    local f90_local8 = NPC_ATK_Right_ButtonXmark
    if f90_local4 == true then
        f90_local7 = NPC_ATK_Left_L2
        f90_local8 = NPC_ATK_Right_L2
    end
    if SpaceCheck(ai, goal, -90, 5) == true then
        if SpaceCheck(ai, goal, 90, 5) == true then
            if random <= 50 then
                animationId = f90_local7
            else
                animationId = f90_local8
            end
        else
            animationId = f90_local7
        end
    elseif SpaceCheck(ai, goal, 90, 5) == true then
        animationId = f90_local8
    elseif ai:GetStringIndexedNumber("IsUnreachMode") == 1 then
        if random <= 50 then
            animationId = f90_local7
        else
            animationId = f90_local8
        end
    end
    if animationId ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, animationId, TARGET_ENE_0, 999, 0, 0)
        ai:SetTimer(6, 1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act104(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local f91_local4 = false
    local f91_local5 = ai:GetNPCActProb(9040)
    if random3 <= f91_local5 then
        f91_local4 = true
    end
    local animationId = NPC_ATK_NONE
    local f91_local7 = NPC_ATK_Down_ButtonXmark
    local f91_local8 = NPC_ATK_DownLeft_ButtonXmark
    local f91_local9 = NPC_ATK_DownRight_ButtonXmark
    if f91_local4 == true then
        f91_local7 = NPC_ATK_Down_L2
        f91_local8 = NPC_ATK_DownLeft_L2
        f91_local9 = NPC_ATK_DownRight_L2
    end
    if distance <= 1 and SpaceCheck(ai, goal, 180, 5) == true then
        animationId = f91_local7
    elseif SpaceCheck(ai, goal, -135, 5) == true then
        if SpaceCheck(ai, goal, 135, 5) == true then
            if random <= 50 then
                animationId = f91_local8
            else
                animationId = f91_local9
            end
        else
            animationId = f91_local8
        end
    elseif SpaceCheck(ai, goal, 135, 5) == true then
        animationId = f91_local9
    else
    end
    if animationId ~= NPC_ATK_NONE or ai:GetStringIndexedNumber("IsUnreachMode") == 1 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, animationId, TARGET_ENE_0, 999, 0, 0)
        ai:SetTimer(6, 1)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act105(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local life = 1
    local f92_local3 = ai:GetNPCActProb(9020)
    local f92_local4 = false
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f92_local4 = true
    end
    if f92_local4 == false then
        ai:AddNPCActProb(9000)
        f92_local3 = ai:GetNPCActProb(9020)
    end
    local isRight = 0
    if SpaceCheck(ai, goal, -90, 1) == true then
        if SpaceCheck(ai, goal, 90, 1) == true then
            if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
                isRight = 0
            else
                isRight = 1
            end
        else
            isRight = 0
        end
    elseif SpaceCheck(ai, goal, 90, 1) == true then
        isRight = 1
    else
        GetWellSpace_Odds = 100
        return GetWellSpace_Odds
    end
    local guardStateId = -1
    if random <= f92_local3 then
        guardStateId = NPC_ATK_L1
    end
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, life, TARGET_ENE_0, isRight, ai:GetRandam_Int(75, 90), true, true, guardStateId)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act106(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local life = 1.8
    local stopDistance = 7
    local f93_local4 = ai:GetNPCActProb(9020)
    local f93_local5 = false
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f93_local5 = true
    end
    if f93_local5 == false then
        ai:AddNPCActProb(9000)
        f93_local4 = ai:GetNPCActProb(9020)
    end
    local guardStateId = -1
    if random <= f93_local4 then
        guardStateId = NPC_ATK_L1
    end
    if stopDistance <= ai:GetDist(TARGET_ENE_0) and guardStateId == NPC_ATK_L1 then
        goal:AddSubGoal(GOAL_COMMON_Guard, life, guardStateId, TARGET_ENE_0, true, true)
    else
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, life, TARGET_ENE_0, stopDistance, TARGET_ENE_0, true, guardStateId)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act107(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local f94_local2 = 2
    local f94_local3 = ai:GetNPCActProb(9020)
    local f94_local4 = false
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f94_local4 = true
    end
    if f94_local4 == false then
        ai:AddNPCActProb(9000)
        f94_local3 = ai:GetNPCActProb(9020)
    end
    local f94_local5 = -1
    if random <= f94_local3 then
        f94_local5 = NPC_ATK_L1
    end
    local f94_local6 = f94_local2
    goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, f94_local6, TARGET_SELF, f94_local5)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act108(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Guard, 3, NPC_ATK_L1Hold, TARGET_ENE_0, GUARD_GOAL_DESIRE_RET_Continue, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act109(ai, goal, paramTbl)
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0, 0, 0, 0)
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    ai:SetTimer(5, 7)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act110(ai, goal, paramTbl)
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, AttDist, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, AttDist, 0, 0)
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, AttDist, 0, 0)
    end
    ai:SetTimer(5, 7)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act111(ai, goal, paramTbl)
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, AttDist, 0, 0)
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, AttDist, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0, 0, 0, 0)
    end
    ai:SetTimer(5, 7)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act112(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local f99_local3 = ai:GetNPCActProb(9020)
    local f99_local4 = false
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
    elseif ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f99_local4 = true
    end
    if f99_local4 == false then
        ai:AddNPCActProb(9000)
        f99_local3 = ai:GetNPCActProb(9020)
    end
    local guardStateId = -1
    local stopDistance = 15
    local f99_local7 = 50
    local life = 3
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        RunRate = 100
        ForceWalkDist = 0
        ForceRunDist = 0.1
    end
    if random <= f99_local3 then
        guardStateId = NPC_ATK_L1
    end
    if random2 <= f99_local7 then
        isWalk = true
    end
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, life, TARGET_ENE_0, stopDistance, TARGET_SELF, isWalk, guardStateId)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act120(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local successDistance = ai:GetStringIndexedNumber("R_Dist_OneHandR1_First")
    local f100_local4 = ai:GetStringIndexedNumber("R_ComboNum_R1")
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    else
    end
    local f100_local5 = 100
    local f100_local6 = successDistance
    local f100_local7 = successDistance + 2
    local f100_local8 = successDistance + 2
    local f100_local9 = 50
    local f100_local10 = 1.8
    local f100_local11 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f100_local9 = 100
        f100_local7 = 0
        f100_local8 = 0.1
    end
    local f100_local12 = ai:GetNPCActProb(9020)
    local f100_local13 = false
    if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f100_local13 = true
    else
        f100_local13 = false
    end
    if f100_local13 == false then
        ai:AddNPCActProb(9000)
        f100_local12 = ai:GetNPCActProb(9020)
    end
    NPC_Approach_Act_Flex(ai, goal, f100_local6, f100_local7, f100_local8, f100_local9, f100_local12, f100_local10, f100_local11)
    if f100_local4 >= 6 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
    elseif f100_local4 == 5 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
    elseif f100_local4 == 4 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
    elseif f100_local4 == 3 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
    elseif f100_local4 == 2 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_L1Hold_R1, TARGET_ENE_0, successDistance, 0, 0)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act121(ai, goal, paramTbl)
    local distance = ai:GetDist(TARGET_ENE_0)
    local successDistance = ai:GetStringIndexedNumber("R_Dist_OneHandR1_First")
    local f101_local2 = 3
    local animationId = NPC_ATK_L1Hold_R1
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        successDistance = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_First")
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        successDistance = ai:GetStringIndexedNumber("L_Dist_TwoHandR1_First")
    end
    if ai:HasSpecialEffectId(TARGET_SELF, 5215500) then
        Life = 2
        NPC_ATK_L1Hold_R1 = NPC_ATK_L2
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, Life, animationId, TARGET_ENE_0, successDistance, 0, 0, 0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act150(ai, goal, paramTbl)
    local f102_local0 = GetRandomItemId_ByType(self, ai, goal, 20)
    ChangeEquipItem_ById(self, ai, goal, f102_local0)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ButtonSquare, TARGET_ENE_0, 999, 0, 0)
    local f102_local1 = ai:GetAIUsageParam(1, f102_local0)
    local f102_local2 = GetUsageId_X(ai, f102_local1)
    if f102_local2 == 2 then
        ai:SetTimer(2, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act151(ai, goal, paramTbl)
    local f103_local0 = GetRandomItemId_ByType(self, ai, goal, 30)
    ChangeEquipItem_ById(self, ai, goal, f103_local0)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ButtonSquare, TARGET_ENE_0, 999, 0, 0)
    local f103_local1 = ai:GetAIUsageParam(1, f103_local0)
    local f103_local2 = GetUsageId_X(ai, f103_local1)
    if f103_local2 == 2 then
        ai:SetTimer(2, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act152(ai, goal, paramTbl)
    local f104_local0 = GetRandomItemId_ByType(self, ai, goal, 31)
    ChangeEquipItem_ById(self, ai, goal, f104_local0)
    local random = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local distance = ai:GetDist(TARGET_ENE_0)
    local successDistance = 0
    local successDistance2 = 0
    local f104_local7 = ai:GetNPCActProb(9020)
    local f104_local8 = ai:GetNPCActProb(9000)
    local f104_local9 = 50
    local f104_local10 = ai:GetStringIndexedNumber("R_ComboNum_R1")
    local f104_local11 = false
    local f104_local12 = false
    local f104_local13 = false
    if random <= f104_local8 then
        f104_local12 = true
    else
        f104_local12 = false
    end
    if ai:GetWeaponBothHandState(TARGET_SELF) == ARM_R then
        if f104_local12 == true then
            f104_local13 = true
        elseif distance >= 1 then
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f104_local13 = false
        else
            f104_local13 = true
        end
    elseif ai:GetWeaponBothHandState(TARGET_SELF) == ARM_L then
        if f104_local12 == true then
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            if distance >= 1 then
                goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
                f104_local13 = true
            else
                f104_local13 = false
            end
        else
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f104_local13 = false
        end
    elseif f104_local12 == true then
        if distance >= 1 then
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            f104_local13 = true
        else
            f104_local13 = false
        end
    else
        f104_local13 = false
    end
    if f104_local13 == true then
        successDistance = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_First")
        successDistance2 = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_Second")
        f104_local11 = false
    else
        successDistance = ai:GetStringIndexedNumber("R_Dist_OneHandR1_First")
        successDistance2 = ai:GetStringIndexedNumber("R_Dist_OneHandR1_Second")
        if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
            f104_local11 = true
        else
            f104_local11 = false
        end
    end
    if f104_local11 == false then
        ai:AddNPCActProb(9000)
        f104_local7 = ai:GetNPCActProb(9020)
    end
    local f104_local14 = false
    if random3 <= f104_local7 then
        f104_local14 = true
        f104_local7 = 100
    end
    local f104_local15 = successDistance
    local f104_local16 = successDistance + 2
    local f104_local17 = successDistance + 2
    local f104_local18 = 50
    local f104_local19 = 1.8
    local f104_local20 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f104_local18 = 100
        f104_local16 = 0
        f104_local17 = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, f104_local15, f104_local16, f104_local17, f104_local18, f104_local7, f104_local19, f104_local20)
    if successDistance <= distance and random2 <= f104_local9 and f104_local14 == true then
        if ai:IsInsideTargetCustom(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_L, 180, 180, 10) == true then
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, 1, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
        else
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, 0, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
        end
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ButtonSquare, TARGET_ENE_0, 999, 0, 0)
    if f104_local10 >= 6 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f104_local10 == 5 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f104_local10 == 4 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f104_local10 == 3 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
    elseif f104_local10 == 2 then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance2, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, successDistance, 0, 0)
    end
    local f104_local21 = ai:GetAIUsageParam(1, f104_local0)
    local f104_local22 = GetUsageId_X(ai, f104_local21)
    if f104_local22 == 2 then
        ai:SetTimer(2, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act153(ai, goal, paramTbl)
    local f105_local0 = GetRandomItemId_ByType(self, ai, goal, 10)
    ChangeEquipItem_ById(self, ai, goal, f105_local0)
    local f105_local1 = 10
    Common_NPC_AI_GetItemUseDist(self, ai, goal, f105_local0, f105_local1)
    f105_local1 = ai:GetStringIndexedNumber("Item_ApproachDist")
    local f105_local2 = 100
    local f105_local3 = f105_local1
    local f105_local4 = f105_local1 + 2
    local f105_local5 = f105_local1 + 2
    local f105_local6 = 50
    local f105_local7 = 1.8
    local f105_local8 = 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        f105_local6 = 100
        f105_local4 = 0
        f105_local5 = 0.1
    end
    local f105_local9 = ai:GetNPCActProb(9020)
    local f105_local10 = false
    if ai:GetStringIndexedNumber("L_WeaponType") == 10 then
        f105_local10 = true
    else
        f105_local10 = false
    end
    if f105_local10 == false then
        ai:AddNPCActProb(9000)
        f105_local9 = ai:GetNPCActProb(9020)
    end
    if ai:GetStringIndexedNumber("IsUnreachMode") == 0 then
        NPC_Approach_Act_Flex(ai, goal, f105_local3, f105_local4, f105_local5, f105_local6, f105_local9, f105_local7, f105_local8)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ButtonSquare, TARGET_ENE_0, 999, 0, 0)
    local f105_local11 = ai:GetAIUsageParam(1, f105_local0)
    local f105_local12 = GetUsageId_X(ai, f105_local11)
    if f105_local12 == 2 then
        ai:SetTimer(2, 10)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act154(ai, goal, paramTbl)
    local f106_local0 = GetRandomItemId_ByType(self, ai, goal, 50)
    ChangeEquipItem_ById(self, ai, goal, f106_local0)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018026) then
        goal:AddSubGoal(GOAL_COMMON_DashTarget, 5, TARGET_ENE_0, 2.3, TARGET_SELF, -1)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ButtonSquare, TARGET_ENE_0, 999, 0, 0)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018026) == false then
        ai:SetTimer(4, 30)
        local f106_local1 = ai:GetAIUsageParam(1, f106_local0)
        local f106_local2 = GetUsageId_X(ai, f106_local1)
        if f106_local2 == 2 then
            ai:SetTimer(2, 10)
        end
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    end
    
end

function GeneralNPC_Act200(ai, goal, paramTbl)
    local f107_local0 = ChangeBothHand_ForArts(self, ai, goal, 12)
    local f107_local1 = 0
    if f107_local0 == ARM_R then
        f107_local1 = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_First")
    elseif f107_local0 == ARM_L then
        f107_local1 = ai:GetStringIndexedNumber("L_Dist_TwoHandR1_First")
    end
    local f107_local2 = ai:GetArtsID(f107_local0)
    Common_NPC_AI_GetArtsUseDist(self, ai, goal, f107_local2, f107_local1)
    if f107_local0 ~= -1 then
        ArtsAction_ByCC(self, ai, goal, f107_local0, ai:GetStringIndexedNumber("Arts_ApproachDist"))
        ai:SetTimer(3, 3)
    end
    
end

function GeneralNPC_Act210(ai, goal, paramTbl)
    local f108_local0 = ChangeBothHand_ForArts(self, ai, goal, 11)
    local f108_local1 = 5
    local f108_local2 = ai:GetArtsID(f108_local0)
    Common_NPC_AI_GetArtsUseDist(self, ai, goal, f108_local2, f108_local1)
    if f108_local0 ~= -1 then
        ArtsAction_ByCC(self, ai, goal, f108_local0, ai:GetStringIndexedNumber("Arts_ApproachDist"))
        ai:SetTimer(3, 3)
    end
    
end

function GeneralNPC_Act220(ai, goal, paramTbl)
    local f109_local0 = ChangeBothHand_ForArts(self, ai, goal, 10)
    local f109_local1 = 12
    local f109_local2 = ai:GetArtsID(f109_local0)
    Common_NPC_AI_GetArtsUseDist(self, ai, goal, f109_local2, f109_local1)
    if f109_local0 ~= -1 then
        ArtsAction_ByCC(self, ai, goal, f109_local0, ai:GetStringIndexedNumber("Arts_ApproachDist"))
        ai:SetTimer(3, 3)
    end
    
end

function GeneralNPC_Act230(ai, goal, paramTbl)
    local f110_local0 = ChangeBothHand_ForArts(self, ai, goal, 20)
    if f110_local0 ~= -1 then
        ArtsAction_ByCC(self, ai, goal, f110_local0, 999)
        ai:SetTimer(3, 3)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function GeneralNPC_Act231(ai, goal, paramTbl)
    local f111_local0 = ChangeBothHand_ForArts(self, ai, goal, 30)
    if f111_local0 ~= -1 then
        ArtsAction_ByCC(self, ai, goal, f111_local0, 999)
        ai:SetTimer(3, 3)
    end
    
end

function GeneralNPC_Act232(ai, goal, paramTbl)
    local f112_local0 = ChangeBothHand_ForArts(self, ai, goal, 50)
    if f112_local0 ~= -1 then
        ArtsAction_ByCC(self, ai, goal, f112_local0, 999)
        ai:SetTimer(4, 30)
        ai:SetTimer(3, 3)
    end
    
end

function GeneralNPC_Act_onNoSubGoal(f113_arg0, f113_arg1, f113_arg2)
    if f113_arg0:GetWeightType(TARGET_SELF) == AI_TARGET_WEIGHT_TYPE_WeightOver or f113_arg0:GetSp(TARGET_SELF) < 0 then
        local orientationFromTarget = AI_DIR_TYPE_ToR
        if f113_arg0:GetRandam_Int(0, 1) == 1 then
            orientationFromTarget = AI_DIR_TYPE_ToL
        end
        f113_arg1:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 2, TARGET_ENE_0, 0.5, TARGET_SELF, false, -1, orientationFromTarget, 2)
    else
        local animationId = NPC_ATK_UpRight_ButtonXmark
        if f113_arg0:GetRandam_Int(0, 1) == 1 then
            animationId = NPC_ATK_UpLeft_ButtonXmark
        end
        f113_arg1:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 999, 0, 0)
    end
    
end

function GeneralNPC_AdjustSpace(f114_arg0, f114_arg1, f114_arg2)
    
end


