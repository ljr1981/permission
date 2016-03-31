note
	description: "[
		Abstract notion of a {CP_PERMISSIONED_ITEM}.
		]"

deferred class
	CP_PERMISSIONED_ITEM

inherit
	FW_UU_IDENTIFIED
	
feature -- Access

	item: EV_WIDGET
			-- `item' receiving `permission'.

	permission: CP_PERMISSION
			-- `permission' being given to `item'.
		deferred
		end

note
	design: "[
		A Permissioned_item is an {EV_WIDGET} (or web control) that has been given
		a {CP_PERMISSION}.
		]"

end
