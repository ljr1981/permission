note
	description: "[
		Representation of an {EP_WIDGET}.
		]"
	design: "[
		A UX (user experience) widget may represent a number of forms
		of widget, from thick client GUI widget (i.e. Windows) to thin
		client web widgets delivered as HTML/CSS/JS components. It may
		also represent service feature calls (i.e. web service or DLL).
		]"
	BNFE: "[
		Widget ::=
			Uuid
			Description
		]"

deferred class
	EP_WIDGET [G -> ANY]

inherit
	EP_IDENTIFIABLE
		redefine
			make
		end

feature {NONE} -- Initialization

	make
			-- `make' of Current {EP_IDENTIFIABLE}.
		do
			check not_in_registry: not registry_has_uuid (uuid)  then
				uuid_registry.force (True, uuid)
			end
			hookup
		end

feature -- Access

	uuid: STRING
			-- `uuid' of Current {EP_WIDGET}.
		note
			warning: "Redefine in descendents as a constant to avoid invariant violation"
			EIS: "src=https://www.uuidgenerator.net/"
		attribute
			Result := Unassigned_keyword
		end

	uuid_registry: HASH_TABLE [BOOLEAN, STRING]
			-- `uuid_registry' list.
		once
			create Result.make (Default_registry_capacity)
		end

feature -- Settings

	set_uuid (a_uuid_string: like uuid)
			-- `set_uuid' with `a_uuid_string' like `uuid'.
		do
			uuid := a_uuid_string
		ensure
			set: uuid.same_string (a_uuid_string)
		end

	set_uuid_from_uuid (a_uuid: UUID)
			-- `set_uuid_from_uuid' as `a_uuid'.
		do
			uuid := a_uuid.out
		ensure
			set: uuid.same_string (a_uuid.out)
		end

	set_widget (a_widget: like widget)
			-- `set_widget' with `a_widget' into `widget'.
		do
			widget := a_widget
		ensure
			set: widget ~ a_widget
		end

feature -- Status Report

	registry_has_uuid (a_uuid: like uuid): BOOLEAN
			-- `registry_has_uuid' for passed `a_uuid'.
		note
			design: "[
				One could write a require contract to prevent the passed
				`a_uuid' from being in the hash already, but that would
				cause the software to break. We don't want the software to
				crash and break. We want the capacity to warn, so the
				require contract is not implemented.
				]"
		do
			Result := uuid_registry.has_key (a_uuid)
		end

feature {EP_WIDGET} -- Implementation

	widget: detachable G
			-- `widget' of Current {EP_WIDGET}.
			-- EV_CONTAINER or EV_PRIMITIVE

feature {NONE} -- Implementation: Basic Operations

	hookup
			-- `hookup' `widget' to parent.
		deferred
		end

	on_no_access do  end
	on_view_access do  end
	on_edit_access do  end
	on_add_access do  end
	on_delete_access do  end

invariant
	not_uuid_unassigned: not uuid.same_string (Unassigned_keyword)
	uuid_not_empty: not uuid.is_empty
	is_uuid: (create {UUID}.make_from_string (uuid)).is_valid_uuid (uuid)
--	uuid.same_string (Unassigned_keyword) xor registry_has_uuid (uuid)

end
