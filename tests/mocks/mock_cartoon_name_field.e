note
	description: "[
		Mock representation of a {MOCK_CARTOON_NAME_FIELD}.
		]"

class
	MOCK_CARTOON_NAME_FIELD

inherit
	CP_PERMISSIONED_EV_TEXT_FIELD
		redefine
			default_create
		end

create
	make_with_client

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			create item.make_with_text ("Cartoon Name")
		end

feature -- Access

	uuid_string: STRING = "553E9CF6-6732-402E-A2DE-4C3AA5A52F43"
			-- <Precursor>

	human_readable_name: STRING = "Mock cartoon name text field"
			-- <Precursor>

feature {NONE} -- Implementation

	registry: MOCK_ITEM_REGISTRY once create Result end
			--  <Precursor>

end
