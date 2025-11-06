using System;
using System.Data.SqlClient;

public partial class books_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindBooks();
        }
    }

    private void BindBooks()
    {
        using (SqlConnection conn = Db.GetConnection())
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT b.Id, b.Title, b.Author, b.PublishedYear, b.ImageUrl, b.AddedAt, m.Name AS MemberName " +
                "FROM Books b " +
                "LEFT JOIN Members m ON b.AddedByMemberId = m.Id " +
                "ORDER BY b.Id DESC", conn);
            SqlDataReader r = cmd.ExecuteReader();
            repBooks.DataSource = r;
            repBooks.DataBind();
        }
    }

    protected void HandleCommand(object sender, System.Web.UI.WebControls.CommandEventArgs e)
    {
        int id;
        if (e.CommandName == "del" && int.TryParse(e.CommandArgument.ToString(), out id))
        {
            using (SqlConnection conn = Db.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Books WHERE Id=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }
            lblInfo.Text = "Book deleted.";
            BindBooks();
        }
    }
}
