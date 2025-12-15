Attribute VB_Name = "modRISK"
Public Function RISK( _
    ticker As String, _
    startDate As Date, _
    endDate As Date _
) As Variant

    Dim sql As String
    Dim rs As ADODB.Recordset

    sql = ""
    sql = sql & "SELECT get_risk("
    sql = sql & "'" & ticker & "', "
    sql = sql & "'" & Format(startDate, "yyyy-mm-dd") & "', "
    sql = sql & "'" & Format(endDate, "yyyy-mm-dd") & "'"
    sql = sql & ") AS risk"

    Set rs = DB_Query(sql)

    If rs Is Nothing Or rs.EOF Or IsNull(rs.Fields("risk").Value) Then
        RISK = CVErr(xlErrNA)
    Else
        RISK = rs.Fields("risk").Value
    End If

    rs.Close
End Function


