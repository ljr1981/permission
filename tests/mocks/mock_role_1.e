note
	description: "[
		Mock representation of an {EP_ROLE}.
		]"

class
	MOCK_ROLE_1

inherit
	EP_ROLE
		redefine
			name,
			uuid
		end

create
	make

feature -- Access

	name: STRING = "Mock name of role 1"
			-- <Precursor>

	uuid: STRING = "C8520A1F-9319-4D43-8F4B-29546FEBB316"
			-- <Precursor>

feature {NONE} -- Implementation

	permission_level: INTEGER = 4

end
