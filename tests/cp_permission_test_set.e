note
	description: "[
		Tests of {CP_PERMISSION} et al.
	]"
	testing: "type/manual"

class
	CP_PERMISSION_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

	TEST_SET_BRIDGE
		undefine
			default_create
		end

feature -- Test routines

	basic_permission_tests
			-- `basic_permission_tests'.
		note
			design: "[
				The idea is to create a control with a UUID and then a group of clients
				with a single client with permissions to change the control. Test to see if:
				
				(1) Does the Client have a permission that is related to the control? (matching UUIDs)
				(2) Does the control respond to the permission level of the Client on creation?
				(3) If the permission of the Client is changed, does the control respond?
					(upgrade and downgrade).
					
				Note that in this case, the control is a single text field, where we do not have
				complexities of any type of "list" with notions of "Add" and "Delete" (or Remove).
				]"
		local
			l_control: MOCK_CARTOON_NAME_FIELD
			l_client: MOCK_CHARACTERS
		do
			create l_client
			create l_control.make_with_client (l_client)
			assert_strings_equal ("characters", "Warner-Bros.", l_client.name)
			assert_strings_equal ("bugsy", "Bugs Bunny", l_client.children [1].name)
			assert_32 ("is_enabled", l_control.item.is_sensitive)
				-- change level
			l_control.set_new_client_level (1)
			assert_32 ("is_disabled", not l_control.item.is_sensitive)
				-- redaction
			l_control.redact
			assert_strings_equal ("redacted", "************", l_control.item.text)
			l_control.unredact
			assert_strings_equal ("redacted", "Cartoon Name", l_control.item.text)
		end

end


