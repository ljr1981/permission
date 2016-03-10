note
	description: "[
		Mock representation of an {EP_WIDGET}.
		]"

class
	MOCK_WIDGET_1

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
--			create {EV_CELL} widget
--			check has_widget: attached {EV_CELL} widget as al_widget then
--				create widget_2.make
--				check has_widget_widget: attached {EV_WIDGET} widget_2.widget as al_widget_widget then
--					al_widget.extend (al_widget_widget)
--				end
--			end
			description := "Mock description of widget 1"
			uuid := "C8520A1F-9319-4D43-8F4B-29546FEBB316"
			Precursor
		end

--	widget_2: MOCK_WIDGET_2

end
