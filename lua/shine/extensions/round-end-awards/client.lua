--The registered table from shared.lua is passed as the global "Plugin".
local Plugin = Plugin

--This is ran when the plugin is loaded on the client, which is when the client finished loading.
function Plugin:Initialise()
	Print( "DT:\nBool: %s\nInt: %s\n", tostring( self.dt.Bool ), tostring( self.dt.Int ) )

	self:CreateCommands()

	self.Enabled = true

	return true
end

--This will create two client side test commands, which print the two datatable values.
function Plugin:CreateCommands()
	local function PrintBool()
		Print( "Bool: %s.", tostring( self.dt.Bool ) )
	end
	local TestBoolCommand = self:BindCommand( "sh_testcl_bool", PrintBool )

	local function PrintInt()
		Print( "Int: %s.", tostring( self.dt.Int ) )
	end
	local TestIntCommand = self:BindCommand( "sh_testcl_int", PrintInt )
end

--You do not need to define this, unless you are doing more than the base class function does.
function Plugin:Cleanup()
	--Seeing as we're printing a message on cleanup, we need to call the base class cleanup to remove our commands.
	self.BaseClass.Cleanup( self )

	Print "Disabling client plugin..."
end
