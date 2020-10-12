-------Script by DrFeelgood for Izba Wytrzezwien
-------Contact: thewhitewizard9001@gmail.com

function Log(msg)
    et.G_Print(msg.."\n")
end

function et_InitGame(levelTime, randomSeed, restart)
	Log("---==Oslona za krede by DrFeelgood loaded==---");
end

function et_ClientCommand(client, command)
    if(et.trap_Argv(0) == "say" or et.trap_Argv(0) == "say_team" or  et.trap_Argv(0) == "say_buddy") then
        if(string.sub(et.trap_Argv(1), 0, string.len("!oslona")) == "!oslona") then
            if(et.G_shrubbot_level(client) < 99) then et.trap_SendServerCommand(-1,"chat \"Zulmission denied\"")
            else
                if(et.gentity_get(client, "ps.powerups", 1) < 50*1000) then
                    et.gentity_set(client, "ps.powerups", 1, 60*60*1000)
                    et.trap_SendServerCommand(-1,"chat \"^dOslona za krede wlaczona na "..et.Info_ValueForKey(et.trap_GetUserinfo(client), "name").."\"")
                else
                    et.gentity_set(client, "ps.powerups", 1, 0)
                    et.trap_SendServerCommand(-1,"chat \"^aOslona za krede wylaczona na "..et.Info_ValueForKey(et.trap_GetUserinfo(client), "name").."\"")
                end
            end
        end
    end
end
