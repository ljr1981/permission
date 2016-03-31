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

	permissions: ARRAYED_LIST [CP_PERMISSION]
			-- <Precursor>
		attribute
			create Result.make (Default_child_capacity)
			Result.force (create {MOCK_PERMISSION})
		end

	uuid_string: STRING = "66B35389-BF3F-4B43-B2EF-687C5538D162"

note
	design: "[
		Here we have Bugs Bunny
		]"

end
