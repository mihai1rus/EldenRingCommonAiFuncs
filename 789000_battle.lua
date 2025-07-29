RegisterTableGoal(GOAL_MirrorAberration789000_Battle, "MirrorAberration789000_Battle")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_MirrorAberration789000_Battle, true)

Goal.Initialize = function (self, ai, goal, battleActivatedCount)
    local unfavorableAttacks = {
        3000, 3001, 3002, 3003, 3004, 3005, 3006, 3007, 3008, 3009, 
        3010, 3011, 3012, 3013, 3014, 3015, 3016, 3017, 3018, 3019, 
        3020, 3021, 3022, 3023, 3024, 3025, 3028, 3030, 3031, 3032, 
        3033, 3034, 3035, 3036, 3037
    }
    for _, attackId in ipairs(unfavorableAttacks) do
        ai:EnableUnfavorableAttackCheck(0, attackId)
    end
    ai:SetNumber(1, 0)    
end

Goal.Activate = function (self, ai, goal)
    Init_Pseudo_Global(ai, goal)
    local probabilities = {}
    local acts = {}
    local paramTbls = {}
    Common_Clear_Param(probabilities, acts, paramTbls)
    DeleteObservedSpEffectRange(ai, 4005050, 0, 12)
    AddObservedSpEffectRange(ai, 789010, 0, 2)
    AddObservedSpEffectRange(ai, 789020, 0, 2)
    ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 4005400)
    ai:AddObserveSpecialEffectAttribute(TARGET_ENE_0, 30)
    local distance = ai:GetDist(TARGET_ENE_0)
    local distanceVertical = ai:GetDistY(TARGET_ENE_0)
    local hpRate = ai:GetHpRate(TARGET_SELF)
    local random = ai:GetRandam_Int(1, 100)
    local randomBubble = ai:GetRandam_Int(1, 3)
    local distanceTwo = ai:GetDist(TARGET_FRI_0)
    local groupThink = ai:GetExcelParam(AI_EXCEL_THINK_PARAM_TYPE__thinkAttr_doAdmirer)
    local casting = hpRate <= 0.65
    local phaseTwo = ai:HasSpecialEffectId(TARGET_SELF, 4005400)
    local bubbles = ai:HasSpecialEffectId(TARGET_SELF, 789010) == false and ai:HasSpecialEffectId(TARGET_SELF, 789011) == false and ai:HasSpecialEffectId(TARGET_SELF, 789012) == false
    local bubbleRemovedPrimary = ai:HasSpecialEffectId(TARGET_SELF, 789020) == false
    local bubbleRemovedSecondary = ai:HasSpecialEffectId(TARGET_SELF, 789021) == false
    local bubbleRemovedTertiary = ai:HasSpecialEffectId(TARGET_SELF, 789022) == false
    local bubblePrimary = ai:HasSpecialEffectId(TARGET_SELF, 789010)
    local bubbleSecondary = ai:HasSpecialEffectId(TARGET_SELF, 789011)
    local bubbleTertiary = ai:HasSpecialEffectId(TARGET_SELF, 789012)
    local summon = ai:IsEventFlag(1041322401) == false or ai:IsEventFlag(1041322421) == false or ai:IsEventFlag(1041322441) == false
    local forwardCheck = ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 120, 180, 100)
    local leftCheck = ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_L, 120, 180, 100)
    local rightCheck = ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_R, 120, 180, 100)
    if not phaseTwo and casting then
        probabilities[2] = 100
    elseif distance >= 15 then
        if forwardCheck then
            ActLot(probabilities, 1, 40, 0, phaseTwo)
            ActLot(probabilities, 22, 40, 0, phaseTwo)
            probabilities[4] = 60
            probabilities[7] = 60
            probabilities[8] = 70
            probabilities[10] = 60


            probabilities[18] = 60
        else
            ActLot(probabilities, 1, 50, 0, phaseTwo)
            ActLot(probabilities, 22, 40, 0, phaseTwo)
            probabilities[10] = 100

            
            probabilities[16] = 50
            probabilities[17] = 100
        end
    elseif distance >= 10 then
        if forwardCheck then
            ActLot(probabilities, 1, 70, 0, phaseTwo)
            ActLot(probabilities, 22, 70, 0, phaseTwo)
            probabilities[4] = 60
            probabilities[7] = 80
            probabilities[8] = 80
            probabilities[10] = 100

            
            probabilities[18] = 100
        else
            ActLot(probabilities, 1, 50, 0, phaseTwo)
            ActLot(probabilities, 22, 40, 0, phaseTwo)
            probabilities[10] = 60

            
            probabilities[16] = 50
            probabilities[17] = 100
        end
    elseif distance >= 5 then
        if forwardCheck then
            ActLot(probabilities, 1, 80, 0, phaseTwo)
            ActLot(probabilities, 22, 40, 0, phaseTwo)
            probabilities[4] = 100
            probabilities[9] = 100
            probabilities[10] = 100
            probabilities[12] = 100

            
            probabilities[18] = 50
        else
            ActLot(probabilities, 1, 60, 0, phaseTwo)
            ActLot(probabilities, 22, 40, 0, phaseTwo)
            probabilities[4] = 60
            probabilities[9] = 60
            probabilities[10] = 70

            
            probabilities[16] = 50
            probabilities[17] = 100
        end
    elseif distance >= 3 then
        if forwardCheck then
            ActLot(probabilities, 1, 50, 0, phaseTwo)
            ActLot(probabilities, 22, 50, 0, phaseTwo)
            probabilities[3] = 60
            probabilities[4] = 50
            probabilities[5] = 70
            probabilities[6] = 50
            probabilities[7] = 80
            probabilities[8] = 80
            probabilities[9] = 100
            probabilities[10] = 100
            probabilities[12] = 100
            probabilities[13] = 100
            probabilities[14] = 60

            
            probabilities[16] = 50
            probabilities[17] = 60
        elseif leftCheck then
            ActLot(probabilities, 1, 60, 0, phaseTwo)
            ActLot(probabilities, 22, 60, 0, phaseTwo)
            probabilities[4] = 60
            probabilities[5] = 50
            probabilities[6] = 70
            probabilities[7] = 80
            probabilities[8] = 80
            probabilities[9] = 100
            probabilities[10] = 100
            probabilities[12] = 100
            probabilities[13] = 70
            probabilities[14] = 70

            
            probabilities[16] = 50
            probabilities[17] = 60
        elseif rightCheck then
            ActLot(probabilities, 1, 60, 0, phaseTwo)
            ActLot(probabilities, 22, 60, 0, phaseTwo)
            probabilities[3] = 60
            probabilities[4] = 60
            probabilities[5] = 50
            probabilities[7] = 80
            probabilities[8] = 80
            probabilities[9] = 100
            probabilities[10] = 100
            probabilities[12] = 100

            
            probabilities[16] = 50
            probabilities[17] = 60
        else
            ActLot(probabilities, 1, 60, 0, phaseTwo)
            ActLot(probabilities, 22, 60, 0, phaseTwo)
            probabilities[4] = 100
            probabilities[5] = 60
            probabilities[7] = 80
            probabilities[8] = 100
            probabilities[9] = 60
            probabilities[10] = 60
            probabilities[12] = 100

            
            probabilities[16] = 100
            probabilities[17] = 100
        end
    elseif forwardCheck then
        ActLot(probabilities, 1, 60, 0, phaseTwo)
        ActLot(probabilities, 22, 60, 0, phaseTwo)
        probabilities[3] = 75
        probabilities[4] = 80
        probabilities[5] = 50
        probabilities[6] = 50
        probabilities[9] = 100
        probabilities[10] = 100
        probabilities[12] = 100
        probabilities[13] = 60
        probabilities[14] = 70

        
        probabilities[16] = 70
        probabilities[17] = 70
    elseif leftCheck then
        ActLot(probabilities, 1, 60, 0, phaseTwo)
        ActLot(probabilities, 22, 60, 0, phaseTwo)
        probabilities[4] = 60
        probabilities[5] = 50
        probabilities[6] = 70
        probabilities[9] = 100
        probabilities[10] = 100
        probabilities[12] = 100
        probabilities[13] = 70
        probabilities[14] = 70

        
        probabilities[16] = 50
        probabilities[17] = 60
    elseif rightCheck then
        ActLot(probabilities, 1, 60, 0, phaseTwo)
        ActLot(probabilities, 22, 60, 0, phaseTwo)
        probabilities[3] = 60
        probabilities[4] = 60
        probabilities[5] = 50
        probabilities[9] = 100
        probabilities[10] = 100
        probabilities[12] = 100

        
        probabilities[16] = 50
        probabilities[17] = 60
    else
        ActLot(probabilities, 1, 60, 0, phaseTwo)
        ActLot(probabilities, 22, 60, 0, phaseTwo)
        probabilities[4] = 100
        probabilities[5] = 60
        probabilities[9] = 60
        probabilities[10] = 60
        probabilities[12] = 100

        
        probabilities[16] = 100
        probabilities[17] = 100
    end
    ActLot(probabilities, 2, 100, 0, casting, bubbles)
    ActLot(probabilities, 19, 100, 0, phaseTwo, bubblePrimary, bubbleRemovedPrimary)
    ActLot(probabilities, 20, 100, 0, phaseTwo, bubbleSecondary, bubbleRemovedSecondary)
    ActLot(probabilities, 21, 100, 0, phaseTwo, bubbleTertiary, bubbleRemovedTertiary)
    ActLot(probabilities, 11, 200, 0, phaseTwo, summon)
    local coolDowns = {
        [1] = {{3009, 3010}, 15, 1},
        [2] = phaseTwo and {{3014, 3019}, 45, 0} or nil,
        [3] = {3015, 12, 1},
        [4] = {{3014, 3019}, 45, 0},
        [5] = {3020, 10, 1},
        [6] = {3024, 12, 1},
        [7] = {3028, 15, 1},
        [8] = {3029, 20, 1},
        [9] = {3030, 20, 1},
        [10] = {3031, 15, 1},
        [11] = {3032, 20, 0},
        [12] = {3033, 20, 0},
        [13] = {3035, 20, 1},
        [14] = {3038, 13, 1},
        [16] = {6001, 5, 1},
        [17] = {{6002, 6003}, 5, 1},
        [18] = {6000, 5, 1},
        [19] = {{3016, 3017, 3034}, 15, 0},
        [20] = {{3016, 3017, 3034}, 15, 0},
        [21] = {{3016, 3017, 3034}, 15, 0},
        [22] = {3013, 15, 1}
    }
    ApplyCooldowns(ai, goal, probabilities, coolDowns)
    RegisterEnemyActs(ai, goal, "MirrorAberration789000", 22, probabilities, paramTbls, acts)
    
