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
			uuid := "C8520A1F-9319-4D43-8F4B-29546FEBB316"
			Precursor
		end

feature {NONE} -- Implementation

	permission_level: INTEGER = 4

end
