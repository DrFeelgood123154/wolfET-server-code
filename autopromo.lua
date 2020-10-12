----------------------------------------------------------------------
-- AutoPromo - An Enemy Territory Auto Promoting Mod
----------------------------------------------------------------------
description = "AutoPromo"
version =    "1.1"
----------------------------------------------------------------------
-- This script can be freely used and modified as long as the original
-- authors are mentioned.
-- Created by Perlo_0ung, edited by Dragon
-- Adapted for silEnT mod 0.5.0 and higher
----------------------------------------------------------------------
-- CONFIGURATION
----------------------------------------------------------------------

lvl1xp = 5000  -- XP needed for level 1
lvl2xp = 10000 -- XP needed for level 2
lvl3xp = 16000 -- XP needed for level 3
lvl4xp = 22000 -- XP needed for level 4
lvl5xp = 28000 -- XP needed for level 5
lvl6xp = 36000 -- Added by DrFeelgood
lvl7xp = 47000 -- Added by DrFeelgood
lvl8xp = 60000 -- Added by DrFeelgood
lvl9xp = 100000 -- Added by DrFeelgood
lvl10xp = 120000 -- Added by DrFeelgood
lvl11xp = 150000 -- Added by DrFeelgood
lvl12xp = 200000 -- Added by DrFeelgood

----------------------------------------------------------------------
-- DO NOT EDIT BELOW THIS LINE
-- UNLESS YOU KNOW WHAT YOU'RE DOING
----------------------------------------------------------------------

function et_InitGame(levelTime,randomSeed,restart)
    local modname = string.format("%s v%s", description, version)
    et.G_Print(string.format("%s loaded\n", modname))
    et.RegisterModname(modname)
end

-- TheSilencerPL - To make it better, faster and less aggravating
-- for the game, store the XP locally and reuse it
function et_ClientSpawn(clientNum, revived, teamChange, restoreHealth)
   local valXP = getXP(clientNum)
   if valXP >=  lvl1xp and valXP < lvl2xp then
      setlevel(clientNum,1,lvl1xp)
   elseif valXP >=  lvl2xp and valXP < lvl3xp then
      setlevel(clientNum,2,lvl2xp)
   elseif valXP >=  lvl3xp and valXP < lvl4xp then
      setlevel(clientNum,3,lvl3xp)
   elseif valXP >=  lvl4xp and valXP < lvl5xp then
      setlevel(clientNum,4,lvl4xp)
   elseif valXP >=  lvl5xp then
      setlevel(clientNum,5,lvl5xp)
   elseif valXP >=  lvl6xp then
      setlevel(clientNum,6,lvl6xp)
   elseif valXP >=  lvl7xp then
      setlevel(clientNum,7,lvl7xp)
   elseif valXP >=  lvl8xp then
      setlevel(clientNum,8,lvl8xp)
   elseif valXP >=  lvl9xp then
      setlevel(clientNum,9,lvl9xp)
   elseif valXP >=  lvl10xp then
      setlevel(clientNum,10,lvl10xp)
   elseif valXP >=  lvl11xp then
      setlevel(clientNum,11,lvl11xp)
   elseif valXP >=  lvl12xp then
      setlevel(clientNum,12,lvl12xp)
   end
end

function getXP(playerID)
   return  et.gentity_get(playerID, "ps.persistant", 0)
end

function getlevel(playerID)
   return et.G_shrubbot_level(playerID)
end

function setlevel(playerID, newlevel, xp)
   local name = et.gentity_get(playerID,"pers.netname")
   if isBot(playerID) or noGuid(playerID) then return end
   if newlevel <= getlevel(playerID) then return end
      et.trap_SendServerCommand(-1,"bp \"^wGratuluje ^7"..name.."^w, zostales awansowany na level ^2"..newlevel.." ^w!\"")
      et.trap_SendConsoleCommand( et.EXEC_APPEND, "setlevel ".. playerID.." "..newlevel.."\n" )
      et.trap_SendConsoleCommand( et.EXEC_APPEND, "readconfig\n" )
end

function noGuid(playerID)
   local userinfo = et.trap_GetUserinfo( playerID )
   local guid     = et.Info_ValueForKey( userinfo, "sil_guid" )
   if guid == "NO_GUID" or guid == "unknown" then
      return true
   end
end

function isBot(playerID)
   if et.gentity_get(playerID,"ps.ping") == 0 then
   return true
   end
end