end

-- Fly Up and Slam
function MirrorAberration789000_Act1(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 7,
        animId = 3010,
        observeEffect = 4005051
    })
end

-- Casting
function MirrorAberration789000_Act2(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 12,
        animId = 3014
    })
end

-- Left - Right Uppercut
function MirrorAberration789000_Act3(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 4.5,
        animId = 3015,
        observeEffect = 4005052
    })   
end

-- Ritual
function MirrorAberration789000_Act4(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 12,
        animId = 3019
    })   
end

-- Axe Slam
function MirrorAberration789000_Act5(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 5,
        animId = 3020,
        observeEffect = 4005053
    }) 
end

-- Right - Left Swipe
function MirrorAberration789000_Act6(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 4.5,
        animId = 3024,
        observeEffect = 4005056
    })   
end

-- Jumping Slam
function MirrorAberration789000_Act7(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 7,
        animId = 3028
    })
end

-- Running Right - Left Swipe
function MirrorAberration789000_Act8(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 8.5,
        animId = 3029
    })
end

-- Hilt Bash
function MirrorAberration789000_Act9(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 7,
        animId = 3030
    })  
end

-- Quick Hook
function MirrorAberration789000_Act10(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 10,
        animId = 3031
    })  
end

-- Tentacles 1
function MirrorAberration789000_Act11(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 6,
        animId = 3032
    })  
