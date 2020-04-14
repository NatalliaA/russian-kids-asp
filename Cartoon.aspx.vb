Imports System.Data.OleDb
Imports System.IO
Imports System.Net
Imports System.Net.WebRequest
Imports System.Net.WebResponse
Imports System.Net.WebException

Public Class Cartoon
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim videoYTID As String
            ' Get the necessary value of a youtube video id from the database
            Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("LearnRussianConnectionString").ConnectionString)
            Dim SqlString As String = "SELECT VideoLink FROM ListOfCartoons WHERE ID=" + Request.QueryString("ID")
            Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
            oleDbConn.Open()
            Dim dataReader = cmd.ExecuteReader()
            dataReader.Read()
            videoYTID = dataReader.GetValue(0)
            tbx_TEMP.Text = videoYTID ' put the value of the video id into the hidden textbox

            

            'to show number of users' likes
            Dim NumberLikes As Integer
            Dim NumberLikesSql As String = "SELECT Count(*) FROM LikesCartoon WHERE Cartoon_fkid=@f2"
            Dim LikesCmd As OleDbCommand = New OleDbCommand(NumberLikesSql, oleDbConn)
            LikesCmd.Parameters.AddWithValue("@f2", Request.Params("ID"))
            NumberLikes = CInt(LikesCmd.ExecuteScalar)
            If NumberLikes = 1 Then
                lbl_likesCount.Text = CStr(NumberLikes) + " user liked this page"
                lbl_likesCount.Visible = True
            ElseIf NumberLikes > 1 Then
                lbl_likesCount.Text = CStr(NumberLikes) + " users liked this page"
                lbl_likesCount.Visible = True
            ElseIf NumberLikes = 0 Then
                lbl_likesCount.Visible = False
            End If

            ' if the user has already liked the page, show the liked label and hide the like button
            If Request.IsAuthenticated Then

                Dim doesLikeSql As String = "SELECT * FROM LikesCartoon WHERE Cartoon_fkid=@f4 AND Reader=@f5"
                Dim doesLikeCmd As OleDbCommand = New OleDbCommand(doesLikeSql, oleDbConn)
                doesLikeCmd.CommandType = CommandType.Text
                doesLikeCmd.Parameters.AddWithValue("@f4", Request.Params("ID"))
                doesLikeCmd.Parameters.AddWithValue("@f5", User.Identity.Name)
                Dim likeDataReader As OleDbDataReader = doesLikeCmd.ExecuteReader()
                If (likeDataReader.HasRows()) Then
                    btn_like.Visible = False
                    lbl_liked.Visible = True
                Else
                    btn_like.Visible = True
                    lbl_liked.Visible = False
                End If

            Else
                btn_like.Visible = True
                lbl_liked.Visible = False
            End If

            'to show all comments

            Dim CommentsSqlString As String = "SELECT * FROM CommentsCartoon WHERE Cartoon_fkid=@f1"
            Dim Cartooncmd As OleDbCommand = New OleDbCommand(CommentsSqlString, oleDbConn)
            Cartooncmd.CommandType = CommandType.Text
            Cartooncmd.Parameters.AddWithValue("@f1", Request.Params("ID"))

            Dim dr = Cartooncmd.ExecuteReader()
            GridView_Comments.DataSource = dr
            GridView_Comments.DataBind()

            'to show number of comments

            Dim NumberComments As Integer
            Dim NumberCommentsSql As String = "SELECT Count(*) From CommentsCartoon WHERE Cartoon_fkid=@f3"
            Dim NumberCommentsCmd As OleDbCommand = New OleDbCommand(NumberCommentsSql, oleDbConn)
            NumberCommentsCmd.Parameters.AddWithValue("@f3", Request.Params("ID"))
            NumberComments = CInt(NumberCommentsCmd.ExecuteScalar)
            If NumberComments = 1 Then
                lbl_comments.Text = CStr(NumberComments) + " Comment:"
            ElseIf NumberComments > 1 Then
                lbl_comments.Text = CStr(NumberComments) + " Comments:"
            ElseIf NumberComments = 0 Then
                lbl_comments.Text = "No Comments Yet. Be the First to Leave One."
            End If

        End If

        'showing like button only for logged in users
        If Not Request.IsAuthenticated Then
            btn_like.Visible = False
            Hyl_LoginLike.Visible = True
        End If


    End Sub

    'to translate words or phrases into different languages accessing the Yandex.Translate API 
    Protected Sub btn_Translate_Click(sender As Object, e As EventArgs) Handles btn_Translate.Click

        Dim txtToTranslate As String = tbx_YourWord.Text
        Dim language As String = ddl_Languages.SelectedValue
        Dim my_Uri As String = "https://translate.yandex.net/api/v1.5/tr/translate?text=" + System.Web.HttpUtility.UrlEncode(txtToTranslate) + "&key=MYKEY&lang=" + language

        Dim webRequest As HttpWebRequest = CType(Net.WebRequest.Create(my_Uri), HttpWebRequest) ' Perform HTTP GET request

        Dim headers As System.Net.WebHeaderCollection = webRequest.GetResponse().Headers ' Get request response

        webRequest.Proxy.Credentials = System.Net.CredentialCache.DefaultCredentials

        ' Parse the request response
        Dim Response As System.Net.WebResponse = webRequest.GetResponse()
        Dim stream As System.IO.Stream = Response.GetResponseStream()
        Dim encode As System.Text.Encoding = System.Text.Encoding.GetEncoding("utf-8")
        Dim translatedStream As New System.IO.StreamReader(stream, encode)
        Dim xTranslation As New System.Xml.XmlDocument()
        xTranslation.LoadXml(translatedStream.ReadToEnd()) ' Parse XML

        tbx_Translation.Text = xTranslation.InnerText ' Pass the translated text to the text box
    End Sub

    Protected Sub btn_like_Click(sender As Object, e As EventArgs) Handles btn_like.Click
        If Request.IsAuthenticated Then
            Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("LearnRussianConnectionString").ConnectionString)
            oleDbConn.Open()
            Dim likeSql As String = "INSERT INTO LikesCartoon(Cartoon_fkid,Reader) Values (@f1,@f2)"
            Dim likeCmd As OleDbCommand = New OleDbCommand(likeSql, oleDbConn)
            likeCmd.CommandType = CommandType.Text
            likeCmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
            likeCmd.Parameters.AddWithValue("@f2", User.Identity.Name)
            likeCmd.ExecuteNonQuery()
            btn_like.Visible = False ' to hide the button
            lbl_liked.Visible = True ' to show the label if the user has already liked the page

            'to update immediately number of users' likes
            Dim NumLikes As Integer
            Dim NumLikesSql As String = "SELECT Count(*) FROM LikesCartoon WHERE Cartoon_fkid=@f2"
            Dim NumLikesCmd As OleDbCommand = New OleDbCommand(NumLikesSql, oleDbConn)
            NumLikesCmd.Parameters.AddWithValue("@f2", Request.Params("ID"))
            NumLikes = CInt(NumLikesCmd.ExecuteScalar)
            If NumLikes = 1 Then
                lbl_likesCount.Text = CStr(NumLikes) + " user liked this page"
                lbl_likesCount.Visible = True
            ElseIf NumLikes > 1 Then
                lbl_likesCount.Text = CStr(NumLikes) + " users liked this page"
                lbl_likesCount.Visible = True
            ElseIf NumLikes = 0 Then
                lbl_likesCount.Visible = False
            End If

        Else
            Response.Redirect("~/Account/Login.aspx")
        End If
    End Sub

    Protected Sub btn_addComment_Click(sender As Object, e As EventArgs) Handles btn_addComment.Click
        If Request.IsAuthenticated Then

            Dim oleDbConn As New OleDb.OleDbConnection(ConfigurationManager.ConnectionStrings("LearnRussianConnectionString").ConnectionString)
            Dim SqlString As String = "INSERT INTO CommentsCartoon (WriterName,Comment, Cartoon_fkid, DayPosted) Values (@f1,@f3,@f4, @f5)"
            Dim cmd As OleDbCommand = New OleDbCommand(SqlString, oleDbConn)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@f1", User.Identity.Name)

            cmd.Parameters.AddWithValue("@f3", tbx_comment.Text)
            cmd.Parameters.AddWithValue("@f4", Request.Params("ID"))
            cmd.Parameters.AddWithValue("@f5", DateTime.Now.ToString)

            oleDbConn.Open()
            cmd.ExecuteNonQuery()

            'to show added comment immediately
            Dim fillComments As String = "SELECT * FROM CommentsCartoon WHERE Cartoon_fkid=@f1"
            Dim fillCommentsCmd As OleDbCommand = New OleDbCommand(fillComments, oleDbConn)
            fillCommentsCmd.CommandType = CommandType.Text
            fillCommentsCmd.Parameters.AddWithValue("@f1", Request.Params("ID"))
            Dim dr = fillCommentsCmd.ExecuteReader()
            GridView_Comments.DataSource = dr
            GridView_Comments.DataBind()
            tbx_comment.Text = ""


            'to update immediately number of comments
            Dim NumberComm As Integer
            Dim NumberCommSql As String = "SELECT Count(*) From CommentsCartoon WHERE Cartoon_fkid=@f3"
            Dim NumberCommCmd As OleDbCommand = New OleDbCommand(NumberCommSql, oleDbConn)
            NumberCommCmd.Parameters.AddWithValue("@f3", Request.Params("ID"))
            NumberComm = CInt(NumberCommCmd.ExecuteScalar)
            If NumberComm = 1 Then
                lbl_comments.Text = CStr(NumberComm) + " Comment:"
            ElseIf NumberComm > 1 Then
                lbl_comments.Text = CStr(NumberComm) + " Comments:"
            ElseIf NumberComm = 0 Then
                lbl_comments.Text = "No Comments Yet. Be the First to Leave One."
            End If

        Else
            Response.Redirect("~/Account/Login.aspx")
        End If
    End Sub

    Protected Sub btn_answers_Click(sender As Object, e As EventArgs) Handles btn_answers.Click

        ListView_Answers.Visible = True

    End Sub
End Class