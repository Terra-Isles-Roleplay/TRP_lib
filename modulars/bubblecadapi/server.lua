---@param APIMethod string
---@param DataType string
---@param DataTypeLookup string
---@param APIData string|table
---@param APIParams table
---@return table|nil|boolean
function TRPlib.BubbleAPICall(APIMethod, DataType, DataTypeLookup, APIData, APIParams)
    if TRPlib.Config.CadType ~= 'TRP' or TRPlib.Config.CadType ~= 'bubble' then return end
    local response = {} -- Table to store the API response
    local DataTypeUrl
    local DataTypeLookupUrl
    local headers

    if DataType == nil or DataTypeLookup == nil then return false end

    if DataType == 'wf' then DataTypeUrl = TRPlib.Config.BubbleWfUrl end
    if DataType == 'data' then DataTypeLookupUrl = TRPlib.Config.BubbleDataUrl end

    if TRPlib.Config.Cad.ApiKeyQuerry ~= '' then
        -- Set the headers required for the API request
        headers = {
            ["Content-Type"] = "application/json", -- Specify the content type as JSON
        }
        APIParams.key = TRPlib.Config.Cad.ApiKeyQuerry
    elseif TRPlib.Config.Cad.ApiKeyHeader ~= '' then
        -- Set the headers required for the API request
        headers = {
            ["Content-Type"] = "application/json", -- Specify the content type as JSON
            ["Authorization"] = "Bearer " .. TRPlib.Config.CAD.ApiKeyHeader -- Add authorization token
        }
    end

    -- Construct the base URL for the API endpoint
    local url = TRPlib.Config.Cad.ApiUrl .. DataTypeUrl .. DataTypeLookupUrl

    -- Check if `APIParams` is provided and construct the query string for multiple parameters
    if APIParams ~= nil then
        local queryString = {} --Local table to hold query parameters
        for key, value in pairs(APIParams) do
            table.insert(queryString, key .. "=" .. tostring(value)) -- Add each key-value pair
        end
        url = url .. "?" .. table.concat(queryString, "&") -- Combine all parameters with '&'
    end

    

    -- Make the HTTP request and capture the status code, response body, and headers
    ---@diagnostic disable-next-line: param-type-mismatch
    local statusCode, responseBody, responseHeaders = PerformHttpRequestAwait(url, APIMethod, APIData, headers)

    -- Assign response data or a fallback message if the response body is empty
    response.data = responseBody or "No response body available."
    response.statuscode = statusCode -- Store the status code
    response.headers = responseHeaders -- Store the response headers

    -- Check if the API call was successful (status code 200)
    if response.statuscode == 200 then
        response.data = json.decode(response.data)
        response = response.data
        return response
    else
        -- Log an error message if the API call was unsuccessful
        return TRPlib.Print('[TRPCore-CADSYNC API] HTTP Status Code: ' .. tostring(response.statuscode) .. ' ' .. json.encode(response.data, {indent = true}), 'error')
    end
end

return TRPlib.BubbleAPICall