function GeneralNPC_Act01(ai, goal, paramTbl)
    local random1 = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local random4 = ai:GetRandam_Int(1, 100)
    local dist = ai:GetDist(TARGET_ENE_0)
    local dualProb = ai:GetNPCActProb(9030)
    local bhProb = ai:GetNPCActProb(9000)
    local guardProb = ai:GetNPCActProb(9020)
    local animId = NPC_ATK_R1
    local comboNum = ai:GetStringIndexedNumber("R_ComboNum_R1")
    local useTwoHand = false
    local useShield = false

    local useDual = (random4 <= dualProb)
    if useDual then 
        animId = NPC_ATK_L1 
    end

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        if useDual then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        elseif random1 <= bhProb then
            useTwoHand = true
        elseif dist >= 1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        else
            useTwoHand = true
        end

    elseif bhs == ARM_L then
        if useDual then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            if random1 <= bhProb and dist >= 1 then
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
                useTwoHand = true
            end
        end

    else
        if not useDual then
            if random1 <= bhProb and dist >= 1 then
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
                useTwoHand = true
            end
        end
    end

    local stopDist, secondDist
    if useTwoHand then
        stopDist = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_First")
        secondDist = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_Second")
    else
        stopDist = ai:GetStringIndexedNumber("R_Dist_OneHandR1_First")
        secondDist = ai:GetStringIndexedNumber("R_Dist_OneHandR1_Second")
        if ai:GetStringIndexedNumber("L_WeaponType") == 10 then 
            useShield = true 
        end
    end

    if not useShield then
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end

    local doSideStep = (random3 <= guardProb)
    if doSideStep then 
        guardProb = 100 
    end

    local canRunDist = stopDist + 2
    local forceRunMinDist = stopDist + 2
    local runProb = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        runProb = 100
        canRunDist = 0
        forceRunMinDist = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, 1.8, 2)

    if stopDist <= dist and random2 <= 50 and doSideStep then
        local sideDir = ai:IsInsideTargetCustom(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_L, 180, 180, 10) and 1 or 0
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, sideDir, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
    end

    AddComboChain(goal, comboNum, animId, stopDist, secondDist, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act02(ai, goal, paramTbl)
    local random1 = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local dist = ai:GetDist(TARGET_ENE_0)
    local guardProb = ai:GetNPCActProb(9020)
    local timerProb = ai:GetNPCActProb(9010)
    local comboNum = ai:GetStringIndexedNumber("R_ComboNum_R2")
    local useTwoHand = false
    local useShield = false

    local wantTwoHand = (random1 <= timerProb)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)

    if bhs == ARM_R then
        useTwoHand = wantTwoHand or (dist < 1)
        if not useTwoHand and dist >= 1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        end

    elseif bhs == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        if wantTwoHand and dist >= 1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            useTwoHand = true
        end

    else
        if wantTwoHand and dist >= 1 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            useTwoHand = true
        end
    end

    local stopDist, secondDist
    if useTwoHand then
        stopDist  = ai:GetStringIndexedNumber("R_Dist_TwoHandR2_First")
        secondDist = ai:GetStringIndexedNumber("R_Dist_TwoHandR2_Second")
    else
        stopDist  = ai:GetStringIndexedNumber("R_Dist_OneHandR2_First")
        secondDist = ai:GetStringIndexedNumber("R_Dist_OneHandR2_Second")
        if ai:GetStringIndexedNumber("L_WeaponType") == 10 then 
            useShield = true 
        end
    end

    if not useShield then
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end

    local doSideStep = (random3 <= guardProb)
    if doSideStep then 
        guardProb = 100 
    end

    local canRunDist = stopDist + 2
    local forceRunMinDist = stopDist + 2
    local runProb = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        runProb = 100; canRunDist = 0; forceRunMinDist = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, 1.8, 2)

    if stopDist <= dist and random2 <= 50 and doSideStep then
        local sideDir = ai:IsInsideTargetCustom(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_L, 180, 180, 10) and 1 or 0
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, sideDir, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
    end

    local random4 = ai:GetRandam_Int(1, 100)
    if comboNum == 2 then
        local fin = (random4 <= 90) and NPC_ATK_R2 or NPC_ATK_R2Hold
        local fst = (random4 <= 80) and NPC_ATK_R2 or NPC_ATK_R2Hold
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, fst, TARGET_ENE_0, stopDist, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, fin, TARGET_ENE_0, secondDist, 0, 0)
    elseif random4 <= 80 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R2, TARGET_ENE_0, stopDist, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R2Hold, TARGET_ENE_0, stopDist, 0, 0)
    end
    
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act03(ai, goal, paramTbl)
    local random1 = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local random4 = ai:GetRandam_Int(1, 100)
    local stopDist = ai:GetStringIndexedNumber("R_Dist_DashR1")
    local guardProb = ai:GetNPCActProb(9020)
    local dualProb = ai:GetNPCActProb(9030)
    local guardAnim = -1
    local animId = (random3 <= 50) and NPC_ATK_DashR1 or NPC_ATK_DashR2
    local isDual = (random4 <= dualProb)
    if isDual then 
        animId = NPC_ATK_DashL1 
    end
    local useShield = false

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        if isDual then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        end
    elseif bhs == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        if ai:GetStringIndexedNumber("L_WeaponType") == 10 then 
            useShield = true 
        end
    else
        if ai:GetStringIndexedNumber("L_WeaponType") == 10 then 
            useShield = true 
        end
    end

    if not useShield then
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end
    if random1 <= guardProb then 
        guardAnim = NPC_ATK_L1 
    end

    goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, stopDist, TARGET_SELF, guardAnim)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, animId, TARGET_ENE_0, 999, 0, 0)
