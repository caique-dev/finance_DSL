Attribute VB_Name = "modRETURNS"
Public Function RETURNS( _
    ticker As String, _
    startDate As Date, _
    endDate As Date _
) As Variant

    Dim sql As String
    Dim rs As ADODB.Recordset
    Dim data() As Double
    Dim i As Long

    sql = ""
    sql = sql & "SELECT ret "
    sql = sql & "FROM get_returns("
    sql = sql & "'" & ticker & "', "
    sql = sql & "'" & Format(startDate, "yyyy-mm-dd") & "', "
    sql = sql & "'" & Format(endDate, "yyyy-mm-dd") & "'"
    sql = sql & ") "
    sql = sql & "WHERE ret IS NOT NULL "
    sql = sql & "ORDER BY ref_date"

    Set rs = DB_Query(sql)

    If rs Is Nothing Or rs.EOF Then
        RETURNS = CVErr(xlErrNA)
        Exit Function
    End If

    ReDim data(1 To rs.RecordCount, 1 To 1)

    rs.MoveFirst
    i = 1
    Do While Not rs.EOF
        data(i, 1) = rs.Fields(0).Value
        i = i + 1
        rs.MoveNext
    Loop

    rs.Close

    RETURNS = data
End Function


