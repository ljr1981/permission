note
	description: "[
		Abstract notion of a {CP_PERMISSIONED_ITEM}.
		]"

deferred class
	CP_PERMISSIONED_ITEM [G -> ANY]

inherit
	CP_ANY

	FW_UU_IDENTIFIED

feature {NONE} -- Initialization

	make_with_client (a_client: like client)
			-- `make_with_client' `a_client'.
		do
			default_create
			client := a_client
		ensure
			set: client ~ a_client
		end

feature -- Access

	item: G
			-- `item' receiving `permission'.

	human_readable_name: STRING
			-- `human_readable_name' for the `item' and `uuid_string'.
		deferred
		end

	client: CP_CLIENT
			-- `client' of Current.

feature -- Basic Operations

	set_item_permission
			-- `set_item_permission'.
		deferred
		end

	set_new_client_level (a_level: INTEGER)
			-- `set_new_client_level' changes `level' on `client' permission.
		require
			valid: ({CP_PERMISSION}.lowest_level |..| {CP_PERMISSION}.highest_level).has (a_level)
		do
			across
				client.permissions as ic_perm
			loop
				if ic_perm.item.uuid_string.same_string (uuid_string) then
					ic_perm.item.set_level (a_level)
					ic_perm.item.apply_level_to_children
					set_item_permission
				end
			end
		end

;note
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
