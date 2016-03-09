note
	description: "[
		Representation of an {EP_ROLE}.
		]"
	design: "[
		An {EP_ROLE} is the nexus point between an {EP_OPERATIVE},
		{EP_WIDGET} and `permission_level'
		]"

class
	EP_ROLE

inherit
	EP_IDENTIFIABLE
		rename
			description as name
		end

	EP_ANY
		undefine
			default_create
		end

feature {NONE} -- Implementation

	permission_level: INTEGER
			-- `permission_level' of Current {EP_IDENTIFIABLE} given `levels' et al.

feature {NONE} -- Implementation: Constants

	No_access: INTEGER = 0
	View_access: INTEGER = 1
	Edit_access: INTEGER = 2
	Add_access: INTEGER = 3
	Delete_access: INTEGER = 4

	Level_count: INTEGER = 5

	levels: HASH_TABLE [STRING, INTEGER]
			-- `levels' of Current {EP_ANY}.
		once
			create Result.make (Level_count)
			Result.extend ("No-Access", no_access)
			Result.extend ("View-Access", view_access)
			Result.extend ("Edit-Access", edit_access)
			Result.extend ("Add-Access", add_access)
			Result.extend ("Delete-Access", delete_access)
		end

invariant
	level_count: levels.count = Level_count
	levels_in_bounds: across (no_access |..| delete_access) as ic_bounds all levels.has_key (ic_bounds.item) end
	permission_in_bounds: (no_access |..| delete_access).has (permission_level)

end