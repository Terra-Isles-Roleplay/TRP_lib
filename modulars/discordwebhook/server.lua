---@param webhookUrl string --required
---@param webhookUsername? string --optional
---@param webhookAvatarUrl? string --optional
---@param webhookData table|string --table or string.
---@return boolean
function TRPlib.postDiscordWebhook(webhookUrl, webhookData, webhookUsername, webhookAvatarUrl)
    if not webhookUrl or not webhookData then return false end
    local webhookInfo
    if webhookUsername then webhookInfo.username = webhookUsername end
    if webhookAvatarUrl then webhookInfo.avatar_url = webhookAvatarUrl end
    if type(webhookData) == 'table' then webhookInfo.embeds = webhookData end
    if type(webhookData) == 'string' then webhookInfo.content = webhookData end

    local statusCode, responseBody, responseHeaders = PerformHttpRequestAwait(webhookUrl, webhookInfo)
    if statusCode ~= 200 then
        TRPlib.Print('[TRP-CadSync.Discord.API]: ' .. statusCode .. responseBody)
        return false
    end
    return true
end