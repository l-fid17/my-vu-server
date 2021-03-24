class('Bot');

require('__shared/Config');
require('__shared/NodeCollection')
require('Globals');
require('PathSwitcher')

local Utilities = require('__shared/Utilities')

function Bot:__init(player)
	--Player Object
	self.player = player;
	self.name = player.name;
	self.id = player.id;

	--common settings
	self._spawnMode = 0;
	self._moveMode = 0;
	self.kit = "";
	self.color = "";
	self.activeWeapon = nil;
	self.primary = nil;
	self.pistol = nil;
	self.gadget2 = nil;
	self.gadget1 = nil;
	self.grenade = nil;
	self.knife = nil;
	self._checkSwapTeam = false;
	self._respawning = false;

	--timers
	self._updateTimer = 0;
	self._aimUpdateTimer = 0;
	self._spawnDelayTimer = 0;
	self._wayWaitTimer = 0;
	self._wayWaitYawTimer = 0;
	self._obstaceSequenceTimer = 0;
	self._stuckTimer = 0;
	self._shotTimer = -Config.botFirstShotDelay;
	self._shootModeTimer = 0;
	self._reloadTimer = 0;
	self._deployTimer = 0;
	self._attackModeMoveTimer = 0;
	self._meleeCooldownTimer = 0;
	self._shootTraceTimer = 0;
	self._actionTimer = 0;

	--shared movement vars
	self.activeMoveMode = 0;
	self.activeSpeedValue = 0;
	self.knifeMode = false;

	--advanced movement
	self._attackMode = 0;
	self._currentWayPoint = nil;
	self._targetYaw = 0;
	self._targetPitch = 0;
	self._targetPoint = nil;
	self._nextTargetPoint = nil;
	self._pathIndex = 0;
	self._meleeActive = false;
	self._lastWayDistance = 0;
	self._invertPathDirection = false;
	self._obstacleRetryCounter = 0;
	self._zombieSpeedValue = 0;
	self._objective = '';
	self._onSwitch = false;
	self._actionActive = false;
	self._reviveActive = false;
	self._deployActive = false;
	self._grenadeActive	= false;

	--shooting
	self._shoot = false;
	self._shootPlayer = nil;
	self._weaponToUse = "Primary";
	self._shootWayPoints = {};
	self._knifeWayPositions = {};
	self._lastTargetTrans = Vec3();
	self._lastShootPlayer = nil;

	--simple movement
	self._botSpeed = 0;
	self._targetPlayer = nil;
	self._spawnTransform = LinearTransform();
end

function Bot:onUpdate(dt)
	if self.player.soldier ~= nil then
		self.player.soldier:SingleStepEntry(self.player.controlledEntryId);
	end

	if g_Globals.isInputAllowed then
		self._updateTimer		= self._updateTimer + dt;
		self._aimUpdateTimer	= self._aimUpdateTimer + dt;

		if self._aimUpdateTimer > StaticConfig.botAimUpdateCycle then
			self:_updateAiming();
			self._aimUpdateTimer = 0; --reset afterwards, to use it for targetinterpolation
		end

		self:_updateYaw();

		if self._updateTimer > StaticConfig.botUpdateCycle then
			self._updateTimer = 0;

			self:_setActiveVars();
			self:_updateRespwawn();
			self:_updateShooting();
			self:_updateMovement(); --TODO: move-mode shoot
		end
	end
end

--public functions
function Bot:revive(player)
	if self.kit == "Assault" and player.corpse ~= nil then
		if Config.botsRevive then
			self._reviveActive = true;
			self._shootPlayer = player;
		end
	end
end

function Bot:shootAt(player, ignoreYaw)
	if self._actionActive or self._reviveActive then
		return false;
	end

	-- don't shoot at teammates
	if self.player.teamId == player.teamId then
		return false;
	end

	if player.soldier == nil or self.player.soldier == nil then
		return false;
	end

	-- don't shoot if too far away
	if not ignoreYaw then
		local distance = player.soldier.worldTransform.trans:Distance(self.player.soldier.worldTransform.trans);

		if self.activeWeapon.type ~= "Sniper" and distance > Config.maxShootDistanceNoSniper then
			return false;
		end
	end

	local dYaw		= 0;
	local fovHalf	= 0;

	if not ignoreYaw then
		local oldYaw	= self.player.input.authoritativeAimingYaw;
		local dy		= player.soldier.worldTransform.trans.z - self.player.soldier.worldTransform.trans.z;
		local dx		= player.soldier.worldTransform.trans.x - self.player.soldier.worldTransform.trans.x;
		local yaw		= (math.atan(dy, dx) > math.pi / 2) and (math.atan(dy, dx) - math.pi / 2) or (math.atan(dy, dx) + 3 * math.pi / 2);

		dYaw			= math.abs(oldYaw-yaw);

		if dYaw > math.pi then
			dYaw =math.pi * 2 - dYaw;
		end

		fovHalf = Config.fovForShooting / 360 * math.pi;
	end

	if dYaw < fovHalf or ignoreYaw then
		if self._shoot then
			if self._shootPlayer == nil or self._shootModeTimer > Config.botMinTimeShootAtPlayer or (self.knifeMode and self._shootModeTimer > (Config.botMinTimeShootAtPlayer/2)) then
				self._shootModeTimer		= 0;
				self._shootPlayer			= player;
				self._lastShootPlayer 		= player;
				self._lastTargetTrans 		= player.soldier.worldTransform.trans:Clone();
				self._knifeWayPositions 	= {};
				
				if self.knifeMode then
					table.insert(self._knifeWayPositions, self._lastTargetTrans);
				end
				
				return true;
			end
		else
			self._shootModeTimer = Config.botFireModeDuration;
			return false;
		end
	end
	
	return false
end

function Bot:setVarsDefault()
	self._spawnMode		= 5;
	self._moveMode		= 5;
	self._botSpeed		= 3;
	self._pathIndex		= 1;
	self._respawning	= g_Globals.respawnWayBots;
	self._shoot			= g_Globals.attackWayBots;
end

