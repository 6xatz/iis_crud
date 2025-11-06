using System;
using System.Data.SqlClient;

public partial class dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSummary();
        }
    }

    private void LoadSummary()
    {
        using (SqlConnection conn = Db.GetConnection())
        {
            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Members", conn))
            {
                object resM = cmd.ExecuteScalar();
                int countM = 0;
                if (resM != null && resM != DBNull.Value) countM = Convert.ToInt32(resM);
                lblMembers.Text = countM.ToString();
            }
            using (SqlCommand cmd2 = new SqlCommand("SELECT COUNT(*) FROM Books", conn))
            {
                object res = cmd2.ExecuteScalar();
                int count = 0;
                if (res != null && res != DBNull.Value) count = Convert.ToInt32(res);
                lblBooks.Text = count.ToString();
            }
        }
    }
}
