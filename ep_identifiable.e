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
			design: "[
				Because we need {EP_IDENTIFIABLE} things to be loadable from
				storage, we cannot depend on default values or constants. As
				such, we are taking away any future possibility of `default_create'
				from this class. If you need to bring it back, you must have a
				VERY GOOD reason! :-)
				]"
		do
			Precursor
			check do_not_create: False end
		end

	make
			-- `make' of Current {EP_IDENTIFIABLE}.
		do
			do_nothing
		end

feature -- Access

	description: STRING
			-- `description' of Current {EP_WIDGET}.
		note
			warning: "Redefine in descendents as a constant to avoid invariant violation"
		attribute
			Result := Unassigned_keyword
		end

feature -- Settings

	set_description (a_description: like description)
			-- `set_description' with `a_description'.
		do
			description := a_description
		ensure
			set: description.same_string (a_description)
		end

feature -- Access: Constants

	Unassigned_keyword: STRING = "Unassigned"
			-- `Unassigned_keyword' constant of Current {EP_ANY}.

feature {NONE} -- Implementation: Constants

	Default_registry_capacity: INTEGER = 1_000
			-- `Default_registry_capacity' constant of Current {EP_ANY}.

invariant
	not_description_unassigned: not description.same_string (Unassigned_keyword)
	description_not_empty: not description.is_empty
	valid_unassigned: Unassigned_keyword.same_string ("Unassigned") -- Strengthens the notion.

end
