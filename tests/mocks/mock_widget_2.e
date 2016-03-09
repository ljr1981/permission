note
	description: "[
		Mock representation of an {EP_WIDGET}.
		]"

class
	MOCK_WIDGET_2

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
			description := "Mock description of widget 2"
			uuid := "864EC56A-3C9B-4490-82C4-E49AC3991ABB"
			Precursor
		end

end
