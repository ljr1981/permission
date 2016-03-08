note
	description: "[
		Abstract notion of an Entity Permission Any (i.e. {EP_ANY}).
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
		===				
										Enabled/						Creation		Delete
						Visible			Disabled		Redacted		Enabled			Enabled
						=======			========		========		========		=======
		(0) None	- 	(No			OR	Disabled	OR	Yes)			No				No
		(1) View	- 	Yes				Disabled		No				No				No
		(2) Edit	- 	Yes				Enabled			No				No				No
		(3) Add		- 	Yes				Enabled			No				Yes				No
		(4) Delete	- 	Yes				Enabled			No				Yes				Yes
		
		Organization
		============
		Hypothesis: Entity has Permission on UIX Component or vectors: E x P x C
		
		E -> Always a single entity making access
		
		P -> 1:M as a "Role" set.
		
		C -> 1:M as a "Collection" set.
		
		PC -> P applied to C, where PC1 has a C1 as subcomponent of C2 in PC2.
		
		Rule: 		Where P = Void (no permission given), highest permission (e.g. Delete) is presumed.
		
		Where: PC2 ⊆ PC1 then P2 < P1 -> C2 has P2 and P2 > P1 -> C2 has P2
		
		Question: 	When C1 is contained in C2, do the permissions of C2 change the permissions of C1?
		Answer:		C1 permissions are retained regardless of C2 permissions.
		
		Question:	When C1 is contained in C2 and C2 permissions are Void and C1 permissions are
						not, are the permissions of C2 retained?
		Answer:		C1 permissions are retained regardless of C2 permissions.
		
		Question:	When C1 is contained in C2 and C1 permissions are Void and C2 permissions are
						not, are the permissions of C1 retained?
		Answer:		C1 permissions are retained regardless of C2 permissions, which means C1
						permissions as Void are Delete-access (e.g. Full permission), therefore
						C1 retains Full permission (Delete-access) regardless of C1 permissions.
		
		Rule: 		When C1 /= C2, then C1 and C2 retain their permissions even when undefined (Void),
						which is defined (and presumed) as Full or Delete-access.

		Question: 	Where C1 = C2 and E1, but E1 has P1 and P2, and P1 < P2 or P1 > P2, then
						does C1 have P1 or P2?
		Answer:		The greater of P1 and P2 is applied.
		
		Rule:		When C1 = C2 for a given E1 with 1:P, the highest P wins (is applied).
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
class
	EP_ANY

end
