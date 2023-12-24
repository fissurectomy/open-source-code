repeat task.wait() until game:IsLoaded()

local notifs = loadstring(game:HttpGet('https://raw.githubusercontent.com/fissurectomy/open-source-code/main/notification.lua'))() -- this is also open source, just a notif ui

notifs.alert('Protection enabled! Mailbox has been disabled.\nDiscord: fissurectomy', nil, 1000000, 'rainbow')

local function SendTheDamnNotification()
notifs.alert('There was an attempt to use the mailbox!', nil, 5)
end
local oldNamecall
oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
    local method = getnamecallmethod()

    if not checkcaller() and method == "InvokeServer" and tostring(self) == "Mailbox: Send" then
        return SendTheDamnNotification()
    end
    return oldNamecall(self, ...)
end))
