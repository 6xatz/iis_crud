using System;
using System.Data.SqlClient;

public partial class book_delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id;
        if (int.TryParse(Request.QueryString["id"], out id))
        {
            using (SqlConnection conn = Db.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Books WHERE Id=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }
        }
        Response.Redirect("books_list.aspx");
    }
}
