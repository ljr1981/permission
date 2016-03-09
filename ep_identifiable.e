note
	description: "[
		Abstract notion of an {EP_IDENTIFIABLE}.
		]"
	design: "[
		Things that want to be identified by a UUID and a
		description (or name) as a key:value pair, where the
		key = UUID and the value = description (or descriptive
		text) as human readable.
		]"

deferred class
	EP_IDENTIFIABLE

inherit
	ANY
		redefine
			default_create
		end

feature {NONE} -- Initialization

	frozen default_create
			-- <Precursor>
			-- DO NOT create direct instances of EP_WIDGET!
		note
			warning: "[
				DO NOT attempt to create direct instances of {EP_ANY}.
				Instead, create descendents (even "mocks"). In the descendent
				classes, be sure to:
				
				1. Provide creation procedures other than default create -OR-
					redefine default_create to facilitate your design need.
					For redefinition, you will need to remove the "frozen".
				]"
		do
			Precursor
			check do_not_create: False end
		end

feature -- Access

	description: STRING
			-- `description' of Current {EP_WIDGET}.
		note
			warning: "Redefine in descendents as a constant to avoid invariant violation"
		once ("OBJECT")
			Result := Unassigned_keyword
		end

	uuid: STRING
			-- `uuid' of Current {EP_WIDGET}.
		note
			warning: "Redefine in descendents as a constant to avoid invariant violation"
		once ("OBJECT")
			Result := Unassigned_keyword
		end

feature {NONE} -- Implementation: Constants

	Unassigned_keyword: STRING = "Unassigned"
			-- `Unassigned_keyword' constant of Current {EP_ANY}

invariant
	not_uuid_unassigned: not uuid.same_string (Unassigned_keyword)
	not_description_unassigned: not uuid.same_string (Unassigned_keyword)

end
