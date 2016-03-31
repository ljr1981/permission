note
	description: "[
		Abstract notion of a {CP_ITEM_REGISTRY}.
		]"

deferred class
	CP_ITEM_REGISTRY

inherit
	CP_ANY
		redefine
			default_create
		end

feature {NONE} -- Initialization

	default_create
			-- <Precursor>
		do
			build_items
		end

feature -- Access

	items: HASH_TABLE [UUID, STRING]
			-- `items' {UUID} hashed by {CP_PERMISSIONED_ITEM}.uuid_string
		note
			design: "[
				Having this as a self-initializing attribute instead of creation in
				the default_create (above) means that ancestor classes do not need to
				make the Precursor call to ensure this feature gets created.
				]"
		attribute
			create Result.make (Default_registry_item_capacity)
		end

	build_items
			-- `build_items' using `put_unique'.
			-- Ancestors of this will need to provide a UUID for each UIX control in the system.
		deferred
		end

	put_unique (a_uuid_string: STRING)
			-- `put_unique' `a_uuid_string' and {UUID} into `items' hash.
		require
			not_inserted: not items.has (a_uuid_string)
		do
			items.force (create {UUID}.make_from_string (a_uuid_string), a_uuid_string)
		ensure
			has: items.inserted
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
