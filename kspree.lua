-------Script by DrFeelgood for Izba Wytrzezwien
-------Contact: thewhitewizard9001@gmail.com
spreeKnifeEndSound = "sound/custom/lulz.wav"

matchWonSound = "sound/custom_misc/matchwon.wav"
matchLostSound = "sound/custom_misc/matchlost.wav"
matchEndAnnounced = false
matchEndAnnounceTime = 0

playerKills = {} --- keep track of kills/deaths
playerDeaths = {}

killingSpreeCooldown = 0

---Use {PLAYERNAME} for player's name
---ignoreCooldown plays the sound regardless of cooldown
deathspree_list = {
    [10] = {
        { [0] = "^w---{PLAYERNAME} ^wzdeh 10 razy za duzo---", [1] = "sound/custom_spree/deaths10.wav", ["cooldown"] = 6, ["ignoreCooldown"] = false },
    },
    [15] = {
        { [0] = "^w---{PLAYERNAME} ^wzdeh 15 razy za duzo---", [1] = "sound/custom_spree/deaths15.wav", ["cooldown"] = 14, ["ignoreCooldown"] = false },
    },
    [20] = {
        { [0] = "^w---{PLAYERNAME} ^wzdeh 20 razy za duzo---", [1] = "sound/custom_spree/deaths20.wav", ["cooldown"] = 15, ["ignoreCooldown"] = false },
    },
}

