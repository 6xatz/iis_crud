<%@ Page Language="C#" AutoEventWireup="true" CodeFile="member_edit.aspx.cs" Inherits="member_edit" MasterPageFile="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Edit Member</h2>
  <asp:UpdatePanel ID="updEditMember" runat="server">
    <ContentTemplate>
      <asp:Label ID="lblStatus" runat="server"></asp:Label>
      <label for="txtName">Name</label>
      <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

      <label for="txtEmail">Email</label>
      <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>

      <label for="txtPhone">Phone</label>
      <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>

      <asp:Button ID="btnUpdate" runat="server" Text="Update Member" CssClass="btn-form" OnClick="btnUpdate_Click" />
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
