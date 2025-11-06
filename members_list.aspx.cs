using System;
using System.Data.SqlClient;

public partial class members_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindMembers();
        }
    }

    private void BindMembers()
    {
        using (SqlConnection conn = Db.GetConnection())
        {
            SqlCommand cmd = new SqlCommand("SELECT Id, Name, Email, Phone, JoinedAt FROM Members ORDER BY Id DESC", conn);
            SqlDataReader r = cmd.ExecuteReader();
            repMembers.DataSource = r;
            repMembers.DataBind();
        }
    }

    protected void HandleCommand(object sender, System.Web.UI.WebControls.CommandEventArgs e)
    {
        int id;
        if (e.CommandName == "del" && int.TryParse(e.CommandArgument.ToString(), out id))
        {
            using (SqlConnection conn = Db.GetConnection())
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Members WHERE Id=@id", conn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            }
            lblInfo.Text = "Member deleted.";
            BindMembers();
        }
    }
}
