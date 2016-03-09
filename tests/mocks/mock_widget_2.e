note
	description: "[

		]"

class
	MOCK_WIDGET_2

inherit
	EP_WIDGET

		redefine
			description,
			uuid
		end

create
	make

feature -- Access

	description: STRING = "Mock description of widget 2"
			-- <Precursor>

	uuid: STRING = "864EC56A-3C9B-4490-82C4-E49AC3991ABB"
			-- <Precursor>

end