end

function GeneralNPC_Act04(ai, goal, paramTbl)
    local r1Range = ai:GetStringIndexedNumber("R_Dist_RollingR1")
    local r2Range = ai:GetStringIndexedNumber("R_Dist_RollingR2")
    return StepAttackAction(ai, goal, r1Range, r2Range,
        {NPC_ATK_Up_ButtonXmark,   NPC_ATK_UpLeft_ButtonXmark,  NPC_ATK_UpRight_ButtonXmark},
        {0, -45, 45},
        true,
        {NPC_ATK_Up_L2, NPC_ATK_UpLeft_L2, NPC_ATK_UpRight_L2})
end

function GeneralNPC_Act05(ai, goal, paramTbl)
    local r1Range = ai:GetStringIndexedNumber("R_Dist_RollingR1")
    local r2Range = ai:GetStringIndexedNumber("R_Dist_RollingR2")
    return StepAttackAction(ai, goal, r1Range, r2Range,
        {NPC_ATK_Left_ButtonXmark, NPC_ATK_Right_ButtonXmark},
        {-90, 90},
        false,
        {NPC_ATK_Left_L2, NPC_ATK_Right_L2})
end

function GeneralNPC_Act06(ai, goal, paramTbl)
    local r1Range = ai:GetStringIndexedNumber("R_Dist_RollingR1")
    local r2Range = ai:GetStringIndexedNumber("R_Dist_RollingR2")
    return StepAttackAction(ai, goal, r1Range, r2Range,
        {NPC_ATK_Down_ButtonXmark, NPC_ATK_DownLeft_ButtonXmark, NPC_ATK_DownRight_ButtonXmark},
        {180, -135, 135},
        false,
        {NPC_ATK_Down_L2, NPC_ATK_DownLeft_L2, NPC_ATK_DownRight_L2})
end

function GeneralNPC_Act07(ai, goal, paramTbl)
    local random1 = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local r1Range = ai:GetStringIndexedNumber("R_Dist_BackStepR1")
    local r2Range = ai:GetStringIndexedNumber("R_Dist_BackStepR2")
    local dualProb = ai:GetNPCActProb(9030)
    local isR1Dual = (random2 <= dualProb)

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    elseif bhs == ARM_R and isR1Dual then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end

    if SpaceCheck(ai, goal, 180, 5) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_ButtonXmark, TARGET_ENE_0, 999, 0, 0)
    end

    local r1Odds = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        local random3 = ai:GetRandam_Int(1, 100)
        local random4 = 0
        r1Odds = 100
        if random3 <= 55 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_ButtonXmark, TARGET_ENE_0, 999, 0, 0)
        else
            random4 = ai:GetRandam_Int(1, 100)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
        if random4 > 0 and random4 <= 55 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_ButtonXmark, TARGET_ENE_0, 999, 0, 0)
        end
    end

    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 3, TARGET_ENE_0, r1Range, r2Range, r1Odds, isR1Dual)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act08(ai, goal, paramTbl)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end

    local approachDist = 4
    local guardProb = 0
    local runProb = 100
    local isSirAnsbach = ai:HasSpecialEffectId(TARGET_SELF, 20018035)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then 
        runProb = 100 
    end
    local guardProb = 0
    local useShield = (ai:GetStringIndexedNumber("L_WeaponType") == 10)
    if not useShield then
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end
    local dualProb = ai:GetNPCActProb(9030)
    local atk2Anim = (GetDualAttackType(ai, goal) == 1 and ai:GetRandam_Int(1,100) <= dualProb)
        and NPC_ATK_L1 or NPC_ATK_R2

    NPC_Approach_Act_Flex(ai, goal, approachDist, 0, 4, runProb, guardProb, 1.8, 2)

    local jumpAnim = isSirAnsbach and NPC_ATK_Down_Jump or NPC_ATK_Up_Jump
    if isSirAnsbach then 
        atk2Anim = NPC_ATK_R1 
    end

    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.5, jumpAnim, TARGET_ENE_0, 999, 0, 90)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, atk2Anim, TARGET_ENE_0, 999, 0, 90)
    if isSirAnsbach then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
    end
end

function GeneralNPC_Act09(ai, goal, paramTbl)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    local isSirAnsbach = ai:HasSpecialEffectId(TARGET_SELF, 20018035)
    if bhs == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end

    local stopDist = 6.8
    local guardProb = 0
    local useShield = (ai:GetStringIndexedNumber("L_WeaponType") == 10)

    if not useShield then
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end

    local dualProb = ai:GetNPCActProb(9030)
    local animId = (GetDualAttackType(ai, goal) == 1 and ai:GetRandam_Int(1,100) <= dualProb)
        and NPC_ATK_L1 or NPC_ATK_R2
    local guardAnim = (ai:GetRandam_Int(1,100) <= guardProb) and NPC_ATK_L1 or -1

    goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, stopDist, TARGET_SELF, guardAnim)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018035) then 
        animId = NPC_ATK_R1 
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.5, NPC_ATK_Dash_Jump, TARGET_ENE_0, 999, 0, 90)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, animId, TARGET_ENE_0, 999, 0, 90)
    if isSirAnsbach then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
    end
