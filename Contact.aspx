<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="RussianForKidsVB.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">

            <div class="col-md-6" style="background-color: #fcca70; border-style: solid; border-color: orange; border-radius: 20px; margin-right: 30px; margin-left: 30px; margin-bottom: 10px; padding: 20px">
                <span class="glyphicon glyphicon-envelope" aria-hidden="true" style="font-size: 30px; color: palevioletred"></span>
                <asp:Label ID="Label1" runat="server" Text="Contact" Font-Bold="true" ForeColor="PaleVioletRed" Font-Size="30px"></asp:Label>
                <br />
                <br />
                <h4>If you have any questions or suggestions please send us an email:</h4>
                <h5 style="font-size: 14px; font-weight: bold"><a href="mailto:info@gmail.com">info@gmail.com</a></h5>
                <br />
                <h4>Thank you!</h4>
                <h4>Your RussianForKids</h4>
            </div>
        </div>
    </div>
</asp:Content>
