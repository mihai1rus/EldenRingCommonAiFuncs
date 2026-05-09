function checkAmmo(ai, bowType, isLeft)
    local expected = BOW_AMMO[bowType]
    if not expected then 
        return 
    end
    local t0 = (bowType == 43 or bowType == 44) and boltT0 or arrowT0
    local t1 = (bowType == 43 or bowType == 44) and boltT1 or arrowT1
    local base1, base2 = isLeft and 8410 or 8400, isLeft and 8411 or 8401
    if t0 ~= expected then 
        ai:AddNPCActProb(base1) 
    end
    if t1 ~= expected then 
        ai:AddNPCActProb(base2) 
    end
    if t0 ~= expected and t1 ~= expected then
        if isLeft then 
            lNoAmmo = true 
        else 
            rNoAmmo = true 
        end
    end
end

function iterItems(ai)
    local results = {}
    local count = 0
    for i = 0, 9 do
        count = count + 1
        results[count] = {ai:GetEquipItemId(TARGET_SELF, i, ITEM_SLOTTYPE_SHORTCUT), ITEM_SLOTTYPE_SHORTCUT, i}
    end
    for i = 0, 5 do
        count = count + 1
        results[count] = {ai:GetEquipItemId(TARGET_SELF, i, ITEM_SLOTTYPE_TOOLBOX), ITEM_SLOTTYPE_TOOLBOX, i}
    end
    local idx = 0
    return function()
        idx = idx + 1
        if idx <= count then 
            return table.unpack(results[idx]) 
        end
    end
end

function slotOk(ai, slotIdx, isBolt, bowT)
    local abType = isBolt and ARROW_OR_BOLT_Bolt or ARROW_OR_BOLT_Arrow
    local b = GetBowType == GetBoltType and GetBoltType or GetArrowType
    local varId = ai:GetWeaponBehaviorVarID(ai:GetEquipArrowBoltId(TARGET_SELF, abType, slotIdx))
    local t = isBolt and GetBoltType(varId) or GetArrowType(varId)
    local expected
    if bowT == 40 then 
        expected = 50
    elseif bowT == 42 then 
        expected = 51
    elseif bowT == 43 then 
        expected = 52
    elseif bowT == 44 then 
        expected = 53
    end
    return t == expected
end

