note
	description: "[
		Mock representation of an {EP_WIDGET}.
		]"

class
	MOCK_WIDGET_1

inherit
	EP_WIDGET
		redefine
			description,
			uuid
		end

create
	make

feature -- Access

	description: STRING = "Mock description of widget 1"
			-- <Precursor>

	uuid: STRING = "C8520A1F-9319-4D43-8F4B-29546FEBB316"
			-- <Precursor>

end
