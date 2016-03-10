note
	description: "[
		Mock representation of an {EP_WIDGET}.
		]"

class
	MOCK_WIDGET_2

inherit
	EP_EV_WIDGET
		redefine
			make
		end

create
	make

feature {NONE} -- Initialization

	make
			-- <Precursor>
		do
--			create {EV_TEXT_FIELD} widget
--			check has_text_field: attached {EV_TEXT_FIELD} widget as al_widget then
--				al_widget.set_text ("Something to have here")
--			end
			description := "Mock description of widget 2"
			uuid := "864EC56A-3C9B-4490-82C4-E49AC3991ABB"
			Precursor
		end

end
