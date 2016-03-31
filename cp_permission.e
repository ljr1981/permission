note
	description: "[
		Representation of a {CP_PERMISSION}.
		]"

class
	CP_PERMISSION

feature -- Access

	level: INTEGER
			-- Current {CP_PERMISSION} `level' (default = `none').

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

feature -- Constants

	none: INTEGER = 0
	view: INTEGER = 1
	edit: INTEGER = 2
	add: INTEGER = 3
	delete: INTEGER = 4

invariant
	valid_level: (none |..| delete).has (level)
	mutex_enabled: is_disabled xor is_enabled

note
	design: "[
		
		4 - Delete-enabled (is_redacted?)
		3 - Add-enabled (is_redacted?)
		2 - Edit-enabled (is_redacted?)
		1 - View-disabled (is_redacted?)
		0 - None
		]"

end
