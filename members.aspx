<%@ Page Language="C#" AutoEventWireup="true" CodeFile="members.aspx.cs" Inherits="members" MasterPageFile="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Members</h2>
  <asp:UpdatePanel ID="updMembers" runat="server">
    <ContentTemplate>
      <asp:Label ID="lblInfo" runat="server"></asp:Label>
      <table>
        <tr>
          <th>ID</th><th>Name</th><th>Email</th>
        </tr>
        <asp:Repeater ID="repMembers" runat="server">
          <ItemTemplate>
            <tr>
              <td><%# Eval("Id") %></td>
              <td><%# Eval("Name") %></td>
              <td><%# Eval("Email") %></td>
            </tr>
          </ItemTemplate>
        </asp:Repeater>
      </table>
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
