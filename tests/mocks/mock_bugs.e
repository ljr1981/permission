note
	description: "[
		Mock representation of a {CP_CLIENT} {MOCK_BUGS}.
		]"

class
	MOCK_BUGS

inherit
	CP_CLIENT
		redefine
			permissions
		end

feature -- Access

	name: STRING = "Bugs Bunny"

	permissions: HASH_TABLE [CP_PERMISSION, STRING]
			-- <Precursor>
		local
			l_permission: MOCK_PERMISSION
		attribute
			create Result.make (Default_child_capacity)
			create l_permission
			Result.force (l_permission, l_permission.uuid_string)
		end

note
	design: "[
		Here we have Bugs Bunny
		]"

end