function SpellCastAction(ai, goal, spellType, wepArm, timerIdx, obsArea, attackAnims)
    local wepId = ai:GetCurrentEquipWeaponId(TARGET_SELF, wepArm)
    local spellId = GetRandomSpellId_ByType(nil, ai, goal, spellType, wepId)
    Common_NPC_AI_GetSpellUseDist(nil, ai, goal, spellId)
    local stopDist = ai:GetStringIndexedNumber("Spell_ApproachDist")
    local param = ai:GetAIUsageParam(0, spellId)
    local cc = GetUsageId_CC(ai, param)
    local x = GetUsageId_X(ai, param)

    ai:ChangeEquipMagicByMagicParamId(spellId)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end

    if attackAnims[2] == nil then
        local canRunDist = stopDist
        local forceRunMinDist = stopDist + 6
        local runProb = 0
        local guardProb = ai:GetNPCActProb(9020)
        if not ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
            runProb    = 0
            forceRunMinDist = stopDist + 6
        else
            runProb    = 100
            canRunDist  = 0
            forceRunMinDist  = 0.1
        end
        if ai:GetStringIndexedNumber("L_WeaponType") ~= 10 then
            ai:AddNPCActProb(9000)
            guardProb = ai:GetNPCActProb(9020)
        end
        NPC_Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, guardProb, 1.8, 2)
    end

    local comboWeights = {20, 30, 30, 20, 0, 0, 0}
    local function pickCombo()
        local random = ai:GetRandam_Int(1, 100)
        local total = 0
        for stage, w in ipairs(comboWeights) do
            total = total + w
            if random <= total then 
                return stage 
            end
        end
        return 1
    end

    local anim1 = attackAnims[1]
    local anim2 = attackAnims[2]
    local dir1 = attackAnims[3]
    local dir2 = attackAnims[4]
    local holdAnim1 = attackAnims[5]
    local holdAnim2 = attackAnims[6]

    local function staffOverride()
        if ai:HasSpecialEffectId(TARGET_SELF, 5025300)
                and wepId >= 2530000 and wepId <= 2539999 then
            return true
        end
        return false
    end

    if cc == 1 then
        local comboStage = pickCombo()
        if staffOverride() then 
            anim1 = NPC_ATK_R2
            if anim2 then 
                anim2 = NPC_ATK_R2 
            end 
        end

        if anim2 then
            goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, anim1, anim2, TARGET_ENE_0, stopDist, dir1, dir2, comboStage, 2, 0, 0, -1, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 30, anim1, -1, TARGET_ENE_0, stopDist, dir1, -1, comboStage, 2, 0, 0, -1, -1)
        end

    elseif cc == 2 then
        ai:AddObserveAreaCustom(obsArea, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        if staffOverride() then
            holdAnim1 = NPC_ATK_R2Hold
            if holdAnim2 then 
                holdAnim2 = NPC_ATK_R2Hold 
            end
        end
        local random = ai:GetRandam_Float(1, 2.2)
        if holdAnim2 then
            goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, holdAnim1, holdAnim2, TARGET_ENE_0, stopDist, dir1, dir2, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, holdAnim1, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        end
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)

    elseif cc == 3 then
        ai:AddObserveAreaCustom(obsArea, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        goal:SetTimer(0, 6)
        if staffOverride() then
            holdAnim1 = NPC_ATK_R2Hold
            if holdAnim2 then 
                holdAnim2 = NPC_ATK_R2Hold 
            end
        end
        local random = ai:GetRandam_Float(1, 4)
        if holdAnim2 then
            goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, random, holdAnim1, holdAnim2, TARGET_ENE_0, stopDist, dir1, dir2, 1, 2, 0, 0, -1, -1):SetLifeEndSuccess(true)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, holdAnim1, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        end
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)

    else
        if staffOverride() then 
            anim1 = NPC_ATK_R2 
        end
        if anim2 then
            goal:AddSubGoal(GOAL_COMMON_NpcComboAttack_WithMove, 1, anim1, anim2, TARGET_ENE_0, stopDist, dir1, dir2, 1, 2, 0, 0, -1, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, anim1, TARGET_ENE_0, stopDist, 0, 0)
        end
    end

    goal:AddSubGoal(GOAL_COMMON_SetTimerRealtime, 0.1, timerIdx, 2)
    if x == 1 then 
        ai:SetTimer(1, 10) 
    end

    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function StepAttackAction(ai, goal, r1Range, r2Range, dirButtons, dirAngles, distCond, useL2Flag)
    local isR1Dual = false
    local useArts  = false
    local dualOdds = ai:GetNPCActProb(9030)
    local artsOdds = ai:GetNPCActProb(9040)

    if ai:GetRandam_Int(1, 100) <= dualOdds then 
        isR1Dual = true 
    end
    if ai:GetRandam_Int(1, 100) <= artsOdds then 
        useArts = true
        isR1Dual = false 
    end

    if not useArts then
        local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
        if bhs == ARM_L then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        elseif bhs == ARM_R and isR1Dual then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
        end
    end

    local btns = {}
    local btnCount = 0
    for i = 1, 3 do
        if dirButtons[i] ~= nil then
            btnCount = btnCount + 1
            btns[i] = useArts and useL2Flag[i] or dirButtons[i]
        end
    end

    local animId = NPC_ATK_NONE
    local dist = ai:GetDist(TARGET_ENE_0)
    local random = ai:GetRandam_Int(1, 100)

    if btnCount == 3 then
        if (not distCond or dist >= 5) and SpaceCheck(ai, goal, dirAngles[1], 5) then
            animId = btns[1]
        elseif SpaceCheck(ai, goal, dirAngles[2], 5) then
            animId = SpaceCheck(ai, goal, dirAngles[3], 5)
                and (random <= 50 and btns[2] or btns[3]) or btns[2]
        elseif SpaceCheck(ai, goal, dirAngles[3], 5) then
            animId = btns[3]
        end
    else
        if SpaceCheck(ai, goal, dirAngles[1], 5) then
            animId = SpaceCheck(ai, goal, dirAngles[2], 5)
                and (random <= 50 and btns[1] or btns[2]) or btns[1]
        elseif SpaceCheck(ai, goal, dirAngles[2], 5) then
            animId = btns[2]
        end
    end

    if animId ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animId, TARGET_ENE_0, 999, 0, 0)
    end

    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        local rnd2 = ai:GetRandam_Int(1, 100)
        local rnd3 = 0
        if rnd2 <= 55 and animId ~= NPC_ATK_NONE then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animId, TARGET_ENE_0, 999, 0, 0)
        else
            rnd3 = ai:GetRandam_Int(1, 100)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, NPC_ATK_R2, TARGET_ENE_0, 999, 0, 90)
        if rnd3 > 0 and rnd3 <= 55 and animId ~= NPC_ATK_NONE then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, animId, TARGET_ENE_0, 999, 0, 0)
        end
    end

    local r1Odds = 50
    if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
        r1Odds  = 100
        r2Range = 0
    end
    goal:AddSubGoal(GOAL_COMMON_NPCStepAttack, 3, TARGET_ENE_0, r1Range, r2Range, r1Odds, isR1Dual)
    ai:SetTimer(6, 1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function AddComboChain(goal, comboNum, anim, successDistance, successDistance2, isCombo)
    local first = isCombo and GOAL_COMMON_ComboAttackTunableSpin or GOAL_COMMON_AttackTunableSpin
    if comboNum >= 2 then
        goal:AddSubGoal(first, 3, anim, TARGET_ENE_0, successDistance, 0, 0, 0)
        for _ = 1, math.min(comboNum, 6) - 2 do
            goal:AddSubGoal(GOAL_COMMON_ComboTunable_SuccessAngle180, 3, anim, TARGET_ENE_0, successDistance2, 0, 0)
        end
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, anim, TARGET_ENE_0, successDistance2, 0, 0)
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, anim, TARGET_ENE_0, successDistance, 0, 0)
    end
end

function BowApproach(ai, goal, approachDist)
    local runProb = 50
    local canRunDist = 0
    local forceRunMinDist = approachDist
    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        runProb = 100
        canRunDist = 0
        forceRunMinDist = 0.1
    end
    NPC_Approach_Act_Flex(ai, goal, approachDist, canRunDist, forceRunMinDist, runProb, 0, 1.8, 2)
end

function BowSetup(ai, goal, arm, isCrossbow)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    local bowT = GetBowType(ai:GetWeaponBehaviorVarID(ai:GetCurrentEquipWeaponId(TARGET_SELF, arm)))
    if bhs == (arm == ARM_R and ARM_R or ARM_L) then
    elseif bhs == (arm == ARM_R and ARM_L or ARM_R) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, arm == ARM_R and NPC_ATK_ChangeStyleR or NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
        if bowT ~= 43 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, arm == ARM_R and NPC_ATK_ChangeStyleR or NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
        end
    else
        if bowT ~= 43 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, arm == ARM_R and NPC_ATK_ChangeStyleR or NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
        end
    end
    return bowT
