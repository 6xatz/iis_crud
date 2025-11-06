<%@ Page Language="C#" AutoEventWireup="true" CodeFile="book_add.aspx.cs" Inherits="book_add" MasterPageFile="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Add New Book</h2>
  <asp:UpdatePanel ID="updAdd" runat="server">
    <ContentTemplate>
      <asp:Label ID="lblStatus" runat="server"></asp:Label>
      <label for="txtTitle">Title</label>
      <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>

      <label for="txtAuthor">Author</label>
      <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>

      <label for="txtYear">Published Year</label>
      <asp:TextBox ID="txtYear" runat="server"></asp:TextBox>

      <label for="txtDesc">Description</label>
      <asp:TextBox ID="txtDesc" TextMode="MultiLine" Rows="4" runat="server"></asp:TextBox>

      <label for="ddlMember">Added By (Member)</label>
      <asp:DropDownList ID="ddlMember" runat="server"></asp:DropDownList>

      <label for="fuImage">Book Cover Image</label>
      <asp:FileUpload ID="fuImage" runat="server" />
      <small style="color: var(--text-secondary); display: block; margin-top: 4px;">
        Optional. Supported formats: JPG, PNG, GIF (Max 2MB)
      </small>

      <asp:Button ID="btnSave" runat="server" Text="Save Book" CssClass="btn-form" OnClick="btnSave_Click" />
    </ContentTemplate>
    <Triggers>
      <asp:PostBackTrigger ControlID="btnSave" />
    </Triggers>
  </asp:UpdatePanel>
</asp:Content>