end

-- Tentacles 2
function MirrorAberration789000_Act12(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 8,
        animId = 3033
    })
end

-- Powerful Slam
function MirrorAberration789000_Act13(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 5.5,
        animId = 3035,
        observeEffect = 4005060
    })
end

-- Right - Left Swipe
function MirrorAberration789000_Act14(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 4.5,
        animId = 3038,
        observeEffect = 4005062
    })
end


function MirrorAberration789000_Act15(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_SidewayMove, ai:GetRandam_Float(2, 2.5), TARGET_ENE_0, ai:GetRandam_Int(0, 1), ai:GetRandam_Int(30, 45), true, true, -1)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function MirrorAberration789000_Act16(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_StepSafety, 3, -1, 1, -1, -1, TARGET_ENE_0, 0, 0, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function MirrorAberration789000_Act17(ai, goal, paramTbl)
    if ai:IsInsideTarget(TARGET_ENE_0, AI_DIR_TYPE_R, 180) then
        goal:AddSubGoal(GOAL_COMMON_StepSafety, 3, -1, -1, 1, -1, TARGET_ENE_0, 0, 0, true)
    else
        goal:AddSubGoal(GOAL_COMMON_StepSafety, 3, -1, -1, -1, 1, TARGET_ENE_0, 0, 0, true)
    end
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

function MirrorAberration789000_Act18(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_COMMON_StepSafety, 3, 1, -1, -1, -1, TARGET_ENE_0, 0, 0, true)
    GetWellSpace_Odds = 0
    return GetWellSpace_Odds
    
end

-- Shoot Cannon Forward Bubble 1
function MirrorAberration789000_Act19(ai, goal, paramTbl)
    return SetupAttack(ai, goal, {
        animId = 3017
    }) 
end

-- Shoot Cannon Upwards Bubble 2
function MirrorAberration789000_Act20(ai, goal, paramTbl)
    return SetupAttack(ai, goal, {
        animId = 3016
    }) 
end

-- Shoot Cannon Powerful Bubble 3
function MirrorAberration789000_Act21(ai, goal, paramTbl)
    return SetupAttack(ai, goal, {
        animId = 3034
    }) 
end

-- Flying Spin
function MirrorAberration789000_Act22(ai, goal, paramTbl)
    return SetupApproach(ai, goal, {
        dist = 10,
        animId = 3013
    }) 
end


function MirrorAberration789000_ActAfter_AdjustSpace(ai, goal, paramTbl)
    goal:AddSubGoal(GOAL_MirrorAberration789000_AfterAttackAct, 10)
    
end

Goal.Update = function (self, ai, goal)
    return Update_Default_NoSubGoal(self, ai, goal)
    
end

Goal.Terminate = function (self, ai, goal)
    
end

Goal.Interrupt = function (self, ai, goal)
    local test = ai:HasSpecialEffectId(TARGET_ENE_0, 140)
    ScriptReload(ai, goal, test, "C:\\Program Files (x86)\\Steam\\steamapps\\common\\ELDEN RING\\Game\\TestMod\\script\\789000_battle-luabnd-dcx\\789000_battle.lua")
    local distance = ai:GetDist(TARGET_ENE_0)
    local successDistance = 5 - ai:GetMapHitRadius(TARGET_SELF)
    local turnTime = 0
    local turnFaceAngle = 0
    local random = ai:GetRandam_Int(1, 100)
    local hpRate = ai:GetHpRate(TARGET_SELF)
    local phaseTwo = ai:HasSpecialEffectId(TARGET_SELF, 4005400)
    local forwardCheck = ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 5)
    if ai:IsInterupt(INTERUPT_ActivateSpecialEffect) then
        if ai:GetSpecialEffectActivateInterruptId(4005051) then
            if forwardCheck then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptId(4005052) then
            if forwardCheck then
                if phaseTwo then
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3037, TARGET_ENE_0, 999, 0, 0)
                    return true
                else
                    goal:ClearSubGoal()
                    goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3023, TARGET_ENE_0, 999, 0, 0)
                    return true
                end
            end
        elseif ai:GetSpecialEffectActivateInterruptId(4005053) then
            if forwardCheck then
                goal:ClearSubGoal()
                ai:SetNumber(1, ai:GetNumber(1) + 1)
                ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 4005054)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptId(4005054) then
            if forwardCheck and ai:GetNumber(1) <= 2 then
                goal:ClearSubGoal()
                ai:SetNumber(1, ai:GetNumber(1) + 1)
                ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 4005054)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3021, TARGET_ENE_0, 999, 0, 0)
                return true
            elseif forwardCheck then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3026, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptId(4005056) then
            if ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 6) then
                goal:ClearSubGoal()
                ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 4005057)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3025, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptId(4005057) and phaseTwo then
            if ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 8) then
                goal:ClearSubGoal()
                ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 4005050)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3009, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptId(4005060) then
            if forwardCheck then
                goal:ClearSubGoal()
                ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 4005061)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3036, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptId(4005061) then
            if ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 6.5) then
                goal:ClearSubGoal()
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3037, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        elseif ai:GetSpecialEffectActivateInterruptId(4005062) then
            if ai:IsInsideTargetCustom(TARGET_SELF, TARGET_ENE_0, AI_DIR_TYPE_F, 180, 180, 6.5) then
                goal:ClearSubGoal()
                ai:AddObserveSpecialEffectAttribute(TARGET_SELF, 4005057)
                goal:AddSubGoal(GOAL_COMMON_ComboRepeat_SuccessAngle180, 10, 3025, TARGET_ENE_0, 999, 0, 0)
                return true
            end
        end
    end
    return false
end

RegisterTableGoal(GOAL_MirrorAberration789000_AfterAttackAct, "MirrorAberration789000_AfterAttackAct")
REGISTER_GOAL_NO_SUB_GOAL(GOAL_MirrorAberration789000_AfterAttackAct, true)

Goal.Activate = function (self, ai, goal)
    
end

Goal.Update = function (self, ai, goal)
    return Update_Default_NoSubGoal(self, ai, goal)
    
end


