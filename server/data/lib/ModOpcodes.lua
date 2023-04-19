-- By Hopus --
function doPlayerSendModOpcode(cid, port, param)
	doPlayerSendCancel(cid, '#<=>#ModOpcode#<=>#'..port..'#<&>#'..param)
end 