end

function GeneralNPC_Act11(ai, goal, paramTbl)
    local bowT = BowSetup(ai, goal, ARM_R, false)
    BowApproach(ai, goal, 30)
    if bowT == 43 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R1, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R1Hold, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    GetWellSpace_Odds = 0; return GetWellSpace_Odds
end

function GeneralNPC_Act12(ai, goal, paramTbl)
    local bowT = BowSetup(ai, goal, ARM_R, false)
    BowApproach(ai, goal, 30)
    if bowT == 43 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2Hold, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    GetWellSpace_Odds = 0; return GetWellSpace_Odds
end

function GeneralNPC_Act21(ai, goal, p)
    return SpellCastAction(ai, goal, 12, ARM_R, 7, 0,
        {NPC_ATK_Up_R1, nil, AI_DIR_TYPE_F, nil, NPC_ATK_Up_R1Hold, nil})
end

function GeneralNPC_Act22(ai, goal, p)
    return SpellCastAction(ai, goal, 12, ARM_R, 7, 0,
        {NPC_ATK_Left_R1, NPC_ATK_Right_R1, AI_DIR_TYPE_L, AI_DIR_TYPE_R,
         NPC_ATK_Left_R1Hold, NPC_ATK_Right_R1Hold})
end

function GeneralNPC_Act23(ai, goal, p)
    return SpellCastAction(ai, goal, 12, ARM_R, 7, 0,
        {NPC_ATK_Down_R1, nil, AI_DIR_TYPE_B, nil, NPC_ATK_Down_R1Hold, nil})
end

function GeneralNPC_Act24(ai, goal, p)
    return SpellCastAction(ai, goal, 11, ARM_R, 8, 1,
        {NPC_ATK_Up_R1, nil, AI_DIR_TYPE_F, nil, NPC_ATK_Up_R1Hold, nil})
end

function GeneralNPC_Act25(ai, goal, p)
    return SpellCastAction(ai, goal, 11, ARM_R, 8, 1,
        {NPC_ATK_Left_R1, NPC_ATK_Right_R1, AI_DIR_TYPE_L, AI_DIR_TYPE_R,
         NPC_ATK_Left_R1Hold, NPC_ATK_Right_R1Hold})
end

function GeneralNPC_Act26(ai, goal, p)
    return SpellCastAction(ai, goal, 11, ARM_R, 8, 1,
        {NPC_ATK_Down_R1, nil, AI_DIR_TYPE_B, nil, NPC_ATK_Down_R1Hold, nil})
end

function GeneralNPC_Act27(ai, goal, p)
    return SpellCastAction(ai, goal, 10, ARM_R, 9, 1,
        {NPC_ATK_Up_R1, nil, AI_DIR_TYPE_F, nil, NPC_ATK_Up_R1Hold, nil})
end

function GeneralNPC_Act28(ai, goal, p)
    return SpellCastAction(ai, goal, 10, ARM_R, 9, 1,
        {NPC_ATK_Left_R1, NPC_ATK_Right_R1, AI_DIR_TYPE_L, AI_DIR_TYPE_R,
         NPC_ATK_Left_R1Hold, NPC_ATK_Right_R1Hold})
end

function GeneralNPC_Act29(ai, goal, p)
    return SpellCastAction(ai, goal, 10, ARM_R, 9, 1,
        {NPC_ATK_Down_R1, nil, AI_DIR_TYPE_B, nil, NPC_ATK_Down_R1Hold, nil})
end

function GeneralNPC_Act30(ai, goal, paramTbl) 
    SimpleSpellAct(ai, goal, 20, ARM_R, nil) 
end

function GeneralNPC_Act31(ai, goal, paramTbl) 
    SimpleSpellAct(ai, goal, 30, ARM_R, nil) 
end

function GeneralNPC_Act32(ai, goal, paramTbl) 
    SimpleSpellAct(ai, goal, 50, ARM_R, 4)  
end

function GeneralNPC_Act33(ai, goal, paramTbl)
    SimpleSpellAct(ai, goal, 21, ARM_R, nil, TARGET_FRI_0)
    ai:AddNPCActProb(3500)
end

function GeneralNPC_Act35(ai, goal, paramTbl)
end

function GeneralNPC_Act36(ai, goal, paramTbl)
end

function GeneralNPC_Act41(ai, goal, paramTbl)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local dist = ai:GetDist(TARGET_ENE_0)
    local stopDist = ai:GetStringIndexedNumber("L_Dist_TwoHandR1_First")
    local secondDist = ai:GetStringIndexedNumber("L_Dist_TwoHandR1_Second")
    local comboNum = ai:GetStringIndexedNumber("L_ComboNum_R1")

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    elseif bhs ~= ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end

    ai:AddNPCActProb(9000)
    local guardProb = ai:GetNPCActProb(9020)
    local doSide = (random3 <= guardProb)
    if doSide then 
        guardProb = 100 
    end

    local canRunDist = stopDist + 2
    local forceRunMinDist = stopDist + 2
    local runProb = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        runProb = 100
        canRunDist = 0
        forceRunMinDist = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, 1.8, 2)

    if stopDist <= dist and random2 <= 50 and doSide then
        local sideDir = ai:IsInsideTargetCustom(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_L, 180, 180, 10) and 1 or 0
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, sideDir, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
    end

    AddComboChain(goal, comboNum, NPC_ATK_R1, stopDist, secondDist, true)
    GetWellSpace_Odds = 0; return GetWellSpace_Odds
