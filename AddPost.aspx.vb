Imports System.Data.OleDb

Public Class AddPost
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.IsAuthenticated Then
            Response.Redirect("~/Account/Login.aspx")
        End If
    End Sub

    Protected Sub btn_addPost_Click(sender As Object, e As EventArgs) Handles btn_addPost.Click

      
        If Len(tbx_Topic.Text) <> 0 And Len(tbx_Description.Text) <> 0 And Len(rbtlist_Category.SelectedValue) <> 0 Then

            Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("LearnRussianConnectionString").ConnectionString)
            Dim SqlString As String = "INSERT INTO Forum (Topic, Category, Description, Author, AddingDay) Values (@f1,@f2,@f3,@f5,@f6)"
            Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@f1", tbx_Topic.Text)
            cmd.Parameters.AddWithValue("@f2", rbtlist_Category.SelectedValue)
            cmd.Parameters.AddWithValue("@f3", tbx_Description.Text)
            cmd.Parameters.AddWithValue("@f5", User.Identity.Name)
            cmd.Parameters.AddWithValue("@f6", DateTime.Now.ToString)
            oleDbConn.Open()
            cmd.ExecuteNonQuery()
            Response.Redirect("ConfirmationPost.aspx")
        Else
            lbl_checkInput.Text = "* Please fill in all fields and upload again your picture."
            lbl_checkInput.Visible = True
        End If
    End Sub

End Class