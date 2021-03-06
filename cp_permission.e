note
	description: "[
		Abstract notion of a {CP_PERMISSION}.
		]"

deferred class
	CP_PERMISSION

inherit
	CP_ANY
		redefine
			default_create
		end

	FW_UU_IDENTIFIED
		undefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			level := internal_level
		ensure then
			set: internal_level = level
		end

feature -- Access

	level: INTEGER assign set_level
			-- Current {CP_PERMISSION} `level' (default = `none').

	children: ARRAYED_LIST [CP_PERMISSION]
			-- `children' of Current {CP_PERMISSION}.
		attribute
			create Result.make (Default_child_capacity)
		end

feature -- Basic Operations

	apply_level_to_children
			-- `apply_level_to_children' applies `level' to `children' in upgrade/downgrade of permission.
		note
			design: "[
				We only upgrade or downgrade based on the rules we have at
				the parent level.
				]"
		do
			across
				children as ic_children
			loop
				if upgrades_children and then ic_children.item.level < level then
					ic_children.item.set_level (level)
				elseif downgrades_children and then ic_children.item.level > level then
					ic_children.item.set_level (level)
				end
			end
		end

feature -- Settings

	set_level (a_level: like level)
			-- `set_level' to `a_level'.
		note
			design: "[
				If this is a parent, then we take whatever level we're given.
				Otherwise, if we're a child, then (again) we take `a_level' as-is.
				The control of upgrade/downgrade is held in the parent (if there
				is one).
				]"
		do
			level := a_level
		end

feature -- Status Report

	is_redacted: BOOLEAN
			-- Current {CP_PERMISSION} `is_redacted'.

	is_disabled: BOOLEAN
			-- Current {CP_PERMISSION} `is_disabled'.
		do
			Result := level <= 1
		end

	is_enabled: BOOLEAN
			-- Current {CP_PERMISSION} `is_enabled'.
		do
			Result := not is_disabled
		end

	upgrades_children: BOOLEAN
			-- `upgrades_children' forces `children' to have at least the same `level' as Current {CP_PERMISSION}.

	downgrades_children: BOOLEAN
			-- `downgrades_children'.
		do
			Result := not upgrades_children
		end

feature -- Constants

	internal_level: INTEGER
			-- `internal_level' used by `default_create' to "seed" (initialize) `level'.
			-- Do not redefine in ancestor if 0 is okay as a default level.
		once
			Result := 0
		end

	none: INTEGER = 0
	view: INTEGER = 1
	edit: INTEGER = 2
	add: INTEGER = 3
	delete: INTEGER = 4

	lowest_level: INTEGER = 0
	highest_level: INTEGER = 4

	Default_child_capacity: INTEGER = 100
			-- `Default_child_capacity' of `children' of Current {CP_PERMISSION}.

invariant
	valid_level: (lowest_level |..| highest_level).has (level)
	valid_lowest: lowest_level = none
	valid_highest: highest_level = delete
	valid_view: view = (none + view)
	valid_edit: edit = (none + edit) and then view = (edit - view)
	valid_add: add = (view + edit) and then none = (add - (edit + view))
	valid_delete: delete = (view + add + none) and then delete = (delete - none)
	mutex_enabled: is_disabled xor is_enabled
	valid_uuid: uuid.is_valid_uuid (uuid_string)

note
	design: "[
		
		4 - Delete-enabled (is_redacted?)
		3 - Add-enabled (is_redacted?)
		2 - Edit-enabled (is_redacted?)
		1 - View-disabled (is_redacted?)
		0 - None
		
		Children
		========
		Does it make sense for a Permission_item to have child Permission_item(s)?
		Is there an 80%-example?
		
		Leaving aside the notion of a {CP_CLIENT} (which has children in the sense
		of "Roles" and "Groups" of Clients), the question can be asked another way:
		Ought we be able to group Permissions together into groups and award those
		permissions to 1:M {CP_CLIENT}s? We think the answer is: "Yes, of course!"
		
		The immediate question then becomes: How does a parent `level' impact the
		levels of the children (or does it)? Does a parent `level' somehow override
		the levels of the children is the parent has a higher level? And what of a
		lower level parent? Does the lower level of the parent downgrade the level
		of the children? Can this be selectable?
		]"

end
