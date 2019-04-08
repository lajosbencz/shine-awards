--It is the job of shared.lua to create the plugin table.
local Plugin = {}
Plugin.Version = "1.0" -- The plugin's (config) version

Plugin.HasConfig = true -- Does this plugin have a config file?
Plugin.ConfigName = "RoundEndAwards.json" -- What's the name of the file?
Plugin.DefaultConfig = { -- What's the default config setup?
    StatEnable = {
		MostKills = true,
		MostDeaths = true,
		MostDamageDealt = true,
		MostDamageSuffered = true,
		MostJumps = true,
		FurthestTraveled = true,
	}
}
Plugin.CheckConfig = true -- Should we check for missing/unused entries when loading?
Plugin.CheckConfigTypes = true -- Should we check the types of values in the config to make sure they match our default's types?
Plugin.CheckConfigRecursively = false -- Should we check sub-table's values for missing/unused entries too?

Plugin.DefaultState = false -- Should the plugin be enabled when it is first added to the config?

Plugin.NS2Only = false -- Set to true to disable the plugin in NS2: Combat if you want to use the same code for both games in a mod.

--This will setup a datatable for the plugin, which is a table of networked values.
function Plugin:SetupDataTable()
	--This adds a boolean value, indexed as "Bool", with default value true.
	self:AddDTVar( "boolean", "Bool", true )
	--This adds an integer value, clamped between 0 and 10, indexed as "Int" and with default value 4.
	self:AddDTVar( "integer (0 to 10)", "Int", 4 )
end

--This is called when any datatable variable changes.
function Plugin:NetworkUpdate( Key, Old, New )
	if Server then return end
	
	--Key is the variable name, Old and New are the old and new values of the variable.
	Print( "%s has changed from %s to %s.", Key, tostring( Old ), tostring( New ) )
end

--This table will be passed into server.lua and client.lua as the global value "Plugin".
Shine:RegisterExtension( "round-end-awards", Plugin )
