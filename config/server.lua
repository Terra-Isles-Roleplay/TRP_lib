local Config = {}
local CadDataTypes = {}
local CadWfTypes = {}


Config.Logging = {
    Enabled = false,
    LevelsEnabled = {
        info = false,
        warn = false,
        error = false,
        debug = false
    }
}


-- Discord Configurations

Config.Discord = {
    Enabled = false, -- Enable Discord Options
    LoggingEnable = false, -- Enable logging to Discord via webhook. Must have the webhook enabled.
    GuildId = '', -- Your server ID.
    BotToken = '', -- Your Bot token
    -- Add Custom Events here or call webhook Event in your own script. Leave blank if you don't want to use them.
    Webhooks = {
        Logging = '',
        ApiCall = '',
        Vmenu = '',
    },
    Events = { -- Enable Discord Features
        getMember = false, --Get a user of a discord server
        getGuild = false, --Get a Discord server
        getRoles = false --Get a users roles in a discord server
    },
    Whitelist = { -- Disable if not wanting to use Discord whitelist.
        Enabled = false, -- Must have all Discord features enabled.
        Roles = {"put id here", "second id"} --String table of the roles you want to be whitelisted. Not currently setup.
    }
}

-- CAD API Configuration

Config.Cad = {
    Type = 'TRP', -- Options: TRP, Bubble
    ApiUrl = '', -- Base Url for API (i.e. https://example.com/api/1.1/)
    BubbleWfUrl = 'wf/', --Only use if using a bubblecad (should be wf/)
    BubbleDataUrl = 'obj/', --Only use if using a bubblecad (should be obj/)
    TRPCadVerison = 'v1', --Only used when using TRP's Cad. (Currently private)
    ApiKeyHeader = '',
    ApiKeyQuerry = '',

}

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
-- Add custom Data Types here.

-- Cad Workflow Types (Only used for TRP & Bubble)

CadWfTypes.getCall = '' --Get Single call
CadWfTypes.getCivilian = '' --Get Single Civilian
CadWfTypes.getDepartment = '' --Get Single Department
CadWfTypes.getInfo = '' -- Get Single information
CadWfTypes.getSubdivision = '' --Get Single Subdivision
CadWfTypes.getUser = '' --Get Single user
CadWfTypes.getVehicle = '' --Get Single vehicle
CadWfTypes.getWeapon = '' --Get Single vehicle
-- Add custom Get Workflows here.

CadWfTypes.setCall = '' --Set Single call
CadWfTypes.setCivilian = '' --Set Single Civilian
CadWfTypes.setDepartment = '' --Set Single Department
CadWfTypes.setSubdivision = '' --Set Single Subdivision
CadWfTypes.setVehicle = '' --Set Single vehicle
CadWfTypes.setWeapon = '' --Set Single vehicle
-- Add custom Set Workflow type here.

CadWfTypes.getCalls = ''
CadWfTypes.getCivilians = ''
CadWfTypes.getDepartments = ''
CadWfTypes.getSubdivisions = ''
CadWfTypes.getUsers = ''
CadWfTypes.getVehicles = ''
CadWfTypes.getWeapons = ''

-- Add custom Get Workflow types here. - muti-item

-- DO NOT EDIT

Config.DataTypes = CadDataTypes
Config.WfTypes = CadWfTypes
TRPlib.Config = Config


return TRPlib.Config