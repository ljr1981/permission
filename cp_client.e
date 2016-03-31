note
	description: "[
		Abstract notion of a {CP_CLIENT}.
		]"

deferred class
	CP_CLIENT

inherit
	CP_ANY

feature -- Access

	name: STRING
			-- `name' of Current {CP_CLIENT}.
		deferred
		end

	children: ARRAYED_LIST [CP_CLIENT]
			-- `children' of Current {CP_CLIENT}
		attribute
			create Result.make (Default_child_capacity)
		end

	permissions: HASH_TABLE [CP_PERMISSION, STRING]
			-- `permissions' given to Current {CP_CLIENT}.

feature {NONE} -- Implementation

	Default_child_capacity: INTEGER = 100
			-- `Default_child_capacity' for `children'.

note
	design: "[
		A general notion of a Client, which will ultimately have a set of {CP_PERMISSION}s.
		
		First, there is no need to create a separate "client" library as the notion of 
		{CP_CLIENT} only applies within the context of permissions. Clients have permission.
		Permissions do not exist without Clients. Because this is true, we do not separate
		the two.
		
		Second, in other systems the term used is "User". While this seems fair enough, it is
		not general enough. The term "User" typically implies a single human being. It is never
		used to denote multiple human beings unless the plural form is used or "User group".
		On the other hand--the term Client is scalable from a single person to groups and even
		entire companies (e.g. "My client is NASA", which is composed of many human beings).
		Secondarily, the notion of Client transcends the notion of human being. A Client might
		be another computer program or a group of computer programs. Therefore, the notion of
		Client is a much better choice of word for this class.
		
		Each Client has a name. As a human user, this would be the name of the user. As a group
		of users, this would be the name of the group (e.g. "Role"). As a Client-system, it would
		be the name of the system and so on.
		
		Each Client might have "child"-Clients (e.g. user groups with users or systems with
		subsystems and so on). Having the notion of `children' opens up a great deal of modelling
		possibilities with {CP_CLIENT}, using the general notion of Client rather than "User"
		(or even nearby term: Operative).
		]"

end
