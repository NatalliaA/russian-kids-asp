<%@ Page Title="List Of Stories" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ListOfStories.aspx.vb" Inherits="RussianForKidsVB.ListOfStories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .breakword {
            word-wrap: break-word;
            word-break: break-all;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-md-9" style="background-color: #fcca70; border-style: solid; border-color: orange; border-radius: 20px; margin-right: 30px; margin-left: 30px; margin-bottom: 10px; padding: 20px">
                <span class="glyphicon glyphicon-book" aria-hidden="true" style="font-size: 30px; color: fuchsia"></span>
                <asp:Label ID="Label2" runat="server" Font-Size="30px" Text="Stories"></asp:Label>
                <h4>Do you like reading stories? Practice your reading and learn new words with Russian stories.</h4>

                <asp:ListView ID="ListView_Stories" runat="server" DataKeyNames="ID" DataSourceID="SqlDataSource1" GroupItemCount="3">
                    <AlternatingItemTemplate>
                        <td runat="server" style="font-size: 18px; font-family: Calibri; font-weight: normal; padding: 20px">
                            <asp:HyperLink ID="Story" runat="server" Text='<% #Eval("Title")%>'
                                NavigateUrl='<%# Eval("ID", "~/Story.aspx?ID={0}") %>' Font-Size="20px" ForeColor="Green" Font-Bold="True" />
                            <br />
                            <%# Eval("EnglishTitle") %>
                            <asp:HyperLink ID="Hyperlink1" NavigateUrl='<%# Eval("ID", "~/Story.aspx?ID={0}") %>' runat="server" Font-Underline="false">
                        <img class="img-responsive img-rounded" style="width:100%" src='<%# Eval("Picture") %>' alt="Picture"/>
                            </asp:HyperLink>
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
                            Content:
                                <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' />
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
                            Content:
                                <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' />
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
                        <td runat="server" style="font-size: 18px; font-family: Calibri; font-weight: normal; padding: 20px">
                            <asp:HyperLink ID="Story" runat="server" Text='<% #Eval("Title")%>'
                                NavigateUrl='<%# Eval("ID", "~/Story.aspx?ID={0}") %>' Font-Size="20px" ForeColor="Green" Font-Bold="True" />

                            <br />
                            <%# Eval("EnglishTitle") %>
                            <asp:HyperLink ID="Hyperlink1" NavigateUrl='<%# Eval("ID", "~/Story.aspx?ID={0}") %>' runat="server" Font-Underline="false">
                        <img class="img-responsive img-rounded" style="width:100%" src='<%# Eval("Picture") %>' alt="Picture"/>
                            </asp:HyperLink>
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
                                <td runat="server" style="">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
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
                            Content:
                                <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
                            <br />
                            Picture:
                                <asp:Label ID="PictureLabel" runat="server" Text='<%# Eval("Picture") %>' />
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:LearnRussianConnectionString %>" ProviderName="<%$ ConnectionStrings:LearnRussianConnectionString.ProviderName %>" SelectCommand="SELECT [ID], [Title], [EnglishTitle], [Content], [Picture] FROM [ListOfStories]"></asp:SqlDataSource>
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
