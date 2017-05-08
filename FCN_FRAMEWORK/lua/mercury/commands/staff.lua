Mercury.Commands.AddPrivilege("staff")


MPLR = FindMetaTable("Player")

function MPLR:IsStaff()
	return self:HasPrivilege("staff")
end