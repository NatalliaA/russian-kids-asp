Imports System.Data.OleDb

Public Class UserProfile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Request.Params("UserName") = User.Identity.Name Then
            btn_editProfile.Visible = True 'the button is shown only if the user looking at his own profile
        Else
            btn_editProfile.Visible = False
        End If
    End Sub

    Protected Sub btn_editProfile_Click(sender As Object, e As EventArgs) Handles btn_editProfile.Click

    End Sub
End Class