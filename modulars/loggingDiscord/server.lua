--[[
    TRP-CADSync Discord Logging
    Created By Terra Isles Development Team
    © Terra Isles Roleplay Community 2017-2025
    Do not edit anything in this file unless you know what you are doing. Use Config Files!!!
]]
---@param url string
---@param message string
---@param embed string
---@param logType any
---@return nil
function TRPlib.DiscordLog(url, message, embed, logType)
    if not TRPlib.Config.DiscordLoggingEnable then return end 
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
