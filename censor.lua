-------Script by DrFeelgood for Izba Wytrzezwien
-------Contact: thewhitewizard9001@gmail.com
explosive_words = {
        "kurwa", "jebany", "jebac", "chuj", "fuck"
}

function Log(msg)
    et.G_Print(msg.."\n")
end

function et_InitGame(levelTime, randomSeed, restart)
	Log("---==Explosive censor script by DrFeelgood loaded==---")
end

function et_ClientCommand(client, command)
    if(et.trap_Argv(0) == "say" or et.trap_Argv(0) == "say_team" or  et.trap_Argv(0) == "say_buddy") then
        for i = 1, #explosive_words do
            if(string.find(et.trap_Argv(1), explosive_words[i]) ~= nil) then
                local damage = 999
                if(et.gentity_get(client, "ps.stats", 0) < 0) then damage = 50 end
                et.gentity_set(client, "ps.powerups", 1, 0)

                ---local meansOfDeath = {
                ---    20, 21, 24, 25, 28, 29, 32, 33, 34, 35, 38, 39, 40, 65, 69
                ---}
                ---local r = math.random(1, #meansOfDeath)
                et.G_Damage(client, client, client, damage, 4, 72)

            end
        end
    end
end
