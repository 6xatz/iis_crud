<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" MasterPageFile="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Login</h2>
    <label>Username:</label>
    <asp:TextBox ID="txtUser" runat="server" /><br/>
    <label>Password:</label>
    <asp:TextBox ID="txtPass" TextMode="Password" runat="server" /><br/>
    <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click" CssClass="btn-form" /><br/>
    <asp:Label ID="lblMsg" runat="server" CssClass="label-error" />
</asp:Content>
