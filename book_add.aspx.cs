using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

public partial class book_add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMembers();
        }
    }

    private void LoadMembers()
    {
        using (SqlConnection conn = Db.GetConnection())
        {
            SqlCommand cmd = new SqlCommand("SELECT Id, Name FROM Members ORDER BY Name", conn);
            SqlDataReader r = cmd.ExecuteReader();
            ddlMember.Items.Clear();
            ddlMember.Items.Add(new ListItem("-- Select Member --", ""));
            while (r.Read())
            {
                ddlMember.Items.Add(new ListItem(r["Name"].ToString(), r["Id"].ToString()));
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        // Handle image upload
        string imageUrl = null;
        if (fuImage.HasFile)
        {
            try
            {
                // Validate file size (2MB max)
                if (fuImage.PostedFile.ContentLength > 2097152)
                {
                    lblStatus.Text = "Image file size must be less than 2MB.";
                    return;
                }

                // Validate file type
                string ext = Path.GetExtension(fuImage.FileName).ToLower();
                if (ext != ".jpg" && ext != ".jpeg" && ext != ".png" && ext != ".gif")
                {
                    lblStatus.Text = "Only JPG, PNG, and GIF images are allowed.";
                    return;
                }

                // Create uploads directory if it doesn't exist
                string uploadDir = Server.MapPath("~/books/");
                if (!Directory.Exists(uploadDir))
                {
                    Directory.CreateDirectory(uploadDir);
                }

                // Generate unique filename
                string fileName = Guid.NewGuid().ToString() + ext;
                string filePath = Path.Combine(uploadDir, fileName);

                // Save the file
                fuImage.SaveAs(filePath);
                imageUrl = "~/books/" + fileName;
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error uploading image: " + ex.Message;
                return;
            }
        }

        // Get selected member ID
        int? memberId = null;
        if (!string.IsNullOrEmpty(ddlMember.SelectedValue))
        {
            memberId = int.Parse(ddlMember.SelectedValue);
        }

        // Save book to database
        using (SqlConnection conn = Db.GetConnection())
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Books (Title, Author, PublishedYear, Description, ImageUrl, AddedByMemberId, AddedAt) " +
                "VALUES (@t, @a, @y, @d, @img, @mid, GETDATE())", conn);
            cmd.Parameters.AddWithValue("@t", txtTitle.Text);
            cmd.Parameters.AddWithValue("@a", txtAuthor.Text);
            int y;
            if (int.TryParse(txtYear.Text, out y))
                cmd.Parameters.AddWithValue("@y", y);
            else
                cmd.Parameters.AddWithValue("@y", DBNull.Value);
            cmd.Parameters.AddWithValue("@d", txtDesc.Text);
            cmd.Parameters.AddWithValue("@img", (object)imageUrl ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@mid", (object)memberId ?? DBNull.Value);
            cmd.ExecuteNonQuery();
        }

        lblStatus.Text = "Book saved successfully!";
        txtTitle.Text = string.Empty;
        txtAuthor.Text = string.Empty;
        txtYear.Text = string.Empty;
        txtDesc.Text = string.Empty;
        ddlMember.SelectedIndex = 0;
    }
}