function Bot:resetVars()
	self._spawnMode				= 0;
	self._moveMode				= 0;
	self._pathIndex				= 0;
	self._respawning			= false;
	self._shoot					= false;
	self._targetPlayer			= nil;
	self._shootPlayer			= nil;
	self._lastShootPlayer		= nil;
	self._invertPathDirection	= false;
	self._shotTimer				= -Config.botFirstShotDelay;
	self._updateTimer			= 0;
	self._aimUpdateTimer		= 0; --timer sync
	self._targetPoint			= nil;
	self._nextTargetPoint		= nil;
	self._knifeWayPositions		= {};
	self._shootWayPoints 		= {};
	self._zombieSpeedValue 		= 0;
	self._spawnDelayTimer		= 0;
	self._objective 			= '';
	self._meleeActive 			= false;
	self._actionActive 			= false;
	self._reviveActive 			= false;
	self._deployActive 			= false;
	self._grenadeActive			= false;
	self._weaponToUse 			= "Primary";

	self.player.input:SetLevel(EntryInputActionEnum.EIAZoom, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeFastMelee, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAMeleeAttack, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0.0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAThrottle, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIASprint, 0);
end

function Bot:setVarsStatic(player)
	self._spawnMode		= 0;
	self._moveMode		= 0;
	self._pathIndex		= 0;
	self._respawning	= false;
	self._shoot			= false;
	self._targetPlayer	= player;
end

function Bot:setVarsSimpleMovement(player, spawnMode, transform)
	self._spawnMode		= spawnMode;
	self._moveMode		= 2;
	self._botSpeed		= 3;
	self._pathIndex		= 0;
	self._respawning	= false;
	self._shoot			= false;
	self._targetPlayer	= player;

	if transform ~= nil then
		self._spawnTransform = transform;
	end
end

function Bot:setVarsWay(player, useRandomWay, pathIndex, currentWayPoint, inverseDirection)
	if useRandomWay then
		self._spawnMode		= 5;
		self._targetPlayer	= nil;
		self._shoot			= g_Globals.attackWayBots;
		self._respawning	= g_Globals.respawnWayBots;
	else
		self._spawnMode		= 4;
		self._targetPlayer	= player;
		self._shoot			= false;
		self._respawning	= false;
	end

	self._botSpeed				= 3;
	self._moveMode				= 5;
	self._pathIndex				= pathIndex;
	self._currentWayPoint		= currentWayPoint;
	self._invertPathDirection	= inverseDirection;
end

function Bot:isStaticMovement()
	if self._moveMode == 0 or self._moveMode == 3 or self._moveMode == 4 then
		return true;
	else
		return false;
	end
end

function Bot:setMoveMode(moveMode)
	self._moveMode = moveMode;
end

function Bot:setRespawn(respawn)
	self._respawning = respawn;
end

function Bot:setShoot(shoot)
	self._shoot = shoot;
end

function Bot:setSpeed(speed)
	self._botSpeed = speed;
end

function Bot:setObjective(objective)
	self._objective = objective or '';
end

function Bot:getObjective(objective)
	return self._objective
end

function Bot:getSpawnMode()
	return self._spawnMode;
end

function Bot:getWayIndex()
	return self._pathIndex;
end

function Bot:getSpawnTransform()
	return self._spawnTransform;
end

function Bot:getTargetPlayer()
	return self._targetPlayer;
end

function Bot:isInactive()
	if self.player.alive or self._spawnMode ~= 0 then
		return false;
	else
		return true;
	end
end

function Bot:resetSpawnVars()
	self._spawnDelayTimer		= 0;
	self._obstaceSequenceTimer	= 0;
	self._obstacleRetryCounter	= 0;
	self._lastWayDistance		= 1000;
	self._shootPlayer			= nil;
	self._lastShootPlayer		= nil;
	self._shootModeTimer		= 0;
	self._meleeCooldownTimer	= 0;
	self._shootTraceTimer		= 0;
	self._reloadTimer 			= 0;
	self._deployTimer 			= MathUtils:GetRandomInt(1, Config.deployCycle);
	self._attackModeMoveTimer	= 0;
	self._attackMode 			= 0;
	self._shootWayPoints		= {};

	self._shotTimer				= -Config.botFirstShotDelay;
	self._updateTimer			= 0;
	self._aimUpdateTimer		= 0; --timer sync
	self._stuckTimer			= 0;
	self._targetPoint			= nil;
	self._nextTargetPoint		= nil;
	self._meleeActive 			= false;
	self._knifeWayPositions		= {};
	self._zombieSpeedValue 		= 0;
	self._onSwitch 				= false;
	self._actionActive 			= false;
	self._reviveActive 			= false;
	self._deployActive 			= false;
	self._grenadeActive			= false;
	self._weaponToUse 			= "Primary";

	self.player.input:SetLevel(EntryInputActionEnum.EIAZoom, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeFastMelee, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAMeleeAttack, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0.0);
	self.player.input:SetLevel(EntryInputActionEnum.EIAThrottle, 0);
	self.player.input:SetLevel(EntryInputActionEnum.EIASprint, 0);
end

function Bot:clearPlayer(player)
	if self._shootPlayer == player then
		self._shootPlayer = nil;
	end

	if self._targetPlayer == player then
		self._targetPlayer = nil;
	end

	if self._lastShootPlayer == player then
		self._lastShootPlayer = nil;
	end
end

function Bot:kill()
	self:resetVars();
	
	if self.player.alive then
		self.player.soldier:Kill();
	end
end

function Bot:destroy()
	self:resetVars();
	self.player.input	= nil;

	PlayerManager:DeletePlayer(self.player);
	self.player			= nil;
end

-- private functions
function Bot:_updateRespwawn()
	if self._respawning and self.player.soldier == nil and self._spawnMode > 0 then
		-- wait for respawn-delay gone
		if self._spawnDelayTimer < g_Globals.respawnDelay then
			self._spawnDelayTimer = self._spawnDelayTimer + StaticConfig.botUpdateCycle;
		else
			Events:DispatchLocal('Bot:RespawnBot', self.name);
		end
	end
end

