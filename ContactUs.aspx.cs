using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EngineeringClubHR
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                List<ContactInfo> contactList = new List<ContactInfo>
{
    new ContactInfo { Name = "Adriaan Croucamp", Email = "adriaan@email.com", Role = "Project Manager", Bio = "The maestro who orchestrates the project's symphony.", ImageSrc = "~/Pictures/ContactUsPictures/Adriaan.png" },
    new ContactInfo { Name = "Nazreen Abrahams", Email = "nazreen@email.com", Role = "Lead Developer", Bio = "Transforming coffee into code since 2015.", ImageSrc = "~/Pictures/ContactUsPictures/Naz.jpg" },
    new ContactInfo { Name = "Joshua Adao", Email = "joshua@email.com", Role = "Fixes and Drama Co-ordinator", Bio = "The 'unofficial' team therapist, fixing more than just code.", ImageSrc = "~/Pictures/ContactUsPictures/Josh.jpg" },
    new ContactInfo { Name = "Shaun Britz", Email = "sean@email.com", Role = "Deployment Guru", Bio = "If you build it, he will deploy it.", ImageSrc = "~/Pictures/ContactUsPictures/Shaun.jpg" },
    new ContactInfo { Name = "Katlego Kgaudi", Email = "katlego@email.com", Role = "Project Architect", Bio = "The visionary shaping the future of our projects.", ImageSrc = "~/Pictures/ContactUsPictures/Katlego.jpg" }
};



                rptContacts.DataSource = contactList.OrderBy(x => x.Name);
                rptContacts.DataBind();
            }
        }

        public class ContactInfo
        {
            public string Name { get; set; }
            public string Email { get; set; }
            public string Role { get; set; }
            public string Bio { get; set; }
            public string ImageSrc { get; set; }
        }
    }
}