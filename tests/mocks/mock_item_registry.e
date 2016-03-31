note
	description: "[
		Mock representation of a {MOCK_ITEM_REGISTRY}.
		]"

class
	MOCK_ITEM_REGISTRY

inherit
	CP_ITEM_REGISTRY

feature -- Access

	build_items
			-- <Precursor>
		do
			put_unique ({MOCK_CARTOON_NAME_FIELD}.uuid_string)
			put_unique ({MOCK_PHONE_NUMBER_FIELD}.uuid_string)
		end

end
