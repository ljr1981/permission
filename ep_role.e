note
	description: "[
		Abstract notion of an {EP_ROLE}.
		]"
	design: "[
		An {EP_ROLE} is the nexus point between an {EP_OPERATIVE},
		{EP_WIDGET}s and `permission_level'
		]"

deferred class
	EP_ROLE

inherit
	EP_IDENTIFIABLE
		rename
			description as name,
			set_description as set_name
		end

	EP_ANY
		undefine
			default_create
		end

feature -- Settings

	set_permission_level (a_permission_level: like permission_level)
			-- `set_permission_level' with `a_permission_level' into `permission_level'.
		do
			permission_level := a_permission_level
		ensure
			set: permission_level = a_permission_level
		end

feature {NONE} -- Implementation

	permission_level: INTEGER
			-- `permission_level' of Current {EP_IDENTIFIABLE} given `levels' et al.
		note
			design: "[
				The -999 value is designed to trip the invariant if the `permission_level'
				is accessed without being set. It forces descendent code to create a level
				between [0-4].
				]"
		attribute
			Result := -999
		ensure
			bad_result: Result = -999
		end

	widget_uuids: ARRAYED_LIST [STRING]
			-- `widget_uuids' list for Current {EP_ROLE}.
		attribute
			create Result.make (Default_widget_capacity)
		end

	Default_widget_capacity: INTEGER = 100
			-- `Default_widget_capacity' for Current {EP_ROLE}.

feature {NONE} -- Implementation: Constants

	No_access: INTEGER = 0
	View_access: INTEGER = 1
	Edit_access: INTEGER = 2
	Add_access: INTEGER = 3
	Delete_access: INTEGER = 4

	Static_level_count: INTEGER = 5

	levels: HASH_TABLE [STRING, INTEGER]
			-- `levels' of Current {EP_ANY}.
		once
			create Result.make (Static_level_count)
			Result.extend ("No-Access", no_access)
			Result.extend ("View-Access", view_access)
			Result.extend ("Edit-Access", edit_access)
			Result.extend ("Add-Access", add_access)
			Result.extend ("Delete-Access", delete_access)
		end

invariant
	max_key_is_static_less_one: levels.current_keys.item (levels.count) = Static_level_count - 1
	level_count: levels.count = Static_level_count
	levels_in_bounds: across (no_access |..| delete_access) as ic_bounds all levels.has_key (ic_bounds.item) end
	permission_in_bounds: (no_access |..| delete_access).has (permission_level)

end
