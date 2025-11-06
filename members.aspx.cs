using System;
using System.Data;
using System.Data.SqlClient;

public partial class members : System.Web.UI.Page
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
        DataTable dt = new DataTable();
        dt.Columns.Add("Id", typeof(int));
        dt.Columns.Add("Name", typeof(string));
        dt.Columns.Add("Email", typeof(string));
        dt.Rows.Add(1, "6xatz", "one@example.com");
        dt.Rows.Add(2, "Fii", "two@example.com");
        repMembers.DataSource = dt;
        repMembers.DataBind();
    }
}
