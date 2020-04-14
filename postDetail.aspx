<%@ Page Title="Post" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="postDetail.aspx.vb" Inherits="RussianForKidsVB.postDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .breakword {
            word-wrap: break-word;
            word-break: break-all;
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="col-md-8" style="background-color: #fcca70; border-style: solid; border-color: orange; border-radius: 20px; margin-right: 30px; margin-left: 30px; margin-bottom: 10px; padding: 20px">

                <!--Like button-->
                <div class="container">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                        <ContentTemplate>
                            <div class="row" style="margin-left: 25px">
                                <div class="col-md-8">
                                    <br />
                                    <asp:Label ID="lbl_likesCount" runat="server" Text="Label" CssClass="pull-right"
                                        Font-Bold="True" Font-Size="14px" ForeColor="Brown"></asp:Label>
                                </div>
                            </div>

                            <div class="row" style="margin-left: 25px">
                                <div class="col-md-8">
                                    <asp:HyperLink ID="Hyl_LoginLike" runat="server" NavigateUrl="~/Account/Login.aspx"
                                        Font-Underline="True" Font-Bold="true" CssClass="pull-right" Visible="false">Log in</asp:HyperLink>
                                    <asp:Label ID="lbl_liked" runat="server" Text="You liked"
                                        Style="font-weight: 700;" CssClass="pull-right" Font-Bold="False"
                                        Font-Size="14px" ForeColor="Brown"></asp:Label>
                                </div>
                            </div>
                            <div class="row" style="margin-left: 25px">
                                <div class="col-md-9">
                                    <asp:Button ID="btn_like" runat="server" Text="Like" CssClass="btn btn-success pull-right" BackColor="#ffff00" ForeColor="Brown"
                                        Font-Bold="true" Font-Size="16px" Height="32px" Width="78px" OnClick="btn_like_Click"
                                        Style="background-image: url('pictures/Like.jpg'); text-align: right; background-repeat: no-repeat" />
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

                <!--displaying post details-->

                <div class="col-md-8" style="background-color: oldlace; border-radius: 20px; border-color: plum; border-style: solid; padding: 20px; margin-top: 10px; margin-bottom: 10px;">
                    <span class="glyphicon glyphicon-globe" aria-hidden="true" style="font-size: 30px; color: purple"></span>
                    <asp:Label ID="Label4" runat="server" Text="Post" Font-Bold="true" Font-Size="18px" ForeColor="OrangeRed"></asp:Label>
                    <br />
                    <br />

                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"
                        CssClass="table table-striped table-hover" RowStyle-Font-Bold="false" RowStyle-Font-Size="16px"
                        FieldHeaderStyle-Font-Size="16px" FieldHeaderStyle-Font-Bold="true" GridLines="None">

                        <Fields>
                            <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic"
                                ItemStyle-Font-Bold="true" ItemStyle-ForeColor="#993300"
                                ItemStyle-Font-Size="18px"></asp:BoundField>
                            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                            <asp:HyperLinkField DataNavigateUrlFields="Author" DataTextField="Author" DataNavigateUrlFormatString="UserProfile.aspx?UserName={0}" HeaderText="Author" />
                            <asp:BoundField DataField="AddingDay" HeaderText="Posted" SortExpression="AddingDay"
                                DataFormatString="{0:d}" />

                            <!--displaying short date-->

                        </Fields>
                    </asp:DetailsView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LearnRussianConnectionString %>" ProviderName="<%$ ConnectionStrings:LearnRussianConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [Topic], [Category], [Description], [Picture], [Author], [AddingDay] FROM [Forum] WHERE ([ID] = ?)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <!--table of comments-->

                <div class="col-md-6" style="background-color: #cae4f7; border-style: solid; border-color: #42acfa; border-radius: 20px; padding: 20px; margin-bottom: 10px">

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
                                    <asp:BoundField DataField="DayPosted" HeaderText="Date" SortExpression="DayPosted"
                                        DataFormatString="{0:d}" ControlStyle-CssClass="col-md-1" ItemStyle-CssClass="breakword" />
                                </Columns>
                            </asp:GridView>

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:LearnRussianConnectionString %>" ProviderName="<%$ ConnectionStrings:LearnRussianConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [Post_fkid], [WriterName], [Title], [Comment], [DayPosted] FROM [CommentsPost] WHERE ([Post_fkid] = ?)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="Post_fkid" QueryStringField="ID" Type="Int32" />
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

            <!--Ways to learn Russian-->

            <div class="col-md-2" style="background-color: #e3ff9d; border-radius: 20px; border-color: #58b3f5; border-style: solid; padding: 10px; margin-bottom: 10px;">
                <h4 style="margin-left: 15px; color: #167bc4">How to Learn with RussianForKids:</h4>

                <div class="col-md-12" style="background-color: #ffdceb; border-radius: 20px; border-color: fuchsia; border-style: solid; padding: 10px; margin-top: 10px; margin-bottom: 10px; margin-right: 10px">
                    <span class="glyphicon glyphicon-book" aria-hidden="true" style="font-size: 30px; color: fuchsia"></span>
                    <asp:Label ID="Label12" runat="server" Text="Reading" Font-Size="14px" Font-Bold="true"></asp:Label>
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
                    <asp:Label ID="Label13" runat="server" Text="Watching and Listening" Font-Size="14px" Font-Bold="true"></asp:Label>
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
                    <asp:Label ID="Label14" runat="server" Text="Writing and Chatting" Font-Size="14px" Font-Bold="true"></asp:Label>
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