end

function SimpleSpellAct(ai, goal, spellType, arm, timerIdx, target)
    local wepId = ai:GetCurrentEquipWeaponId(TARGET_SELF, arm)
    local spellId = GetRandomSpellId_ByType(nil, ai, goal, spellType, wepId)
    ai:ChangeEquipMagicByMagicParamId(spellId)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    local btnAnim = (arm == ARM_R) and NPC_ATK_R1 or NPC_ATK_L1
    if ai:HasSpecialEffectId(TARGET_SELF, 5025300) and wepId >= 2530000 and wepId <= 2539999 then
        btnAnim = NPC_ATK_R2
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, btnAnim, target or TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    if timerIdx then 
        ai:SetTimer(4, 30) 
    end
end

function LeftBowAct(ai, goal, isR2)
    local bowT = BowSetup(ai, goal, ARM_L, false)
    local bhs = ai:GetWeaponBothHandState(TARGET_SELF)
    local leftStance = (bhs == ARM_L)
    BowApproach(ai, goal, 30)
    if bowT == 43 then
        local anim = leftStance and (isR2 and NPC_ATK_R2 or NPC_ATK_R1) or (isR2 and NPC_ATK_L2 or NPC_ATK_L1)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, anim, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, anim, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    else
        local holdAnim = isR2 and NPC_ATK_R2Hold or NPC_ATK_R1Hold
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, holdAnim, TARGET_ENE_0, 999, 0, 0):SetTargetRange(0, 2.5, 999)
    end
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function SimpleSpellActL(ai, goal, spellType, timerSet)
    local wepId = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local spellId = GetRandomSpellId_ByType(nil, ai, goal, spellType, wepId)
    ai:ChangeEquipMagicByMagicParamId(spellId)
    if ai:IsBothHandMode(TARGET_SELF) then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
    end
    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L1, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
    goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_ENE_0)
    if timerSet then 
        ai:SetTimer(4, 30) 
    end
end

function StepEvade(ai, goal, dirAngles, btnAnims, l2Anims, distCond)
    local random1 = ai:GetRandam_Int(1, 100)
    local dist = ai:GetDist(TARGET_ENE_0)
    local useL2 = (ai:GetRandam_Int(1, 100) <= ai:GetNPCActProb(9040))
    local animId = NPC_ATK_NONE
    local btns = useL2 and l2Anims or btnAnims

    local btnCount = 0
    local angleCount = 0
    for i = 1, 3 do
        if btns[i] ~= nil then 
            btnCount = btnCount + 1 
        end
        if dirAngles[i] ~= nil then 
            angleCount = angleCount + 1 
        end
    end

    if btnCount == 3 then
        local fwdOk = (not distCond or dist >= 5) and SpaceCheck(ai, goal, dirAngles[1], 5)
        if fwdOk then
            animId = btns[1]
        elseif SpaceCheck(ai, goal, dirAngles[2], 5) then
            animId = SpaceCheck(ai, goal, dirAngles[3], 5)
                and (random1 <= 50 and btns[2] or btns[3]) or btns[2]
        elseif SpaceCheck(ai, goal, dirAngles[3], 5) then
            animId = btns[3]
        end

    else
        if SpaceCheck(ai, goal, dirAngles[1], 5) then
            animId = SpaceCheck(ai, goal, dirAngles[2], 5)
                and (random1 <= 50 and btns[1] or btns[2]) or btns[1]
        elseif SpaceCheck(ai, goal, dirAngles[2], 5) then
            animId = btns[2]
        elseif angleCount > 2 and ai:GetStringIndexedNumber("IsUnreachMode") == 1 then
            animId = random1 <= 50 and btns[1] or btns[2]
        end
    end

    if animId ~= NPC_ATK_NONE then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 2, animId, TARGET_ENE_0, 999, 0, 0)
        ai:SetTimer(6, 1)
    end

    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ItemUseAct(ai, goal, itemType, preApproach, postTimer)
    local itemId = GetRandomItemId_ByType(nil, ai, goal, itemType)
    ChangeEquipItem_ById(nil, ai, goal, itemId)
    if preApproach then
        local approachDist = 10
        Common_NPC_AI_GetItemUseDist(nil, ai, goal, itemId, approachDist)
        approachDist = ai:GetStringIndexedNumber("Item_ApproachDist")
        local guardProb = ai:GetNPCActProb(9020)
        local useShield = (ai:GetStringIndexedNumber("L_WeaponType") == 10)
        if not useShield then
            ai:AddNPCActProb(9000)
            guardProb = ai:GetNPCActProb(9020)
        end

        if ai:GetStringIndexedNumber("IsUnreachMode") == 0 then
            local runProb = 100
            local canRunDist = approachDist + 2
            local forceRunMinDist = approachDist + 2
            if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
                runProb = 100
                canRunDist = 0
                forceRunMinDist = 0.1
            end
            NPC_Approach_Act_Flex(ai, goal, approachDist, canRunDist, forceRunMinDist, runProb, guardProb, 1.8, 2)
        end
    end

    goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ButtonSquare, TARGET_ENE_0, 999, 0, 0)
    if postTimer then
         ai:SetTimer(4, 30) 
        end
    local param = ai:GetAIUsageParam(1, itemId)
    if GetUsageId_X(ai, param) == 2 then 
        ai:SetTimer(2, 10) 
    end

    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
end

