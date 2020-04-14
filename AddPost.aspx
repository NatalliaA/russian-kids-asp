<%@ Page Title="Add Post" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddPost.aspx.vb" Inherits="RussianForKidsVB.AddPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="container">
        <div class="row">
            <div class="col-md-9" style="background-color: #fcca70; border-style: solid; border-color: orange; border-radius: 20px; margin-right: 30px; margin-left: 30px; margin-bottom: 10px; padding: 20px">
                <span class="glyphicon glyphicon-globe" aria-hidden="true" style="font-size: 30px; color: purple"></span>
                <asp:Label ID="Label2" runat="server" Font-Size="30px" Text="Forum"></asp:Label>
                <h4>Thank you for sharing your ideas or asking questions!
                     Being an active member will help you to improve your reading and writing in Russian.</h4>
                <br />
                <br />

                <p style="font-size: 14px; color: green">* All fields are requierd (also a short text is fine).</p>
                <p>
                    <asp:Label ID="lbl_checkInput" runat="server" Font-Size="12px" ForeColor="Red"
                        Height="30px" Text="Label" Visible="False" Width="250px"></asp:Label>
                </p>
                <h4><strong>Topic (e.g. My trip to Moscow)</strong></h4>
                <p>
                    <asp:TextBox ID="tbx_Topic" runat="server" CssClass="form-control"></asp:TextBox>
                </p>
                <br />

                <h4><strong>Select One Category (e.g. Culture)</strong></h4>
                <p>
                    <asp:RadioButtonList ID="rbtlist_Category" CssClass="radio" runat="server" RepeatDirection="Vertical" Font-Size="14px">
                        <asp:ListItem>Language</asp:ListItem>
                        <asp:ListItem>Travel</asp:ListItem>
                        <asp:ListItem Value="Friends"></asp:ListItem>
                        <asp:ListItem Selected="True">Culture</asp:ListItem>
                        <asp:ListItem Value="Books"></asp:ListItem>
                        <asp:ListItem>Teaching</asp:ListItem>
                        <asp:ListItem>Question</asp:ListItem>
                    </asp:RadioButtonList>
                </p>
                <br />

                <h4><strong>Write Your Message / Story</strong></h4>
                <p>
                    <asp:TextBox ID="tbx_Description" runat="server" CssClass="form-control" Height="285px" TextMode="MultiLine"></asp:TextBox>
                </p>
                <p>
                    <asp:Button ID="btn_addPost" runat="server" CssClass="btn btn-success pull-right" BackColor="#ffff00" ForeColor="Brown" Font-Bold="true" Font-Size="16px" Height="35px" Width="220px" Text="Post Your Message" />
                </p>
                <br />
                <br />
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
