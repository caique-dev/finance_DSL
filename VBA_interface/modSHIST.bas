Attribute VB_Name = "modSHIST"
Public Function SHIST(ticker As String) As Variant
    Dim sql As String
    Dim rs As ADODB.Recordset

    sql = ""
    sql = sql & "SELECT get_shist('" & ticker & "') AS shist"

    Set rs = DB_Query(sql)

    If rs Is Nothing Or rs.EOF Or IsNull(rs.Fields("shist").Value) Then
        SHIST = CVErr(xlErrNA)
    Else
        SHIST = rs.Fields("shist").Value
    End If

    rs.Close
End Function