end

function GeneralNPC_Act42(ai, goal, paramTbl)
    local random2 = ai:GetRandam_Int(1, 100)
    local dist = ai:GetDist(TARGET_ENE_0)
    local stopDist = ai:GetStringIndexedNumber("L_Dist_TwoHandR2_First")
    local secondDist = ai:GetStringIndexedNumber("L_Dist_TwoHandR2_Second")
    local comboNum = ai:GetStringIndexedNumber("L_ComboNum_R1")

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    elseif bhs ~= ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end

    ai:AddNPCActProb(9000)
    local guardProb = ai:GetNPCActProb(9020)
    local runProb  = 50
    local canRunDist = stopDist + 2
    local forceRunMinDist = stopDist + 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        runProb = 100
        canRunDist = 0
        forceRunMinDist = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, 1.8, 2)

    local random4 = ai:GetRandam_Int(1, 100)
    if comboNum == 2 then
        local fst = (random4 <= 80) and NPC_ATK_R2 or NPC_ATK_R2Hold
        local fin = (random4 <= 90) and NPC_ATK_R2 or NPC_ATK_R2Hold
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, fst, TARGET_ENE_0, stopDist, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, fin, TARGET_ENE_0, secondDist, 0, 0)
    elseif random4 <= 80 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R2, TARGET_ENE_0, stopDist, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R2Hold, TARGET_ENE_0, stopDist, 0, 0)
    end
    GetWellSpace_Odds = 0; return GetWellSpace_Odds
end

function GeneralNPC_Act43(ai, goal, paramTbl)
    local dist = ai:GetDist(TARGET_ENE_0)
    local stopDist = ai:GetStringIndexedNumber("L_Dist_OneHandL2")
    local comboNum = ai:GetStringIndexedNumber("R_ComboNum_R1")

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_L or bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end

    ai:AddNPCActProb(9000)
    local guardProb = ai:GetNPCActProb(9020)
    local runProb = 50
    local canRunDist = stopDist + 2
    local forceRunMinDist = stopDist + 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        runProb = 100
        canRunDist = 0
        forceRunMinDist = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, 1.8, 2)
    AddComboChain(goal, comboNum, NPC_ATK_L1, stopDist, AttDist_Second, true)
    GetWellSpace_Odds = 0; return GetWellSpace_Odds
end

function GeneralNPC_Act44(ai, goal, paramTbl)
    local random1 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local stopDist = ai:GetStringIndexedNumber("L_Dist_DashR1")
    local guardAnim = -1

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    elseif bhs ~= ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end

    ai:AddNPCActProb(9000)
    local guardProb = ai:GetNPCActProb(9020)
    if random1 <= guardProb then 
        guardAnim = NPC_ATK_L1 
    end

    local animId = (random3 <= 50) and NPC_ATK_DashR1 or NPC_ATK_DashR2
    goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, stopDist, TARGET_SELF, guardAnim)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, animId, TARGET_ENE_0, 999, 0, 0)
end

function GeneralNPC_Act45(ai, goal, paramTbl)
    local r1Range = ai:GetStringIndexedNumber("L_Dist_RollingR1")
    local r2Range = ai:GetStringIndexedNumber("L_Dist_RollingR2")

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    elseif bhs ~= ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end

    return StepAttackAction(ai, goal, r1Range, r2Range,
        {NPC_ATK_Up_ButtonXmark, NPC_ATK_UpLeft_ButtonXmark, NPC_ATK_UpRight_ButtonXmark},
        {0, -45, 45}, true,
        {NPC_ATK_Up_L2, NPC_ATK_UpLeft_L2, NPC_ATK_UpRight_L2})
end

function GeneralNPC_Act46(ai, goal, paramTbl)
    local r1Range = ai:GetStringIndexedNumber("L_Dist_RollingR1")
    local r2Range = ai:GetStringIndexedNumber("L_Dist_RollingR2")

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    elseif bhs ~= ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end

    return StepAttackAction(ai, goal, r1Range, r2Range,
        {NPC_ATK_Left_ButtonXmark, NPC_ATK_Right_ButtonXmark},
        {-90, 90}, false,
        {NPC_ATK_Left_L2, NPC_ATK_Right_L2})
end

function GeneralNPC_Act47(ai, goal, paramTbl)
    local r1Range = ai:GetStringIndexedNumber("L_Dist_RollingR1")
    local r2Range = ai:GetStringIndexedNumber("L_Dist_RollingR2")

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    elseif bhs ~= ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end

    return StepAttackAction(ai, goal, r1Range, r2Range,
        {NPC_ATK_Down_ButtonXmark, NPC_ATK_DownLeft_ButtonXmark, NPC_ATK_DownRight_ButtonXmark},
        {180, -135, 135}, false,
        {NPC_ATK_Down_L2, NPC_ATK_DownLeft_L2, NPC_ATK_DownRight_L2})
