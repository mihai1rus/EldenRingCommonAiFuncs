RegisterTableGoal(GOAL_CommonNPCTest29999_Battle, "CommonNPCTest29999_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_CommonNPCTest29999_Battle, true)

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
end

Goal.Activate = function(self, ai, goal)
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
    if ExecFirstAction(self, ai, goal)  == 1 then 
        return 
    end
    local actNums = {
        1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 21, 22, 23, 
        24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 35, 36,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52,
        61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 
        73, 101, 102, 103, 104, 105, 106, 107, 108, 109, 
        110, 111, 112, 120, 121, 150, 151, 152, 153, 154,
        200, 210, 220, 230, 231, 232,
    }
    
    local acts = {}
    for _, n in ipairs(actNums) do
        acts[n] = REGIST_FUNC(ai, goal, _G["GeneralNPC_Act" .. n])
    end
    Common_NPC_AI(self, ai, goal)
    local probabilities = MakeNPCProbArr(self, ai, goal, 1)
    local actAfter = REGIST_FUNC(ai, goal, GeneralNPC_AdjustSpace)
    Common_Battle_Activate_ForCommonNPC(ai, goal, probabilities, acts, actAfter)
    if goal:GetSubGoalNum() <= 0 then
        GeneralNPC_Act_onNoSubGoal(ai, goal)
    end
end

Goal.Update = function(self, ai, goal)
    if ai:GetStringIndexedNumber("IsExistSpAtPlanning") == 1 and ai:GetSp(TARGET_SELF) <= 0 then
        ai:SetStringIndexedNumber("IsExistSpAtPlanning", 0)
        goal:ClearSubGoal()
        ai:Replaning()
    end
    if goal:IsFinishTimer(0)
        and ai:GetBehaviorStateId(PLAN_IDX_AINOTE_STATETYPE) == PLAN_STATETYPE_CHARGEMAGIC then
        goal:ClearSubGoal()
        goal:AddSubGoal(GOAL_COMMON_Wait, 1, TARGET_ENE_0)
    end
    return Update_Default_NoSubGoal(self, ai, goal)
end

Goal.Terminate = function (self, ai, goal)   
end

Goal.Interrupt = function(self, ai, goal)
    local probabilities = {}
    if ai:IsLadderAct(TARGET_SELF) then 
        return false 
    end

    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect)
            and ai:GetSpecialEffectActivateInterruptId(5635) then
        ai:DeleteObserveSpecialEffectAttribute(TARGET_SELF, 5635)
        goal:ClearSubGoal()
        local animationId = NPC_ATK_R2
        local weight = ai:GetNPCActProb(9030)
        local random = ai:GetRandam_Int(1, 100)
        if ai:GetWeaponBothHandState(TARGET_SELF) == -1
                and GetDualAttackType(ai, goal) == 1
                and weight >= random then
            animationId = NPC_ATK_L1
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animationId, TARGET_ENE_0, 4, 0, 0)
        return true
    end

    if ai:IsInterupt(INTERUPT_Damaged) then
        Common_NPC_AI(self, ai, goal)
        probabilities = MakeNPCProbArr(self, ai, goal, 2)
        local random = ai:GetRandam_Int(1, 100)
        local total = 0
        local function check(act)
            total = total + (probabilities[act] or 0)
            return random <= total
        end
        if check(1201) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act01(ai, goal); 
            return true
        elseif check(1202) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act101(ai, goal); 
            return true
        elseif check(1203) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act102(ai, goal); 
            return true
        elseif check(1204) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act103(ai, goal); 
            return true
        elseif check(1205) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act104(ai, goal); 
            return true
        elseif check(1206) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 2, TARGET_ENE_0, 1, TARGET_SELF, false, NPC_ATK_L1)
            return true
        elseif check(1207) then
            goal:ClearSubGoal()
            local dir = ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) and 0 or 1
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, dir, ai:GetRandam_Int(75, 90), true, false, NPC_ATK_L1)
            return true
        elseif check(1208) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 1, TARGET_ENE_0, 3, TARGET_ENE_0, true, NPC_ATK_L1)
            return true
        end
    end

    if ai:IsInterupt(INTERUPT_Shoot) then
        Common_NPC_AI(self, ai, goal)
        probabilities = MakeNPCProbArr(self, ai, goal, 3)
        local random = ai:GetRandam_Int(1, 100)
        local total = 0
        local function check(act)
            total = total + (probabilities[act] or 0); 
            return random <= total
        end
        if check(1301) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act102(ai, goal); 
            return true
        elseif check(1302) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act103(ai, goal); 
            return true
        elseif check(1303) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act104(ai, goal); 
            return true
        elseif check(1304) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, 1, TARGET_SELF, false, NPC_ATK_L1)
            return true
        elseif check(1305) then
            goal:ClearSubGoal()
            local dir = ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) and 0 or 1
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, dir, ai:GetRandam_Int(75, 90), true, false, NPC_ATK_L1)
            return true
        elseif check(1306) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, 1, TARGET_SELF, false, NPC_ATK_L1)
            return true
        end
    end

    if ai:IsInterupt(INTERUPT_FindAttack) then
        Common_NPC_AI(self, ai, goal)
        probabilities = MakeNPCProbArr(self, ai, goal, 4)
        local random = ai:GetRandam_Int(1, 100)
        local total = 0
        local function check(act)
            total = total + (probabilities[act] or 0); return random <= total
        end
        if check(1401) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act101(ai, goal); 
            return true
        elseif check(1402) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act102(ai, goal); 
            return true
        elseif check(1403) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act103(ai, goal); 
            return true
        elseif check(1404) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act104(ai, goal); 
            return true
        elseif check(1405) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, 1, TARGET_SELF, false, NPC_ATK_L1)
            return true
        elseif check(1406) then
            goal:ClearSubGoal()
            local dir = ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_L, 180) and 0 or 1
            goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1.2, TARGET_ENE_0, dir, ai:GetRandam_Int(75, 90), true, false, NPC_ATK_L1)
            return true
        elseif check(1407) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_Guard, 1.2, NPC_ATK_L1, TARGET_ENE_0, GUARD_GOAL_DESIRE_RET_Continue, true)
            return true
        elseif check(1408) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act120(ai, goal)
        elseif check(1409) then
            goal:ClearSubGoal()
            ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 5635)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L2, TARGET_ENE_0, 999, 0, 0)
        end
    end

    if ai:IsInterupt(INTERUPT_TargetOutOfRange) and ai:IsTargetOutOfRangeInterruptSlot(0) then
        Common_NPC_AI(self, ai, goal)
        probabilities = MakeNPCProbArr(self, ai, goal, 5)
        local random = ai:GetRandam_Int(1, 100)
        local total = 0
        local function check(act)
            total = total + (probabilities[act] or 0); 
            return random <= total
        end
        if check(1501) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act105(ai, goal); 
            return true
        elseif check(1502) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act103(ai, goal); 
            return true
        end
    end

    if ai:IsInterupt(INTERUPT_SuccessGuard) then
        Common_NPC_AI(self, ai, goal)
        probabilities = MakeNPCProbArr(self, ai, goal, 6)
        local random = ai:GetRandam_Int(1, 100)
        local total = 0
        local function check(act)
            total = total + (probabilities[act] or 0); 
            return random <= total
        end
        if check(1601) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act101(ai, goal); 
            return true
        elseif check(1602) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act121(ai, goal); 
            return true
        end
    end

    if ai:IsInterupt(INTERUPT_SuccessParry) then
        Common_NPC_AI(self, ai, goal)
        probabilities = MakeNPCProbArr(self, ai, goal, 7)
        if ai:GetRandam_Int(1, 100) <= (probabilities[1701] or 0) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, -1, TARGET_SELF, false, 0):SetLifeEndSuccess(true)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, 999, 0, -1)
            return true
        end
    end

    if ai:IsInterupt(INTERUPT_GuardBreak) then
        Common_NPC_AI(self, ai, goal)
        probabilities = MakeNPCProbArr(self, ai, goal, 8)
        local random = ai:GetRandam_Int(1, 100)
        local total = 0
        local function check(act)
            total = total + (probabilities[act] or 0); 
            return random <= total
        end
        if check(1801) then
            goal:ClearSubGoal()
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 1, TARGET_ENE_0, -1, TARGET_SELF, false, 0):SetLifeEndSuccess(true)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, 999, 0, -1)
            return true
        elseif check(1802) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act03(ai, goal); 
            return true
        elseif check(1803) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act21(ai, goal); 
            return true
        end
    end

    if ai:IsInterupt(INTERUPT_UseItem) then
        Common_NPC_AI(self, ai, goal)
        probabilities = MakeNPCProbArr(self, ai, goal, 9)
        local random = ai:GetRandam_Int(1, 100)
        local total = 0
        local function check(act)
            total = total + (probabilities[act] or 0); 
            return random <= total
        end
        if check(1901) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act03(ai, goal); 
            return true
        elseif check(1902) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act153(); 
            return true
        end
    end

    if ai:IsInterupt(INTERUPT_ParryTiming) then
        Common_NPC_AI(self, ai, goal)
        probabilities = MakeNPCProbArr(self, ai, goal, 10)
        local random = ai:GetRandam_Int(1, 100)
        local total = 0
        local function check(act)
            total = total + (probabilities[act] or 0); 
            return random <= total
        end
        if check(2001) then
            if CanExecArts_Immediately(self, ai, goal, 42) == 1 then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.2, NPC_ATK_L2, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        elseif check(2002) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act102(ai, goal); 
            return true
        elseif check(2003) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act103(ai, goal); 
            return true
        elseif check(2004) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act104(ai, goal); 
            return true
        elseif check(2005) then
            goal:ClearSubGoal(); 
            GeneralNPC_Act07(ai, goal); 
            return true
        elseif check(2006) then
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

