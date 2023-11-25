using EngineeringClubHR.Classes;
using EngineeringClubHR.Classes.Client;
using System;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web.UI;

namespace EngineeringClubHR
{
    public partial class CreateClient : Page
    {
        private int clientID;
        private readonly ClientService _clientService;

        public CreateClient()
        {
            var repository = new ClientRepository(new EngineeringClubHREntities4());
            _clientService = new ClientService(repository);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["clientID"] != null && int.TryParse(Request.QueryString["clientID"], out clientID))
                {
                    ButtonSave.Text = "Update";

                    using (EngineeringClubHREntities4 entities = new EngineeringClubHREntities4())
                    {
                        var client = entities.Clients.FirstOrDefault(c => c.clientID == clientID);
                        if (client != null)
                        {
                            PopulateFields(client);
                        }
                        else
                        {

                        }
                    }
                }
            }
        }
        private void PopulateFields(Client client)
        {
            Firstname.Text = client.firstName;
            Middlename.Text = client.middleName;
            Lastname.Text = client.lastName;
            Email.Text = client.email;
            PhoneNumber.Text = client.phoneNumber;
            Address.Text = client.address;
            City.Text = client.city;
            PostalCode.Text = client.postalCode;
            Country.Text = client.country;
            State.Text = client.state;
            Industry.Text = client.industry;
            ContactPerson.Text = client.contactPerson;
            ContactPersonEmail.Text = client.contactPersonEmail;
            ContactPersonPhone.Text = client.contactPersonPhone;
            TextBox1.Text = client.organizationName;
            TextBox2.Text = client.clientType;
            clientType.Text = client.clientType;
        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            //try
            //{
            Page.Validate();

            if (Page.IsValid)
            {
                var isUpdate = ButtonSave.Text == "Update" && int.TryParse(Request.QueryString["clientID"], out clientID);
                var client = isUpdate ? new ClientRepository(new EngineeringClubHREntities4()).GetClient(clientID) : new Client();
                UpdateClient(client);
                _clientService.SaveClient(client, isUpdate);
                Response.Redirect("ManageClients.aspx");
            }
            // }
            //catch (Exception ex)
            //{
            //    ErrorLogger.LogError(ex, this.Page);
            //    string loggedErrorDetails = ErrorLogger.ErrorDetails;
            //}
        }
        private void UpdateClient(Client client)
        {
            client.firstName = Firstname.Text;
            client.middleName = Middlename.Text;
            client.lastName = Lastname.Text;
            client.email = Email.Text;
            client.phoneNumber = PhoneNumber.Text;
            client.address = Address.Text;
            client.city = City.Text;
            client.postalCode = PostalCode.Text;
            client.country = Country.Text;
            client.state = State.Text;
            client.industry = Industry.Text;
            client.contactPerson = ContactPerson.Text;
            client.contactPersonEmail = ContactPersonEmail.Text;
            client.contactPersonPhone = ContactPersonPhone.Text;
            client.organizationName = TextBox1.Text;
            client.clientType = clientType.Text;
        }
    }

}