spree_list = {
    [5] = {
        { [0] = "^w---{PLAYERNAME} ^w 5 killow---", [1] = "sound/custom_spree/spree5a.wav", ["cooldown"] = 6, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 5 killow---", [1] = "sound/custom_spree/spree5b.wav", ["cooldown"] = 9, ["ignoreCooldown"] = false },
    },
    [10] = {
        { [0] = "^w---{PLAYERNAME} ^w 10 killow---", [1] = "sound/custom_spree/spree10a.wav", ["cooldown"] = 10, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 10 killow---", [1] = "sound/custom_spree/spree10b.wav", ["cooldown"] = 8, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 10 killow---", [1] = "sound/custom_spree/spree10c.wav", ["cooldown"] = 12, ["ignoreCooldown"] = false },
    },
    [15] = {
        { [0] = "^w---{PLAYERNAME} ^w 15 killow---", [1] = "sound/custom_spree/spree15a.wav", ["cooldown"] = 7, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 15 killow---", [1] = "sound/custom_spree/spree15b.wav", ["cooldown"] = 6, ["ignoreCooldown"] = false },
    },
    [20] = {
        { [0] = "^w---{PLAYERNAME} ^w 20 killow---", [1] = "sound/custom_spree/spree20a.wav", ["cooldown"] = 12, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 20 killow---", [1] = "sound/custom_spree/spree20b.wav", ["cooldown"] = 15, ["ignoreCooldown"] = false },
    },
    [25] = {
        { [0] = "^w---{PLAYERNAME} ^w 25 killow---", [1] = "sound/custom_spree/spree25a.wav", ["cooldown"] = 11, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 25 killow---", [1] = "sound/custom_spree/spree25b.wav", ["cooldown"] = 11, ["ignoreCooldown"] = false },
    },
    [30] = {
        { [0] = "^w---{PLAYERNAME} ^w 30 killow---", [1] = "sound/custom_spree/spree30a.wav", ["cooldown"] = 15, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 30 killow---", [1] = "sound/custom_spree/spree30b.wav", ["cooldown"] = 11, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 30 killow---", [1] = "sound/custom_spree/spree30c.wav", ["cooldown"] = 24, ["ignoreCooldown"] = false },
    },
    [35] = {
        { [0] = "^w---{PLAYERNAME} ^w 35 killow---", [1] = "sound/custom_spree/spree35a.wav", ["cooldown"] = 13, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 35 killow---", [1] = "sound/custom_spree/spree35b.wav", ["cooldown"] = 11, ["ignoreCooldown"] = false },
    },
    [40] = {
        { [0] = "^w---{PLAYERNAME} ^w 40 killow---", [1] = "sound/custom_spree/spree40a.wav", ["cooldown"] = 11, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 40 killow---", [1] = "sound/custom_spree/spree40b.wav", ["cooldown"] = 14, ["ignoreCooldown"] = false },
    },
    [45] = {
        { [0] = "^w---{PLAYERNAME} ^w 45 killow---", [1] = "sound/custom_spree/spree45a.wav", ["cooldown"] = 14, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 45 killow---", [1] = "sound/custom_spree/spree45b.wav", ["cooldown"] = 22, ["ignoreCooldown"] = false },
    },
    [50] = {
        { [0] = "^w---{PLAYERNAME} ^w 50 killow---", [1] = "sound/custom_spree/spree50a.wav", ["cooldown"] = 15, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 50 killow---", [1] = "sound/custom_spree/spree50b.wav", ["cooldown"] = 15, ["ignoreCooldown"] = false },
    },
    [60] = {
        { [0] = "^w---{PLAYERNAME} ^w 60 killow---", [1] = "sound/custom_spree/spree60a.wav", ["cooldown"] = 15, ["ignoreCooldown"] = false },
        { [0] = "^w---{PLAYERNAME} ^w 60 killow---", [1] = "sound/custom_spree/spree60b.wav", ["cooldown"] = 18, ["ignoreCooldown"] = false },
    },
    [100] = {
        { [0] = "^3---^1==^2==^4***^w{PLAYERNAME} ^5NABIL 100 KILLOW BEZ ZGONU, ^6TAKAGI IS NOT AMUSED^4***^2==^1==^3---", [1] = "sound/custom_spree/spree100a.wav",
            ["cooldown"] = 23, ["ignoreCooldown"] = true },
    },
}

knifespree_list = {
    [3] = {
        { [0] = "^w---{PLAYERNAME} ^1 3 kille nozem---", [1] = "sound/custom_spree/knifespree3.wav", ["cooldown"] = 8, ["ignoreCooldown"] = false }
    },
}

snipespree_list = {

}

spreeend1 = { [0] = "sound/custom_spree/spreeend1.wav", ["cooldown"] = 14, ["ignoreCooldown"] = false } --- for ending spree lower than 20 kills
spreeend2 = { [0] = "sound/custom_spree/spreeend2.wav", ["cooldown"] = 21, ["ignoreCooldown"] = false } --- 20+ kills
spreeendself = "sound/custom_spree/spreeendself.wav" --- ending own spree
spreeendteam = "sound/custom_spree/spreeendteam.wav" --- spree ended by team
spreeendunknown = "sound/custom_spree/spreeendunknown.wav" --- spree ender by world/unknown
firstbloodTriggered = false
firstblood_soundlist = {
    { [0] = "sound/custom_misc/firstblood1.wav", ["cooldown"] = 15 },
    { [0] = "sound/custom_misc/firstblood2.wav", ["cooldown"] = 15 },
    { [0] = "sound/custom_misc/firstblood3.wav", ["cooldown"] = 15 },
}

et.MAX_WEAPONS = 50
EV_GLOBAL_CLIENT_SOUND = 54

---For keeping track of players' sprees
deathsprees = {}
killing_sprees = {}
knifesprees = {}
snipesprees = {}

worldKillMessages = {
    "died",
    "zdeh",
    "wytrzezwial",
    "otrzymal darmowy wpierdol",
    "przewrocil sie",
    "kropnol",
    "kipnal",
    "nie dokonczyl flaszki"
}

censorKillMessages = {
    "eksplodowal",
    "rozflakowal sie",
    "nie dokonczyl flaszki",
    "zdenerwowal sie",
    "odwiedzil gimbaze"
}

---just a small helper i guess
function Log(msg)
    if(msg == nil) then msg = "NULL" end
    et.G_Print(msg.."\n")
end

function PlaySound(soundFile)
    et.G_globalSound(soundFile)
end

function PlayClientSound(client, soundFile)
    et.G_ClientSound(client, et.G_SoundIndex(soundFile))
end

function SendMsg(msg)
    if(msg ~= "") then
        et.trap_SendServerCommand(-1,"chat \""..msg.."\"")
    end
end

function SendSpree(msg, playername)
    if(msg == nil) then msg = "SPREE_MSG_ERROR" end
    if playername == nil then playername = "NIEZNANY_ZUL" end
    if(msg ~= "") then
        local newmsg = string.gsub(msg, "{PLAYERNAME}", playername)
        et.trap_SendServerCommand(-1,"chat \""..newmsg.."\"")
    end
end

function GetGuid(id)
    return(string.lower(et.Info_ValueForKey(et.trap_GetUserinfo(id), "cl_guid")))
end

function PlayerName(id)
    return(et.Info_ValueForKey(et.trap_GetUserinfo(id), "name"))
end

function PlayerTeam(client)
    local cs = et.trap_GetConfigstring(et.CS_PLAYERS + client)
    return tonumber(et.Info_ValueForKey(cs, "t"))
end

---=== CALLBACKS
function et_InitGame(levelTime, randomSeed, restart)
    sv_maxclients = tonumber(et.trap_Cvar_Get("sv_maxclients"))

    local i = 0
    for i=0, sv_maxclients-1 do
        playerKills[i] = 0
        playerDeaths[i] = 0
        deathsprees[i] = 0
        killing_sprees[i] = 0
        knifesprees[i] = {0, 0}
        snipesprees[i] = {0, 0}
    end

    matchEndAnnounced = false
    matchEndAnnounceTime = 0
	Log("---==Killing spree script by DrFeelgood loaded==---");
end

function et_Obituary(victim, killer, mod)
    if(mod == 64) then --- team change
        return nil
    end

    local soundPlayed = false
    local v_teamid = et.gentity_get(victim, "sess.sessionTeam")
    local k_teamid = nil
    local victimName = et.gentity_get(victim, "pers.netname")
    local killerName = "WORLD"
    if(killer ~= 1022 and killer ~= 1023) then
        killerName = et.gentity_get(killer, "pers.netname")
        k_teamid = et.gentity_get(killer, "sess.sessionTeam")
    end
    if(victim == killer) then -- suicide
        soundPlayed = true
    elseif(v_teamid == k_teamid) then -- team kill

    else -- normal kill
        if k_teamid ~= nil then -- no world / unknown kills
            deathsprees[killer] = 0
            playerKills[killer] = playerKills[killer]+1
            killing_sprees[killer] = killing_sprees[killer]+1
            if(mod == 6 or mod == 68) then knifesprees[killer][1] = knifesprees[killer][1]+1
            elseif(mod == 46 or mod == 51) then snipesprees[killer][1] = snipesprees[killer][1]+1 end
            soundPlayed = CheckSprees(killer)

            if firstbloodTriggered == false and tonumber(et.trap_Cvar_Get("gamestate")) == 0 then
                local randBlood = firstblood_soundlist[math.random(1, #firstblood_soundlist)]
                PlaySound(randBlood[0])
                killingSpreeCooldown = et.trap_Milliseconds() + (randBlood["cooldown"] * 1000)
                firstbloodTriggered = true
            end
        end
    end

    ---==spree end
    local spreeEnd = 0 --0/1/2
    if killing_sprees[victim] >= 5 and killing_sprees[victim] < 10 then spreeEnd = 1
    elseif killing_sprees[victim] >= 10 and killing_sprees[victim] < 20 then spreeEnd = 2
    elseif killing_sprees[victim] >= 20 then spreeEnd = 3 end
    if spreeEnd ~= 0 then
        if victim == killer then
            spreeEnd = 4
            SendMsg(et.gentity_get(victim, "pers.netname").."^1 zakonczyl swoj spree po  ==^2"..killing_sprees[victim].."^1== killach!")
        else
            if killer == 1022 or killer == 1023 then
                SendMsg("^1 Spree ^2=="..et.gentity_get(victim, "pers.netname").."^2==^1 zostal zakonczony po ==^2"..killing_sprees[victim].."^1== killach!")
                soundPlayed = true
                PlaySound(spreeendunknown)
            else
                SendMsg("^1 Spree ^2=="..et.gentity_get(victim, "pers.netname").."^2==^1 zostal zakonczony przez ^w"..et.gentity_get(killer, "pers.netname").."^1 po ==^2"..killing_sprees[victim].."^1== killach!")
            end
            if(v_teamid == k_teamid) then spreeEnd = 5 end
        end
    end

    ---==
    playerDeaths[victim] = playerDeaths[victim] + 1
    killing_sprees[victim] = 0
    deathsprees[victim] = deathsprees[victim] + 1
    knifesprees[victim] = {0, 0}
    snipesprees[victim] = {0, 0}

    if k_teamid ~= nil and killing_sprees[victim] > 4 and (mod == 6 or mod == 68) then --- spree ended with knife
        SendMsg(et.gentity_get(victim, "pers.netname").."^1's spree was ended by ^w"..et.gentity_get(killer, "pers.netname").."^1's knife!")
        PlaySound(spreeKnifeEndSound)
    end


    ---==play sounds
    if soundPlayed == false and spreeEnd == 2 and (et.trap_Milliseconds() > killingSpreeCooldown or spreeend1["ignoreCooldown"] == true) then
        PlaySound(spreeend1[0])
        killingSpreeCooldown = et.trap_Milliseconds() + spreeend1["cooldown"]*1000
    elseif soundPlayed == false and spreeEnd == 3 and (et.trap_Milliseconds() > killingSpreeCooldown or spreeend2["ignoreCooldown"] == true) then
        PlaySound(spreeend2[0])
        killingSpreeCooldown = et.trap_Milliseconds() + spreeend2["cooldown"]*1000
    elseif spreeEnd == 4 then PlaySound(spreeendself)--- selfkill
    elseif spreeEnd == 5 then PlaySound(spreeendteam) end

    CheckSprees(victim)

    ---==CUSTOM DEATH MESSAGES
    if(killer == 1022) then
        if(v_teamid == k_teamid) then
            return "^1[!TK!] ^w"..et.gentity_get(victim, "pers.netname").." ^w"..worldKillMessages[math.random(1, #worldKillMessages)]
        end
        return et.gentity_get(victim, "pers.netname").." ^w"..worldKillMessages[math.random(1, #worldKillMessages)]
    end
    if(mod == 72) then --- CENSOR KILL
        return et.gentity_get(victim, "pers.netname").." ^w"..censorKillMessages[math.random(1, #censorKillMessages)]
    end
    --Log("kills for "..et.gentity_get(killer, "pers.netname")..": "..killing_sprees[killer])
    --Log("knife kills for "..et.gentity_get(killer, "pers.netname")..": "..knifesprees[killer][1])
    --Log("deaths for "..et.gentity_get(victim, "pers.netname")..": "..deathsprees[victim])

    ---CUSTOM KILL MESSAGES
    --[[local i, x
    for i=1,#customKillMessages do
        for x=1, #customKillMessages[i][1] do
            if(customKillMessages[i][1][x] == mod) then
                if(customKillMessages[i][1][2] ~= nil) then
                    return customKillMessages[i][2][math.random(2, #customKillMessages[i][2])]
                end
            end
        end
    end
    --]]--
    --[[local endString = ""
    if(killer ~= 1022 and killer ~= 1023) then
        if(v_teamid == k_teamid) then endString = endstring.."^1[!TK!] " end
        if(mod == 1) then
            return endString.."^w"..victimName.."^w zostal rozflakowany przez "..killerName.."^w z ^1MG [MACHINEGUN]^w!"
        elseif(mod == 2) then
            return endString.."^w"..victimName.."^w zostal rozflakowany przez "..killerName.."^w z ^1browning'a [BROWNING]^w!"
        elseif(mod == 3) then
            return endString.."^w"..victimName.."^w zostal rozflakowany przez "..killerName.."^w z ^1MG42 [MG42]^w!"
        elseif(mod == 4) then
            return endString.."^w"..victimName.."^w zostal rozflakowany przez "..killerName.."^w ^1granatem [GRENADE]^w!"
        elseif(mod == 5) then
            return endString.."^w"..victimName.."^w zostal rozflakowany przez "..killerName.."^w ^1rakieta [ROCKET]^w!"
        elseif(mod == 6) then
            return endString.."^w"..victimName.."^w zostal ^1zadzgany ^wprzez "..killerName.."^w ^1[KNIFE]^w!"
        elseif(mod == 7) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w ^1lugerem [LUGER]^w!"
        elseif(mod == 8) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w ^1coltem [COLT]^w!"
        elseif(mod == 9) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w z ^1MP40 [MP40]^w!"
        elseif(mod == 10) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w z ^1thompsona [THOMPSON]^w!"
        elseif(mod == 11) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w ze ^1stena [STEN]^w!"
        elseif(mod == 12) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w z ^1garanda [GARAND]^w!"
        elseif(mod == 13) then
            return endString.."^w"..victimName.."^w zostal zlikwidowany przez "..killerName.."^w ze ^1snajpy [SNOOPERSCOPE]^w!"
        elseif(mod == 14 or mod == 50) then
            return endString.."^w"..victimName.."^w zostal po cichu zlikwidowany przez ^w"..killerName.."^w z ^1pistoletu [SILENCER]^w!"
        elseif(mod == 15) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w z ^1FG42 [FG42]^w!"
        elseif(mod == 16) then
            return endString.."^w"..victimName.."^w zostal zlikwidowany przez "..killerName.."^w z ^1FG42 [FG42 SCOPE]^w!"
        elseif(mod == 17) then
            return endString.."^w"..victimName.."^w zostal rozflakowany przez "..killerName.."^w z ^1panzerfaust'a [PANZERFAUST]^w!"
        elseif(mod == 18) then
            return endString.."^w"..victimName.."^w zostal rozflakowany przez "..killerName.."^w z ^1rifle grenade [RIFLE GRENADE]^w!"
        elseif(mod == 18) then
            return endString.."^w"..victimName.."^w zostal rozflakowany przez "..killerName.."^w z ^1rifle grenade [RIFLE GRENADE]^w!"
        elseif(mod == 19) then
            return endString.."^w"..victimName.."^w zostal spalony przez ^w"..killerName.."^w z ^1miotacza plomieni [FLAMETHROWER]^w!"
        elseif(mod == 26) then
            return endString.."^w"..victimName.."^w nie zauwazyl ^1dynamitu ^w"..killerName.."^1 [DYNAMITE]^w!"
        elseif(mod == 27) then
            return endString.."^w"..victimName.."^w zostal zniszczony przez ^1nalot ^w"..killerName.."^1 [AIRSTRIKE]^w!"
        elseif(mod == MOD_REVIVE) then
            return endString.."^w"..victimName.."^w zostal ^2podniesiony przez ^w"..killerName.."^2 [REVIVE]^w!"
        elseif(mod == 30) then
            return endString.."^w"..victimName.."^w zostal rozflakowany przez "..killerName.."^w z ^1artylerii [ARTILLERY]^w!"
        elseif(mod == 45) then
            return endString.."^w"..victimName.."^w nie zauwazyl ^1miny ^w"..killerName.."^w ^1[LANDMINE]^w!"
        elseif(mod == 47) then
            return endString.."^w"..victimName.."^w nie zauwazyl ^1miny ^w"..killerName.."^w ^1[TRIPMINE]^w!"
        elseif(mod == 49) then
            return endString.."^w"..victimName.."^w zostal rozflakowany przez "..killerName.."^w z ^1mobile MG42 [MOBILE MG42]^w!"
        elseif(mod == 51) then
            return endString.."^w"..victimName.."^w zostal zlikwidowany przez "..killerName.."^w ze ^1snajpy [GARAND SCOPE]^w!"
        elseif(mod == 52) then
            return endString.."^w"..victimName.."^w zostal ^1zamurowany ^wprzez "..victimName.."^w ^1[CONSTRUCTION]^w!"
        elseif(mod == 55) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w z ^1K43 [K43]^w!"
        elseif(mod == 56) then
            return endString.."^w"..victimName.."^w zostal zlikwidowany przez "..killerName.."^w ze ^1snajpy [K43 SCOPE]^w!"
        elseif(mod == 57) then
            return endString.."^w"..victimName.."^w przyjal pocisk ^w"..killerName.."^w na klate ^1[MORTAR]^w!"
        elseif(mod == 58) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w z ^1coltow [AKIMBO COLT]^w!"
        elseif(mod == 58) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w z ^1lugerow [AKIMBO LUGER]^w!"
        elseif(mod == 65) then
            return endString.."^w"..victimName.."^w zostal ^1zdeptany ^wprzez "..victimName.."^w [GOOMBA]^w!"
        elseif(mod == 67) then
            return endString.."^w"..victimName.."^w dostal ^1zawalu ^wwalczac z ^w"..killerName.."^w [SUICIDE]^w!"
        elseif(mod == 68) then
            return endString.."^w"..victimName.."^w dostal ^1nozem ^wod ^w"..killerName.."^w [KNIFE]^w!"
        elseif(mod == 70) then
            return endString.."^w"..victimName.."^w zostal rozstrzelany przez "..killerName.."^w z ^1PPSH [PPSH]^w!"
        end
    end]]--
end

function et_RunFrame(lvltime)
    if(matchEndAnnounceTime ~= 0 and et.trap_Milliseconds() >= matchEndAnnounceTime and matchEndAnnounced == false) then
        matchEndAnnounced = true
        ---=====WIN/LOST
        if(tonumber(et.Info_ValueForKey(et.trap_GetConfigstring(14), "winner")) ~= nil) then
            winTeam = tonumber(et.Info_ValueForKey(et.trap_GetConfigstring(14), "winner")) + 1 --offset to match playerteams, 0 = tie
            if(winTeam ~= 0) then
                for i = 0, tonumber(et.trap_Cvar_Get("sv_maxClients")) - 1 do
                    if(PlayerTeam(i) == winTeam) then
                        PlayClientSound(i, matchWonSound)
                        PlayClientSound(i, matchWonSound)
                    elseif(PlayerTeam(i) ~= winTeam and PlayerTeam(i) ~= 3) then
                        PlayClientSound(i, matchLostSound)
                        PlayClientSound(i, matchLostSound)
                    end
                end
            end
        end
        ---=====TOP KILLERS
        function CompareByKD(a,b)
            return a[2] > b[2]
        end

        local kdStats = { }
        for i = 0, tonumber(et.trap_Cvar_Get("sv_maxClients")) - 1 do
            if(playerKills[i] >= 1) then
                if(playerDeaths[i] == 0) then table.insert(kdStats, {i, playerKills[i]})
                else table.insert(kdStats, {i, playerKills[i] / playerDeaths[i]}) end
            end
        end
        if(#kdStats > 0) then
            table.sort(kdStats, CompareByKD)
            et.trap_SendServerCommand(-1,"chat \"^5===Top3 zabojcze zule mapy:\"")
            for i = 1, #kdStats do
                local msg = "^5"..i..". ^w"..et.gentity_get(kdStats[i][1], "pers.netname").."^5 - KD ratio: "..string.format("%2.2f", kdStats[i][2])
                et.trap_SendServerCommand(-1,"chat \""..msg.."\"")

                if(i >= 3) then break end
            end
        end
        ---=====FLAWLESS VICTORY
        for i = 0, tonumber(et.trap_Cvar_Get("sv_maxClients")) - 1 do
            if((playerKills[i] >= 20 and playerDeaths[i] == 0) or (playerKills[i] >= 10 and playerDeaths[i] ~= 0 and playerKills[i]/playerDeaths[i] >= 25)) then
                local msg = "^q=Flawless victory: "..et.gentity_get(i, "pers.netname").." K: "..playerKills[i].." / D: "..playerDeaths[i]
                et.trap_SendServerCommand(-1,"chat \""..msg.."\"")
            end
        end
    end
end

function et_IntermissionStarts(round)
    matchEndAnnounceTime = et.trap_Milliseconds() + 5*1000
end

--=====
function CheckSprees(id)
    local soundPlayed = false
    if knifesprees[id][1] ~= 0 then
        if(knifespree_list[knifesprees[id][1]] ~= nil and knifesprees[id][1] ~= knifesprees[id][2]) then
            local _spree = knifespree_list[knifesprees[id][1]]
            local _spreeid = _spree[math.random(1, #_spree)]
            SendSpree(_spreeid[0], et.gentity_get(id, "pers.netname"))
            if(soundPlayed == false and (et.trap_Milliseconds() > killingSpreeCooldown or _spreeid["ignoreCooldown"] == true)) then
                PlaySound(_spreeid[1])
                killingSpreeCooldown = et.trap_Milliseconds() + (_spreeid["cooldown"] * 1000)
            end
            soundPlayed = true
            knifesprees[id][2] = knifesprees[id][1]
        end
    end

    --if snipesprees[id][1] ~= 0 then
    --    if(sniprespree_list[snipesprees[id][1]] ~= nil and snipesprees[id][1] ~= snipesprees[id][2]) then
    --        local _spree = sniprespree_list[snipesprees[id][1]]
    --        local _spreeid = _spree[math.random(1, #_spree)]
    --        SendSpree(_spreeid[0], et.gentity_get(id, "pers.netname"))
    --        PlaySound(_spreeid[1])
    --        soundPlayed = true
    --        snipesprees[id][1] = snipesprees[id][2]
    --    end
    --end

    if killing_sprees[id] ~= 0 then
        if(spree_list[killing_sprees[id]] ~= nil) then
            local _spree = spree_list[killing_sprees[id]]
            local _spreeid = _spree[math.random(1, #_spree)]
            SendSpree(_spreeid[0], et.gentity_get(id, "pers.netname"))
            if(soundPlayed == false and (et.trap_Milliseconds() > killingSpreeCooldown or _spreeid["ignoreCooldown"] == true)) then
                PlaySound(_spreeid[1])
                killingSpreeCooldown = et.trap_Milliseconds() + (_spreeid["cooldown"] * 1000)
            end
            soundPlayed = true
        end
    end

    if deathsprees[id] ~= 0 then
        if(deathspree_list[deathsprees[id]] ~= nil) then
            local _spree = deathspree_list[deathsprees[id]]
            local _spreeid = _spree[math.random(1, #_spree)]
            SendSpree(_spreeid[0], et.gentity_get(id, "pers.netname"))
            if(et.trap_Milliseconds() > killingSpreeCooldown or _spreeid["ignoreCooldown"] == true) then
                PlaySound(_spreeid[1])
                killingSpreeCooldown = et.trap_Milliseconds() + (_spreeid["cooldown"] * 1000)
            end
            soundPlayed = false
        end
    end

    return soundPlayed
end

function et_ClientBegin(id)
    playerKills[id] = 0
    playerDeaths[id] = 0
    deathsprees[id] = 0
    killing_sprees[id] = 0
    knifesprees[id][1] = 0
    snipesprees[id][1] = 0
end

function et_ClientDisconnect(id)
    playerKills[id] = 0
    playerDeaths[id] = 0
    deathsprees[id] = 0
    killing_sprees[id] = 0
    knifesprees[id][1] = 0
    snipesprees[id][1] = 0
end

function ParseString(inputString)
	local i = 1
	local t = {}
	for w in string.gfind(inputString, "([^%s]+)%s*") do
		t[i]=w
		i=i+1
	end
	return t
end