end

function GeneralNPC_Act48(ai, goal, paramTbl)
    local r1Range = ai:GetStringIndexedNumber("L_Dist_BackStepR1")
    local r2Range = ai:GetStringIndexedNumber("L_Dist_BackStepR2")

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    elseif bhs ~= ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end

    if SpaceCheck(ai, goal, 180, 5) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_ButtonXmark, TARGET_ENE_0, 999, 0, 0)
    end

    local r1Odds = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        r1Odds = 100
        r2Range = 0
    end

    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 1, TARGET_ENE_0, r1Range, r2Range, r1Odds)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0; return GetWellSpace_Odds
end

function GeneralNPC_Act49(ai, goal, paramTbl)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    local isSirAnsbach = ai:HasSpecialEffectId(TARGET_SELF, 20018035)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    elseif bhs ~= ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end

    local guardProb = 0
    local useShield = (ai:GetStringIndexedNumber("L_WeaponType") == 10)
    if not useShield then
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end

    local runProb = 100
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        runProb = 100 
    end
    NPC_Approach_Act_Flex(ai, goal, 4, 0, 4, runProb, guardProb, 1.8, 2)

    local jumpAnim = NPC_ATK_Up_Jump
    local atkAnim  = NPC_ATK_R2
    if isSirAnsbach then 
        jumpAnim = NPC_ATK_Down_Jump
        atkAnim = NPC_ATK_R1 
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.5, jumpAnim, TARGET_ENE_0, 999, 0, 90)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, atkAnim, TARGET_ENE_0, 999, 0, 90)
    if isSirAnsbach then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
    end
end

function GeneralNPC_Act50(ai, goal, paramTbl)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    local isSirAnsbach = ai:HasSpecialEffectId(TARGET_SELF, 20018035)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    elseif bhs ~= ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
    end

    local guardProb = 0
    local useShield = (ai:GetStringIndexedNumber("L_WeaponType") == 10)
    if not useShield then
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end

    local guardAnim = (ai:GetRandam_Int(1,100) <= guardProb) and NPC_ATK_L1 or -1
    goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, 6.8, TARGET_SELF, guardAnim)

    local atkAnim = NPC_ATK_R2
    if isSirAnsbach then 
        atkAnim = NPC_ATK_R1 
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.5, NPC_ATK_Dash_Jump, TARGET_ENE_0, 999, 0, 90)
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, atkAnim, TARGET_ENE_0, 999, 0, 90)
    if isSirAnsbach then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
    end
end

function GeneralNPC_Act51(ai, goal, paramTbl) 
    return LeftBowAct(ai, goal, false) 
end

function GeneralNPC_Act52(ai, goal, paramTbl) 
    return LeftBowAct(ai, goal, true)  
end

function GeneralNPC_Act61(ai, goal, paramTbl)
    return SpellCastAction(ai, goal, 12, ARM_L, 7, 0,
        {NPC_ATK_Up_L1, nil, AI_DIR_TYPE_F, nil, NPC_ATK_Up_L1Hold, nil})
end

function GeneralNPC_Act62(ai, goal, paramTbl)
    return SpellCastAction(ai, goal, 12, ARM_L, 7, 0,
        {NPC_ATK_Left_L1, NPC_ATK_Right_L1, AI_DIR_TYPE_L, AI_DIR_TYPE_R,
         NPC_ATK_Left_L1Hold, NPC_ATK_Right_L1Hold})
end

function GeneralNPC_Act63(ai, goal, paramTbl)
    return SpellCastAction(ai, goal, 12, ARM_L, 7, 0,
        {NPC_ATK_Down_L1, nil, AI_DIR_TYPE_B, nil, NPC_ATK_Down_L1Hold, nil})
end

function GeneralNPC_Act64(ai, goal, paramTbl)
    return SpellCastAction(ai, goal, 11, ARM_L, 8, 1,
        {NPC_ATK_Up_L1, nil, AI_DIR_TYPE_F, nil, NPC_ATK_Up_L1Hold, nil})
end

function GeneralNPC_Act65(ai, goal, paramTbl)
    return SpellCastAction(ai, goal, 11, ARM_L, 8, 1,
        {NPC_ATK_Left_L1, NPC_ATK_Right_L1, AI_DIR_TYPE_L, AI_DIR_TYPE_R,
         NPC_ATK_Left_L1Hold, NPC_ATK_Right_L1Hold})
end

function GeneralNPC_Act66(ai, goal, paramTbl)
    return SpellCastAction(ai, goal, 11, ARM_L, 8, 1,
        {NPC_ATK_Down_L1, nil, AI_DIR_TYPE_B, nil, NPC_ATK_Down_L1Hold, nil})
end

function GeneralNPC_Act67(ai, goal, paramTbl)
    return SpellCastAction(ai, goal, 10, ARM_L, 9, 1,
        {NPC_ATK_Up_L1, nil, AI_DIR_TYPE_F, nil, NPC_ATK_Up_L1Hold, nil})
end

