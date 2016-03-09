note
	description: "[
		Mock representation of an {EP_WIDGET}.
		]"

class
	MOCK_WIDGET_1

inherit
	EP_WIDGET
		redefine
			make
		end

create
	make

feature {NONE} -- Initialization

	make
			-- <Precursor>
		do
			description := "Mock description of widget 1"
			uuid := "C8520A1F-9319-4D43-8F4B-29546FEBB316"
			Precursor
		end

end
