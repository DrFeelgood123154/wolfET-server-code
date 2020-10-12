-------Script by DrFeelgood for Izba Wytrzezwien
-------Contact: thewhitewizard9001@gmail.com

function Log(msg)
    if(msg == nil) then msg = "NULL" end
    et.G_Print(msg.."\n")
end

function SendMsg(msg)
    if(msg ~= "") then
        et.trap_SendServerCommand(-1,"chat \""..msg.."\"")
    end
end

setCheck = 0
nextCheck = 0
function et_RunFrame(lvltime)
    if(setCheck ~= 0) then
        nextCheck = lvltime + 1000
        setCheck = 0
        return
    end
    if(nextCheck == 0 or lvltime < nextCheck) then return end
    nextCheck = 0

    countallies = 0
    countaxis = 0
    countspecs = 0
    for i = 0, tonumber(et.trap_Cvar_Get("sv_maxClients")) - 1 do
        if(i ~= nil and et.gentity_get(i,"ps.ping") ~= 0) then
            if checkteam(i) == 1 then
                countaxis = countaxis + 1
            elseif checkteam(i) == 2 then
                countallies =  countallies + 1
            elseif checkteam(i) == 3 then
                countspecs =  countspecs + 1
            end
        end
    end
    Log("countallies: "..countallies)
    Log("countaxis: "..countaxis)
    Log("countspecs: "..countspecs)
    total = countallies + countaxis + countspecs
    if(total == 0) then
        SendMsg("^1===No players detected on server, resetting to default===")
        et.trap_SendConsoleCommand(et.EXEC_NOW, "exec \"mapconfigs/default.cfg\"")
    end
end

function checkteam(client)
   local cs = et.trap_GetConfigstring(et.CS_PLAYERS + client)
    return tonumber(et.Info_ValueForKey(cs, "t"))
end

function et_ClientConnect(cid, firstTime, isBot)
    setCheck = 1
end

function et_ClientDisconnect(cid)
    setCheck = 1
end
