<%@ Page Language="C#" AutoEventWireup="true" CodeFile="books_list.aspx.cs" Inherits="books_list" MasterPageFile="~/Site.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
  <h2>Books</h2>
  <div class="toolbar-center">
    <a href="book_add.aspx" class="btn btn-add">Add Book</a>
  </div>
  <asp:UpdatePanel ID="updBooks" runat="server">
    <ContentTemplate>
      <asp:Label ID="lblInfo" runat="server"></asp:Label>
      <div class="table-card">
        <div class="table-wrap">
          <table>
            <tr>
              <th>Cover</th><th>ID</th><th>Title</th><th>Author</th><th>Year</th><th>Added By</th><th>Added At</th><th>Action</th>
            </tr>
            <asp:Repeater ID="repBooks" runat="server">
              <ItemTemplate>
                <tr>
                  <td>
                    <%# !string.IsNullOrEmpty(Eval("ImageUrl") as string)
                        ? "<img src='" + ResolveUrl(Eval("ImageUrl").ToString()) + "' style='width: 50px; height: 70px; object-fit: cover; border-radius: 4px;' />"
                        : "<div style='width: 50px; height: 70px; background: var(--elevated); border-radius: 4px; display: flex; align-items: center; justify-content: center; color: var(--text-secondary); font-size: 10px;'>No Image</div>" %>
                  </td>
                  <td><%# Eval("Id") %></td>
                  <td><%# Eval("Title") %></td>
                  <td><%# Eval("Author") %></td>
                  <td><%# Eval("PublishedYear") %></td>
                  <td><%# Eval("MemberName") != DBNull.Value ? Eval("MemberName") : "<span style='color: var(--text-secondary);'>-</span>" %></td>
                  <td><%# Eval("AddedAt") != DBNull.Value ? Convert.ToDateTime(Eval("AddedAt")).ToString("yyyy-MM-dd HH:mm") : "<span style='color: var(--text-secondary);'>-</span>" %></td>
                  <td>
                    <a href='book_edit.aspx?id=<%# Eval("Id") %>' class="btn btn-edit">Edit</a>
                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-delete"
                      CommandName="del" CommandArgument='<%# Eval("Id") %>' OnCommand="HandleCommand"
                    >Delete</asp:LinkButton>
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
