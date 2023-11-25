using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void TeamChat_Click(object sender, EventArgs e)
        {
            Response.Redirect("TeamPage.aspx");
        }

        protected void Settings_Click(object sender, EventArgs e)
        {
            Response.Redirect("SettingsPage.aspx");
        }

        protected void FAQ_Click(object sender, EventArgs e)
        {
            Response.Redirect("FAQ.aspx");
        }

        protected void ContactUS_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactUS.aspx");
        }
    }
}