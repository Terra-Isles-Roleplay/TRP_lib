---@param type string
---@param id string
---@return boolean
function TRPlib.GetPlayerIdentifier(type, id)
    local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(id)

    for a = 0, numIdentifiers do
       table.insert(identifiers, GetPlayerIdentifier(id, a))
    end

    for b = 1, #identifiers do
       if string.find(identifiers[b], type, 1) then
            return identifiers[b]
       end
    end
    return false
end

return TRPlib.GetPlayerIdentifier