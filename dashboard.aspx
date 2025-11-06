<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" MasterPageFile="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Dashboard</h2>
  <asp:UpdatePanel ID="updSummary" runat="server">
    <ContentTemplate>
      <div class="toolbar-center">
        <asp:Label ID="lblInfo" runat="server"></asp:Label>
      </div>
      <table>
        <tr>
          <th>Metric</th><th>Value</th>
        </tr>
        <tr>
          <td>Total Members</td>
          <td><asp:Label ID="lblMembers" runat="server"></asp:Label></td>
        </tr>
        <tr>
          <td>Total Books</td>
          <td><asp:Label ID="lblBooks" runat="server"></asp:Label></td>
        </tr>
      </table>
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