function Bot:_updateAiming()
	if (not self.player.alive or self._shootPlayer == nil) then
		return
	end
	if not self._reviveActive then
		if (not self._shoot or self._shootPlayer.soldier == nil or self.activeWeapon == nil) then
			return;
		end
		--interpolate player movement
		local targetMovement		= Vec3.zero;
		local pitchCorrection		= 0.0;
		local fullPositionTarget	=  self._shootPlayer.soldier.worldTransform.trans:Clone() + Utilities:getCameraPos(self._shootPlayer, true);
		local fullPositionBot		= self.player.soldier.worldTransform.trans:Clone() + Utilities:getCameraPos(self.player, false);

		if not self.knifeMode then
			local distanceToPlayer	= fullPositionTarget:Distance(fullPositionBot);
			--calculate how long the distance is --> time to travel
			local timeToTravel = 0
			if self.activeWeapon.type == "Grenade" then
				timeToTravel 		=  2 * 0.8 * self.activeWeapon.bulletSpeed / self.activeWeapon.bulletDrop;
			else
				timeToTravel		= (distanceToPlayer / self.activeWeapon.bulletSpeed);
			end
			local factorForMovement	= (timeToTravel) / self._aimUpdateTimer;
			pitchCorrection	= 0.5 * timeToTravel * timeToTravel * self.activeWeapon.bulletDrop;
			
			if self._lastShootPlayer == self._shootPlayer then
				targetMovement			= (fullPositionTarget - self._lastTargetTrans) * factorForMovement; --movement in one dt
			end

			self._lastShootPlayer = self._shootPlayer;
			self._lastTargetTrans = fullPositionTarget;
		end

		--calculate yaw and pitch
		local dz		= fullPositionTarget.z + targetMovement.z - fullPositionBot.z;
		local dx		= fullPositionTarget.x + targetMovement.x - fullPositionBot.x;
		local dy		= fullPositionTarget.y + targetMovement.y + pitchCorrection - fullPositionBot.y;
		local atanDzDx	= math.atan(dz, dx);
		local yaw		= (atanDzDx > math.pi / 2) and (atanDzDx - math.pi / 2) or (atanDzDx + 3 * math.pi / 2);

		--calculate pitch
		local distance	= math.sqrt(dz ^ 2 + dx ^ 2);
		local pitch		= math.atan(dy, distance);

		self._targetPitch	= pitch;
		self._targetYaw		= yaw;
	else
		if (self._shootPlayer.corpse == nil) then
			return;
		end
		local positionTarget	=  self._shootPlayer.corpse.worldTransform.trans:Clone();
		local positionBot		= self.player.soldier.worldTransform.trans:Clone() + Utilities:getCameraPos(self.player, false);

		local dz		= positionTarget.z - positionBot.z;
		local dx		= positionTarget.x - positionBot.x;
		local dy		= positionTarget.y - positionBot.y;

		local atanDzDx	= math.atan(dz, dx);
		local yaw		= (atanDzDx > math.pi / 2) and (atanDzDx - math.pi / 2) or (atanDzDx + 3 * math.pi / 2);

		--calculate pitch
		local distance	= math.sqrt(dz ^ 2 + dx ^ 2);
		local pitch		= math.atan(dy, distance);

		self._targetPitch	= pitch;
		self._targetYaw		= yaw;
	end
end

function Bot:_updateYaw()
	if self._meleeActive then
		return;
	end
	
	if self._targetPoint ~= nil and self._shootPlayer == nil and self.player.soldier ~= nil then
		if self.player.soldier.worldTransform.trans:Distance(self._targetPoint.Position) < 0.2 then
			self._targetPoint = self._nextTargetPoint;
		end
		
		local dy		= self._targetPoint.Position.z - self.player.soldier.worldTransform.trans.z;
		local dx		= self._targetPoint.Position.x - self.player.soldier.worldTransform.trans.x;
		local atanDzDx	= math.atan(dy, dx);
		local yaw		= (atanDzDx > math.pi / 2) and (atanDzDx - math.pi / 2) or (atanDzDx + 3 * math.pi / 2);
		self._targetYaw = yaw;
	end
	
	if self.knifeMode then
		if self._shootPlayer ~= nil and self.player.soldier ~= nil then
			if #self._knifeWayPositions > 0 then
				local dy		= self._knifeWayPositions[1].z - self.player.soldier.worldTransform.trans.z;
				local dx		= self._knifeWayPositions[1].x - self.player.soldier.worldTransform.trans.x;
				local atanDzDx	= math.atan(dy, dx);
				local yaw		= (atanDzDx > math.pi / 2) and (atanDzDx - math.pi / 2) or (atanDzDx + 3 * math.pi / 2);
				self._targetYaw = yaw;
				
				if self.player.soldier.worldTransform.trans:Distance(self._knifeWayPositions[1]) < 1.5 then
					table.remove(self._knifeWayPositions, 1);
				end
			end
		end
	end

	local deltaYaw = self.player.input.authoritativeAimingYaw - self._targetYaw;
	
	if deltaYaw > math.pi then
		deltaYaw = deltaYaw - 2*math.pi
	elseif deltaYaw < -math.pi then
		deltaYaw = deltaYaw + 2*math.pi
	end

	local absDeltaYaw	= math.abs(deltaYaw);
	local inkrement 	= g_Globals.yawPerFrame;
	
	if absDeltaYaw < inkrement then
		self.player.input.authoritativeAimingYaw	= self._targetYaw;
		self.player.input.authoritativeAimingPitch	= self._targetPitch;
		return;
	end

	if deltaYaw > 0  then
		inkrement = -inkrement;
	end
	
	local tempYaw = self.player.input.authoritativeAimingYaw + inkrement;
	
	if tempYaw >= (math.pi * 2) then
		tempYaw = tempYaw - (math.pi * 2);
	elseif tempYaw < 0.0 then
		tempYaw = tempYaw + (math.pi * 2);
	end
	
	self.player.input.authoritativeAimingYaw	= tempYaw
	self.player.input.authoritativeAimingPitch	= self._targetPitch;
end


