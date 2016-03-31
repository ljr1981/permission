note
	description: "[
		Abstract notion of a {CP_PERMISSIONED_EV_TEXT_FIELD}
		]"

deferred class
	CP_PERMISSIONED_EV_TEXT_FIELD

inherit
	CP_PERMISSIONED_ITEM [EV_TEXT_FIELD]

feature -- Basic Operations

	redact
			-- `redact' current `item' text.
		do
			redacted_text := item.text
			check attached redacted_text as al_text then
				item.set_text (create {STRING}.make_filled (Redaction_character, al_text.count))
			end
		ensure
			saved: attached redacted_text
		end

	unredact
			-- `unredact' current `item' text.
		require
			redacted: attached redacted_text
		do
			if attached redacted_text as al_text then
				item.set_text (al_text)
			end
		ensure
			unredacted: attached redacted_text as al_text and then al_text.same_string (item.text)
		end

	redacted_text: detachable STRING
			-- `redacted_text' of `item'.

feature {NONE} -- Implementation

	Redaction_character: CHARACTER = '*'
			-- `Redaction_character' for Current {CP_PERMISSIONED_EV_TEXT_FIELD} redact.

end
