note
	description: "[
		Mock representation of a {MOCK_ITEM_REGISTRY}.
		]"

class
	MOCK_ITEM_REGISTRY

inherit
	CP_ITEM_REGISTRY

feature -- Access

	items: HASH_TABLE [UUID, STRING]
			-- <Precursor>
		once
			create Result.make (Default_registry_item_capacity)
			Result.force (create {UUID}.make_from_string ({MOCK_CARTOON_NAME_FIELD}.uuid_string), {MOCK_CARTOON_NAME_FIELD}.uuid_string)
		end

end
