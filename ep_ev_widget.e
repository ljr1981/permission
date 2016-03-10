note
	description: "[
		Representation of an {EP_WIDGET} using an {EV_WIDGET}.
		]"

class
	EP_EV_WIDGET

inherit
	EP_WIDGET [EV_WIDGET]

feature {NONE} -- Implementation: Basic Operations

	hookup
			-- <Precursor>
		local
			l_data: ARRAYED_LIST [like Current]
		do
--			if attached {EV_WIDGET} widget as al_widget then
--				if attached {ARRAYED_LIST [like Current]} al_widget.data as al_data then
--					al_data.force (Current)
--				else
--					create l_data.make_from_array (<<Current>>)
--					al_widget.set_data (l_data)
--				end
--			end
		end

end
