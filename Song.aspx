<%@ Page Title="Song" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Song.aspx.vb" Inherits="RussianForKidsVB.Song" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .breakword {
            word-wrap: break-word;
            word-break: break-all;
        }
    </style>

    <div class="container">
        <div class="row">

            <div class="col-md-9" style="background-color: #fcca70; border-style: solid; border-color: orange; border-radius: 20px; margin-right: 30px; margin-left: 30px; margin-bottom: 10px">

                <!--displaying like button-->

                <div class="container">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="row" style="margin-left: 25px">
                                <div class="col-md-12">
                                    <br />
                                    <asp:Label ID="lbl_likesCount" runat="server" Text="Label" CssClass="pull-right"
                                        Font-Bold="True" Font-Size="14px" ForeColor="Brown"></asp:Label>
                                </div>
                            </div>

                            <div class="row" style="margin-left: 25px">
                                <div class="col-md-12">
                                    <asp:HyperLink ID="Hyl_LoginLike" runat="server" NavigateUrl="~/Account/Login.aspx"
                                        Font-Underline="True" Font-Bold="true" CssClass="pull-right" Visible="false">Log in</asp:HyperLink>
                                    <asp:Label ID="lbl_liked" runat="server" Text="You liked"
                                        Style="font-weight: 700;" CssClass="pull-right" Font-Bold="False"
                                        Font-Size="14px" ForeColor="Brown"></asp:Label>
                                </div>
                            </div>
                            <div class="row" style="margin-left: 25px">
                                <div class="col-md-12">
                                    <asp:Button ID="btn_like" runat="server" Text="Like" CssClass="btn btn-success pull-right" BackColor="#ffff00" ForeColor="Brown"
                                        Font-Bold="true" Font-Size="16px" Height="32px" Width="78px" OnClick="btn_like_Click"
                                        Style="background-image: url('pictures/Like.jpg'); text-align: right; background-repeat: no-repeat" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <div class="container">
                    <div class="row">
                        <div class="col-md-8" style="margin-top: 10px">

                            <!--Song Title-->

                            <div class="col-md-12" style="background-color: oldlace; border-radius: 20px; border-color: plum; border-style: solid; padding: 20px; margin-bottom: 10px;">
                                <span class="glyphicon glyphicon-music" aria-hidden="true" style="font-size: 30px; color: orangered"></span>
                                <asp:Label ID="Label13" runat="server" Text="Watch the Song Video" Font-Bold="true" Font-Size="18px" ForeColor="OrangeRed"></asp:Label>
                                <br />
                                <br />

                                <asp:ListView ID="ListView_Songs" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" GroupItemCount="3">
                                    <AlternatingItemTemplate>
                                        <td runat="server">
                                            <asp:Label runat="server" Text='<%# Eval("Title") %>' Font-Size="20px" ForeColor="Green" Font-Bold="True" />
                                            <br />
                                            <asp:Label runat="server" Text='<%# Eval("EnglishTitle")%>' Font-Bold="true" />
                                            <br />
                                        </td>
                                    </AlternatingItemTemplate>
                                    <EditItemTemplate>
                                        <td runat="server" style="">ID:
                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                            <br />
                                            Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                                            <br />
                                            EnglishTitle:
                    <asp:TextBox ID="EnglishTitleTextBox" runat="server" Text='<%# Bind("EnglishTitle") %>' />
                                            <br />
                                            VideoLink:
                    <asp:TextBox ID="VideoLinkTextBox" runat="server" Text='<%# Bind("VideoLink") %>' />
                                            <br />
                                            Lyrics:
                    <asp:TextBox ID="LyricsTextBox" runat="server" Text='<%# Bind("Lyrics") %>' />
                                            <br />
                                            Picture:
                    <asp:TextBox ID="PictureTextBox" runat="server" Text='<%# Bind("Picture") %>' />
                                            <br />
                                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                            <br />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                            <br />
                                        </td>
                                    </EditItemTemplate>
                                    <EmptyDataTemplate>
                                        <table runat="server" style="">
                                            <tr>
                                                <td>No data was returned.</td>
                                            </tr>
                                        </table>
                                    </EmptyDataTemplate>
                                    <EmptyItemTemplate>
                                        <td runat="server" />
                                    </EmptyItemTemplate>
                                    <GroupTemplate>
                                        <tr id="itemPlaceholderContainer" runat="server">
                                            <td id="itemPlaceholder" runat="server"></td>
                                        </tr>
                                    </GroupTemplate>
                                    <InsertItemTemplate>
                                        <td runat="server" style="">Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                                            <br />
                                            EnglishTitle:
                    <asp:TextBox ID="EnglishTitleTextBox" runat="server" Text='<%# Bind("EnglishTitle") %>' />
                                            <br />
                                            VideoLink:
                    <asp:TextBox ID="VideoLinkTextBox" runat="server" Text='<%# Bind("VideoLink") %>' />
                                            <br />
                                            Lyrics:
                    <asp:TextBox ID="LyricsTextBox" runat="server" Text='<%# Bind("Lyrics") %>' />
                                            <br />
                                            Picture:
                    <asp:TextBox ID="PictureTextBox" runat="server" Text='<%# Bind("Picture") %>' />
                                            <br />
                                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                            <br />
                                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                            <br />
                                        </td>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <td runat="server">
                                            <asp:Label runat="server" Text='<%# Eval("Title") %>' Font-Size="20px" ForeColor="Green" Font-Bold="True" />
                                            <br />
                                            <asp:Label runat="server" Text='<%# Eval("EnglishTitle")%>' Font-Bold="true" />
                                            <br />
                                        </td>
                                    </ItemTemplate>
                                    <LayoutTemplate>
                                        <table runat="server">
                                            <tr runat="server">
                                                <td runat="server">
                                                    <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                                        <tr id="groupPlaceholder" runat="server">
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr runat="server">
                                                <td runat="server" style=""></td>
                                            </tr>
                                        </table>
                                    </LayoutTemplate>
                                    <SelectedItemTemplate>
                                        <td runat="server" style="">ID:
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                            <br />
                                            Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                                            <br />
                                            EnglishTitle:
                    <asp:Label ID="EnglishTitleLabel" runat="server" Text='<%# Eval("EnglishTitle") %>' />
                                            <br />
                                            VideoLink:
                    <asp:Label ID="VideoLinkLabel" runat="server" Text='<%# Eval("VideoLink") %>' />
                                            <br />
                                            Lyrics:
                    <asp:Label ID="LyricsLabel" runat="server" Text='<%# Eval("Lyrics") %>' />
                                            <br />
                                            Picture:
                    <asp:Label ID="PictureLabel" runat="server" Text='<%# Eval("Picture") %>' />
                                            <br />
                                        </td>
                                    </SelectedItemTemplate>
                                </asp:ListView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LearnRussianConnectionString %>" ProviderName="<%$ ConnectionStrings:LearnRussianConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [Title], [EnglishTitle], [VideoLink], [Lyrics], [Picture] FROM [ListOfSongs] WHERE ([ID] = ?)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                <!--to put the youtube video id value from the db-->
                                <asp:TextBox ID="tbx_TEMP" Style="display: none;" runat="server"></asp:TextBox>
                                <br />

                                <!--Video-->

                                <!--youtube player-->
                                <!-- 1. The <iframe> (and video player) will replace this <div> tag. -->
                                <p id="player" class="img-responsive img-rounded" style="height: 360px; width: 600px"></p>

                                <script type="text/javascript">
                                    // 2. This code loads the IFrame Player API Javascript code asynchronously.
                                    var tag = document.createElement('script');

                                    tag.src = "https://www.youtube.com/iframe_api"; // The link for the API request
                                    var firstScriptTag = document.getElementsByTagName('script')[0];
                                    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

                                    // 3. This function creates an <iframe> (and YouTube player) after the API code downloads.
                                    var player;
                                    function onYouTubeIframeAPIReady() {
                                        var TestVideoID = document.getElementById('<%=tbx_TEMP.ClientID %>').value; //get value of youtube video ID from textbox
                                        player = new YT.Player('player', {
                                            //height: '330',
                                            //width: '430',
                                            videoId: TestVideoID,
                                            events: {
                                                'onReady': onPlayerReady,
                                                'onStateChange': onPlayerStateChange
                                            }
                                        });
                                    }

                                    // 4. The API will call this function when the video player is ready.
                                    function onPlayerReady(event) {
                                        event.target.playVideo();
                                    }

                                    // 5. The API calls this function when the player's state changes.
                                    //    The function indicates that when playing a video (state=1),
                                    //    the player should play untill the .
                                    var done = false;
                                    function onPlayerStateChange(event) {
                                        if (event.data == YT.PlayerState.ENDED)
                                        { // If the event is that the video reached its end
                                            player.seekTo(0, 1) // Go to the beginning of the video
                                            player.pauseVideo() // Pause the video
                                        }
                                    }
                                    function stopVideo() {
                                        player.stopVideo();
                                    }
                                </script>
                            </div>

                            <!-- Translation-->

                            <div class="col-md-12" style="background-color: #d5cbcb; border-style: solid; border-color: #877e7e; border-radius: 20px; padding: 20px; margin-top: 10px; margin-bottom: 10px">

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <span class="glyphicon glyphicon-book" aria-hidden="true" style="font-size: 30px; color: fuchsia"></span>
                                        <asp:Label ID="Label12" runat="server" Text="Dictionary" Font-Bold="true" Font-Size="18px" ForeColor="Fuchsia"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="Label2" runat="server" Text="Languages:" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                        <asp:DropDownList ID="ddl_Languages" runat="server" CssClass="form-control" Width="130px">
                                            <asp:ListItem>ru-en</asp:ListItem>
                                            <asp:ListItem>en-ru</asp:ListItem>
                                            <asp:ListItem>ru-de</asp:ListItem>
                                            <asp:ListItem>de-ru</asp:ListItem>
                                        </asp:DropDownList>
                                        <br />
                                        <asp:Label ID="Label4" runat="server" Text="Type a word or a sentence:" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                        <asp:TextBox ID="tbx_YourWord" runat="server" CssClass="form-control" Height="35px" TextMode="MultiLine"></asp:TextBox>
                                        <asp:Button ID="btn_Translate" runat="server" Text="Translate" CssClass="btn btn-success pull-right" BackColor="#ffff00" ForeColor="Brown"
                                            Font-Bold="true" Font-Size="16px" Height="30px" Width="120px" />
                                        <br />
                                        <asp:Label ID="Label6" runat="server" Text="Result:" ForeColor="Brown" Font-Bold="true"></asp:Label>
                                        <asp:TextBox ID="tbx_Translation" runat="server" CssClass="form-control" Height="35px" TextMode="MultiLine"></asp:TextBox>

                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <!--table of comments-->

                            <div class="col-md-12" style="background-color: #cae4f7; border-style: solid; border-color: #42acfa; border-radius: 20px; padding: 20px; margin-bottom: 10px">

                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                    <ContentTemplate>
                                        <span class="glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 30px; color: dodgerblue"></span>
                                        <asp:Label ID="Label11" runat="server" Text="Share Ideas, Questions" Font-Bold="true" Font-Size="18px" ForeColor="DodgerBlue"></asp:Label>
                                        <br />
                                        <br />
                                        <asp:Label ID="lbl_comments" runat="server" Height="25px"
                                            Style="font-weight: 700" Text="Label" Width="452px" ForeColor="Brown" Font-Bold="true"></asp:Label>

                                        <asp:GridView ID="GridView_Comments" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                                            CssClass="table table-striped table-hover table-responsive" GridLines="None"
                                            CellPadding="0" Font-Size="13px">
                                            <Columns>
                                                <asp:HyperLinkField DataNavigateUrlFields="WriterName" ControlStyle-CssClass="col-md-1"
                                                    DataNavigateUrlFormatString="UserProfile.aspx?UserName={0}"
                                                    DataTextField="WriterName" HeaderText="Name" ControlStyle-ForeColor="#993300" ControlStyle-Font-Bold="true" />
                                                <asp:BoundField ControlStyle-CssClass="col-md-3" ItemStyle-CssClass="breakword" DataField="Comment" HeaderText="Comment"
                                                    SortExpression="Comment" />
                                                <asp:BoundField DataField="DayPosted" HeaderText="Date" SortExpression="DayPosted" DataFormatString="{0:d}" ItemStyle-CssClass="breakword" ControlStyle-CssClass="col-md-1" />
                                            </Columns>
                                        </asp:GridView>

                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:LearnRussianConnectionString %>" ProviderName="<%$ ConnectionStrings:LearnRussianConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [Song_fkid], [WriterName], [Title], [Comment], [DayPosted] FROM [CommentsSong] WHERE ([Song_fkid] = ?)">
                                            <SelectParameters>
                                                <asp:QueryStringParameter Name="Song_fkid" QueryStringField="ID" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <!--writing comments-->

                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true" style="font-size: 30px; color: green"></span>
                                        <asp:Label ID="Label7" runat="server" ForeColor="Green" Font-Size="18px" Font-Bold="true">Write Your Comment (<asp:HyperLink ID="hyp_login" runat="server"
                                            Font-Underline="True" ForeColor="#00CCFF" NavigateUrl="~/Account/Login.aspx">Log in</asp:HyperLink>): </asp:Label>
                                        <br />
                                        <br />
                                        <asp:TextBox ID="tbx_comment" runat="server" CssClass="form-control" Height="155px" TextMode="MultiLine"></asp:TextBox></p>
    <asp:Button ID="btn_addComment" runat="server" OnClick="btn_addComment_Click" Text="Add Comment"
        CssClass="btn btn-success pull-right" BackColor="#ffff00" ForeColor="Brown" Font-Bold="true" Font-Size="16px" Height="35px" Width="150px" />
                                        <br />
                                        <br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>

                        <!--Song lyrics and Tasks-->

                        <div class="col-md-4" style="background-color: #d9ff79; border-style: solid; border-color: #8fbf14; border-radius: 20px; padding: 20px; margin-top: 10px; margin-bottom: 10px;">
                            <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                                    <span class="glyphicon glyphicon-book" aria-hidden="true" style="font-size: 30px; color: fuchsia"></span>
                                    <asp:Label ID="Label10" runat="server" Text="Read the Lyrics (scroll)" Font-Bold="true" Font-Size="18px" ForeColor="Fuchsia"></asp:Label>
                                    <br />

                                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource2" GroupItemCount="1">
                                        <AlternatingItemTemplate>
                                            <td runat="server">
                                                <%-- <%# Eval("Title") %>--%>
                                                <br />
                                                <asp:TextBox ID="Lyrics" runat="server" Text='<%# Eval("Lyrics")%>' CssClass=" form-control" BackColor="White" Width="220px" Height="315px" TextMode="MultiLine" ReadOnly="True" />
                                                <br />
                                            </td>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <td runat="server" style="">ID:
                    <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                                <br />
                                                Lyrics:
                    <asp:TextBox ID="LyricsTextBox" runat="server" Text='<%# Bind("Lyrics") %>' />
                                                <br />
                                                Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                                                <br />
                                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                <br />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                                <br />
                                            </td>
                                        </EditItemTemplate>
                                        <EmptyDataTemplate>
                                            <table runat="server" style="">
                                                <tr>
                                                    <td>No data was returned.</td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                        <EmptyItemTemplate>
                                            <td runat="server" />
                                        </EmptyItemTemplate>
                                        <GroupTemplate>
                                            <tr id="itemPlaceholderContainer" runat="server">
                                                <td id="itemPlaceholder" runat="server"></td>
                                            </tr>
                                        </GroupTemplate>
                                        <InsertItemTemplate>
                                            <td runat="server" style="">Lyrics:
                    <asp:TextBox ID="LyricsTextBox" runat="server" Text='<%# Bind("Lyrics") %>' />
                                                <br />
                                                Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                                                <br />
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                <br />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                <br />
                                            </td>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <td runat="server">
                                                <br />
                                                <asp:TextBox ID="Lyrics" runat="server" Text='<%# Eval("Lyrics")%>' CssClass=" form-control" BackColor="White" Width="220px" Height="315px" TextMode="MultiLine" ReadOnly="True" />
                                                <br />
                                            </td>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <table runat="server">
                                                <tr runat="server">
                                                    <td runat="server">
                                                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                                            <tr id="groupPlaceholder" runat="server">
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr runat="server">
                                                    <td runat="server" style=""></td>
                                                </tr>
                                            </table>
                                        </LayoutTemplate>
                                        <SelectedItemTemplate>
                                            <td runat="server" style="">ID:
                    <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                                <br />
                                                Lyrics:
                    <asp:Label ID="LyricsLabel" runat="server" Text='<%# Eval("Lyrics") %>' />
                                                <br />
                                                Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                                                <br />
                                            </td>
                                        </SelectedItemTemplate>
                                    </asp:ListView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LearnRussianConnectionString %>" ProviderName="<%$ ConnectionStrings:LearnRussianConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [Lyrics], [Title] FROM [ListOfSongs] WHERE ([ID] = ?)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <!--Tasks-->

                                    <span class="glyphicon glyphicon-question-sign" aria-hidden="true" style="font-size: 30px; color: orange"></span>
                                    <asp:Label ID="Label8" runat="server" Text="Quiz" Font-Bold="true" Font-Size="20px" ForeColor="#008400"></asp:Label>
                                    <br />
                                    <br />
                                    <asp:ListView ID="ListView_Tasks" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource4" GroupItemCount="3">
                                        <AlternatingItemTemplate>
                                            <td runat="server" style="">
                                                <asp:Label ID="Label1" runat="server" Text="1. Find a correct answer:" Font-Bold="True" ForeColor="Brown"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="TaskMultipleChoiceLabel" runat="server" Text='<%# Eval("TaskMultipleChoice") %>' />
                                                <br />
                                                <asp:Label ID="Label3" runat="server" Text="2. Translate into English:" Font-Bold="True" ForeColor="Brown"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="TaskTranslateLabel" runat="server" Text='<%# Eval("TaskTranslate") %>' />
                                                <br />
                                                <span class="glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 30px; color: dodgerblue"></span>
                                                <asp:Label ID="Label5" runat="server" Text=" 3. Share in Comments your Ideas " Font-Bold="True" ForeColor="Brown"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="TaskCommentLabel" runat="server" Text='<%# Eval("TaskComment") %>' />
                                                <br />
                                            </td>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <td runat="server" style="">ID:
                        <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                                <br />
                                                TaskMultipleChoice:
                        <asp:TextBox ID="TaskMultipleChoiceTextBox" runat="server" Text='<%# Bind("TaskMultipleChoice") %>' />
                                                <br />
                                                TaskTranslate:
                        <asp:TextBox ID="TaskTranslateTextBox" runat="server" Text='<%# Bind("TaskTranslate") %>' />
                                                <br />
                                                TaskComment:
                        <asp:TextBox ID="TaskCommentTextBox" runat="server" Text='<%# Bind("TaskComment") %>' />
                                                <br />
                                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                <br />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                                <br />
                                            </td>
                                        </EditItemTemplate>
                                        <EmptyDataTemplate>
                                            <table runat="server" style="">
                                                <tr>
                                                    <td>No data was returned.</td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                        <EmptyItemTemplate>
                                            <td runat="server" />
                                        </EmptyItemTemplate>
                                        <GroupTemplate>
                                            <tr id="itemPlaceholderContainer" runat="server">
                                                <td id="itemPlaceholder" runat="server"></td>
                                            </tr>
                                        </GroupTemplate>
                                        <InsertItemTemplate>
                                            <td runat="server" style="">TaskMultipleChoice:
                        <asp:TextBox ID="TaskMultipleChoiceTextBox" runat="server" Text='<%# Bind("TaskMultipleChoice") %>' />
                                                <br />
                                                TaskTranslate:
                        <asp:TextBox ID="TaskTranslateTextBox" runat="server" Text='<%# Bind("TaskTranslate") %>' />
                                                <br />
                                                TaskComment:
                        <asp:TextBox ID="TaskCommentTextBox" runat="server" Text='<%# Bind("TaskComment") %>' />
                                                <br />
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                <br />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                <br />
                                            </td>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <td runat="server" style="">
                                                <asp:Label ID="Label1" runat="server" Text="1. Find a correct answer:" Font-Bold="True" ForeColor="Brown"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="TaskMultipleChoiceLabel" runat="server" Text='<%# Eval("TaskMultipleChoice") %>' />
                                                <br />
                                                <asp:Label ID="Label3" runat="server" Text="2. Translate into English:" Font-Bold="True" ForeColor="Brown"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="TaskTranslateLabel" runat="server" Text='<%# Eval("TaskTranslate") %>' />
                                                <br />
                                                <span class="glyphicon glyphicon-comment" aria-hidden="true" style="font-size: 30px; color: dodgerblue"></span>
                                                <asp:Label ID="Label5" runat="server" Text=" 3. Share in Comments your Ideas " Font-Bold="True" ForeColor="Brown"></asp:Label>
                                                <br />
                                                <br />
                                                <asp:Label ID="TaskCommentLabel" runat="server" Text='<%# Eval("TaskComment") %>' />
                                                <br />
                                            </td>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <table runat="server">
                                                <tr runat="server">
                                                    <td runat="server">
                                                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                                            <tr id="groupPlaceholder" runat="server">
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr runat="server">
                                                    <td runat="server" style=""></td>
                                                </tr>
                                            </table>
                                        </LayoutTemplate>
                                        <SelectedItemTemplate>
                                            <td runat="server" style="">ID:
                        <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                                <br />
                                                TaskMultipleChoice:
                        <asp:Label ID="TaskMultipleChoiceLabel" runat="server" Text='<%# Eval("TaskMultipleChoice") %>' />
                                                <br />
                                                TaskTranslate:
                        <asp:Label ID="TaskTranslateLabel" runat="server" Text='<%# Eval("TaskTranslate") %>' />
                                                <br />
                                                TaskComment:
                        <asp:Label ID="TaskCommentLabel" runat="server" Text='<%# Eval("TaskComment") %>' />
                                                <br />
                                            </td>
                                        </SelectedItemTemplate>
                                    </asp:ListView>

                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:LearnRussianConnectionString %>" ProviderName="<%$ ConnectionStrings:LearnRussianConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [TaskMultipleChoice], [TaskTranslate], [TaskComment] FROM [ListOfSongs] WHERE ([ID] = ?)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <asp:Button ID="btn_answers" runat="server" Text="Show Answers" CssClass="btn btn-success pull-right" BackColor="#ffff00" ForeColor="Brown"
                                        Font-Bold="true" Font-Size="16px" Height="35px" Width="150px" />
                                    <br />
                                    <br />

                                    <!--Answers-->

                                    <asp:ListView ID="ListView_Answers" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource5" GroupItemCount="3" Visible="false">
                                        <AlternatingItemTemplate>
                                            <td runat="server" style="">
                                                <br />
                                                <asp:Label ID="AnswerMultipleLabel" runat="server" Text='<%# Eval("AnswerMultiple") %>' Font-Bold="True" />
                                                <asp:Label ID="AnswerTranslateLabel" runat="server" Text='<%# Eval("AnswerTranslate") %>' Font-Bold="True" />
                                                <br />
                                            </td>
                                        </AlternatingItemTemplate>
                                        <EditItemTemplate>
                                            <td runat="server" style="">ID:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                                <br />
                                                AnswerMultiple:
                <asp:TextBox ID="AnswerMultipleTextBox" runat="server" Text='<%# Bind("AnswerMultiple") %>' />
                                                <br />
                                                AnswerTranslate:
                <asp:TextBox ID="AnswerTranslateTextBox" runat="server" Text='<%# Bind("AnswerTranslate") %>' />
                                                <br />
                                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                                <br />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                                <br />
                                            </td>
                                        </EditItemTemplate>
                                        <EmptyDataTemplate>
                                            <table runat="server" style="">
                                                <tr>
                                                    <td>No data was returned.</td>
                                                </tr>
                                            </table>
                                        </EmptyDataTemplate>
                                        <EmptyItemTemplate>
                                            <td runat="server" />
                                        </EmptyItemTemplate>
                                        <GroupTemplate>
                                            <tr id="itemPlaceholderContainer" runat="server">
                                                <td id="itemPlaceholder" runat="server"></td>
                                            </tr>
                                        </GroupTemplate>
                                        <InsertItemTemplate>
                                            <td runat="server" style="">AnswerMultiple:
                <asp:TextBox ID="AnswerMultipleTextBox" runat="server" Text='<%# Bind("AnswerMultiple") %>' />
                                                <br />
                                                AnswerTranslate:
                <asp:TextBox ID="AnswerTranslateTextBox" runat="server" Text='<%# Bind("AnswerTranslate") %>' />
                                                <br />
                                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                                <br />
                                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                                <br />
                                            </td>
                                        </InsertItemTemplate>
                                        <ItemTemplate>
                                            <td runat="server" style="">
                                                <br />
                                                <asp:Label ID="AnswerMultipleLabel" runat="server" Text='<%# Eval("AnswerMultiple") %>' Font-Bold="True" />
                                                <asp:Label ID="AnswerTranslateLabel" runat="server" Text='<%# Eval("AnswerTranslate") %>' Font-Bold="True" />
                                                <br />
                                            </td>
                                        </ItemTemplate>
                                        <LayoutTemplate>
                                            <table runat="server">
                                                <tr runat="server">
                                                    <td runat="server">
                                                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                                            <tr id="groupPlaceholder" runat="server">
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr runat="server">
                                                    <td runat="server" style=""></td>
                                                </tr>
                                            </table>
                                        </LayoutTemplate>
                                        <SelectedItemTemplate>
                                            <td runat="server" style="">ID:
                <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                                <br />
                                                AnswerMultiple:
                <asp:Label ID="AnswerMultipleLabel" runat="server" Text='<%# Eval("AnswerMultiple") %>' />
                                                <br />
                                                AnswerTranslate:
                <asp:Label ID="AnswerTranslateLabel" runat="server" Text='<%# Eval("AnswerTranslate") %>' />
                                                <br />
                                            </td>
                                        </SelectedItemTemplate>
                                    </asp:ListView>

                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:LearnRussianConnectionString %>" ProviderName="<%$ ConnectionStrings:LearnRussianConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [AnswerMultiple], [AnswerTranslate] FROM [ListOfSongs] WHERE ([ID] = ?)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>

            <!--Ways to learn Russian-->

            <div class="col-md-2" style="background-color: #e3ff9d; border-radius: 20px; border-color: #58b3f5; border-style: solid; padding: 10px; margin-bottom: 10px;">
                <h4 style="margin-left: 15px; color: #167bc4">How to Learn with RussianForKids:</h4>

                <div class="col-md-12" style="background-color: #ffdceb; border-radius: 20px; border-color: fuchsia; border-style: solid; padding: 10px; margin-top: 10px; margin-bottom: 10px; margin-right: 10px">
                    <span class="glyphicon glyphicon-book" aria-hidden="true" style="font-size: 30px; color: fuchsia"></span>
                    <asp:Label ID="Label9" runat="server" Text="Reading" Font-Size="14px" Font-Bold="true"></asp:Label>
                    <p>
                        Practice reading with stories and tranlslating new words
                        <asp:HyperLink ID="HyperLink1" runat="server"
                            NavigateUrl="~/ListOfStories.aspx" ForeColor="Blue" Font-Bold="true" Font-Underline="true">>>></asp:HyperLink>
                    </p>
                </div>

                <div class="col-md-12" style="background-color: #fadac4; border-radius: 20px; border-color: orangered; border-style: solid; padding: 10px; margin-top: 10px; margin-bottom: 10px; margin-right: 10px">
                    <span class="glyphicon glyphicon-music" aria-hidden="true" style="font-size: 30px; color: orangered"></span>
                    <asp:Label ID="Label1" runat="server" Text="Singing" Font-Size="14px" Font-Bold="true"></asp:Label>
                    <p>
                        Practice speaking, listening and understanding with songs
                        <asp:HyperLink ID="HyperLink2" runat="server"
                            NavigateUrl="~/ListOfSongs.aspx" ForeColor="Blue" Font-Bold="true" Font-Underline="true">>>></asp:HyperLink>
                    </p>
                </div>

                <div class="col-md-12" style="background-color: #c0c8e2; border-radius: 20px; border-color: blueviolet; border-style: solid; padding: 10px; margin-top: 10px; margin-bottom: 10px; margin-right: 10px">
                    <span class="glyphicon glyphicon-facetime-video" aria-hidden="true" style="font-size: 30px; color: blueviolet"></span>
                    <asp:Label ID="Label14" runat="server" Text="Watching and Listening" Font-Size="14px" Font-Bold="true"></asp:Label>
                    <p>
                        Practice listening and undestanding with cartoons
                        <asp:HyperLink ID="HyperLink3" runat="server"
                            NavigateUrl="~/ListOfCartoons.aspx" ForeColor="Blue" Font-Bold="true" Font-Underline="true">>>></asp:HyperLink>
                    </p>
                </div>

                <div class="col-md-12" style="background-color: #f8fbae; border-radius: 20px; border-color: gold; border-style: solid; padding: 10px; margin-top: 10px; margin-bottom: 10px; margin-right: 10px">
                    <span class="glyphicon glyphicon-star" aria-hidden="true" style="font-size: 30px; color: gold"></span>
                    <asp:Label ID="Label3" runat="server" Text="Learning" Font-Size="14px" Font-Bold="true"></asp:Label>
                    <p>
                        Read tips how to learn languages
                        <asp:HyperLink ID="HyperLink4" runat="server"
                            NavigateUrl="~/Tips.aspx" ForeColor="Blue" Font-Bold="true" Font-Underline="true">>>></asp:HyperLink>
                    </p>
                </div>

                <div class="col-md-12" style="background-color: #eae3ea; border-radius: 20px; border-color: purple; border-style: solid; padding: 10px; margin-top: 10px; margin-bottom: 10px; margin-right: 10px">
                    <span class="glyphicon glyphicon-globe" aria-hidden="true" style="font-size: 30px; color: purple"></span>
                    <asp:Label ID="Label15" runat="server" Text="Writing and Chatting" Font-Size="14px" Font-Bold="true"></asp:Label>
                    <p>
                        Practice writing and translating by chatting with others
                        <asp:HyperLink ID="HyperLink5" runat="server"
                            NavigateUrl="~/ForumPostList.aspx" ForeColor="Blue" Font-Bold="true" Font-Underline="true">>>></asp:HyperLink>
                    </p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
