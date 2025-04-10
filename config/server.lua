---@type table
local Config = {}
local Discord = {}
local CadDataTypes = {}
local CadWfTypes = {}


Config.LoggingEnabled = false


----Discord Configurations

Config.Discord = {
    DiscordEnabled = false, -- Enable Discord Options
    LoggingEnable = false, --Enable logging to Discord via webhook.<br>Must have the webhook enabled.
    GuildId = '', --Your server ID.
    BotToken = '',--Your Bot token
    -- Add Custom Events here or call webhook Event in your own script.<br>Leave blank if you dont want to use them.
    Webhooks = {
        Logging = '',
        ApiCall = '',
    },
    Events = { --Enable Discord Features
        getMember = false,
        getGuild = false,
        getRoles = false
    }
}

-- CAD API Configuration

Config.CadType = 'TRP' -- Options: TRP, Bubble
Config.CadApiUrl = '' -- Base Url for API (i.e. https://example.com/api/1.1/)
Config.BubbleWfUrl = 'wf/' --Only use if using a bubblecad (should be wf/)
Config.BubbleDataUrl = 'obj/'--Only use if using a bubblecad (should be obj/)
Config.TRPCadVerison = 'v1' --Only used when using TRP's Cad. (Currently private)
Config.CadApiKeyHeader = '' --Use this if your API key should go in the header
Config.CadApIKeyQuerry = '' --Use this if your API key should be sent as a param.

-- Cad Data Types <br>
-- If you cad dosn't use a type then replace with nil <br> Example: calls = 'call' or calls = nil


CadDataTypes.calls = '' --Also sometimes called files
CadDataTypes.civilians = ''
CadDataTypes.departments = ''
CadDataTypes.info = '' --Community information from CAD (Name, settings, etc.) Mainly used for TRP Cad or Bubble Cad
CadDataTypes.subdivisions = ''
CadDataTypes.users = ''
CadDataTypes.vehicles = ''
CadDataTypes.weapons = ''
--- Add custom Data Types here.

-- Cad Workflow Types (Only used for TRP & Bubble)


CadWfTypes.getCall = '' --Get Single call
CadWfTypes.getCivilian = '' --Get Single Civilian
CadWfTypes.getDepartment = '' --Get Single Department
CadWfTypes.getInfo = '' -- Get Single information
CadWfTypes.getSubdivision = '' --Get Single Subdivision
CadWfTypes.getUser = '' --Get Single user
CadWfTypes.getVehicle = '' --Get Single vehicle
CadWfTypes.getWeapon = '' --Get Single vehicle
--- Add custom Get Workflows here.

CadWfTypes.setCall = '' --Set Single call
CadWfTypes.setCivilian = '' --Set Single Civilian
CadWfTypes.setDepartment = '' --Set Single Department
CadWfTypes.setSubdivision = '' --Set Single Subdivision
CadWfTypes.setVehicle = '' --Set Single vehicle
CadWfTypes.setWeapon = '' --Set Single vehicle
--- Add custom Set Workflow type here.

CadWfTypes.getCalls = ''
CadWfTypes.getCivilians = ''
CadWfTypes.getDepartments = ''
CadWfTypes.getSubdivisions = ''
CadWfTypes.getUsers = ''
CadWfTypes.getVehicles = ''
CadWfTypes.getWeapons = ''

--- Add custom Get Workflow types here. - muti-item



---Do not edit.

Config.DataTypes = CadDataTypes
Config.WfTypes = CadWfTypes
Config.Discord = Discord
TRPlib.Config = Config


return TRPlib.Config