function ArtsAct(self, ai, goal, artsType, defaultDist, timerDuration)
    local arm = ChangeBothHand_ForArts(self, ai, goal, artsType)
    if arm == -1 then 
        return 
    end

    local dist = defaultDist
    if dist then
        local artsId = ai:GetArtsID(arm)
        Common_NPC_AI_GetArtsUseDist(self, ai, goal, artsId, dist)
        dist = ai:GetStringIndexedNumber("Arts_ApproachDist")
    else
        dist = 999
    end

    ArtsAction_ByCC(self, ai, goal, arm, dist)
    ai:SetTimer(3, 3)
    if timerDuration then 
        ai:SetTimer(4, timerDuration) 
    end
end

function ArtsAction_ByCC(self, ai, goal, arm, successDist)
    local param = GetArtsUsageParam(ai, arm)
    local aa = GetUsageId_AA(ai, param)
    local cc = GetUsageId_CC(ai, param)
    local x = GetUsageId_X(ai, param)
    local stopDist = successDist
    local canRunDist = stopDist + 2
    local forceRunMinDist = stopDist + 2
    local runProb = 50
    local walkLife = 1.8
    local runLife = 2

    if ai:HasSpecialEffectId(TARGET_SELF, 20018032) then
        runProb = 100
        canRunDist = 0
        forceRunMinDist = 0.1
    end

    if aa < 20 and cc ~= 40 and cc ~= 41 and cc ~= 42 then
        NPC_Approach_Act_Flex(ai, goal, stopDist, canRunDist, forceRunMinDist, runProb, 0, walkLife, runLife)
    end

    if cc == 0 then
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0)
    elseif cc == 10 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0)
    elseif cc == 11 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R2, TARGET_ENE_0, stopDist, 0, 0)
    elseif cc == 12 or cc == 14 then
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0)
    elseif cc == 15 then
        stopDist = stopDist + 5
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0)
    elseif cc == 16 then
        stopDist = stopDist + 5
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_R2, TARGET_ENE_0, stopDist, 0, 0)
    elseif cc == 17 then
        stopDist = stopDist + 5
        goal:AddSubGoal(GOAL_COMMON_ComboAttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboRepeat, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0, 0)
        goal:AddSubGoal(GOAL_COMMON_ComboFinal, 3, NPC_ATK_L2, TARGET_ENE_0, stopDist, 0, 0)
    elseif cc == 20 then
        local random = ai:GetRandam_Float(1, 3.5)
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, random, NPC_ATK_L2Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    elseif cc == 30 then
        if ai:HasSpecialEffectId(TARGET_SELF, 20018674) then
            ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 3.2)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, NPC_ATK_L2Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        elseif aa == 12 then
            ai:AddObserveAreaCustom(0, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, NPC_ATK_L2Hold, TARGET_ENE_0, -99, 0, 0, 0, 0):SetLifeEndSuccess(true)
        else
            ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 5, NPC_ATK_L2Hold, TARGET_ENE_0, 0, 0, 0, 0, 0):SetLifeEndSuccess(true)
        end
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_ENE_0)
    elseif cc == 40 then
        local animId = (ai:GetRandam_Int(0, 1) == 1) and NPC_ATK_L2Hold_R2 or NPC_ATK_L2Hold_R1
        if stopDist < ai:GetDist(TARGET_ENE_0) then
            goal:AddSubGoal(GOAL_COMMON_ApproachTarget, 5, TARGET_ENE_0, stopDist, TARGET_ENE_0, true, NPC_ATK_L2Hold, GUARD_GOAL_DESIRE_RET_Failed, false)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L2Hold, TARGET_ENE_0, 999, 0, 0, 0, 0)
        end
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, animId, TARGET_ENE_0, stopDist, 0, 0, 0, 0)
    elseif cc == 41 then
        local animId = GetArtsShotButton(ai, arm, NPC_ATK_L2Hold_R1, NPC_ATK_L2Hold_R2)
        if animId == NPC_ATK_DownHold_L2Hold then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1.5, animId, TARGET_ENE_0, 999, 0, 0, 0, 0)
        else
            goal:AddSubGoal(GOAL_COMMON_NpcStanceAttack_WithMove, 20, TARGET_ENE_0, animId, 3, 0, 0, 0, 0)
        end
    elseif cc == 42 then
        local animId = GetArtsShotButton(ai, arm, NPC_ATK_L2Hold_R1, NPC_ATK_L2Hold_R2)
        if ai:HasSpecialEffectId(TARGET_SELF, 20018702) or ai:HasSpecialEffectId(TARGET_SELF, 20018721) then
            animId = NPC_ATK_L2Hold_R1
        end
        ai:AddObserveAreaCustom(1, TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 4)
        if animId == NPC_ATK_DownHold_L2Hold then
            goal:AddSubGoal(GOAL_COMMON_LeaveTarget, 0.1, TARGET_ENE_0, 8, TARGET_ENE_0, true, -1)
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 1, NPC_ATK_L2Hold, TARGET_ENE_0, 999, 0, 0, 0, 0):SetLifeEndSuccess(true)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, ai:GetRandam_Float(3, 4), animId, TARGET_ENE_0, 999, 0, 0, 0, 0):SetLifeEndSuccess(true)
            goal:AddSubGoal(GOAL_COMMON_Wait, 0.2, TARGET_SELF)
        end
    else
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_L2, TARGET_ENE_0, 999, 0, 0)
    end

    if x == 2 then 
        ai:SetTimer(2, 10) 
    end
end


function GetUsageId_AA(ai, aiUsageId)
    return math.floor(aiUsageId / 1000000)
end

function GetUsageId_X(ai, aiUsageId)
    return math.floor(ai:Mod(aiUsageId, 1000000) / 100000)
end

