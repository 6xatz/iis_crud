using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

public partial class book_edit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMembers();
            int id;
            if (int.TryParse(Request.QueryString["id"], out id))
            {
                using (SqlConnection conn = Db.GetConnection())
                {
                    SqlCommand cmd = new SqlCommand(
                        "SELECT Title, Author, PublishedYear, Description, ImageUrl, AddedByMemberId FROM Books WHERE Id=@id", conn);
                    cmd.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader r = cmd.ExecuteReader())
                    {
                        if (r.Read())
                        {
                            txtTitle.Text = r["Title"].ToString();
                            txtAuthor.Text = r["Author"].ToString();
                            txtYear.Text = r["PublishedYear"].ToString();
                            txtDesc.Text = r["Description"].ToString();

                            // Display current image if exists
                            if (r["ImageUrl"] != DBNull.Value && !string.IsNullOrEmpty(r["ImageUrl"].ToString()))
                            {
                                imgCurrent.ImageUrl = r["ImageUrl"].ToString();
                                imgCurrent.Visible = true;
                            }

                            // Set selected member
                            if (r["AddedByMemberId"] != DBNull.Value)
                            {
                                ddlMember.SelectedValue = r["AddedByMemberId"].ToString();
                            }
                        }
                    }
                }
            }
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

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int id;
        if (!int.TryParse(Request.QueryString["id"], out id)) return;

        // Handle image upload
        string imageUrl = null;
        bool updateImage = false;

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
                updateImage = true;
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

        // Update book in database
        using (SqlConnection conn = Db.GetConnection())
        {
            string sql;
            if (updateImage)
            {
                sql = "UPDATE Books SET Title=@t, Author=@a, PublishedYear=@y, Description=@d, ImageUrl=@img, AddedByMemberId=@mid WHERE Id=@id";
            }
            else
            {
                sql = "UPDATE Books SET Title=@t, Author=@a, PublishedYear=@y, Description=@d, AddedByMemberId=@mid WHERE Id=@id";
            }

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@t", txtTitle.Text);
            cmd.Parameters.AddWithValue("@a", txtAuthor.Text);
            int y;
            if (int.TryParse(txtYear.Text, out y))
                cmd.Parameters.AddWithValue("@y", y);
            else
                cmd.Parameters.AddWithValue("@y", DBNull.Value);
            cmd.Parameters.AddWithValue("@d", txtDesc.Text);
            cmd.Parameters.AddWithValue("@mid", (object)memberId ?? DBNull.Value);
            if (updateImage)
            {
                cmd.Parameters.AddWithValue("@img", imageUrl);
            }
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
        }

        lblStatus.Text = "Book updated successfully!";
        Response.Redirect(Request.RawUrl); // Refresh to show new image
    }
}
