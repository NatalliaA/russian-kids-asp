Imports System.Data.OleDb

Public Class EditProfile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then ' if the user got to this page not from this page than do this:

            Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("LearnRussianConnectionString").ConnectionString)
            Dim SqlString As String = "SELECT * FROM UserProfile WHERE UserName=@f1"
            Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@f1", User.Identity.Name)
            oleDbConn.Open()

            Dim dr As OleDbDataReader = cmd.ExecuteReader()
            If dr.HasRows Then
                dr.Read() 'check if it has some records
                If Not IsDBNull(dr("Country")) Then tbx_country.Text = dr("Country")
                If Not IsDBNull(dr("Languages")) Then tbx_languages.Text = dr("Languages")

            End If

        End If
    End Sub

    Protected Sub btn_safeProfile_Click(sender As Object, e As EventArgs) Handles btn_safeProfile.Click
        Dim newFileName As String = ""
        Dim SqlString As String


        Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("LearnRussianConnectionString").ConnectionString)

        SqlString = "UPDATE UserProfile SET Country=@f1, Languages=@f2 WHERE UserName=@f3"

        Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
        cmd.CommandType = CommandType.Text
        cmd.Parameters.AddWithValue("@f1", tbx_country.Text)
        cmd.Parameters.AddWithValue("@f2", tbx_languages.Text)
        cmd.Parameters.AddWithValue("@f3", User.Identity.Name)

        oleDbConn.Open()
        cmd.ExecuteNonQuery()
        cmd.Dispose()
        oleDbConn.Close()
        oleDbConn.Dispose()
        Response.Redirect("~/UserProfile.aspx?UserName=" & User.Identity.Name)
    End Sub
End Class