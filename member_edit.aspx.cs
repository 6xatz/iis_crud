using System;
using System.Data.SqlClient;

public partial class member_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int id;
            if (int.TryParse(Request.QueryString["id"], out id))
            {
                using (SqlConnection conn = Db.GetConnection())
                {
                    SqlCommand cmd = new SqlCommand("SELECT Name, Email, Phone FROM Members WHERE Id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader r = cmd.ExecuteReader())
                    {
                        if (r.Read())
                        {
                            txtName.Text = r["Name"].ToString();
                            txtEmail.Text = r["Email"].ToString();
                            txtPhone.Text = r["Phone"].ToString();
                        }
                    }
                }
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int id;
        if (!int.TryParse(Request.QueryString["id"], out id)) return;
        using (SqlConnection conn = Db.GetConnection())
        {
            SqlCommand cmd = new SqlCommand("UPDATE Members SET Name=@n, Email=@e, Phone=@p WHERE Id=@id", conn);
            cmd.Parameters.AddWithValue("@n", txtName.Text);
            cmd.Parameters.AddWithValue("@e", txtEmail.Text);
            cmd.Parameters.AddWithValue("@p", txtPhone.Text);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
        }
        lblStatus.Text = "Member updated.";
    }
}
