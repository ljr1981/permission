note
	description: "[
		Mock representation of a {CP_CLIENT} {MOCK_CHARACTERS}.
		]"
class
	MOCK_CHARACTERS

inherit
	CP_CLIENT
		redefine
			children,
			permissions
		end

feature -- Access

	name: STRING = "Warner-Bros."
			-- <Precursor>

	children: ARRAYED_LIST [CP_CLIENT]
			-- <Precursor>
		attribute
			create Result.make (Default_child_capacity)
			Result.force (create {MOCK_BUGS})
		end

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
		The idea is to have a collection of characters (e.g. {MOCK_CHARACTER}).
		]"

end
