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

	cp_permission_creation_tests
			-- `cp_permission_creation_tests'.
		local
			l_permission: MOCK_PERMISSION
		do
			create l_permission
		end

end


