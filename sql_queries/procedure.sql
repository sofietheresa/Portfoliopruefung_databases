Create Procedure Sp_DeleteReadersById(
@ReadersId int) as
Begin
	Delete From readers where readers_id = @StudentId
End