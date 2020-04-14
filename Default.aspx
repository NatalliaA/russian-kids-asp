<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="RussianForKidsVB._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">

            <!--Ways to learn Russian-->

            <div class="col-md-5" style="background-color: #e3ff9d; border-radius: 20px; border-color: #58b3f5; border-style: solid; padding: 10px; margin-top: 10px; margin-bottom: 10px; margin-right: 10px">
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
                    <asp:Label ID="Label2" runat="server" Text="Watching and Listening" Font-Size="14px" Font-Bold="true"></asp:Label>
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
                    <asp:Label ID="Label4" runat="server" Text="Writing and Chatting" Font-Size="14px" Font-Bold="true"></asp:Label>
                    <p>
                        Practice writing and translating by chatting with others
                        <asp:HyperLink ID="HyperLink5" runat="server"
                            NavigateUrl="~/ForumPostList.aspx" ForeColor="Blue" Font-Bold="true" Font-Underline="true">>>></asp:HyperLink>

                    </p>
                </div>
            </div>

            <!--Welcome-->

            <div class="col-md-6" style="background-color: #f0f7fc; border-radius: 20px; border-color: #58b3f5; border-style: solid; padding: 10px; margin-top: 10px; margin-bottom: 10px; margin-right: 10px">

                <h3 style="margin-left: 15px; color: #167bc4">Welcome!</h3>
                <div class="col-md-12">

                    <p><strong>RussianForKids</strong> is a site for children who learn Russian as a second or foreign language. You will find here lots of&nbsp; stories, songs, cartoons, and activities to have fun and learn Russian.</p>
                </div>
                <div class="col-md-12" style="background-color: #9ef5e2; border-radius: 20px; border-color: #62ccb5; border-style: solid; padding: 10px; margin-bottom: 10px; margin-right: 20px">
                    <h4>Kids</h4>
                    <p>We have lots of great things for you to learn Russian. Watch Russian cartoons, listen Russian songs, read stories, etc. You can also become a member of our site. This will make it possible for you to comment, like, share experiences and ask questions on the forum to practise your writing and reading.</p>
                </div>
                <div class="col-md-12" style="background-color: #f6d7f6; border-radius: 20px; border-color: plum; border-style: solid; padding: 10px; margin-bottom: 10px; margin-right: 20px">
                    <h4>Parents and Teachers</h4>
                    <p>Our site offers various materials including quizzes, stories, song lyrics, etc. You can also find tipps how to learn or teach Russian. As a member of our site you can go to our forum to share ideas and ask questions.</p>
                </div>
                <h5 style="margin-left: 15px; color: #167bc4"><strong>Enjoy learning Russian with us!</strong></h5>
            </div>
        </div>
    </div>
</asp:Content>
