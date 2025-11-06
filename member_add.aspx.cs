using System;
using System.Data.SqlClient;

public partial class member_add : System.Web.UI.Page
{
    protected void btnSave_Click(object sender, EventArgs e)
    {
        using (SqlConnection conn = Db.GetConnection())
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Members (Name, Email, Phone) VALUES (@n, @e, @p)", conn);
            cmd.Parameters.AddWithValue("@n", txtName.Text);
            cmd.Parameters.AddWithValue("@e", txtEmail.Text);
            cmd.Parameters.AddWithValue("@p", txtPhone.Text);
            cmd.ExecuteNonQuery();
        }
        lblStatus.Text = "Member saved.";
        txtName.Text = txtEmail.Text = txtPhone.Text = string.Empty;
    }
}
