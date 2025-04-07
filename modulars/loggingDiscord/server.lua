--[[ 
  _______ _____  _____         _____          _____   _______     ___   _  _____ 
 |__   __|  __ \|  __ \       / ____|   /\   |  __ \ / ____\ \   / / \ | |/ ____|
    | |  | |__) | |__) |_____| |       /  \  | |  | | (___  \ \_/ /|  \| | |     
    | |  |  _  /|  ___/______| |      / /\ \ | |  | |\___ \  \   / | . ` | |     
    | |  | | \ \| |          | |____ / ____ \| |__| |____) |  | |  | |\  | |____ 
    |_|  |_|  \_\_|           \_____/_/    \_\_____/|_____/   |_|  |_| \_|\_____|
 
    TRP-CADSync Discord Logging
    Created By Terra Isles Development Team
    © Terra Isles Roleplay Community 2017-2025
    Do not edit anything in this file unless you know what you are doing. Use Config Files!!!
]]

---@param message string
---@param embed boolean
---@param logType string
---@return nil
function TRPlib.DiscordLog(message, embed, logType)
    local webhookData
    if not message or not logType then return end
    if type(message) ~= 'string' then return end
    webhookData.embeds = {}
    webhookData.embeds.footer = {}
    if embed then
        webhookData.embeds.name = '['..logType..']'
        webhookData.embeds.discription = message
        webhookData.embed.footer.text = 'TRP Logging System'
    else
        webhookData.content = message
    end
     ---@type boolean, string, string
    TRPlib.Discord.postWebhook('', webhookData)
    return
end