function Bot:_updateShooting()
	if self.player.alive and self._shoot then
		--select weapon-slot TODO: keep button pressed or not?
		if not self._meleeActive then
			if self.player.soldier.weaponsComponent ~= nil then
				if self.knifeMode then
					if self.player.soldier.weaponsComponent.currentWeaponSlot ~= WeaponSlot.WeaponSlot_7 then
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon7, 1);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon6, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon5, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon3, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon2, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon1, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
						self.activeWeapon = self.knife;
						self._shotTimer = 0;
					else
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon7, 0);
					end
				elseif self._reviveActive or (self._weaponToUse == "Gadget2" and Config.botWeapon == "Auto") or Config.botWeapon == "Gadget2" then
					if self.player.soldier.weaponsComponent.currentWeaponSlot ~= WeaponSlot.WeaponSlot_5 then
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon7, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon6, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon5, 1);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon3, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon2, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon1, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
						self.activeWeapon = self.gadget2;
						self._shotTimer = 0;
					else
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon5, 0);
					end
				elseif self._deployActive or (self._weaponToUse == "Gadget1" and Config.botWeapon == "Auto") or Config.botWeapon == "Gadget1" then
					if self.player.soldier.weaponsComponent.currentWeaponSlot ~= WeaponSlot.WeaponSlot_2 then
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon7, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon6, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon5, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon3, 1);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon2, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon1, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
						self.activeWeapon = self.gadget1;
						self._shotTimer = 0;
					else
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon3, 0);
					end
				elseif self._grenadeActive or (self._weaponToUse == "Grenade" and Config.botWeapon == "Auto") or Config.botWeapon == "Grenade" then
					if self.player.soldier.weaponsComponent.currentWeaponSlot ~= WeaponSlot.WeaponSlot_6 then
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon7, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon6, 1);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon5, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon3, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon2, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon1, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
						self.activeWeapon = self.grenade;
						self._shotTimer = 0;
					else
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon6, 0);
					end
				elseif (self._weaponToUse == "Pistol" and Config.botWeapon == "Auto") or Config.botWeapon == "Pistol" then
					if self.player.soldier.weaponsComponent.currentWeaponSlot ~= WeaponSlot.WeaponSlot_1 then
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon7, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon6, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon5, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon3, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon2, 1);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon1, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
						self.activeWeapon = self.pistol;
						self._shotTimer = 0;
					else
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon2, 0);
					end
				elseif (self._weaponToUse == "Primary" and Config.botWeapon == "Auto") or Config.botWeapon == "Primary" then
					if self.player.soldier.weaponsComponent.currentWeaponSlot ~= WeaponSlot.WeaponSlot_0 then
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon7, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon6, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon5, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon3, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon2, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon1, 1);
						self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
						self.activeWeapon = self.primary;
						self._shotTimer = 0;
					else
						self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon1, 0);
					end
				end
			end
		end

		if self._shootPlayer ~= nil and self._shootPlayer.soldier ~= nil then
			if self._shootModeTimer < Config.botFireModeDuration or (Config.zombieMode and self._shootModeTimer < (Config.botFireModeDuration * 4)) then
				self._deployActive = false;
				self.player.input:SetLevel(EntryInputActionEnum.EIAZoom, 1); --does not work.
				self.player.input:SetLevel(EntryInputActionEnum.EIAReload, 0);
				self._shootModeTimer	= self._shootModeTimer + StaticConfig.botUpdateCycle;
				self.activeMoveMode		= 9; -- movement-mode : attack
				self._reloadTimer		= 0; -- reset reloading

				--check for melee attack
				if Config.meleeAttackIfClose and not self._meleeActive and self._meleeCooldownTimer <= 0 and self._shootPlayer.soldier.worldTransform.trans:Distance(self.player.soldier.worldTransform.trans) < 2 then
					self._meleeActive = true;
					self.activeWeapon = self.knife;
					
					self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
					self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon7, 1);
					self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeFastMelee, 1);
					self.player.input:SetLevel(EntryInputActionEnum.EIAMeleeAttack, 1);
					self._meleeCooldownTimer = Config.meleeAttackCoolDown;
					
					if not USE_REAL_DAMAGE then
						Events:DispatchLocal("ServerDamagePlayer", self._shootPlayer.name, self.player.name, true);
					end
				else
					if self._meleeCooldownTimer < 0 then
						self._meleeCooldownTimer = 0;
					elseif self._meleeCooldownTimer > 0 then
						self._meleeCooldownTimer = self._meleeCooldownTimer - StaticConfig.botUpdateCycle;
						if self._meleeCooldownTimer < (Config.meleeAttackCoolDown - 0.8) then
							self._meleeActive = false;
							self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeFastMelee, 0);
							self.player.input:SetLevel(EntryInputActionEnum.EIAMeleeAttack, 0);
						end
					end
				end

				if self._grenadeActive then -- throw grenade
					if self.player.soldier.weaponsComponent.currentWeapon.secondaryAmmo <= 1 then
						self.player.soldier.weaponsComponent.currentWeapon.secondaryAmmo = self.player.soldier.weaponsComponent.currentWeapon.secondaryAmmo + 1
					end
					if self._shotTimer > 0.5 then
						self._grenadeActive = false;
					end
				end
				-- target in vehicle - use gadget 2 if rocket --TODO: don't shoot with other classes
				if self._shootPlayer.attachedControllable ~= nil then
					if self.gadget2 ~= nil then
						if self.gadget2.type == "Rocket" then
							self._weaponToUse = "Gadget2"
							if self.player.soldier.weaponsComponent.currentWeapon.secondaryAmmo <= 2 then
								self.player.soldier.weaponsComponent.currentWeapon.secondaryAmmo = self.player.soldier.weaponsComponent.currentWeapon.secondaryAmmo + 3
							end
						end
					end
				else
					if self.knifeMode or self._meleeActive then
						self._weaponToUse = "Knife"
					else
						if not self._grenadeActive and self.player.soldier.weaponsComponent.weapons[1] ~= nil then
							if self.player.soldier.weaponsComponent.weapons[1].primaryAmmo == 0 then
								self._weaponToUse = "Pistol"
							else
								self._weaponToUse = "Primary"
							end
						end
						-- use grenade from time to time
						if Config.botsThrowGrenades then
							local targetTimeValue = Config.botFireModeDuration - 1.0;
							if ((self._shootModeTimer >= targetTimeValue) and (self._shootModeTimer < (targetTimeValue + StaticConfig.botUpdateCycle))) or Config.botWeapon == "Grenade" then
								-- should be triggered only once per fireMode
								if MathUtils:GetRandomInt(0,100) < 18 then
									if self.grenade ~= nil then
										self._grenadeActive = true;
									end
								end
							end
						end
					end
				end

				--trace way back
				if self.activeWeapon ~= nil and self.activeWeapon.type ~= "Sniper" or self.knifeMode then
					if self._shootTraceTimer > StaticConfig.traceDeltaShooting then
						--create a Trace to find way back
						self._shootTraceTimer 	= 0;
						local point				= {
							Position = self.player.soldier.worldTransform.trans:Clone(),
							SpeedMode = 4,			-- 0 = wait, 1 = prone, 2 = crouch, 3 = walk, 4 run
							ExtraMode = 0,
							OptValue = 0,
						};

						table.insert(self._shootWayPoints, point);
						if self.knifeMode then
							local trans = self._shootPlayer.soldier.worldTransform.trans:Clone()
							table.insert(self._knifeWayPositions, trans)
						end
					end
					self._shootTraceTimer = self._shootTraceTimer + StaticConfig.botUpdateCycle;
				end

				--shooting sequence
				if self.activeWeapon ~= nil then
					if self.knifeMode then
						self._shotTimer	= -Config.botFirstShotDelay;
					else
						if self._shotTimer >= (self.activeWeapon.fireCycle + self.activeWeapon.pauseCycle) then
							self._shotTimer	= 0;
						end
						if self._shotTimer >= 0 then
							if self.activeWeapon.delayed == false then
								if self._shotTimer >= self.activeWeapon.fireCycle or self._meleeActive then
									self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
								else
									self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 1);
								end
							else --start with pause Cycle
								if self._shotTimer >= self.activeWeapon.pauseCycle and not self._meleeActive then
									self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 1);
								else
									self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
								end
							end
						end
					end

					self._shotTimer = self._shotTimer + StaticConfig.botUpdateCycle;
				end

			else
				self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
				self._weaponToUse 		= "Primary"
				self._shotTimer			= -Config.botFirstShotDelay;
				self._shootPlayer		= nil;
				self._grenadeActive 	= false;
				self._lastShootPlayer	= nil;
			end
		elseif self._reviveActive and self._shootPlayer ~= nil then
			self._deployActive = false;
			if self._shootPlayer.corpse ~= nil then  -- revive
				self.player.input:SetLevel(EntryInputActionEnum.EIAZoom, 1); --does not work.
				self.player.input:SetLevel(EntryInputActionEnum.EIAReload, 0);
				self._shootModeTimer	= self._shootModeTimer + StaticConfig.botUpdateCycle;
				self.activeMoveMode		= 9; -- movement-mode : attack
				self._reloadTimer		= 0; -- reset reloading

				--check for revive if close
				if self._shootPlayer.corpse.worldTransform.trans:Distance(self.player.soldier.worldTransform.trans) < 2 then
					self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 1);
				end
				
				--trace way back
				if self._shootTraceTimer > StaticConfig.traceDeltaShooting then
					--create a Trace to find way back
					self._shootTraceTimer 	= 0;
					local point				= {
						Position = self.player.soldier.worldTransform.trans:Clone(),
						SpeedMode = 4,			-- 0 = wait, 1 = prone, 2 = crouch, 3 = walk, 4 run
						ExtraMode = 0,
						OptValue = 0,
					};

					table.insert(self._shootWayPoints, point);
					if self.knifeMode then
						local trans = self._shootPlayer.soldier.worldTransform.trans:Clone()
						table.insert(self._knifeWayPositions, trans)
					end
				end
				self._shootTraceTimer = self._shootTraceTimer + StaticConfig.botUpdateCycle;
			else
				self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
				self._weaponToUse 		= "Primary"
				self._shotTimer			= -Config.botFirstShotDelay;
				self._shootPlayer		= nil;
				self._reviveActive		= false;
			end

		elseif self._deployActive then --deploy bag
			self._deployTimer = self._deployTimer + StaticConfig.botUpdateCycle;
			self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 1);
			if self._deployTimer > 1 then
				self._deployActive = false;
				self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
			end
		else
			self.player.input:SetLevel(EntryInputActionEnum.EIAZoom, 0);
			self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0);
			self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeFastMelee, 0);
			self.player.input:SetLevel(EntryInputActionEnum.EIAMeleeAttack, 0);
			self._weaponToUse 		= "Primary"
			self._grenadeActive 	= false;
			self._shootPlayer		= nil;
			self._lastShootPlayer	= nil;
			self._shootModeTimer	= 0;
			self._attackMode		= 0;

			self._reloadTimer = self._reloadTimer + StaticConfig.botUpdateCycle;
			if self._reloadTimer > 4 then
				self.player.input:SetLevel(EntryInputActionEnum.EIAReload, 0);
			elseif self._reloadTimer > 3 and self.player.soldier.weaponsComponent.currentWeapon.primaryAmmo <= self.activeWeapon.reload then
				self.player.input:SetLevel(EntryInputActionEnum.EIAReload, 1);
			end

			-- deploy from time to time
			if Config.botsDeploy then
				if self.kit == "Support" or self.kit == "Assault" then
					if self.gadget1.type == "Ammobag" or self.gadget1.type == "Medkit" then
						self._deployTimer = self._deployTimer + StaticConfig.botUpdateCycle;
						if self._deployTimer > Config.deployCycle then
							self._deployTimer = 0;
							self._deployActive = true;
						end
					end
				end
			end
		end
	end
