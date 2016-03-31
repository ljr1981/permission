note
	description: "[
		Abstract notion of a {CP_PERMISSIONED_ITEM}.
		]"

deferred class
	CP_PERMISSIONED_ITEM [G -> ANY]

inherit
	FW_UU_IDENTIFIED

feature -- Access

	item: G
			-- `item' receiving `permission'.

	permission: CP_PERMISSION
			-- `permission' being given to `item'.
		deferred
		end

note
	design: "[
		A Permissioned_item is an {EV_WIDGET} (or web control) that has been given
		a {CP_PERMISSION}.

		Widgets are what we want to permission. Sometimes, those widgets will be
		"fat-client" ("thick-client") GUI UIX controls. At other times, the widgets
		will be "thin-client" remote web UIX controls, generated in HTML/CSS/JS.
		The Formal Generic used in this class might ultimately be an EV_WIDGET
		if we're working with a "fat-client". Otherwise, it can be whatever class
		type will come about for "thin-client"s.
		]"
end
