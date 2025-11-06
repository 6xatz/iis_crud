<%@ Page Language="C#" AutoEventWireup="true" CodeFile="member_add.aspx.cs" Inherits="member_add" MasterPageFile="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Add Member</h2>
  <asp:UpdatePanel ID="updAddMember" runat="server">
    <ContentTemplate>
      <asp:Label ID="lblStatus" runat="server"></asp:Label>
      <label for="txtName">Name</label>
      <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

      <label for="txtEmail">Email</label>
      <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

      <label for="txtPhone">Phone</label>
      <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>

      <asp:Button ID="btnSave" runat="server" Text="Save Member" CssClass="btn-form" OnClick="btnSave_Click" />
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
