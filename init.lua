--- Taken from ox_lib, edited by Tristian R.
local debug_getinfo = debug.getinfo

function noop() end

TRPlib = setmetatable({
    name = 'TRP_lib',
    context = IsDuplicityVersion() and 'server' or 'client',
}, {
    __index = function(self, key)
        local dir = ('modulars/%s'):format(key)
        local chunk = LoadResourceFile(self.name, ('%s/%s.lua'):format(dir, self.context))
        local shared = LoadResourceFile(self.name, ('%s/shared.lua'):format(dir))

        if shared then
            chunk = (chunk and ('%s\n%s'):format(shared, chunk)) or shared
        end

        if chunk then
            local fn, err = load(chunk, ('@@TRP_lib/%s/%s.lua'):format(key, self.context))

            if not fn or err then
                return print(('\n^1Error importing module (%s): %s^0'):format(dir, err))
            end

            rawset(self, key, fn() or noop)

            return self[key]
        end
    end
})