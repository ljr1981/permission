note
	description: "[
		Mock representation of a {MOCK_PHONE_NUMBER_FIELD}.
		]"

class
	MOCK_PHONE_NUMBER_FIELD

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
			create item.make_with_text ("770-295-9729")
		end

feature -- Access

	uuid_string: STRING = "8907FB18-4051-47F5-A940-8F3AD2F71842"
			-- <Precursor>

	human_readable_name: STRING = "Mock phone number text field"
			-- <Precursor>

feature {NONE} -- Implementation

	registry: MOCK_ITEM_REGISTRY once create Result end
			--  <Precursor>

end
