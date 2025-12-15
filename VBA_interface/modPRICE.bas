Attribute VB_Name = "modPRICE"
Public Function PRICE(ticker As String, refDate As Date) As Double
    Dim sql As String
    Dim rs As ADODB.Recordset

    sql = ""
    sql = sql & "SELECT get_price("
    sql = sql & "'" & ticker & "', "
    sql = sql & "'" & Format(refDate, "yyyy-mm-dd") & "'"
    sql = sql & ") AS price"

    Set rs = DB_Query(sql)

    If rs Is Nothing Or rs.EOF Or IsNull(rs.Fields("price").Value) Then
        PRICE = CVErr(xlErrNA)
    Else
        PRICE = rs.Fields("price").Value
    End If

    rs.Close
End Function

