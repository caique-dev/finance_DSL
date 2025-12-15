Attribute VB_Name = "modEHIST"
Public Function EHIST(ticker As String) As Variant
    Dim sql As String
    Dim rs As ADODB.Recordset

    sql = ""
    sql = sql & "SELECT get_ehist('" & ticker & "') AS ehist"

    Set rs = DB_Query(sql)

    If rs Is Nothing Or rs.EOF Or IsNull(rs.Fields("ehist").Value) Then
        EHIST = CVErr(xlErrNA)
    Else
        EHIST = rs.Fields("ehist").Value
    End If

    rs.Close
End Function

