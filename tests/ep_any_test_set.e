note
	description: "[
		Eiffel tests that can be executed by testing tool.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	EP_ANY_TEST_SET

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

	ep_any_tests
			-- `ep_any_tests'
		local
			l_any: EP_ANY
			l_widget: EP_WIDGET
			l_role: EP_ROLE
			l_mock_1: MOCK_WIDGET_1
			l_mock_2: MOCK_WIDGET_2
		do
			do_nothing
			create l_mock_1.make
			create l_mock_2.make
		end

end