function GeneralNPC_Act68(ai, goal, paramTbl)
    return SpellCastAction(ai, goal, 10, ARM_L, 9, 1,
        {NPC_ATK_Left_L1, NPC_ATK_Right_L1, AI_DIR_TYPE_L, AI_DIR_TYPE_R,
         NPC_ATK_Left_L1Hold, NPC_ATK_Right_L1Hold})
end

function GeneralNPC_Act69(ai, goal, paramTbl)
    return SpellCastAction(ai, goal, 10, ARM_L, 9, 1,
        {NPC_ATK_Down_L1, nil, AI_DIR_TYPE_B, nil, NPC_ATK_Down_L1Hold, nil})
end

function GeneralNPC_Act70(ai, goal, paramTbl) 
    SimpleSpellActL(ai, goal, 20, false) 
end

function GeneralNPC_Act71(ai, goal, paramTbl) 
    SimpleSpellActL(ai, goal, 30, false) 
end

function GeneralNPC_Act72(ai, goal, paramTbl) 
    SimpleSpellActL(ai, goal, 50, true) 
end

function GeneralNPC_Act73(ai, goal, paramTbl)
    local wepId = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local spellId = GetRandomSpellId_ByType(nil, ai, goal, 21, RWepId)
    ai:ChangeEquipMagicByMagicParamId(spellId)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end

    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L1, TARGET_FRI_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    ai:AddNPCActProb(3500)
end

function GeneralNPC_Act101(ai, goal, paramTbl)
    if SpaceCheck(ai, goal, 180, 5) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ButtonXmark, TARGET_ENE_0, 999, 0, 0)
    end
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act102(ai, goal, paramTbl)
    return StepEvade(ai, goal,
        {0, -45, 45},
        {NPC_ATK_Up_ButtonXmark, NPC_ATK_UpLeft_ButtonXmark, NPC_ATK_UpRight_ButtonXmark},
        {NPC_ATK_Up_L2, NPC_ATK_UpLeft_L2, NPC_ATK_UpRight_L2},
        true)
end

function GeneralNPC_Act103(ai, goal, paramTbl)
    return StepEvade(ai, goal,
        {-90, 90, 0}, 
        {NPC_ATK_Left_ButtonXmark, NPC_ATK_Right_ButtonXmark},
        {NPC_ATK_Left_L2, NPC_ATK_Right_L2},
        false)
end

function GeneralNPC_Act104(ai, goal, p)
    local random = ai:GetRandam_Int(1, 100)
    local dist = ai:GetDist(TARGET_ENE_0)
    local useL2 = (ai:GetRandam_Int(1, 100) <= ai:GetNPCActProb(9040))
    local btns = useL2 and {NPC_ATK_Down_L2, NPC_ATK_DownLeft_L2, NPC_ATK_DownRight_L2} or {NPC_ATK_Down_ButtonXmark, NPC_ATK_DownLeft_ButtonXmark, NPC_ATK_DownRight_ButtonXmark}
    local animId = NPC_ATK_NONE

    if dist <= 1 and SpaceCheck(ai, goal, 180, 5) then
        animId = btns[1]
    elseif SpaceCheck(ai, goal, -135, 5) then
        animId = SpaceCheck(ai, goal, 135, 5) and (random <= 50 and btns[2] or btns[3]) or btns[2]
    elseif SpaceCheck(ai, goal, 135, 5) then
        animId = btns[3]
    end

    if animId ~= NPC_ATK_NONE or ai:GetStringIndexedNumber("IsUnreachMode") == 1 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, animId, TARGET_ENE_0, 999, 0, 0)
        ai:SetTimer(6, 1)
    end

    GetWellSpace_Odds = 0; return GetWellSpace_Odds
end

function GeneralNPC_Act105(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local guardProb = ai:GetNPCActProb(9020)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)

    local useShield = false
    if bhs ~= ARM_R and bhs ~= ARM_L then
        if ai:GetStringIndexedNumber("L_WeaponType") == 10 then 
            useShield = true 
        end
    end
    if not useShield then
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end

    local isRight
    if SpaceCheck(ai, goal, -90, 1) then
        isRight = SpaceCheck(ai, goal, 90, 1) and (ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) and 1 or 0) or 0
    elseif SpaceCheck(ai, goal, 90, 1) then
        isRight = 1
    else
        GetWellSpace_Odds = 100
        return GetWellSpace_Odds
    end

    local guardAnim = (random <= guardProb) and NPC_ATK_L1 or -1
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, 1, TARGET_ENE_0, isRight, ai:GetRandam_Int(75, 90), true, true, guardAnim)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act106(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local guardProb = ai:GetNPCActProb(9020)
    local stopDist = 7
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs ~= ARM_R and bhs ~= ARM_L and ai:GetStringIndexedNumber("L_WeaponType") == 10 then
    else
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end

    local guardAnim = (random <= guardProb) and NPC_ATK_L1 or -1
    if stopDist <= ai:GetDist(TARGET_ENE_0) and guardAnim == NPC_ATK_L1 then
        goal:AddSubGoal(GOAL_COMMON_Guard, 1.8, guardAnim, TARGET_ENE_0, true, true)
    else
        goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 1.8, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, guardAnim)
    end
    GetWellSpace_Odds = 100
    return GetWellSpace_Odds
end

