Attribute VB_Name = "modDB"
Function DB_Query(sql As String) As ADODB.Recordset
    Dim conn As ADODB.Connection
    Dim rs As ADODB.Recordset

    On Error GoTo ErrHandler

    Set conn = New ADODB.Connection
    conn.Open "DSN=PostgreSQL_excel;"

    Set rs = New ADODB.Recordset
    rs.Open sql, conn, adOpenStatic, adLockReadOnly

    Set DB_Query = rs
    Exit Function

ErrHandler:
    MsgBox "Erro ao executar query:" & vbCrLf & Err.Description, vbCritical
    Set DB_Query = Nothing
End Function