function Common_NPC_AI(self, ai, goal)
    ai:ResetNPCActProb()

    Common_NPC_AI_GetWeponParam(self, ai, goal, ARM_R)
    Common_NPC_AI_GetWeponParam(self, ai, goal, ARM_L)

    local rType = ai:GetStringIndexedNumber("R_WeaponType")
    local lType = ai:GetStringIndexedNumber("L_WeaponType")
    local dist = ai:GetDist(TARGET_ENE_0)

    if rType == 12 and lType ~= 10 then 
        rType = 11 
    end

    local distModifier = 0
    if dist > 7 then 
        distModifier = 4
    elseif dist > 5 then 
        distModifier = 3
    elseif dist > 3 then 
        distModifier = 2
    elseif dist > 1 then 
        distModifier = 1
    end

    local rBase = 0
    -- Dagger
    if rType == 1  then 
        rBase = 10
    -- ???
    elseif rType == 2 then 
        rBase = 20
    -- Curved Greatsword
    elseif rType == 11 then 
        rBase = 30
    -- ???
    elseif rType == 12 then 
        rBase = 40
    -- Katana
    elseif rType == 13 then 
        rBase = 50
    -- ???
    elseif rType == 30 then
        local mt = CheckMagicType(self, ai, goal)
        if mt == 1 then 
            rBase = 100
        elseif mt == 2 then 
            rBase = 110
        else                
            rBase = 120 
        end
    -- ???
    elseif rType == 20 then 
        rBase = 200
    end
    if rBase > 0 then 
        ai:AddNPCActProb(rBase + distModifier) 
    end

    local lBase = 0
    -- Dagger
    if lType == 1 then 
        lBase = 500
    -- ???
    elseif lType == 2 then 
        lBase = 510
    -- ???
    elseif lType == 20 then 
        lBase = 600
    -- ???
    elseif lType == 30 then 
        lBase = 700
    -- ??? or Curved Greatsword
    elseif lType == 10 or lType == 11 then 
        lBase = 800
    end
    if lBase > 0 then 
        ai:AddNPCActProb(lBase + distModifier) 
    end

    local rWepId = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local lWepId = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local rBehav = ai:GetWeaponBehaviorVarID(rWepId)
    local lBehav = ai:GetWeaponBehaviorVarID(lWepId)

    -- Right Weapon is Spear/Great Spear/Halberd or Shield
    if (rBehav >= 1600 and rBehav <= 1899) or (rBehav >= 3000 and rBehav <= 3299) then
        ai:AddNPCActProb(1000 + distModifier)
    end
    -- Right Weapon is Hammer/Great Hammer
    if rBehav >= 1200 and rBehav <= 1299 then
        ai:AddNPCActProb(1010 + distModifier)
    end

    local rArts = GetCondNum_ForArts(ai, ARM_R)
    local lArts = GetCondNum_ForArts(ai, ARM_L)
    if rArts > 0 then 
        ai:AddNPCActProb(rArts + distModifier) 
    end
    if lArts > 0 and lArts ~= rArts then 
        ai:AddNPCActProb(lArts + distModifier) 
    end

    -- Target Guarding
    if ai:IsTargetGuard(TARGET_ENE_0) then 
        ai:AddNPCActProb(3000) 
    end

    -- Target Sleeping
    if ai:HasSpecialEffectId(TARGET_ENE_0, PLAN_SP_EFFECT_ANIME_SLEEPING) then
        ai:AddNPCActProb(3100)
    end

    -- (Deprecated) Ally Above 50% HP or Ally Very Far
    if not ai:IsInsideTargetCustom(TARGET_SELF, TARGET_FRI_0, AI_DIR_TYPE_F, 360, 180, 45)
        or ai:GetHpRate(TARGET_FRI_0) >= 0.5 then
        ai:AddNPCActProb(3500)
    end

    local wt = ai:GetWeightType(TARGET_SELF)
    if wt == AI_TARGET_WEIGHT_TYPE_WeightOver then 
        ai:AddNPCActProb(4000)
    elseif wt == AI_TARGET_WEIGHT_TYPE_Heavy then 
        ai:AddNPCActProb(4010)
    elseif wt == AI_TARGET_WEIGHT_TYPE_Normal then 
        ai:AddNPCActProb(4020)
    elseif wt == AI_TARGET_WEIGHT_TYPE_Light then 
        ai:AddNPCActProb(4030)
    end

    if ai:GetHpRate(TARGET_SELF) >= 0.5 then 
        ai:AddNPCActProb(4100) 
    end

    -- No Stamina
    if ai:GetSp(TARGET_SELF) <= 1 then
        ai:AddNPCActProb(4200)
        ai:SetStringIndexedNumber("IsExistSpAtPlanning", 0)
    else
        ai:SetStringIndexedNumber("IsExistSpAtPlanning", 1)
    end

    -- 12 = Close Range, 11 = Medium Range, 10 = Far Range, 20 = Healing, 21 = Heal From Afar, 30 = Buffs, 50 = Deprecated
    local spellTypes = {12, 11, 10, 20, 21, 30, 50}
    local spellBases = {6000, 6010, 6020, 6030, 6031, 6040, 6050}
    for i, st in ipairs(spellTypes) do
        if not HasSpelltypeX(self, ai, goal, st) then
            ai:AddNPCActProb(spellBases[i])
        end
    end

    local canUseR14 = true
    local canUseL15 = true
    local rSpellBases = {6400, 6410, 6420, 6430, 6431, 6440, 6450}
    local lSpellBases = {6600, 6610, 6620, 6630, 6631, 6640, 6650}
    for i, st in ipairs(spellTypes) do
        if not HasSpelltypeX_CanUse(self, ai, goal, st, rWepId) then
            ai:AddNPCActProb(rSpellBases[i])
        elseif st == 12 or st == 11 or st == 10 then
            canUseR14 = false
        end
        if not HasSpelltypeX_CanUse(self, ai, goal, st, lWepId) then
            ai:AddNPCActProb(lSpellBases[i])
        elseif st == 12 or st == 11 or st == 10 then
            canUseL15 = false
        end
    end

    -- Deprecated
    if rType == 30 and canUseR14 then 
        ai:AddNPCActProb(6800) 
    end

    local toEne = ai:GetToTargetAngle(TARGET_ENE_0)
    local checkR = 1
    local meshL = ai:GetExistMeshOnLineDistSpecifyAngle(TARGET_SELF, toEne + 90, checkR, AI_SPA_DIR_TYPE_TargetF)
    local meshR = ai:GetExistMeshOnLineDistSpecifyAngle(TARGET_SELF, toEne - 90, checkR, AI_SPA_DIR_TYPE_TargetF)
    local meshB = ai:GetExistMeshOnLineDistSpecifyAngle(TARGET_SELF, toEne - 180, checkR, AI_SPA_DIR_TYPE_TargetF)
    -- If Better to Go Sideways
    if meshB < checkR then 
        ai:AddNPCActProb(7000) 
    end
    -- If Better to Go Backwards
    if meshL < checkR and meshR < checkR then 
        ai:AddNPCActProb(7010) 
    end

    -- If Can't Reach
    if ai:GetStringIndexedNumber("IsUnreachMode") == 1 then
        if ai:IsFinishTimer(10) then
            ai:SetTimer(10, 1)
            if ai:CheckDoesExistPath(TARGET_ENE_0, AI_DIR_TYPE_CENTER, 0) then
                ai:SetStringIndexedNumber("IsUnreachMode", 0)
            else
                ai:AddNPCActProb(7800)
            end
        else
            ai:AddNPCActProb(7800)
        end
    end

    -- 10 = Throwables, 20 = Flasks, 30 = Buff, 31 = Greases, 50 = Lamenter Mask
    local itemTypes = {10, 20, 30, 31, 50}
    local itemBases = {8000, 8010, 8020, 8030, 8040}
    for i, it in ipairs(itemTypes) do
        if not HasItemtypeX_CanUse(self, ai, goal, it) then
            ai:AddNPCActProb(itemBases[i])
        end
    end

    local arrowId0 = ai:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Arrow, 0)
    local arrowId1 = ai:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Arrow, 1)
    local boltId0 = ai:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Bolt,  0)
    local boltId1 = ai:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Bolt,  1)
    local arrowB0 = ai:GetWeaponBehaviorVarID(arrowId0)
    local arrowB1 = ai:GetWeaponBehaviorVarID(arrowId1)
    local boltB0 = ai:GetWeaponBehaviorVarID(boltId0)
    local boltB1 = ai:GetWeaponBehaviorVarID(boltId1)
    local bowR = GetBowType(rBehav)
    local bowL = GetBowType(lBehav)
    local arrowT0 = GetArrowType(arrowB0)
    local arrowT1 = GetArrowType(arrowB1)
    local boltT0 = GetBoltType(boltB0)
    local boltT1 = GetBoltType(boltB1)

    -- 40 = Bow, 42 = Great Bow, 43 = Crossbow, 44 = Ballista
    -- 50 = Arrow, 51 = Great Arrow, 52 = Bolt, 53 = Ballista Bolt
    local BOW_AMMO = { [40]=50, [42]=51, [43]=52, [44]=53 }

    local rNoAmmo = false
    local lNoAmmo = false
    checkAmmo(ai, bowR, false)
    checkAmmo(ai, bowL, true)

    local bhState = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhState == ARM_R 
            or bhState == ARM_L
            or ai:GetStringIndexedNumber("L_WeaponType") ~= 10 then
        ai:AddNPCActProb(9000)
    end

    -- 40 = Quickstep/Bloodhound Step, 41 = Vow of the Indomitable
    if CanExecArts_Immediately(self, ai, goal, 40) == 0
            and CanExecArts_Immediately(self, ai, goal, 41) == 0 then
        ai:AddNPCActProb(9005)
    end

    if ai:GetTimer(5) > 0 then 
        ai:AddNPCActProb(9010) 
    end

    if bhState == ARM_R then 
        ai:AddNPCActProb(9020)
    elseif bhState == ARM_L then 
        ai:AddNPCActProb(9021)
    else                         
        ai:AddNPCActProb(9022)
    end

    if GetDualAttackType(ai, goal) >= 0 then 
        ai:AddNPCActProb(9100) 
    end

    -- If No Skill
    if GetArtsUsageParam(ai, ARM_L) == 90000000 then 
        ai:AddNPCActProb(9120) 
    end

    local timerFlags = {3, 4, 6, 7, 8, 9}
    local timerBases = {9503, 9504, 9506, 9507, 9508, 9509}
    for i, t in ipairs(timerFlags) do
        if ai:GetTimer(t) > 0 then 
            ai:AddNPCActProb(timerBases[i]) 
        end
    end

    -- Has Just Cast Heal From Afar
    if ai:HasSpecialEffectId(TARGET_SELF, 20018726) then 
        ai:AddNPCActProb(9510)
    end

    -- In a Group
    if ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer) == 1 then
        local role = ai:GetTeamOrder(ORDER_TYPE_Role)
        if role == ROLE_TYPE_Torimaki then 
            ai:AddNPCActProb(9600)
        elseif role == ROLE_TYPE_Kankyaku then 
            ai:AddNPCActProb(9700)
        end
    end

    local SPECIAL_EFFECT_PROB_MAP = {
        [5020] = 15020, [5021] = 15021, [5022] = 15022, [5023] = 15023, [5024] = 15024,
        [18690] = 15030, [18691] = 15031, [18692] = 15032, [18693] = 15033, [18694] = 15034,
        [18695] = 15035, [18650] = 15036, [18651] = 15037, [18652] = 15038, [18653] = 15039,
        [18654] = 15040, [18655] = 15041, [18656] = 15042, [18657] = 15043, [18658] = 15044,
        [18659] = 15045, [18660] = 15046, [18661] = 15047, [18662] = 15048, [18663] = 15049,
        [18664] = 15050, [18665] = 15051, [18666] = 15052, [18667] = 15053, [18668] = 15054,
        [18669] = 15055, [18670] = 15056, [18671] = 15057, [19384] = 15058,
        [20018660] = 15100, [20018661] = 15101, [20018662] = 15102, [20018663] = 15103,
        [20018664] = 15104, [20018665] = 15105, [20018666] = 15106, [20018667] = 15107,
        [20018668] = 15108, [20018672] = 15109, [20018673] = 15110, [20018674] = 15111,
        [20018675] = 15112, [20018676] = 15113, [20018677] = 15114, [20018678] = 15115,
        [20018679] = 15116, [20018680] = 15117, [20018681] = 15119, [20018684] = 15121,
        [20018647] = 15124, [20018689] = 15124, [20018685] = 15122, [20018686] = 15123,
        [20018692] = 15125, [20018693] = 15126, [20018694] = 15127, [20018695] = 15128,
        [20018696] = 15129, [20018697] = 15130, [20018698] = 15131, [20018699] = 15132,
        [20018700] = 15133, [20018701] = 15134, [20018702] = 15135, [20018703] = 15136,
        [20018704] = 15137, [20018705] = 15138, [20018706] = 15139, [20018707] = 15140,
        [20018708] = 15141, [20018709] = 15142, [20018710] = 15143, [20018711] = 15144,
        [20018712] = 15145, [20018713] = 15146, [20018714] = 15147, [20018715] = 15148,
        [20018716] = 15149, [20018717] = 15150, [20018718] = 15151, [20018719] = 15118,
        [20018720] = 15152, [20018721] = 15153, [20018722] = 15154, [20018724] = 15155,
        [20018725] = 15156,
    }

    for sfxId, probIdx in pairs(SPECIAL_EFFECT_PROB_MAP) do
        if ai:HasSpecialEffectId(TARGET_SELF, sfxId) then
            ai:AddNPCActProb(probIdx)
        end
    end

    ai:SetStringIndexedNumber("IsUselessWeapon", 0)
    local rUseless = (rType == 30 and canUseR14) or (rType == 20 and rNoAmmo)
        or (ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R) == 110000)
    local lUseless = (lType == 30 and canUseL15) or (lType == 20 and lNoAmmo)
        or (ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L) == 110000)
    if rUseless and lUseless then
        ai:SetStringIndexedNumber("IsUselessWeapon", 1)
    end
end
