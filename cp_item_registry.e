note
	description: "[
		Abstract notion of a {CP_ITEM_REGISTRY}.
		]"

deferred class
	CP_ITEM_REGISTRY

inherit
	CP_ANY

feature -- Access

	items: HASH_TABLE [UUID, STRING]
			-- `items' {UUID} hashed by {CP_PERMISSIONED_ITEM}.uuid_string
		deferred
		end

feature {NONE} -- Implementation: Constants

	Default_registry_item_capacity: INTEGER = 1_000
			-- `Default_registry_item_capacity' for Current {CP_ITEM_REGISTRY}.

;note
	design: "[
		In order for {CP_CLIENT}s to know that they have to have a registry
		of UUID
		]"

end
