<%@ Page Language="C#" AutoEventWireup="true" CodeFile="book_edit.aspx.cs" Inherits="book_edit" MasterPageFile="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Edit Book</h2>
  <asp:UpdatePanel ID="updEdit" runat="server">
    <ContentTemplate>
      <asp:Label ID="lblStatus" runat="server"></asp:Label>

      <div style="margin-bottom: 20px;">
        <asp:Image ID="imgCurrent" runat="server" Visible="false"
                   style="max-width: 200px; max-height: 300px; border-radius: 8px; border: 1px solid var(--border-color);" />
      </div>

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

      <label for="fuImage">Change Book Cover Image</label>
      <asp:FileUpload ID="fuImage" runat="server" />
      <small style="color: var(--text-secondary); display: block; margin-top: 4px;">
        Optional. Leave empty to keep current image. Supported formats: JPG, PNG, GIF (Max 2MB)
      </small>

      <asp:Button ID="btnUpdate" runat="server" Text="Update Book" CssClass="btn-form" OnClick="btnUpdate_Click" />
    </ContentTemplate>
    <Triggers>
      <asp:PostBackTrigger ControlID="btnUpdate" />
    </Triggers>
  </asp:UpdatePanel>
</asp:Content>
