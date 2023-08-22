--[[
Auto MSG Like Bot growtopia doing right now

This source only can use on GentaHax / or you can convert to another executor

This Script can sended msg to player joining your local world | you must afk

Can msg player on another world

[!] Ratio Ban 90%

[!] Dont ask me if your account got ban

[!] Dont use main account

Discord : pangerans
@iHkaz
]]


local delay = 5000
local text = "Hi Bro Nice To Meet You!"


--Dont Change This-----------
ListHookedName = {}
startSpammingMessage = false
-----------------------------

Log("Dont Cry if your account got ban (yes)")

function sendMSG(name,text)
    SendPacket(2,"action|input\n|text|/msg "..name.." "..text)
end -- Function for send msg to listed name

AddHook("OnVarList","hookvsr",function(var)
    if var[0] == "OnSpawn" then
        table.insert(ListHookedName,{name = var[1]:match("name|(.+)\n")}) -- Added Name to table if player join the world
        Log("Succes Added "..var[1]:match("name|(.+)\n"))
        if #ListHookedName == 5 then
            startSpammingMessage = true
            Log("Succes Hooked 5 Name!. Program starting...")
        end -- Will Spam if Got 5 Hooked Name :) 
    end
end)

while true do
    SleepMS(delay)
    totalplayer = 0
    if startSpammingMessage then
        SleepMS(delay)
        for _,hook in pairs(ListHookedName) do
            sendMSG(hook.name,text)
            SleepMS(delay)
            totalplayer = totalplayer + 1
        end
        Log("Succes Send Msg To"..totalplayer.."Player")
    end
end