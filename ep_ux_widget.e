note
	description: "[
		Representation of an {EP_UX_WIDGET}.
		]"
	design: "[
		A UX (user experience) widget may represent a number of forms
		of widget, from thick client GUI widget (i.e. Windows) to thin
		client web widgets delivered as HTML/CSS/JS components. It may
		also represent service feature calls (i.e. web service or DLL).
		]"

class
	EP_UX_WIDGET

inherit
	EP_ANY

feature -- Access

	item: detachable ANY
			-- A possibly Void `item' for Current {EP_UX_WIDGET}.

end