function GeneralNPC_Act107(ai, goal, paramTbl)
    local random = ai:GetRandam_Int(1, 100)
    local guardProb = ai:GetNPCActProb(9020)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs ~= ARM_R and bhs ~= ARM_L and ai:GetStringIndexedNumber("L_WeaponType") == 10 then
    else
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end

    local guardAnim = (random <= guardProb) and NPC_ATK_L1 or -1
    goal:AddSubGoal(GOAL_COMMON_DashTarget, 3, TARGET_ENE_0, 2, TARGET_SELF, guardAnim)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act108(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_Guard, 3, NPC_ATK_L1Hold, TARGET_ENE_0, GUARD_GOAL_DESIRE_RET_Continue, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act109(ai, goal, paramTbl)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0, 0, 0, 0)
    elseif bhs == ARM_L then
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
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, AttDist, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, AttDist, 0, 0)
    elseif bhs == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0, 0, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, AttDist, 0, 0)
    end
    ai:SetTimer(5, 7)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act111(ai, goal, paramTbl)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R or bhs == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, AttDist, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0, 0, 0, 0)
    end
    ai:SetTimer(5, 7)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act112(ai, goal, paramTbl)
    local random1 = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local guardProb = ai:GetNPCActProb(9020)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs ~= ARM_R and bhs ~= ARM_L and ai:GetStringIndexedNumber("L_WeaponType") == 10 then
    else
        ai:AddNPCActProb(9000); guardProb = ai:GetNPCActProb(9020)
    end
    local guardAnim = (random1 <= guardProb) and NPC_ATK_L1 or -1
    local isWalk = (random2 <= 50)
    goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 3, TARGET_ENE_0, 15, TARGET_SELF, isWalk, guardAnim)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act120(ai, goal, paramTbl)
    local stopDist = ai:GetStringIndexedNumber("R_Dist_OneHandR1_First")
    local comboNum  = ai:GetStringIndexedNumber("R_ComboNum_R1")

    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R or bhs == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end

    local guardProb = ai:GetNPCActProb(9020)
    local useShield = (ai:GetStringIndexedNumber("L_WeaponType") == 10)
    if not useShield then
        ai:AddNPCActProb(9000)
        guardProb = ai:GetNPCActProb(9020)
    end

    local runProb = 50
    local canRunDist = stopDist + 2
    local forceRunMinDist = stopDist + 2
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        runProb = 100
        canRunDist = 0
        forceRunMinDist = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, 1.8, 2)
    AddComboChain(goal, comboNum, NPC_ATK_L1Hold_R1, stopDist, stopDist, true)
    GetWellSpace_Odds = 0; return GetWellSpace_Odds
end

function GeneralNPC_Act121(ai, goal, paramTbl)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    local stopDist = ai:GetStringIndexedNumber("R_Dist_OneHandR1_First")
    if bhs == ARM_R then 
        stopDist = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_First")
    elseif bhs == ARM_L then 
        stopDist = ai:GetStringIndexedNumber("L_Dist_TwoHandR1_First")
    end

    local animId = NPC_ATK_L1Hold_R1
    local life = 3
    if ai:HasSpecialEffectId(TARGET_SELF, 5215500) then
        life = 2
        animId = NPC_ATK_L2
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, life, animId, TARGET_ENE_0, stopDist, 0, 0, 0)
    GetWellSpace_Odds = 0; return GetWellSpace_Odds
end

function GeneralNPC_Act150(ai, goal, paramTbl) 
    return ItemUseAct(ai, goal, 20, false, false) 
end

function GeneralNPC_Act151(ai, goal, paramTbl) 
    return ItemUseAct(ai, goal, 30, false, false) 
end

function GeneralNPC_Act153(ai, goal, paramTbl) 
    return ItemUseAct(ai, goal, 10, true,  false) 
end

