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

	permissions: ARRAYED_LIST [CP_PERMISSION]
			-- <Precursor>
		attribute
			create Result.make (Default_child_capacity)
			Result.force (create {MOCK_PERMISSION})
		end

	uuid_string: STRING = "1710BEC4-D5B1-40F4-B8A8-E4DED450B87C"

note
	design: "[
		The idea is to have a collection of characters (e.g. {MOCK_CHARACTER}).
		]"

end
