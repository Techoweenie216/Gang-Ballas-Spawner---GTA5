


function fullloadout()
	GiveWeaponToPed(GetPlayerPed(-1),-538741184, 1000, 0, false) --switch blade
	GiveWeaponToPed(GetPlayerPed(-1),-656458692, 1000, 0, false) --brass nuckles
	GiveWeaponToPed(GetPlayerPed(-1),1317494643, 1000, 0, false) --hammer
	GiveWeaponToPed(GetPlayerPed(-1),-1786099057, 1000, 0, false) -- baseball bat
	GiveWeaponToPed(GetPlayerPed(-1), -2067956739, 1000, 0, false) --crowbar
	GiveWeaponToPed(GetPlayerPed(-1),-102323637, 1000, 0, false) --broken bottle
	GiveWeaponToPed(GetPlayerPed(-1),-1810795771, 1000, 0, false) --pool cue
	
        GiveWeaponToPed(GetPlayerPed(-1),453432689, 1000, 0, false) -- pistol
	GiveWeaponComponentToPed(GetPlayerPed(-1),453432689, 0xED265A1C) --  extended clip
	GiveWeaponToPed(GetPlayerPed(-1),-1045183535, 1000, 0, false) -- revolver

        GiveWeaponToPed(GetPlayerPed(-1),487013001, 1000, 0, false) -- pumpshotgun
	GiveWeaponToPed(GetPlayerPed(-1),2017895192, 1000, 0, false) -- sawed off shotgun
	GiveWeaponToPed(GetPlayerPed(-1),-275439685, 1000, 0, false) -- double barrel shotgun
	
	GiveWeaponToPed(GetPlayerPed(-1),-1074790547, 1000, 0, false) -- assaultrifle
	GiveWeaponComponentToPed(GetPlayerPed(-1),-1074790547, 0xB1214F9B) --  extended clip
	GiveWeaponToPed(GetPlayerPed(-1),1649403952, 1000, 0, false) -- compact rifle

	GiveWeaponToPed(GetPlayerPed(-1),-1813897027 , 1000, 0, false) -- grenade
	GiveWeaponToPed(GetPlayerPed(-1),615608432 , 1000, 0, false) -- molotov
	GiveWeaponToPed(GetPlayerPed(-1),-1169823560 , 1000, 0, false) -- pipebomb




        Citizen.Wait(1000, 0, false)
	
	HasAlreadyGotMessage = true
end

Citizen.CreateThread(function()
   local markerPos = vector3(74.28132, -1972.233, 20.00)
   while true do
	Citizen.Wait(1)
	local ped = GetPlayerPed(-1)
	local playerCoords = GetEntityCoords(ped)
	local distance = #(playerCoords - markerPos)
	local isInMarker = false	

		-- if closer than 8 draw the marker
		if distance < 8.0 then
		DrawMarker(27, markerPos.x, markerPos.y, markerPos.z , 0.0, 0.0, 0.0, 0.0, 180.0, 0.0, 2.0, 2.0, 2.0, 255, 0, 255, 50, false, false, 2, nil, nil, false)
	    		if distance < 2.0 then
				isInMarker = true
				else
				HasAlreadyGotMessage = false
				end
		else
			Citizen.Wait(1000, 0, false)
		end
	
		if isInMarker and not HasAlreadyGotMessage then
    		-- Give random ballas ped
			local RGroup = {'g_m_y_ballaeast_01','g_m_y_ballaorig_01','g_f_y_ballas_01','csb_ballasout','g_m_y_ballasout_01'}
			local RPed = (RGroup[math.random(#RGroup)])
			local player = PlayerId()
			local model = GetHashKey(RPed)
    							
			RequestModel(RPed)
    			while not HasModelLoaded(RPed) do
        			Wait(100)
    			end
    			SetPlayerModel(player, RPed)
				Wait(100)
				
    			SetModelAsNoLongerNeeded(RPed)
			SetPedArmour(player, 100)
			
			SetRelationshipBetweenGroups(0, GetHashKey('AMBIENT_GANG_BALLAS'), GetHashKey('player'))
			fullloadout()
			Citizen.Wait(500)							


			HasAlreadyGotMessage = true
			Citizen.Wait(500)
        	end

	end
end)


