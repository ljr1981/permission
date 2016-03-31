note
	description: "[
		Abstract notion of an Client Permission Any (i.e. {CP_ANY}).
		]"
class
	CP_ANY

note
	steps: "[
		(1) Client: Define/Create an Client
		(2) Permissions: Define 1:M Permissions
		]"
	design: "[
		Objects that manage various forms of "permission" (e.g rights).
		The basic permissions are (from low to high):

		(0) No-Access		- None (none-exported)	-	V
		(1) View-Access		- Read-only (Query)		-	R
		(2) Edit-Access		- Read-write (Compute)	-	U
		(3) Add-Access		- Create				-	C
		(4) Delete-Access	- Delete				-	D

		CRUD = Create / Read / Update / Delete + Void

		Applications
		============
		Internally, Eiffel classes have all of the "permissions" above:
		
		(0) No-Access		- Exported to {NONE}	-	V
		(1) View-Access		- Exported to {CLIENT}	-	R
		(2) Edit-Access		- Setter-feature		-	U
		(3) Add-Access		- Assignment			-	C
		(4) Delete-Access	- Void-Assignment		-	D
		
		Eventually, Eiffel code touches an external client entity.
		When this happens, the UIX API must facilitate like permissions.
		
		To prevent external entities from having unconstrained access to data
		and operations of a system, we need the notion of a permission.
		
		UIX
		===																Item			Item
										Enabled/						Creation		Delete
						Visible			Disabled		Redacted		Enabled			Enabled
						=======			========		========		========		=======
		(0) None	- 	(No			OR	Disabled	OR	Yes)			No				No
		(1) View	- 	Yes				Disabled		No				No				No
		(2) Edit	- 	Yes				Enabled			No				No				No
		(3) Add		- 	Yes				Enabled			No				Yes				No
		(4) Delete	- 	Yes				Enabled			No				Yes				Yes
		
		
		
									  ┌───────────────┬───────────────────────┬───────────────────────┬───────────────────┬───────────────────────┐
	  			VRUCD Applied		  │	 View (1)	  │		Edit			  │						  │					  │						  │
				=============		  │	 None		  │	(Redacted/Disabled)	  │	      (Enabled)		  │	     Add		  │		  Delete		  │
		┌─────────────────────────────┼───────────────┼───────────────────────┼───────────────────────┼───────────────────┼───────────────────────┤
		│detachable	item_feature	  │	Secret		  │	Exported			  │	Setter				  │	n/a				  │	n/a					  │
		│attached	item_feature	  │	Secret		  │	Exported			  │	Setter				  │	n/a				  │	n/a					  │
		│detachable	list_feature	  │	Secret		  │	Exported			  │	Setter				  │	n/a				  │	n/a					  │
		│attached	list_feature (2)  │	Secret		  │	Exported			  │	List-item-set		  │	List-item-add	  │	List-item-delete	  │
		├─────────────────────────────┼───────────────┼───────────────────────┼───────────────────────┼───────────────────┼───────────────────────┤
		│attached	item_control (4)  │	Hidden		  │	Read-only (1)		  │	Item-editable (3)	  │	Item-editable (3) │	Item-editable (3)	  │
		│attached	list_control	  │	Hidden		  │	Read-only (1)		  │	List-item-editable (3)│	List-item-add (3) │	List-item-delete (3)  │
		└─────────────────────────────┴───────────────┴───────────────────────┴───────────────────────┴───────────────────┴───────────────────────┘
		Footnotes
		---------
		(1) Once a UIX control can be seen, then we can consider if it is Redacted. It can remain
			Redacted even if it is editable (e.g. password fields are this way). However, the Redaction
			can be turned off briefly based upon certain rules, such as:
				(a) Temporary (until field exit)
				(b) Temporary (timed)
				(c) Temporary (field exit and timed)
				(d) Temporary (until window exit)
				(e) Temporary (until window lost focus)
				(f) Temporary (until session exit)
				(g) Permanent (via other user with correct permission)
		(2) A List_feature will be of types such as LIST, ARRAY, BAG, and so on. Notions of VRUCD are
			handled by the Eiffel language specification and available features on each class.
		(3) Once a UIX control can be edited, Added-to, or Deleted-from, there is a further notion of
			a "Manager override"--that is--someone with greater authority or permission can grant either
				temporary or permanent permission upgrade to the underling. Like Redaction, the granting
				has rules that govern how long the underling retains the permission upgrade.
		(4) Also allow for notions of defaults and minimums.
				
		Applying UIX Permissions
		========================
		Based on the information writeup above, we can now consider what it means to
		]"
	define: "UIX (or UX)", "[
				User Interface Experience or just User Experience.
				]"
	define: "Set Symbols", "[
					Symbol	Meaning											Example
					======	=============================================	==================
					A ⊆ B	Subset: A has some (or all) elements of B		{3,4,5} ⊆ D
					A ⊂ B	Proper Subset: A has some elements of B			{3,5} ⊂ D
					A ⊄ B	Not a Subset: A is not a subset of B			{1,6} ⊄ C
					A ⊇ B	Superset: A has same elements as B, or more		{1,2,3} ⊇ {1,2,3}
					]"
end