function GeneralNPC_Act152(ai, goal, paramTbl)
    local itemId = GetRandomItemId_ByType(nil, ai, goal, 31)
    ChangeEquipItem_ById(nil, ai, goal, itemId)

    local random1 = ai:GetRandam_Int(1, 100)
    local random2 = ai:GetRandam_Int(1, 100)
    local random3 = ai:GetRandam_Int(1, 100)
    local dist = ai:GetDist(TARGET_ENE_0)
    local guardProb = ai:GetNPCActProb(9020)
    local bhProb = ai:GetNPCActProb(9000)
    local comboNum = ai:GetStringIndexedNumber("R_ComboNum_R1")
    local useTwoHand = false
    local useShield  = false

    local wantTwoHand = (random1 <= bhProb)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    if bhs == ARM_R then
        useTwoHand = wantTwoHand or (dist < 1)
        if not useTwoHand and dist >= 1 then
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        end
    elseif bhs == ARM_L then
        goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        if wantTwoHand and dist >= 1 then
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            useTwoHand = true
        end
    else
        if wantTwoHand and dist >= 1 then
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            useTwoHand = true
        end
    end

    local stopDist, secondDist
    if useTwoHand then
        stopDist = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_First")
        secondDist = ai:GetStringIndexedNumber("R_Dist_TwoHandR1_Second")
    else
        stopDist = ai:GetStringIndexedNumber("R_Dist_OneHandR1_First")
        secondDist = ai:GetStringIndexedNumber("R_Dist_OneHandR1_Second")
        if ai:GetStringIndexedNumber("L_WeaponType") == 10 then 
            useShield = true 
        end
    end
    if not useShield then
        ai:AddNPCActProb(9000); guardProb = ai:GetNPCActProb(9020)
    end

    local doSide = (random3 <= guardProb)
    if doSide then 
        guardProb = 100 
    end

    local canRunDist = stopDist + 2
    local forceRunMinDist = stopDist + 2
    local runProb = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        runProb = 100
        canRunDist = 0
        forceRunMinDist = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, 1.8, 2)

    if stopDist <= dist and random2 <= 50 and doSide then
        local sideDir = ai:IsInsideTargetCustom(TARGET_ENE_0, TARGET_SELF, AI_DIR_TYPE_L, 180, 180, 10) and 1 or 0
        goal:AddSubGoal(GOAL_COMMON_SidewayMove, 0.3, TARGET_ENE_0, sideDir, ai:GetRandam_Int(75, 90), true, true, NPC_ATK_L1Hold)
    end

    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ButtonSquare, TARGET_ENE_0, 999, 0, 0)
    if comboNum >= 2 then
        for _ = 1, math.min(comboNum, 6) - 1 do
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, NPC_ATK_R1, TARGET_ENE_0, stopDist, 0, 0)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, secondDist, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_R1, TARGET_ENE_0, stopDist, 0, 0)
    end

    if GetUsageId_X(ai, ai:GetAIUsageParam(1, itemId)) == 2 then 
        ai:SetTimer(2, 10) 
    end

    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act154(ai, goal, paramTbl)
    local itemId = GetRandomItemId_ByType(nil, ai, goal, 50)
    ChangeEquipItem_ById(nil, ai, goal, itemId)
    if ai:HasSpecialEffectId(TARGET_SELF, 20018026) then
        goal:AddSubGoal(GOAL_COMMON_DashTarget, 5, TARGET_ENE_0, 2.3, TARGET_SELF, -1)
    end

    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ButtonSquare, TARGET_ENE_0, 999, 0, 0)
    if not ai:HasSpecialEffectId(TARGET_SELF, 20018026) then
        ai:SetTimer(4, 30)
        if GetUsageId_X(ai, ai:GetAIUsageParam(1, itemId)) == 2 then 
            ai:SetTimer(2, 10) 
        end
        GetWellSpace_Odds = 0
        return GetWellSpace_Odds
    end
end

function GeneralNPC_Act200(ai, goal, paramTbl)
    local arm = ChangeBothHand_ForArts(nil, ai, goal, 12)
    if arm == -1 then 
        return 
    end

    local defDist = (arm == ARM_R) and ai:GetStringIndexedNumber("R_Dist_TwoHandR1_First") or ai:GetStringIndexedNumber("L_Dist_TwoHandR1_First")
    local artsId = ai:GetArtsID(arm)
    Common_NPC_AI_GetArtsUseDist(nil, ai, goal, artsId, defDist)
    ArtsAction_ByCC(nil, ai, goal, arm, ai:GetStringIndexedNumber("Arts_ApproachDist"))
    ai:SetTimer(3, 3)
end

function GeneralNPC_Act210(ai, goal, paramTbl) 
    ArtsAct(nil, ai, goal, 11, 5, nil) 
end

function GeneralNPC_Act220(ai, goal, paramTbl) 
    ArtsAct(nil, ai, goal, 10, 12, nil) 
end

function GeneralNPC_Act230(ai, goal, paramTbl)
    local arm = ChangeBothHand_ForArts(nil, ai, goal, 20)
    if arm ~= -1 then 
        ArtsAction_ByCC(nil, ai, goal, arm, 999)
        ai:SetTimer(3, 3) 
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function GeneralNPC_Act231(ai, goal, paramTbl)
    local arm = ChangeBothHand_ForArts(nil, ai, goal, 30)
    if arm ~= -1 then 
        ArtsAction_ByCC(nil, ai, goal, arm, 999)
        ai:SetTimer(3, 3) 
    end
end

function GeneralNPC_Act232(ai, goal, paramTbl)
    local arm = ChangeBothHand_ForArts(nil, ai, goal, 50)
    if arm ~= -1 then
        ArtsAction_ByCC(nil, ai, goal, arm, 999)
        ai:SetTimer(4, 30)
        ai:SetTimer(3, 3)
    end
end

function GeneralNPC_Act_onNoSubGoal(ai, goal)
    if ai:GetWeightType(TARGET_SELF) == AI_TARGET_WEIGHT_TYPE_WeightOver or ai:GetSp(TARGET_SELF) < 0 then
        local dir = (ai:GetRandam_Int(0, 1) == 1) and AI_DIR_TYPE_ToL or AI_DIR_TYPE_ToR
        goal:AddSubGoal(GOAL_COMMON_ApproachSettingDirection, 2, TARGET_ENE_0, 0.5, TARGET_SELF, false, -1, dir, 2)
    else
        local animId = (ai:GetRandam_Int(0, 1) == 1) and NPC_ATK_UpLeft_ButtonXmark or NPC_ATK_UpRight_ButtonXmark
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animId, TARGET_ENE_0, 999, 0, 0)
    end
end

function GeneralNPC_AdjustSpace(ai, goal)
end