end

function Bot:_getWayIndex(currentWayPoint)
	local activePointIndex = 1;

	if currentWayPoint == nil then
		currentWayPoint = activePointIndex;
	else
		activePointIndex = currentWayPoint;

		-- direction handling
		local countOfPoints = #g_NodeCollection:Get(nil, self._pathIndex)
		local firstPoint =  g_NodeCollection:GetFirst(self._pathIndex)
		if activePointIndex > countOfPoints then
			if firstPoint.OptValue == 0xFF then --inversion needed
				activePointIndex			= countOfPoints;
				self._invertPathDirection	= true;
			else
				activePointIndex			= 1;
			end
		elseif activePointIndex < 1 then
			if firstPoint.OptValue == 0xFF then --inversion needed
				activePointIndex			= 1;
				self._invertPathDirection	= false;
			else
				activePointIndex			= countOfPoints;
			end
		end
	end
	return activePointIndex;
end

function Bot:_updateMovement()
	-- movement-mode of bots
	local additionalMovementPossible = true;

	if self.player.alive then
		-- pointing
		if self.activeMoveMode == 2 and self._targetPlayer ~= nil then
			if self._targetPlayer.soldier ~= nil then
				local dy		= self._targetPlayer.soldier.worldTransform.trans.z - self.player.soldier.worldTransform.trans.z;
				local dx		= self._targetPlayer.soldier.worldTransform.trans.x - self.player.soldier.worldTransform.trans.x;
				local atanDzDx	= math.atan(dy, dx);
				local yaw		= (atanDzDx > math.pi / 2) and (atanDzDx - math.pi / 2) or (atanDzDx + 3 * math.pi / 2);
				self._targetYaw = yaw;
			end

		-- mimicking
		elseif self.activeMoveMode == 3 and self._targetPlayer ~= nil then
			additionalMovementPossible = false;

			for i = 0, 36 do
				self.player.input:SetLevel(i, self._targetPlayer.input:GetLevel(i));
			end

			self._targetYaw		= self._targetPlayer.input.authoritativeAimingYaw;
			self._targetPitch	= self._targetPlayer.input.authoritativeAimingPitch;

		-- mirroring
		elseif self.activeMoveMode == 4 and self._targetPlayer ~= nil then
			additionalMovementPossible = false;

			for i = 0, 36 do
				self.player.input:SetLevel(i, self._targetPlayer.input:GetLevel(i));
			end

			self._targetYaw		= self._targetPlayer.input.authoritativeAimingYaw + ((self._targetPlayer.input.authoritativeAimingYaw > math.pi) and -math.pi or math.pi);
			self._targetPitch	= self._targetPlayer.input.authoritativeAimingPitch;

		-- move along points
		elseif self.activeMoveMode == 5 then
			self._attackModeMoveTimer = 0;

			-- get next point
			local activePointIndex = self:_getWayIndex(self._currentWayPoint)

			if g_NodeCollection:Get(1, self._pathIndex) ~= nil then -- check for valid point
				local point				= nil;
				local nextPoint			= nil;
				local pointIncrement	= 1;
				local noStuckReset		= false;
				local useShootWayPoint	= false;

				if #self._shootWayPoints > 0 then	--we need to go back to path first
					point 				= self._shootWayPoints[#self._shootWayPoints];
					nextPoint 			= self._shootWayPoints[#self._shootWayPoints - 1];
					if nextPoint == nil then
						nextPoint = g_NodeCollection:Get(activePointIndex, self._pathIndex);
						if Config.debugTracePaths then
							NetEvents:BroadcastLocal('ClientNodeEditor:BotSelect', self._pathIndex, activePointIndex, self.player.soldier.worldTransform.trans, (self._obstaceSequenceTimer > 0), "Blue")
						end
					end
					useShootWayPoint	= true;
				else
					point = g_NodeCollection:Get(activePointIndex, self._pathIndex);
					if not self._invertPathDirection then
						nextPoint 		= g_NodeCollection:Get(self:_getWayIndex(self._currentWayPoint + 1), self._pathIndex);
						if Config.debugTracePaths then
							NetEvents:BroadcastLocal('ClientNodeEditor:BotSelect', self._pathIndex, self:_getWayIndex(self._currentWayPoint + 1), self.player.soldier.worldTransform.trans, (self._obstaceSequenceTimer > 0), "Green")
						end
					else
						nextPoint 		= g_NodeCollection:Get(self:_getWayIndex(self._currentWayPoint - 1), self._pathIndex);
						if Config.debugTracePaths then
							NetEvents:BroadcastLocal('ClientNodeEditor:BotSelect', self._pathIndex, self:_getWayIndex(self._currentWayPoint - 1), self.player.soldier.worldTransform.trans, (self._obstaceSequenceTimer > 0), "Green")
						end
					end
				end

				-- execute Action if needed
				if self._actionActive then
					if self._actionTimer == point.Data.Action.time then
						for _,input in pairs(point.Data.Action.inputs) do
							self.player.input:SetLevel(input, 1)
						end
					end

					self._actionTimer = self._actionTimer - StaticConfig.botUpdateCycle;
					if self._actionTimer <= 0 then
						self._actionActive = false;
					end

					if self._actionActive then
						return --DONT EXECUTE ANYTHING ELSE
					end
				end

				if (point.SpeedMode) > 0 then -- movement
					self._wayWaitTimer			= 0;
					self._wayWaitYawTimer		= 0;
					self.activeSpeedValue		= point.SpeedMode; --speed
					if Config.zombieMode then
						if self._zombieSpeedValue == 0 then
							self._zombieSpeedValue = MathUtils:GetRandomInt(1,2);
						end
						self.activeSpeedValue = self._zombieSpeedValue;
					end
					if Config.overWriteBotSpeedMode > 0 then
						self.activeSpeedValue = Config.overWriteBotSpeedMode;
					end
					local dy					= point.Position.z - self.player.soldier.worldTransform.trans.z;
					local dx					= point.Position.x - self.player.soldier.worldTransform.trans.x;
					local distanceFromTarget	= math.sqrt(dx ^ 2 + dy ^ 2);
					local heightDistance		= math.abs(point.Position.y - self.player.soldier.worldTransform.trans.y);


					--detect obstacle and move over or around TODO: Move before normal jump
					local currentWayPontDistance = self.player.soldier.worldTransform.trans:Distance(point.Position);
					if currentWayPontDistance > self._lastWayDistance + 0.02 and self._obstaceSequenceTimer == 0 then
						--TODO: skip one pooint?
						distanceFromTarget			= 0;
						heightDistance				= 0;
					end

					self._targetPoint = point;
					self._nextTargetPoint = nextPoint;


					if math.abs(currentWayPontDistance - self._lastWayDistance) < 0.02 or self._obstaceSequenceTimer ~= 0 then
						-- try to get around obstacle
						self.activeSpeedValue = 4; --always try to stand

						if self._obstaceSequenceTimer == 0 then --step 0
							self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 0);
							self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 0);

						elseif self._obstaceSequenceTimer > 2.4 then --step 4 - repeat afterwards
							self._obstaceSequenceTimer = 0;
							self._meleeActive = false;
							self._obstacleRetryCounter = self._obstacleRetryCounter + 1;
							self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0.0);
							self.player.input:SetLevel(EntryInputActionEnum.EIAMeleeAttack, 0);
							self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeFastMelee, 0);
							self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0.0);
						
						elseif self._obstaceSequenceTimer > 1.0 then --step 3
							if self._obstacleRetryCounter == 0 then
								self._meleeActive = true;
								self.player.input:SetLevel(EntryInputActionEnum.EIASelectWeapon7, 1);
								self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeFastMelee, 1);
								self.player.input:SetLevel(EntryInputActionEnum.EIAMeleeAttack, 1); --maybe a fence?
							else
								self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 1);
							end
							
						elseif self._obstaceSequenceTimer > 0.4 then --step 2
							self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 0);
							self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 0);
							self._targetPitch		= 0.0;
							if (MathUtils:GetRandomInt(0,1) == 1) then
								self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 1.0 * Config.speedFactor);
							else
								self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, -1.0 * Config.speedFactor);
							end

						elseif self._obstaceSequenceTimer > 0.0 then --step 1
							self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 1);
							self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 1);
						end

						self._obstaceSequenceTimer = self._obstaceSequenceTimer + StaticConfig.botUpdateCycle;
						self._stuckTimer = self._stuckTimer + StaticConfig.botUpdateCycle; 

						if self._obstacleRetryCounter >= 2 then --try next waypoint
							self._obstacleRetryCounter	= 0;
							self._meleeActive 			= false;
							distanceFromTarget			= 0;
							heightDistance				= 0;
							noStuckReset				= true;
							pointIncrement				= MathUtils:GetRandomInt(-3,7); -- go 5 points further
							if g_Globals.isConquest or g_Globals.isRush then
								self._invertPathDirection	= (MathUtils:GetRandomInt(0,100) < 40);
							end
							-- experimental
							if pointIncrement == 0 then -- we can't have this
								pointIncrement = 2 --go backwards and try again
							end
						end

						if self._stuckTimer > 15 then
							self.player.soldier:Kill()
							
							if Debug.Server.BOT then
								print(self.player.name.." got stuck. Kill")
							end
							
							return
						end
					else
						self._meleeActive = false;
						self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0.0);
						self.player.input:SetLevel(EntryInputActionEnum.EIAMeleeAttack, 0);
						if not self._deployActive and not self._grenadeActive then
							self.player.input:SetLevel(EntryInputActionEnum.EIAFire, 0.0);
						end
					end

					self._lastWayDistance = currentWayPontDistance;

					-- jump detection. Much more simple now, but works fine ;-)
					if self._obstaceSequenceTimer == 0 then
						if (point.Position.y - self.player.soldier.worldTransform.trans.y) > 0.3 and Config.jumpWhileMoving then
							--detect, if a jump was recorded or not
							local timeForwardBackwardJumpDetection = 1.1; -- 1.5 s ahead and back
							local jumpValid = false;
							for i = 1, math.floor(timeForwardBackwardJumpDetection/Config.traceDelta) do
								local pointBefore = g_NodeCollection:Get(activePointIndex - i, self._pathIndex);
								local pointAfter = g_NodeCollection:Get(activePointIndex + i, self._pathIndex)
								if (pointBefore ~= nil and pointBefore.ExtraMode == 1) or (pointAfter ~= nil and pointAfter.ExtraMode == 1) then
									jumpValid = true;
									break;
								end
							end
							if jumpValid then
								self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 1);
								self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 1);
							end

						else --only reset, if no obstacle-sequence active
							self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 0);
							self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 0);
						end
					end

					local targetDistanceSpeed = Config.targetDistanceWayPoint;
					if self.activeSpeedValue == 4 then
						targetDistanceSpeed = targetDistanceSpeed * 1.5;
					elseif self.activeSpeedValue == 2 then
						targetDistanceSpeed = targetDistanceSpeed * 0.7;
					elseif self.activeSpeedValue == 1 then
						targetDistanceSpeed = targetDistanceSpeed * 0.5;
					end

					--check for reached target
					if distanceFromTarget <= targetDistanceSpeed and heightDistance <= StaticConfig.targetHeightDistanceWayPoint then
						if not noStuckReset then
							self._stuckTimer = 0;
						end
						if not useShootWayPoint then
							-- CHECK FOR ACTION
							if point.Data.Action ~= nil then
								local action = point.Data.Action;
								if g_GameDirector:checkForExecution(point, self.player.teamId) then
									self._actionActive = true;
									if action.time ~= nil then
										self._actionTimer = action.time
									else
										self._actionTimer = 0;
									end
									if action.yaw ~= nil then
										self._targetYaw = action.yaw;
									end
									if action.pitch ~= nil then
										self._targetPitch = action.pitch;
									end

									-- reset all inputs
									for i = 0, 36 do
										self.player.input:SetLevel(i, 0);
									end

									return --DONT DO ANYTHING ELSE ANYMORE
								end
							end
							-- CHECK FOR PATH-SWITCHES
							local switchPath, newWaypoint = g_PathSwitcher:getNewPath(self.name, point, self._objective);
							if not self.player.alive then
								return
							end

							if switchPath and not self._onSwitch then
								if (self._objective ~= '') then
									-- 'best' direction for objective on switch
									local direction = g_NodeCollection:ObjectiveDirection(newWaypoint, self._objective)
									self._invertPathDirection = (direction == 'Previous')
								else 
									-- random path direction on switch
									self._invertPathDirection = MathUtils:GetRandomInt(1,2) == 1
								end

								self._pathIndex = newWaypoint.PathIndex;
								self._currentWayPoint = newWaypoint.PointIndex;
								self._onSwitch = true;
							else
								self._onSwitch = false;
								if self._invertPathDirection then
									self._currentWayPoint = activePointIndex - pointIncrement;
								else
									self._currentWayPoint = activePointIndex + pointIncrement;
								end
							end

						else
							for i = 1, pointIncrement do --one already gets removed on start of wayfinding
								table.remove(self._shootWayPoints);
							end
						end
						self._obstaceSequenceTimer	= 0;
						self._meleeActive = false;
						self._lastWayDistance		= 1000;
					end
				else -- wait mode
					self._wayWaitTimer		= self._wayWaitTimer + StaticConfig.botUpdateCycle;
					local lastYawTimer 		= self._wayWaitYawTimer
					self._wayWaitYawTimer 	= self._wayWaitYawTimer + StaticConfig.botUpdateCycle;
					self.activeSpeedValue	= 0;
					self._targetPoint		= nil;

					-- move around a little
					if self._wayWaitYawTimer > 6 then
						self._wayWaitYawTimer = 0;
						self._targetYaw = self._targetYaw + 1.0; -- 60 ° rotation right
						if self._targetYaw > (math.pi * 2) then
							self._targetYaw = self._targetYaw - (2 * math.pi)
						end
					elseif self._wayWaitYawTimer >= 4 and lastYawTimer < 4 then
						self._targetYaw = self._targetYaw - 1.0; -- 60 ° rotation left
						if self._targetYaw < 0 then
							self._targetYaw = self._targetYaw + (2 * math.pi)
						end
					elseif self._wayWaitYawTimer >= 3 and lastYawTimer < 3 then
						self._targetYaw = self._targetYaw - 1.0; -- 60 ° rotation left
						if self._targetYaw < 0 then
							self._targetYaw = self._targetYaw + (2 * math.pi)
						end
					elseif self._wayWaitYawTimer >= 1 and lastYawTimer < 1 then
						self._targetYaw = self._targetYaw + 1.0; -- 60 ° rotation right
						if self._targetYaw > (math.pi * 2) then
							self._targetYaw = self._targetYaw - (2 * math.pi)
						end
					end

					if self._wayWaitTimer > point.OptValue then
						self._wayWaitTimer		= 0;
						if self._invertPathDirection then
							self._currentWayPoint	= activePointIndex - 1;
						else
							self._currentWayPoint	= activePointIndex + 1;
						end
					end
				end
			end

		-- Shoot MoveMode
		elseif self.activeMoveMode == 9 then
			if self._attackMode == 0 then
				if Config.botAttackMode == "Crouch" then
					self._attackMode = 2;
				elseif Config.botAttackMode == "Stand" then
					self._attackMode = 3;
				else -- random
					self._attackMode = MathUtils:GetRandomInt(2, 3);
				end
			end
			--crouch moving (only mode with modified gun)
			if self.activeWeapon.type == "Sniper" and not self.knifeMode then
				if self._attackMode == 2 then
					if self.player.soldier.pose ~= CharacterPoseType.CharacterPoseType_Crouch then
						self.player.soldier:SetPose(CharacterPoseType.CharacterPoseType_Crouch, true, true);
					end
				else
					if self.player.soldier.pose ~= CharacterPoseType.CharacterPoseType_Stand then
						self.player.soldier:SetPose(CharacterPoseType.CharacterPoseType_Stand, true, true);
					end
				end
				self.activeSpeedValue = 0;
				self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 0);
				self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0.0);
			else
				local targetTime = 5.0
				local targetCycles = math.floor(targetTime / StaticConfig.traceDeltaShooting);

				if self.knifeMode then --Knife Only Mode
					targetCycles = 1;
					self.activeSpeedValue = 4; --run towards player
				else
					if self._attackMode == 2 then
						self.activeSpeedValue = 2;
					else
						self.activeSpeedValue = 3;
					end
				end
				if Config.overWriteBotAttackMode > 0 then
					self.activeSpeedValue = Config.overWriteBotAttackMode;
				end

				if #self._shootWayPoints > targetCycles and Config.jumpWhileShooting then
					local distanceDone = self._shootWayPoints[#self._shootWayPoints].Position:Distance(self._shootWayPoints[#self._shootWayPoints-targetCycles].Position);
					if distanceDone < 0.5 then --no movement was possible. Try to jump over obstacle
						self.activeSpeedValue = 3;
						self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 1);
						self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 1);
					else
						self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 0);
						self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 0);
					end
				else
					self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 0);
					self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0.0);
				end

				-- do some sidwards movement from time to time
				if self._attackModeMoveTimer > 20 then
					self._attackModeMoveTimer = 0;
					self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0.0);
				elseif self._attackModeMoveTimer > 17 then
					self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, -0.5 * Config.speedFactorAttack);
				elseif self._attackModeMoveTimer > 13 then
					self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0.0);
				elseif self._attackModeMoveTimer > 12 then
					self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0.5 * Config.speedFactorAttack);
				elseif self._attackModeMoveTimer > 9 then
					self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0);
				elseif self._attackModeMoveTimer > 7 then
					self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0.5 * Config.speedFactorAttack);
				end

				self._attackModeMoveTimer = self._attackModeMoveTimer + StaticConfig.botUpdateCycle;
			end

		elseif self.activeMoveMode == 8 then  -- Revive Move Mode
			self.activeSpeedValue = 4; --run to player
			if self.player.soldier.pose ~= CharacterPoseType.CharacterPoseType_Stand then
				self.player.soldier:SetPose(CharacterPoseType.CharacterPoseType_Stand, true, true);
			end
			self.player.input:SetLevel(EntryInputActionEnum.EIAStrafe, 0);

			--TODO: obstacle detection
			self._attackModeMoveTimer = self._attackModeMoveTimer + StaticConfig.botUpdateCycle;
			if self._attackModeMoveTimer > 5 then
				self._attackModeMoveTimer = 0;
			elseif self._attackModeMoveTimer > 4.5 then
				self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 1);
				self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 1);
			else
				self.player.input:SetLevel(EntryInputActionEnum.EIAJump, 0);
				self.player.input:SetLevel(EntryInputActionEnum.EIAQuicktimeJumpClimb, 0);
			end

			if self._shootPlayer ~= nil and self._shootPlayer.corpse ~= nil then
				if self.player.soldier.worldTransform.trans:Distance(self._shootPlayer.corpse) < 0.5 then
					self.activeSpeedValue = 1;
				end
			end
		end

		-- additional movement
		if additionalMovementPossible then
			local speedVal = 0;

			if self.activeMoveMode > 0 then
				if self.activeSpeedValue == 1 then
					speedVal = 1.0;

					if self.player.soldier.pose ~= CharacterPoseType.CharacterPoseType_Prone then
						self.player.soldier:SetPose(CharacterPoseType.CharacterPoseType_Prone, true, true);
					end

				elseif self.activeSpeedValue == 2 then
					speedVal = 1.0;

					if self.player.soldier.pose ~= CharacterPoseType.CharacterPoseType_Crouch then
						self.player.soldier:SetPose(CharacterPoseType.CharacterPoseType_Crouch, true, true);
					end

				elseif self.activeSpeedValue >= 3 then
					speedVal = 1.0;

					if self.player.soldier.pose ~= CharacterPoseType.CharacterPoseType_Stand then
						self.player.soldier:SetPose(CharacterPoseType.CharacterPoseType_Stand, true, true);
					end
				end
			end

			-- do not reduce speed if sprinting
			if speedVal > 0 and self._shootPlayer ~= nil and self._shootPlayer.soldier ~= nil and self.activeSpeedValue <= 3 then
				speedVal = speedVal * Config.speedFactorAttack;
			end

			-- movent speed
			if self.player.alive then
				if self.activeSpeedValue <= 3 then
					self.player.input:SetLevel(EntryInputActionEnum.EIAThrottle, speedVal * Config.speedFactor);
					self.player.input:SetLevel(EntryInputActionEnum.EIASprint, 0);
				else
					self.player.input:SetLevel(EntryInputActionEnum.EIAThrottle, 1.0);
					self.player.input:SetLevel(EntryInputActionEnum.EIASprint, 1);

				end
			end
		end
	end
end

function Bot:_setActiveVars()
	self.activeMoveMode		= self._moveMode;
	self.activeSpeedValue	= self._botSpeed;
	
	if Config.botWeapon == "Knife" or Config.zombieMode then
		self.knifeMode = true;
	else
		self.knifeMode = false;
	end
end

function Bot:_getCameraHight(soldier, isTarget)
	local camereaHight = 0;

	if not isTarget then
		camereaHight = 1.6; --bot.soldier.pose == CharacterPoseType.CharacterPoseType_Stand

		if soldier.pose == CharacterPoseType.CharacterPoseType_Prone then
			camereaHight = 0.3;
		elseif soldier.pose == CharacterPoseType.CharacterPoseType_Crouch then
			camereaHight = 1.0;
		end
	else
		camereaHight = 1.3; --bot.soldier.pose == CharacterPoseType.CharacterPoseType_Stand - reduce by 0.3

		if soldier.pose == CharacterPoseType.CharacterPoseType_Prone then
			camereaHight = 0.3; -- don't reduce
		elseif soldier.pose == CharacterPoseType.CharacterPoseType_Crouch then
			camereaHight = 0.8; -- reduce by 0.2
		end
	end

	return camereaHight;
end

return Bot;