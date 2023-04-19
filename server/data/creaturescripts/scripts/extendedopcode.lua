local OPCODE_LANGUAGE = 1

function onExtendedOpcode(player, opcode, buffer)
	if opcode == OPCODE_LANGUAGE then
		-- otclient language
		if buffer == 'en' or buffer == 'pt' then
			-- example, setting player language, because otclient is multi-language...
			-- player:setStorageValue(SOME_STORAGE_ID, SOME_VALUE)
		end
	else
		-- other opcodes can be ignored, and the server will just work fine...
	end
	print(buffer)
	if opcode == 14 then
			--if not (buffer == "getRefresh") then
			--	if buffer == "sendBanana" then
			--		print("banana was given")
			--		player:addItem(2160, 1)
			--	end
			--end
	
	local response = {}
		player:sendExtendedOpcode(14, json.encode(response))		
	end
	
end