function GetUsageId_B(ai, aiUsageId)
    return math.floor(ai:Mod(aiUsageId, 100000) / 10000)
end

function GetUsageId_CC(ai, aiUsageId)
    return math.floor(ai:Mod(aiUsageId, 10000) / 100)
end

function GetUsageId_DD(ai, aiUsageId)
    return math.floor(ai:Mod(aiUsageId, 100))
end

function GetArtsUsageParam(ai, arm)
    local param = ai:GetAIUsageParam(2, ai:GetArtsID(arm))
    local wepId = ai:GetCurrentEquipWeaponId(TARGET_SELF, arm)
    local behav = ai:GetWeaponBehaviorVarID(wepId)
    local bowT = GetBowType(behav)
    local arr0T = GetArrowType(ai:GetWeaponBehaviorVarID(ai:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Arrow, 0)))
    local arr1T = GetArrowType(ai:GetWeaponBehaviorVarID(ai:GetEquipArrowBoltId(TARGET_SELF, ARROW_OR_BOLT_Arrow, 1)))

    if wepId == 110000 or (GetDualAttackType(ai, goal) >= 0 and arm == ARM_L) then
        return 90000000
    end
    if (bowT == 40 and arr0T ~= 50 and arr1T ~= 50)
        or (bowT == 42 and arr0T ~= 51 and arr1T ~= 51) then
        return -1
    end
    return param
end

function MakeNPCProbArr(self, ai, goal, array)

    local PROB_ARR_RANGES = {
        [2] = 1200, [3] = 1300, [4] = 1400, [5] = 1500,
        [6] = 1600, [7] = 1700, [8] = 1800, [9] = 1900, [10] = 2000,
    }

    local act = {}
    if array == 1 then
        for i = 1, 300 do
            act[i] = math.max(0, ai:GetNPCActProb(i))
        end
        return act
    end
    local base = PROB_ARR_RANGES[array]
    if base then
        for i = base, base + 10 do
            act[i] = math.max(0, ai:GetNPCActProb(i))
        end
    end
    return act
end

function GetBowType(varId)
    if varId >= 4000 and varId <= 4199 then 
        return 40
    elseif varId >= 4200 and varId <= 4299 then 
        return 42
    elseif varId >= 4300 and varId <= 4399 then 
        return 43
    elseif varId >= 4400 and varId <= 4449 then 
        return 44
    end
    return -1
end

function GetArrowType(varId)
    if varId >= 5000 and varId <= 5099 then 
        return 50 
    end
    if varId >= 5100 and varId <= 5199 then 
        return 51 
    end
    return -1
end

function GetBoltType(varId)
    if varId >= 5200 and varId <= 5299 then 
        return 52 
    end
    if varId >= 5300 and varId <= 5399 then 
        return 53 
    end
    return -1
end

function GetDualAttackType(ai, goal)

    local DUAL_ATTACK_SAME_CAT = {
        [PLAN_WEAPON_CATEGORY_SHORT_SWORD] = 0,
        [PLAN_WEAPON_CATEGORY_CLAW] = 1,
        [PLAN_WEAPON_CATEGORY_STRAIGHT_SWORD] = 0,
        [PLAN_WEAPON_CATEGORY_TWINBLADE] = 0,
        [PLAN_WEAPON_CATEGORY_LARGE_SWORD] = 1,
        [PLAN_WEAPON_CATEGORY_EXTRALARGE_SWORD] = 1,
        [PLAN_WEAPON_CATEGORY_RAPIER] = 0,
        [PLAN_WEAPON_CATEGORY_CURVEDSWORD] = 0,
        [PLAN_WEAPON_CATEGORY_KATANA] = 1,
        [PLAN_WEAPON_CATEGORY_EXTRALARGE_AXHAMMER] = 1,
        [PLAN_WEAPON_CATEGORY_FLAIL] = 1,
        [PLAN_WEAPON_CATEGORY_SPEAR] = 0,
        [PLAN_WEAPON_CATEGORY_HALBERD] = 1,
        [PLAN_WEAPON_CATEGORY_LARGE_CURVEDSWORD]= 1,
        [PLAN_WEAPON_CATEGORY_WHIP] = 0,
        [PLAN_WEAPON_CATEGORY_LARGE_SCYTHE] = 1,
    }

    local r = ai:GetWepCategoryNo(ARM_R)
    local l = ai:GetWepCategoryNo(ARM_L)
    local lSp = ai:GetWepSpAtkCategoryNo(ARM_L)

    if r == PLAN_WEAPON_CATEGORY_SHORT_SWORD then
        if r == l and lSp ~= 104 then 
            return 0 
        end
        return -1
    end
    if r == PLAN_WEAPON_CATEGORY_KATANA then
        if r == l or lSp == 104 then 
            return 1 
        end
        return -1
    end
    if r == PLAN_WEAPON_CATEGORY_AX or r == PLAN_WEAPON_CATEGORY_HAMMER then
        if l == PLAN_WEAPON_CATEGORY_AX or l == PLAN_WEAPON_CATEGORY_HAMMER then 
            return 1 
        end
        return -1
    end
    if r == PLAN_WEAPON_CATEGORY_LARGE_AX or r == PLAN_WEAPON_CATEGORY_LARGE_HAMMER then
        if l == PLAN_WEAPON_CATEGORY_LARGE_AX or l == PLAN_WEAPON_CATEGORY_LARGE_HAMMER then 
            return 1 
        end
        return -1
    end
    if r == PLAN_WEAPON_CATEGORY_LARGE_SPEAR or r == PLAN_WEAPON_CATEGORY_LARGE_RAPIER then
        if l == PLAN_WEAPON_CATEGORY_LARGE_SPEAR or l == PLAN_WEAPON_CATEGORY_LARGE_RAPIER then 
            return 1 
        end
        return -1
    end
    if r == PLAN_WEAPON_CATEGORY_FIST then
        if r == l
            and ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R) ~= 110000
            and ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L) ~= 110000 then
            return 1
        end
        return -1
    end

    if r == l then
        local t = DUAL_ATTACK_SAME_CAT[r]
        if t then 
            return t 
        end
    end
    return -1
