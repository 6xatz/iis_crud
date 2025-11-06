<%@ Page Language="C#" AutoEventWireup="true" CodeFile="members_list.aspx.cs" Inherits="members_list" MasterPageFile="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Members</h2>
  <div class="toolbar-center">
    <a href="member_add.aspx" class="btn btn-add">Add Member</a>
  </div>
  <asp:UpdatePanel ID="updMembers" runat="server">
    <ContentTemplate>
      <asp:Label ID="lblInfo" runat="server"></asp:Label>
      <div class="table-card">
        <div class="table-wrap">
          <table>
            <tr>
              <th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Joined</th><th>Action</th>
            </tr>
            <asp:Repeater ID="repMembers" runat="server">
              <ItemTemplate>
                <tr>
                  <td><%# Eval("Id") %></td>
                  <td><%# Eval("Name") %></td>
                  <td><%# Eval("Email") %></td>
                  <td><%# Eval("Phone") %></td>
                  <td><%# Eval("JoinedAt", "{0:yyyy-MM-dd}") %></td>
                  <td>
                    <a href='member_edit.aspx?id=<%# Eval("Id") %>' class="btn btn-edit">Edit</a>
                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-delete" CommandName="del" CommandArgument='<%# Eval("Id") %>' OnCommand="HandleCommand">Delete</asp:LinkButton>
                  </td>
                </tr>
              </ItemTemplate>
            </asp:Repeater>
          </table>
        </div>
      </div>
    </ContentTemplate>
  </asp:UpdatePanel>
</asp:Content>
