note
	description: "[
		Representation of an {EP_WIDGET}.
		]"
	design: "[
		A UX (user experience) widget may represent a number of forms
		of widget, from thick client GUI widget (i.e. Windows) to thin
		client web widgets delivered as HTML/CSS/JS components. It may
		also represent service feature calls (i.e. web service or DLL).
		]"
	BNFE: "[
		Widget ::=
			Uuid
			Description
		]"

class
	EP_WIDGET

inherit
	EP_IDENTIFIABLE

	EP_ANY
		undefine
			default_create
		end

end
