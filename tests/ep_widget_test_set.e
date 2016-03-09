note
	description: "[
		Test of {EP_WIDGET}
	]"
	testing: "type/manual"

class
	EP_WIDGET_TEST_SET

inherit
	EQA_TEST_SET
		rename
			assert as assert_old
		end

	EQA_COMMONLY_USED_ASSERTIONS
		undefine
			default_create
		end

feature -- Test routines

	ep_widget_tests
			-- `ep_widget_tests'
		note
			testing:  "execution/isolated"
		local
			l_widget: MOCK_WIDGET_1
		do
			create l_widget.make
			l_widget.set_description (Mock_description)
			l_widget.set_uuid (Mock_uuid)
			l_widget.set_uuid_from_uuid (create {UUID}.make_from_string (Mock_uuid))
			assert_strings_equal ("same_uuid", Mock_uuid, l_widget.uuid)
		end

feature {NONE} -- Implementation

	Mock_description: STRING = "MOCK_DESCRIPTION"

	Mock_uuid: STRING
		once
			Result := (create {RANDOMIZER}).uuid.out
		end

end


