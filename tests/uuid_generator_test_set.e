note
	description: "[
		UUID Generator test.
	]"
	author: "EiffelStudio test wizard"
	date: "$Date$"
	revision: "$Revision$"
	testing: "type/manual"

class
	UUID_GENERATOR_TEST_SET

inherit
	EQA_TEST_SET

feature -- Test routines

	generate_uuid
			-- New test routine
		note
			testing:  "execution/isolated"
			usage: "[
				Run this test to produce 100 fresh UUID string values in the
				generated_uuid.txt file, located in the project root folder.
				]"
		local
			l_file: PLAIN_TEXT_FILE
			l_date: DATE_TIME
		do
			create l_file.make_create_read_write ("generated_uuid.txt")
			create l_date.make_now
			l_file.put_string ("Generated on: " + l_date.out + "%N%N")
			across
				(1 |..| 100) as ic
			loop
				l_file.put_string ((create {RANDOMIZER}).uuid.out)
				l_file.put_character ('%N')
			end
			l_file.close
		end

end


