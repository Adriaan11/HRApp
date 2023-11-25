using System;
using System.Linq;
using System.Web.UI.WebControls;
using AjaxControlToolkit.HtmlEditor.ToolbarButtons;
using EngineeringClubHR;
using EngineeringClubHR.Classes;
using Microsoft.Extensions.Logging;

namespace EngineeringClubHR
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void loginButton_Click(object sender, EventArgs e)
        {


            using (EngineeringClubHREntities4 entities = new EngineeringClubHREntities4())
            {
                string username = userText.Text;
                string password = passText.Text;

                // Check for Admin credentials
                if (username == "Admin" && password == "Admin")
                {
                    Session["New"] = "Admin";
                    Response.Write("Admin login successful");
                    Response.Redirect("Dashboard.aspx");
                    return; // Exit the method early
                }

                var user = entities.Employees.FirstOrDefault(emp => emp.firstName == username);
                if (user != null)
                {
                    if (user.password != null && user.password.Trim() == password)
                    {
                        Session["New"] = user.firstName;
                        Response.Write("Login successful");
                        Response.Redirect("Dashboard.aspx");
                    }
                    else
                    {
                        lblPasswordError.Text = "Password is incorrect";
                        lblPasswordError.Visible = true;
                        lblUsernameError.Visible = false;
                    }
                }
                else
                {
                    lblUsernameError.Text = "Username is incorrect";
                    lblUsernameError.Visible = true;
                    lblPasswordError.Visible = false;
                }
            }
        }

    }

}

