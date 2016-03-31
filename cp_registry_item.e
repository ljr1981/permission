note
	description: "[
		Abstract notion of a {CP_REGISTRY_ITEM}.
		]"

deferred class
	CP_REGISTRY_ITEM

feature {NONE} -- Implementation

	registry: CP_ITEM_REGISTRY
			-- `registry' to ensure Current {CP_REGISTRY_ITEM} is on it.
		deferred
		end

note
	design: "[
		An item that belongs on the registry
		]"

end
