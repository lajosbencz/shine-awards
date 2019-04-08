--The plugin table registered in shared.lua is passed in as the global "Plugin".
local Plugin = Plugin

function Plugin:Initialise()
	self:CreateCommands()

	self.Enabled = true

	return true
end

--Here we create two commands that set our datatable values.
function Plugin:CreateCommands()
	local Commands = Plugin.Commands

	local function ChangeBool( Client, Bool )
		self.dt.Bool = Bool
	end
	local ChangeBool = self:BindCommand( "sh_test_bool", "bool", ChangeBool, true )
	ChangeBool:AddParam{ Type = "boolean", Optional = true, Default = function() return not self.dt.Bool end }

	local function ChangeInt( Client, Int )
		self.dt.Int = Int
	end
	local ChangeInt = self:BindCommand( "sh_test_int", "int", ChangeInt, true )
	ChangeInt:AddParam{ Type = "number", Round = true, Min = 0, Max = 10 }
end

--We call the base class cleanup to remove the console commands.
function Plugin:Cleanup()
	self.BaseClass.Cleanup( self )

	Print "Disabling server plugin..."
end
