-------Script by DrFeelgood for Izba Wytrzezwien
-------Contact: thewhitewizard9001@gmail.com

function et_ClientConnect(cid, firstTime, isBot)
    if(firstTime == 1 and isBot == 0) then
        local file = io.open("connectlog.txt", "a")
        io.output(file)
        local name = et.Info_ValueForKey(et.trap_GetUserinfo(cid), "name")
        local guid = et.Info_ValueForKey(et.trap_GetUserinfo(cid), "cl_guid")
        io.write(os.date("%Y-%m-%d %H:%M:%S").." CONNECT: "..name.." connected with GUID "..guid.."\r\n")
        io.close(file)
	end
end

function et_ClientDisconnect(cid)
    local file = io.open("connectlog.txt", "a")
    io.output(file)
    local name = et.Info_ValueForKey(et.trap_GetUserinfo(cid), "name")
    io.write(os.date("%Y-%m-%d %H:%M:%S").." DISCONNECT: "..name.." disconnected\r\n")
    io.close(file)
end
