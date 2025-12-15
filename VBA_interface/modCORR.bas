Attribute VB_Name = "modCORR"
Public Function CORR( _
    ticker1 As String, _
    ticker2 As String, _
    startDate As Date, _
    endDate As Date _
) As Variant

    Dim sql As String
    Dim rs As ADODB.Recordset

    sql = ""
    sql = sql & "SELECT get_corr("
    sql = sql & "'" & ticker1 & "', "
    sql = sql & "'" & ticker2 & "', "
    sql = sql & "'" & Format(startDate, "yyyy-mm-dd") & "', "
    sql = sql & "'" & Format(endDate, "yyyy-mm-dd") & "'"
    sql = sql & ") AS corr"

    Set rs = DB_Query(sql)

    If rs Is Nothing Or rs.EOF Or IsNull(rs.Fields("corr").Value) Then
        CORR = CVErr(xlErrNA)
    Else
        CORR = rs.Fields("corr").Value
    End If

    rs.Close
End Function