end

function ChangeEquipItem_ById(self, ai, goal, itemId)
    for _, slot, slotIdx in iterItems(ai) do
        if _ == itemId then
            ai:ChangeEquipItem(slotIdx, slot)
            return true
        end
    end
    return false
end

function GetRandomItemId_ByType(self, ai, goal, itemType)
    local items = {}
    local count = 0
    for itemId, slot, _ in iterItems(ai) do
        if GetItemType(self, ai, itemId) == itemType
                and CanUseItem(self, ai, goal, itemId) then
            count = count + 1
            items[count] = itemId
        end
    end
    if count == 0 then return 0 end
    local random = ai:GetRandam_Int(1, 100)
    local totalProb = 0
    for i = 1, count do
        totalProb = totalProb + (100 / count)
        if random <= totalProb or i == count then 
            return items[i] 
        end
    end
    return items[count]
end

function GetItemType(self, ai, itemId)
    if itemId == -1 then 
        return -1 
    end
    return GetUsageId_AA(ai, ai:GetAIUsageParam(1, itemId))
end

function CanUseItem(self, ai, goal, itemId)
    local param = ai:GetAIUsageParam(1, itemId)
    local aa = GetUsageId_AA(ai, param)
    local b = GetUsageId_B(ai, param)
    local x = GetUsageId_X(ai, param)

    if x == 2 and ai:GetTimer(2) > 0 then 
        return -1 
    end

    if aa == 10 then
        return b ~= 9 or ai:GetStringIndexedNumber("IsUselessWeapon") == 1
    elseif aa == 20 then
        if     b == 7 then 
            return not ai:HasSpecialEffectAttribute(TARGET_SELF, 154)
        elseif b == 8 then 
            return not ai:HasSpecialEffectId(TARGET_SELF, 5630)
        else               
            return true
        end
    elseif aa == 30 then
        if b == 0 then
            return not ai:HasSpecialEffectCategory(TARGET_SELF, 151)
                and not ai:HasSpecialEffectCategory(TARGET_SELF, 156)
                and not ai:HasSpecialEffectCategory(TARGET_SELF, 160)
                and not ai:HasSpecialEffectId(TARGET_SELF, 503501)
                and not ai:HasSpecialEffectCategory(TARGET_SELF, 1001)
        elseif b == 1 then
            local lEnhance = ai:CanWeaponEnhance(ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L))
            local rEnhance = ai:CanWeaponEnhance(ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R))
            return (lEnhance and not ai:HasSpecialEffectCategory(TARGET_SELF, 163))
                or (rEnhance and not ai:HasSpecialEffectCategory(TARGET_SELF, 162)
                    and not ai:HasSpecialEffectCategory(TARGET_SELF, 10000))
        end
    elseif aa == 31 then
        return not ai:HasSpecialEffectCategory(TARGET_SELF, 162)
            and not ai:HasSpecialEffectCategory(TARGET_SELF, 10000)
            and ai:CanWeaponEnhance(ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R))
    elseif aa == 50 then
        return true
    end
    return false
end

function GetSpellType(self, ai, spellId)
    if spellId == -1 then 
        return -1 
    end
    return GetUsageId_AA(ai, ai:GetAIUsageParam(0, spellId))
end

function GetRandomSpellId_ByType(self, ai, goal, spellType, wepId)
    local spells = {}
    local count = 0
    for i = 0, 9 do
        local id = ai:GetEquipMagicId(TARGET_SELF, i)
        if GetSpellType(self, ai, id) == spellType
                and CanUseSpell(self, ai, goal, id, wepId) then
            count = count + 1
            spells[count] = id
        end
    end
    if count == 0 then 
        return 0 
    end
    local random  = ai:GetRandam_Int(1, 100)
    local totalProb = 0
    for i = 1, count do
        totalProb = totalProb + (100 / count)
        if random <= totalProb or i == count then 
            return spells[i] 
        end
    end
    return spells[count]
end

