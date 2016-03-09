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

class
	EP_WIDGET

inherit
	EP_IDENTIFIABLE
		redefine
			make
		end

	EP_ANY
		undefine
			default_create
		end

feature {NONE} -- Initialization

	make
			-- `make' of Current {EP_IDENTIFIABLE}.
		do
			check not_in_registry: not registry_has_uuid (uuid)  then
				uuid_registry.force (True, uuid)
			end
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

invariant
	not_uuid_unassigned: not uuid.same_string (Unassigned_keyword)
	uuid_not_empty: not uuid.is_empty
	is_uuid: (create {UUID}.make_from_string (uuid)).is_valid_uuid (uuid)
	registry_has_uuid (uuid)

end
