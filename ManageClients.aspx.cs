using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using EngineeringClubHR.Classes;

namespace EngineeringClubHR
{
    // This is the code-behind file for the ManageClients page.
    public partial class ManageClients : System.Web.UI.Page
    {
        // Create a new instance of the Entity Framework context.
        EngineeringClubHREntities4 entities = new EngineeringClubHREntities4();
        // This method is called when the page is loaded.
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the page is not being loaded in response to a client postback,
            // which means this is the first time the page is being loaded.
            if (!IsPostBack)
            {
                // Bind the data to the Repeater control.
                BindData();
            }
        }

        protected void ClientRepeater_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
                if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
                {
                    var dataItem = e.Item.DataItem;
                    var activeStatus = DataBinder.Eval(dataItem, "active");
                    ImageButton removeButton = (ImageButton)e.Item.FindControl("RemoveButton");

                    bool isActive;
                    Boolean.TryParse(activeStatus.ToString(), out isActive);


                }
            }
            catch (Exception ex)
            {
                ErrorLogger.LogError(ex, this.Page);
                // If you want to do something with the logged error details
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }


        }
        protected void searchBar_TextChanged(object sender, EventArgs e)
        {
            string searchQuery = searchBar.Text;
            BindData(searchQuery);
        }

        // You need to implement this method based on your own data source.
        private List<Client> GetClients(bool isActive, string searchQuery = null)
        {
            List<Client> clients = new List<Client>();
            using (var context = new EngineeringClubHREntities4())
            {
                IQueryable<Client> query = context.Clients.Where(x => x.active == isActive);

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    query = query.Where(x => x.clientID.ToString().Contains(searchQuery) ||
                                             x.clientType.Contains(searchQuery) ||
                                             x.organizationName.Contains(searchQuery) ||
                                             x.firstName.Contains(searchQuery) ||
                                             x.middleName.Contains(searchQuery) ||
                                             x.lastName.Contains(searchQuery) ||
                                             x.email.Contains(searchQuery) ||
                                             x.phoneNumber.Contains(searchQuery) ||
                                             x.address.Contains(searchQuery) ||
                                             x.city.Contains(searchQuery) ||
                                             x.state.Contains(searchQuery) ||
                                             x.postalCode.Contains(searchQuery) ||
                                             x.country.Contains(searchQuery) ||
                                             x.industry.Contains(searchQuery) ||
                                             x.contactPerson.Contains(searchQuery) ||
                                             x.contactPersonEmail.Contains(searchQuery) ||
                                             x.contactPersonPhone.Contains(searchQuery));
                }

                clients = query.ToList();
            }
            return clients;
        }



        protected void RemoveButton_Click(object sender, EventArgs e)
        {
            try
            {
                ImageButton button = (ImageButton)sender;
                int clientID = Convert.ToInt32(button.CommandArgument);
                Client client = entities.Clients.FirstOrDefault(c => c.clientID == clientID);
                if (client != null)
                {
                    if (client.active)
                    {
                        client.active = false;

                    }
                    else
                    {
                        client.active = true;
                    }
                    entities.SaveChanges();
                    BindData(); // Reload the data so that changes reflect immediately.
                }
            }
            catch (Exception ex)
            {
                ErrorLogger.LogError(ex, this.Page);
                // If you want to do something with the logged error details
                string loggedErrorDetails = ErrorLogger.ErrorDetails;
            }


        }

        private void BindData(string searchQuery = null)
        {
            ActiveRepeater.DataSource = GetClients(true, searchQuery);
            ActiveRepeater.DataBind();

            inActiveRepeater.DataSource = GetClients(false, searchQuery);
            inActiveRepeater.DataBind();
        }

        // This method is called when the "Create Client" button is clicked.
        protected void BUTTADDCLIENT_Click(object sender, EventArgs e)
        {
            // Redirect the user to the CreateClient.aspx page.
            Response.Redirect("CreateClient.aspx");
        }

        protected void ActiveRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}
