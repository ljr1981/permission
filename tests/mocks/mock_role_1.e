note
	description: "[
		Mock representation of an {EP_ROLE}.
		]"

class
	MOCK_ROLE_1

inherit
	EP_ROLE
		redefine
			make
		end

create
	make

feature {NONE} -- Initialization

	make
			-- <Precursor>
		do
			name := "Mock name of role 1"
			permission_level := 4
			Precursor
		end

end