function ExecWeaponChange(self, ai, goal)
    local rWep = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R)
    local lWep = ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_L)
    local rIdx = ai:GetEquipWeaponIndex(ARM_R)
    local lIdx = ai:GetEquipWeaponIndex(ARM_L)
    local rPri = ai:GetEquipWeaponId(TARGET_SELF, ARM_R, WEP_Primary)
    local rSec = ai:GetEquipWeaponId(TARGET_SELF, ARM_R, WEP_Secondary)
    local rTer = ai:GetEquipWeaponId(TARGET_SELF, ARM_R, WEP_Tertiary)
    local lPri = ai:GetEquipWeaponId(TARGET_SELF, ARM_L, WEP_Primary)
    local lSec = ai:GetEquipWeaponId(TARGET_SELF, ARM_L, WEP_Secondary)
    local lTer = ai:GetEquipWeaponId(TARGET_SELF, ARM_L, WEP_Tertiary)

    local unarmed = 110000
    local isGideonOfnir = ai:HasSpecialEffectId(TARGET_SELF, 18678)
    local hpThresh = -1
    local isChangeWepUnder70PercentHp = ai:HasSpecialEffectId(TARGET_SELF, 19393)
    local isChangeWepUnder50PercentHp = ai:HasSpecialEffectId(TARGET_SELF, 19394)
    local isChangeWepUnder30PercentHp = ai:HasSpecialEffectId(TARGET_SELF, 19395)
    local hp = ai:GetHpRate(TARGET_SELF)
    local enemyHitByKnowledgeAboveAll = ai:HasSpecialEffectId(TARGET_ENE_0, 1898)
    local timerActive = ai:GetTimer(11) > 0

    local function swapR()
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.1, NPC_ATK_ArrowKeyRight, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0)
        return 1
    end
    local function swapL()
        goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 0.1, NPC_ATK_ArrowKeyLeft, TARGET_ENE_0, 999, 0, 0):SetLifeEndSuccess(true)
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.5, TARGET_ENE_0)
        return 1
    end

    if isGideonOfnir then
        if rIdx == WEP_Primary then
            if enemyHitByKnowledgeAboveAll or timerActive then 
                return swapR() 
            end
        else
            if not enemyHitByKnowledgeAboveAll and not timerActive then 
                return swapR() 
            end
        end
    end

    if rWep == unarmed and 
            not (rPri == unarmed and rSec == unarmed and rTer == unarmed) then
        return swapR()
    end
    if lWep == unarmed and 
            not (lPri == unarmed and lSec == unarmed and lTer == unarmed) then
        return swapL()
    end

    if isChangeWepUnder70PercentHp then 
        hpThresh = 0.7
    elseif isChangeWepUnder50PercentHp then 
        hpThresh = 0.5
    elseif isChangeWepUnder30PercentHp then 
        hpThresh = 0.3
    end
    if hpThresh >= 0 and hp <= hpThresh then
        if rTer ~= unarmed and 
                rIdx ~= WEP_Tertiary then 
            return swapR() 
        end
        if lTer ~= unarmed and 
                lIdx ~= WEP_Tertiary then 
            return swapL() 
        end
    end

    return 0
end

function ExecFirstAction(self, ai, goal)
    local isGideonOfnir = ai:HasSpecialEffectId(TARGET_SELF, 18678)
    if isGideonOfnir
            and ai:GetTimer(11) <= 0
            and ai:GetEquipWeaponIndex(ARM_R) == WEP_Primary then
        ai:SetTimer(11, 20)
        GeneralNPC_Act232(ai, goal, paramTbl)
        return 1
    end
    return 0
end

function GetCondNum_ForArts(ai, arm)
    local param = GetArtsUsageParam(ai, arm)
    local aa = GetUsageId_AA(ai, param)
    local x = GetUsageId_X(ai, param)

    if x == 2 and ai:GetTimer(2) > 0 then 
        return -1 
    end

    -- Close Range
    if aa == 12 then 
        return 2000
    -- Medium Range
    elseif aa == 11 then 
        return 2010
    -- Far Range
    elseif aa == 10 then 
        return 2020
    elseif aa == 20 then 
        return 2030
    -- Buffs
    elseif aa == 30 then
        local b = GetUsageId_B(ai, param)
        if b == 0 then
            if not ai:HasSpecialEffectCategory(TARGET_SELF, 156)
                    and not ai:HasSpecialEffectCategory(TARGET_SELF, 160)
                    and not ai:HasSpecialEffectCategory(TARGET_SELF, 1001) then
                return 2040
            end
        elseif b == 1 then
            if not ai:HasSpecialEffectCategory(TARGET_SELF, 162)
                    and not ai:HasSpecialEffectCategory(TARGET_SELF, 163) then
                return 2040
            end
        elseif b == 8 and not ai:HasSpecialEffectId(TARGET_ENE_0, 1897) then
            return 2040
        end
    -- Quickstep/Bloodhound Step
    elseif aa == 40 then 
        return 2050
    -- Vow of the Indomitable
    elseif aa == 41 then 
        return 2060
    -- Shield
    elseif aa == 42 then 
        return 2070
    -- Debuffs
    elseif aa == 50 then
        local b = GetUsageId_B(ai, param)
        if b == 0 or (b == 1 and not ai:HasSpecialEffectId(TARGET_ENE_0, 1897)) then
            return 2080
        end
    end
    return -1
end

function CheckMagicType(self, ai, goal)
    local counts = {[12]=0, [11]=0, [10]=0}
    for i = 0, 6 do
        local id = ai:GetEquipMagicId(TARGET_SELF, i)
        local t = GetSpellType(self, ai, id)
        if counts[t] then 
            counts[t] = counts[t] + 1 
        end
    end
    if counts[10] >= counts[11] and counts[10] >= counts[12] then 
        return 1
    elseif counts[11] >= counts[12] and counts[11] > counts[10] then 
        return 2
    else                                                               
        return 3
    end
end

function HasSpelltypeX(self, ai, goal, spellType)
    for i = 0, 9 do
        if GetSpellType(self, ai, ai:GetEquipMagicId(TARGET_SELF, i)) == spellType then
            return true
        end
    end
    return false
end

function HasSpelltypeX_CanUse(self, ai, goal, spellType, wepId)
    for i = 0, 9 do
        local id = ai:GetEquipMagicId(TARGET_SELF, i)
        if GetSpellType(self, ai, id) == spellType
                and CanUseSpell(self, ai, goal, id, wepId) then
            return true
        end
    end
    return false
end

