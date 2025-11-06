using System;

public partial class logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try { Session.Clear(); Session.Abandon(); } catch { }
        Response.Redirect("login.aspx");
    }
}
