Attribute VB_Name = "modDBESCALAR"
Public Function DB_Scalar(sql As String) As Variant
    Dim rs As ADODB.Recordset

    Set rs = DB_Query(sql)

    If rs Is Nothing Or rs.EOF Then
        DB_Scalar = CVErr(xlErrNA)
    Else
        DB_Scalar = rs.Fields(0).Value
    End If

    rs.Close
End Function