function CanUseSpell(self, ai, goal, spellId, wepId)
    local cat = ai:GetMagicCategory(spellId)
    if not ai:CanShootMagicByType(wepId, cat) then 
        return false 
    end

    local param = ai:GetAIUsageParam(0, spellId)
    local aa = GetUsageId_AA(ai, param)
    local b = GetUsageId_B(ai, param)
    local x = GetUsageId_X(ai, param)

    if x == 1 and ai:GetTimer(1) > 0 then 
        return false 
    end

    if aa == 10 or aa == 11 or aa == 12 or aa == 20 or aa == 21 then
        return true
    elseif aa == 30 then
        if b == 0 then
            return not ai:HasSpecialEffectCategory(TARGET_SELF, 151)
                and not ai:HasSpecialEffectCategory(TARGET_SELF, 156)
                and not ai:HasSpecialEffectCategory(TARGET_SELF, 160)
                and not ai:HasSpecialEffectId(TARGET_SELF, 1676000)
                and not ai:HasSpecialEffectId(TARGET_SELF, 21490000)
                and not ai:HasSpecialEffectCategory(TARGET_SELF, 1001)
        elseif b == 1 then
            return not ai:HasSpecialEffectCategory(TARGET_SELF, 162)
                and ai:CanWeaponEnhance(ai:GetCurrentEquipWeaponId(TARGET_SELF, ARM_R))
        elseif b == 2 then
            return not ai:HasSpecialEffectCategory(TARGET_SELF, 163)
                and ai:GetStringIndexedNumber("L_WeaponType") == 10
        end
    elseif aa == 50 then
        return true
    end
    return false
end

function HasItemtypeX(self, ai, goal, itemType)
    for itemId, slot, _ in iterItems(ai) do
        if GetItemType(self, ai, itemId) == itemType then 
            return true 
        end
    end
    return false
end

function HasItemtypeX_CanUse(self, ai, goal, itemType)
    for itemId, slot, _ in iterItems(ai) do
        if GetItemType(self, ai, itemId) == itemType
                and CanUseItem(self, ai, goal, itemId) then
            return true
        end
    end
    return false
end

function ChangeBothHand_ForArts(self, ai, goal, artsAA)
    local rParam = GetArtsUsageParam(ai, ARM_R)
    local lParam = GetArtsUsageParam(ai, ARM_L)
    local rAA = GetUsageId_AA(ai, rParam)
    local lAA = GetUsageId_AA(ai, lParam)
    local lSub = 0
    local isFreyja = ai:HasSpecialEffectId(TARGET_SELF, 20018025)

    if lAA == 90 then 
        lSub = 1
        lAA = -1 
    end

    local bhState = ai:GetWeaponBothHandState(TARGET_SELF)

    if artsAA == rAA and artsAA == lAA then
        if bhState == ARM_R then 
            return ARM_R
        elseif bhState == ARM_L then 
            return ARM_L
        elseif lSub == 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            return ARM_R
        else 
            return ARM_R
        end

    elseif artsAA == rAA then
        if bhState == ARM_R then 
            return ARM_R
        elseif bhState == ARM_L then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            return ARM_R
        elseif lSub == 0 then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleR, TARGET_ENE_0, 999, 0, 0)
            return ARM_R
        else 
            return ARM_R
        end

    elseif artsAA == lAA then
        if isFreyja then
            if bhState == ARM_R then
                goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
            end
            return ARM_L
        elseif bhState == ARM_R then
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
            return ARM_L
        elseif bhState == ARM_L then
            return ARM_L
        else
            goal:AddSubGoal(GOAL_COMMON_AttackTunableSpin, 3, NPC_ATK_ChangeStyleL, TARGET_ENE_0, 999, 0, 0)
            return ARM_L
        end

    else
        goal:AddSubGoal(GOAL_COMMON_Wait, 0.1, TARGET_SELF)
        return -1
    end
end

function CanExecArts_Immediately(self, ai, goal, artsAA)
    local rParam = GetArtsUsageParam(ai, ARM_R)
    local lParam = GetArtsUsageParam(ai, ARM_L)
    local rAA = GetUsageId_AA(ai, rParam)
    local lAA = GetUsageId_AA(ai, lParam)
    local bhState = ai:GetWeaponBothHandState(TARGET_SELF)

    if bhState == ARM_R then 
        return (rAA == artsAA) and 1 or 0
    elseif bhState == ARM_L then 
        return (lAA == artsAA) and 1 or 0
    else
        local lArtsId = ai:GetArtsID(ARM_L)
        local lIsSpecial = (lArtsId >= 300 and lArtsId <= 399)
            or lArtsId == 117 or lArtsId == 223
            or lArtsId == 701 or lArtsId == 702
            or lArtsId == 1001 or lArtsId == 1002 or lArtsId == 1007
            or lArtsId == 1195 or lArtsId == 1196 or lArtsId == 1197
            or (lArtsId >= 400 and lArtsId <= 499)
        if lIsSpecial then
            return (lAA == artsAA) and 1 or 0
        else
            return (rAA == artsAA) and 1 or 0
        end
    end
end

function GetArtsShotButton(ai, arm, btn1, btn2)
    local wepId = ai:GetCurrentEquipWeaponId(TARGET_SELF, arm)
    local behav = ai:GetWeaponBehaviorVarID(wepId)
    local bowT  = GetBowType(behav)

    if bowT == -1 then
        return (ai:GetRandam_Int(0, 1) == 1) and btn1 or btn2
    end

    local isBolt = (bowT == 43 or bowT == 44)
    local ok0 = slotOk(ai, 0, isBolt, bowT)
    local ok1 = slotOk(ai, 1, isBolt, bowT)

    if ok0 and ok1 then 
        return (ai:GetRandam_Int(0, 1) == 1) and btn1 or btn2 
    end
    if ok0 then 
        return btn1 
    end
    if ok1 then 
        return btn2 
    end
    return NPC_ATK_DownHold_L2Hold
end
