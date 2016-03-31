note
	description: "[
		Mock {CP_PERMISSION}.
		]"

class
	MOCK_PERMISSION

inherit
	CP_PERMISSION
		redefine
			internal_level
		end

feature -- Access

	uuid_string: STRING = "553E9CF6-6732-402E-A2DE-4C3AA5A52F43"

feature {NONE} -- Implementation

	internal_level: INTEGER = 4
			-- <Precursor>

end
