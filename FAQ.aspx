<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="EngineeringClubHR.FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="faq.css">
    <title>FAQ</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="faq-container">
        <div>
            <asp:Panel ID="Download" runat="server" CssClass="download-panel">
                <asp:Button ID="DownloadButton" runat="server" CssClass="download-button" Text="Download PDF" OnClick="DownloadButton_Click"></asp:Button>
            </asp:Panel>
        </div>


        <h1>Frequently Asked Questions</h1>
        <p>Q: 'What is this page?' A: 'A list of Frequently asked questions regarding the Engineering Club HR web application'</p>

        <!-- Schedule Section-->
        <asp:Panel ID="pnlScheduling" CssClass="category-dropdown" runat="server">

            <asp:Button ID="btnScheduling" CssClass="category-button" runat="server" Text="Scheduling ▼" OnClientClick="return false;" />
            <div class="category-content" runat="server">
                <asp:Button ID="btnCalendarView" CssClass="subcategory-button" runat="server" Text="Calendar View ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">

                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the process of creating a new client?</h1>
                        </li>
                        <li>To create a new client, you will need to fill out several fields with the necessary information such as the client's name, email, phone number, organization details, and address. Once filled, click the "Create" button to save the client information.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. What information is required for entering a new client's details?</h1>
                        </li>
                        <li>You need to fill in the following details:
                    1. Client Type, First Name, Middle Name (if available), Last Name
                    2. Email Address and Phone Number
                    3. Organization Name, Type, and Industry
                    4. Address Information
                    5. Contact Person Information (if applicable)</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. How do I save the client's information?</h1>
                        </li>
                        <li>After entering all the required details, click the "Create" button to save the client's information. If you're updating an existing client, click the "Update" button instead.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. Are there any guidelines for input validation?</h1>
                        </li>
                        <li>Yes, here are the validation guidelines:
                    - Names, organization type, industry, and city should contain only letters.
                    - Phone numbers and postal codes should contain only numbers.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. What should I do if I encounter an error?</h1>
                        </li>
                        <li>Check for error messages that appear in red on the screen. These will guide you on any missing or incorrectly formatted information.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. What if I want to update an existing client's information?</h1>
                        </li>
                        <li>In that case, populate the fields with the updated information and click on the "Update" button to save the changes.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. Is it mandatory to fill all the fields?</h1>
                        </li>
                        <li>Yes, ensure that all required fields are filled before saving the client information to avoid errors.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. Is the middle name mandatory?</h1>
                        </li>
                        <li>No, the middle name is optional. You can leave it blank if it's not applicable.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. Can I add more than one contact person?</h1>
                        </li>
                        <li>The system is designed to capture details for one contact person. For multiple contact persons, you may have to create additional entries.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">10. Who should I contact for further assistance?</h1>
                        </li>
                        <li>
                            <!-- Add the answer for question 10 here -->
                        </li>
                    </ul>
                    <asp:Panel ID="Panel12" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/CalenderView.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>

                </div>
                <asp:Button ID="btnCreateSchedule" CssClass="subcategory-button" runat="server" Text="Create Schedule ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the 'Create Schedule' page?</h1>
                        </li>
                        <li>The "Create Schedule" page is designed to allow users to create and manage calendar events, such as appointments, tasks, or meetings. It provides an interface for specifying event details and viewing a list of scheduled events.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How can I create a calendar event using this page?</h1>
                        </li>
                        <li>To create a calendar event, follow these steps:
            - Enter a "Task Description" to describe the event or task you want to schedule.
            - Select a "Client" from the dropdown list, representing the client or organization related to the event.
            - Choose an "Employee" from the dropdown list, indicating who is responsible for the event.
            - Specify the "Start Date" and "End Date" by selecting dates from the provided calendar inputs.
            - Additionally, set the "Start Time" and "End Time" for the event.
            - Click the "Add Event" button to save the event in the calendar.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. Are there any mandatory fields when creating a calendar event?</h1>
                        </li>
                        <li>Yes, the following fields are mandatory when creating a calendar event:
            - "Task Description"
            - "Client"
            - "Employee"
            - "Start Date"
            - "End Date"
            - "Start Time"
            - "End Time"
            These fields must be filled out to create a calendar event.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. How can I edit or update an existing calendar event?</h1>
                        </li>
                        <li>If you need to edit or update an existing calendar event, you can do so by selecting the event from the event list and making changes in the input fields. Be sure to click the "Add Event" button to save the updated information.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. What happens after I create a calendar event?</h1>
                        </li>
                        <li>After creating a calendar event, it is recorded in the system, and the event is displayed in the event list. You can view, edit, or delete events in the list.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. Can I delete a calendar event?</h1>
                        </li>
                        <li>Yes, you can delete a calendar event by selecting the event from the event list and clicking the "Delete" button.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How can I switch between different calendar views (e.g., Weeks and Months)?</h1>
                        </li>
                        <li>You can switch between different calendar views by using the "ButtonsCalendarView" buttons provided on the page. Click on "Weeks" or "Months" to change the calendar view.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How can I view the list of scheduled events?</h1>
                        </li>
                        <li>The list of scheduled events is displayed in a grid under the "Event List" section. You can view event details, edit events, and delete events from this list.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. How do I contact support for further assistance with calendar events or this page?</h1>
                        </li>
                        <li>If you have additional questions, encounter issues, or need further assistance related to calendar events or using this page, please contact our support team for guidance and support.</li>
                        <!-- Add more questions related to Create Schedule here -->
                    </ul>
                    <asp:Panel ID="Panel1" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/CreateSchedule.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>

                </div>

                <asp:Button ID="btnScheduledView" CssClass="subcategory-button" runat="server" Text="Scheduled View ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Scheduling Week View" page?</h1>
                        </li>
                        <li>The "Scheduling Week View" page allows you to view and manage scheduled events and tasks for a one-week time frame. It provides a visual representation of events and tasks in a calendar format.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I navigate through the calendar to view different weeks?</h1>
                        </li>
                        <li>You can navigate through the calendar to view different weeks using the following buttons:
            - "Previous": Click to view the previous week.
            - "Next": Click to view the next week.
            - "Today": Click to return to the current week.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. How can I switch to a different view, such as a month view or create a new schedule?</h1>
                        </li>
                        <li>You can switch to a different view or create a new schedule using the buttons located in the top right corner of the page:
            - "Month View": Click to switch to a monthly calendar view.
            - "Create": Click to create a new schedule or event.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. What information is displayed on the calendar for each event or task?</h1>
                        </li>
                        <li>The calendar displays the following information for each event or task:
            - Start date and time
            - End date and time
            - Task description
            - Assigned employee
            - Client associated with the task</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. How can I interact with the events or tasks on the calendar?</h1>
                        </li>
                        <li>You can interact with the events or tasks on the calendar by clicking on them. This will allow you to view additional details and perform actions such as editing or changing the status of the event.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. Can I search for specific events or tasks within the week view?</h1>
                        </li>
                        <li>Currently, there is no direct search functionality within the week view. You can visually locate events and tasks on the calendar.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How can I refresh the calendar or retrieve the latest data?</h1>
                        </li>
                        <li>To refresh the calendar and retrieve the latest data, you can use the "Refresh" button. This will update the displayed events and tasks based on the latest information.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. Can I filter or sort events and tasks based on specific criteria, such as clients or employees?</h1>
                        </li>
                        <li>Filtering or sorting options are not available directly in the week view. You can view events and tasks as they are scheduled.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. What do the different colors on the calendar represent?</h1>
                        </li>
                        <li>Events and tasks may be color-coded based on their priority, status, or other attributes. The specific color code meanings may vary based on your organization's configuration.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">10. How can I create, edit, or manage events and tasks in the Scheduling Week View?</h1>
                        </li>
                        <li>To create, edit, or manage events and tasks, you may need to access other functionalities within the Engineering Club's system or follow specific workflows defined by your organization. The Scheduling Week View primarily provides a visual representation of the scheduled events.</li>
                    </ul>
                    <asp:Panel ID="Panel2" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/ScheduleView.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>

        <!--Client Section -->

        <asp:Panel ID="pnlClient" CssClass="category-dropdown" runat="server">
            <asp:Button ID="btnClient" CssClass="category-button" runat="server" Text="Client ▼" OnClientClick="return false;" />
            <div class="category-content" runat="server">
                <asp:Button ID="btnCreateClient" CssClass="subcategory-button" runat="server" Text="Create Client ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Create Client" page?</h1>
                        </li>
                        <li>The "Create Client" page is designed for adding or updating client information in the Engineering Club HR system. It allows you to manage client details, including personal information, contact information, organization details, address information, and contact person information.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I create a new client?</h1>
                        </li>
                        <li>To create a new client, follow these steps:
                    - Fill in the "Personal Information" section, including client type, first name, middle name (if applicable), and last name.
                    - In the "Contact Information" section, provide the client's email and phone number.
                    - Move to the "Organization Information" section and enter the client's name, organization type, and industry.
                    - Fill in the "Address Information" section, which includes the street address, city, state, postal code, and country.
                    - If applicable, add contact person information in the "Contact Person Information" section.
                    - Finally, click the "Create" button to save the client's information.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. How do I update an existing client's information?</h1>
                        </li>
                        <li>If you want to update an existing client's information, follow these steps:
                    - Access the "Create Client" page with the client's details you want to update.
                    - Modify the relevant fields with the new information.
                    - Click the "Update" button to save the changes.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. Can I upload files or documents related to the client?</h1>
                        </li>
                        <li>Yes, you can upload files or documents related to the client. You can use the "btnUpload" button for this purpose. Please follow any specific instructions or file format requirements provided on the page.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. How do I switch between creating a new client and updating an existing client?</h1>
                        </li>
                        <li>The page automatically detects whether you are creating a new client or updating an existing one. If you provide a valid "clientID" parameter in the URL, the page will recognize it as an update operation, and the button text will change to "Update." Otherwise, it will be set to "Create."</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. What happens if I encounter an error while saving or updating client information?</h1>
                        </li>
                        <li>If you encounter any errors or issues while saving or updating client information, please check for error messages displayed on the page. These messages will guide you on any missing or incorrectly formatted information that needs to be corrected.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. Are there any mandatory fields when creating a new client?</h1>
                        </li>
                        <li>Yes, some fields are mandatory, and you must fill them out to create a new client. These fields typically include client type, first name, last name, email, phone number, organization name, and organization type.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. Can I use this page to create clients with specific accessibility settings?</h1>
                        </li>
                        <li>Yes, there is a "toggleColorblindMode" function that allows you to enable a colorblind mode for the page to enhance accessibility for users with color vision deficiencies.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. How can I contact support for further assistance?</h1>
                        </li>
                        <li>If you have additional questions, face challenges, or need further assistance related to the "Create Client" page, please reach out to our support team for help.</li>
                    </ul>
                    <asp:Panel ID="Panel3" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/CreateClient.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
                <asp:Button ID="btnManageClient" CssClass="subcategory-button" runat="server" Text="Manage Client ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Manage Clients" page in the Engineering Club HR system?</h1>
                        </li>
                        <li>The "Manage Clients" page is designed to provide tools and features for managing and interacting with the list of clients in the Engineering Club HR system.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. What are the main components of the "Manage Clients" page interface?</h1>
                        </li>
                        <li>The "Manage Clients" page interface includes the following key components:
                    - Title: A prominent title, "Engineering Club Clients," at the top of the page.
                    - Toggle Colorblind-Friendly Button: A button labeled "Toggle Colorblind Friendly" that can be clicked to change the page's color scheme for improved accessibility.
                    - Buttons: Several action buttons for performing tasks such as opening a chat and creating a new client.
                    - Search Bar: A search bar for finding clients by name.
                    - Active Clients Section: A section displaying active clients, including their organization name and contact information.
                    - Inactive Clients Section: A section displaying inactive clients with organization name and contact information.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. How do I toggle the color scheme to "Colorblind Friendly" on the "Manage Clients" page?</h1>
                        </li>
                        <li>To toggle the color scheme to "Colorblind Friendly," you can click the "Toggle Colorblind Friendly" button. This change will adjust the color scheme to enhance accessibility for colorblind users.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. What actions can I perform on the "Manage Clients" page?</h1>
                        </li>
                        <li>On this page, you can perform the following actions:
                    - Open Chat: Click the "Open Chat" button to access a chat feature.
                    - Create Client: Click the "Create Client" button to add a new client to the system.
                    - Search for a Client: Use the search bar to find a specific client by their name.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. What is the purpose of the "Active Clients" section on the page?</h1>
                        </li>
                        <li>The "Active Clients" section lists all clients who are currently active, providing information about their organization name and contact details.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. What is the purpose of the "Inactive Clients" section on the page?</h1>
                        </li>
                        <li>The "Inactive Clients" section displays clients who are currently inactive. It includes details such as the organization name and contact information for these clients.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How can I filter clients by their activity status (active or inactive) on the "Manage Clients" page?</h1>
                        </li>
                        <li>You can filter clients by their activity status using the "Active" and "Inactive" sections. Each section displays clients based on their activity status, and you can switch between them to view the respective client lists.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. What happens when I click on the "Edit" or "Remove" buttons next to a client's information in the "Active Clients" or "Inactive Clients" sections?</h1>
                        </li>
                        <li>Edit Button (Pencil Icon): Clicking the "Edit" button redirects you to the "CreateClient.aspx" page, allowing you to edit the selected client's information.
                Remove Button (Toggle On/Off Icon): Clicking the "Remove" button toggles the active/inactive status of the selected client, making it active if it was inactive, or inactive if it was active.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. How do I add a new client on the "Manage Clients" page?</h1>
                        </li>
                        <li>To add a new client, click the "Create Client" button. This action will redirect you to the "CreateClient.aspx" page, where you can enter the details of the new client.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">10. How do I perform a client search on the "Manage Clients" page?</h1>
                        </li>
                        <li>You can perform a client search by entering the client's name in the search bar and pressing Enter. The system will display search results matching the entered client name.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">11. How can I switch between viewing active and inactive clients on the "Manage Clients" page?</h1>
                        </li>
                        <li>You can switch between viewing active and inactive clients by scrolling through the respective sections on the page. The "Active Clients" and "Inactive Clients" sections provide separate lists based on client activity status.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">12. What should I do if I encounter issues or have questions about the "Manage Clients" page?</h1>
                        </li>
                        <li>If you encounter issues or have questions about the "Manage Clients" page or its features, consider the following steps:
                    - Review the FAQ for guidance on using the page.
                    - Reach out to your system administrator or support team for assistance.
                    - Explore the chat feature if you need further assistance.</li>
                    </ul>
                    <asp:Panel ID="Panel4" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/ManageClient.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
                <asp:Button ID="btnViewClient" CssClass="subcategory-button" runat="server" Text="View Client ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "View Client" page in Engineering Club?</h1>
                        </li>
                        <li>The "View Client" page allows you to add new client information to the Engineering Club system. It is used for recording and managing client details.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I access the "ViewClient" page?</h1>
                        </li>
                        <li>You can access the "View Client" page by logging into the Engineering Club system and navigating to the page. Typically, it can be found in the system's menu or dashboard.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. What information is required when creating a new client?</h1>
                        </li>
                        <li>When creating a new client, you are required to provide the following information: - Client Name - Organization Type - First Name - Middle Name (if applicable) - Last Name - Email - Phone Number - Address - City - Postal Code - Country - Industry - Contact Person - Contact Person's Email - Contact Person's Phone Number</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. Are there any specific formatting requirements for the client details?</h1>
                        </li>
                        <li>While creating a client, ensure that you provide accurate and valid information. Pay attention to formatting, such as email addresses, phone numbers, and postal codes, to ensure they are correctly entered.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. What is the "Industry" field used for?</h1>
                        </li>
                        <li>The "Industry" field is used to specify the industry or sector to which the client belongs. It helps categorize and classify clients based on their business domain.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. How do I save the client information after filling out the form?</h1>
                        </li>
                        <li>To save the client information, click the "Create" button at the bottom of the form. This will submit the form and add the client details to the system.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. Can I edit or update client information after it's been created?</h1>
                        </li>
                        <li>The ability to edit or update client information may depend on your organization's system settings. If allowed, you can typically make changes to client details through an edit or update feature in the system.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. What do I do if I encounter an issue or have specific questions about the "View Client" page?</h1>
                        </li>
                        <li>If you encounter issues or have specific questions related to viewing a client or using this page, please reach out to your organization's support team or administrator for assistance.</li>
                    </ul>
                    <asp:Panel ID="Panel5" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/ClientView.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>

        <!--Employee Section -->

        <asp:Panel ID="pnlEmployee" CssClass="category-dropdown" runat="server">
            <asp:Button ID="btnEmployee" CssClass="category-button" runat="server" Text="Employee ▼" OnClientClick="return false;" />
            <div class="category-content" runat="server">
                <asp:Button ID="btnCreateEmployee" CssClass="subcategory-button" runat="server" Text="Create Employee ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Create Employee" page?</h1>
                        </li>
                        <li>The "Create Employee" page is designed to add new employee information in the Engineering Club HR system. It allows you to manage personal, contact, and work-related details for employees.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I create a new employee record?</h1>
                        </li>
                        <li>To create a new employee record, follow these steps: a. Fill in the "Personal Information" section, including first name, middle name (if applicable), last name, preferred name, gender, ID number, nationality, address, country, city, state, postal code, password, marital status, date of birth, and country of birth. b. In the "Contact Information" section, provide the employee's phone number, email, emergency contact name, emergency contact relationship, emergency contact phone, and position. c. In the "Work Information" section, fill out details like job title, department, manager, termination date, employment status, employment type, work hours per week, employee status, office location, hourly rate, salary, and hire date. d. Optionally, upload a profile picture using the "Upload profile picture" button. e. Click the "Save" button to save the employee's information.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. How do I update an existing employee's information?</h1>
                        </li>
                        <li>If you want to update an existing employee's information, follow these steps: a. Access the "Create Employee" page with the employee's details you want to update. b. Modify the relevant fields with the new information. c. Click the "Update" button to save the changes. (The "Update" button is not visible by default but can be made visible when updating an existing employee.)</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. What are the mandatory fields when creating a new employee?</h1>
                        </li>
                        <li>Several fields are mandatory when creating a new employee, including first name, gender, ID number, address, country, city, state, postal code, password, marital status, date of birth, phone number, email, emergency contact name, emergency contact relationship, emergency contact phone, position, job title, department, employment status, employment type, work hours per week, employee status, office location, hourly rate, salary, and hire date.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. How can I upload a profile picture for an employee?</h1>
                        </li>
                        <li>To upload a profile picture for an employee, use the "Upload profile picture" button in the "Profile Picture" section. This allows you to select an image file to associate with the employee's profile.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. What happens if I encounter an error while saving or updating employee information?</h1>
                        </li>
                        <li>If you encounter any errors or issues while saving or updating employee information, please check for error messages displayed on the page. These messages will guide you on any missing or incorrectly formatted information that needs to be corrected.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How can I contact support for further assistance?</h1>
                        </li>
                        <li>If you have additional questions, face challenges, or need further assistance related to the "Create Employee" page, please reach out to our support team for help.</li>
                    </ul>
                    <asp:Panel ID="Panel6" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/CreateEmployee.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>

                </div>
                <asp:Button ID="btnManageEmployee" CssClass="subcategory-button" runat="server" Text="Manage Employees ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Manage Employees" page in the Engineering Club HR system?</h1>
                        </li>
                        <li>The "Manage Employees" page is designed to provide tools and features for managing and interacting with the list of employees in the Engineering Club HR system.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. What are the main components of the "Manage Employees" page interface?</h1>
                        </li>
                        <li>The "Manage Employees" page interface includes the following key components: - Title: A prominent title, "Engineering Club Employees," at the top of the page. - Buttons: Several action buttons for performing tasks such as opening a chat and creating a new employee. - Search Bar: A search bar for finding employees by name. - Active Employees Section: A section displaying active employees, including their name, contact information, and manager details. - Inactive Employees Section: A section displaying inactive employees with their name, contact information, and manager details.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. What actions can I perform on the "Manage Employees" page?</h1>
                        </li>
                        <li>On this page, you can perform the following actions: - Open Chat: Click the "Open Chat" button to access a chat feature. - Create Employee: Click the "Create Employee" button to add a new employee to the system. - Search for an Employee: Use the search bar to find a specific employee by their name. - Edit Employee: Click the "Edit Employee" button to edit the selected employee's information. - Toggle Employee Status: Click the "Toggle On/Off" button to change the employee's status between active and inactive.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. What is the purpose of the "Active Employees" section on the page?</h1>
                        </li>
                        <li>The "Active Employees" section lists all employees who are currently active, providing information about their name, contact details, and manager.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. What is the purpose of the "Inactive Employees" section on the page?</h1>
                        </li>
                        <li>The "Inactive Employees" section displays employees who are currently inactive. It includes details such as the employee's name, contact information, and manager.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. How can I filter employees by their activity status (active or inactive) on the "Manage Employees" page?</h1>
                        </li>
                        <li>You can filter employees by their activity status using the "Active" and "Inactive" sections. Each section displays employees based on their activity status, and you can switch between them to view the respective employee lists.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How do I add a new employee on the "Manage Employees" page?</h1>
                        </li>
                        <li>To add a new employee, click the "Create Employee" button. This action will redirect you to the "CreateEmployee.aspx" page, where you can enter the details of the new employee.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How do I edit an existing employee's information on the "Manage Employees" page?</h1>
                        </li>
                        <li>To edit an existing employee's information, click the "Edit Employee" button next to the employee's details. This action will redirect you to the "CreateEmployee.aspx" page with the employee's ID as a query parameter, allowing you to make changes.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. What happens when I click the "Toggle On/Off" button next to an employee's information in the "Active Employees" or "Inactive Employees" sections?</h1>
                        </li>
                        <li>Clicking the "Toggle On/Off" button toggles the employee's status between active and inactive. If the employee is active, it will become inactive, and vice versa.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">10. How do I perform an employee search on the "Manage Employees" page?</h1>
                        </li>
                        <li>You can perform an employee search by entering the employee's name in the search bar and pressing Enter. The system will display search results matching the entered employee name.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">11. What should I do if I encounter issues or have questions about the "Manage Employees" page?</h1>
                        </li>
                        <li>If you encounter issues or have questions about the "Manage Employees" page or its features, consider the following steps: - Review the FAQ for guidance on using the page. - Reach out to your system administrator or support team for assistance. - Explore the chat feature if you need further assistance.</li>
                    </ul>
                    <asp:Panel ID="Panel7" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/ManageEmployee.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>


        <!-- Grievance Section -->

        <asp:Panel ID="pnlGrievance" CssClass="category-dropdown" runat="server">
            <asp:Button ID="btnGrievance" CssClass="category-button" runat="server" Text="Grievance ▼" OnClientClick="return false;" />
            <div class="category-content" runat="server">
                <asp:Button ID="Button2" CssClass="subcategory-button" runat="server" Text="Create Grievance ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Create Grievance" page?</h1>
                        </li>
                        <li>The "Create Grievance" page allows you to file a grievance or complaint within the Engineering Club HR system. It's a platform to report workplace issues, disputes, or concerns related to employees' behavior.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I file a new grievance using this page?</h1>
                        </li>
                        <li>To file a new grievance, follow these steps: a. Select the "Grievance Victim Name" from the dropdown list. This is the employee who is experiencing the issue. b. Choose the "Grievance Actor Name" from the second dropdown list. This is the employee involved in the grievance. c. Provide a brief and descriptive "Grievance Title" in the respective text box. d. Enter detailed "Description" of the grievance in the text box provided. e. Click the "Submit Grievance" button to submit your grievance.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. What are the mandatory fields when filing a grievance?</h1>
                        </li>
                        <li>When filing a grievance, you must fill in the following mandatory fields: - "Grievance Victim Name" - "Grievance Actor Name" - "Grievance Title" - "Description"</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. What should I do if I encounter an issue while saving the grievance?</h1>
                        </li>
                        <li>If you encounter any issues while saving the grievance, such as incomplete fields or errors, you will receive feedback on the page. Ensure that all mandatory fields are filled out, and follow any guidance provided in the error messages.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. Can I report a grievance with a duplicate title?</h1>
                        </li>
                        <li>If you attempt to report a grievance with a title that already exists in the system, you will receive a confirmation prompt. You can choose to save it anyway or clear the title field to provide a unique title.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. How are grievance submissions handled in the system?</h1>
                        </li>
                        <li>When you submit a grievance, it is processed and recorded in the system. A unique grievance ID is assigned, and a grievance log entry is created. The grievance is associated with both the "Grievance Victim" and the "Grievance Actor." The submission date and status are also recorded.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. Is there a specific format for the "Description" field?</h1>
                        </li>
                        <li>The "Description" field allows you to provide a detailed account of the grievance. While there is no specific format, it's essential to be clear and concise, describing the issue, any relevant events, and the impact it has on the workplace.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How can I contact support for further assistance with my grievance?</h1>
                        </li>
                        <li>If you have additional questions, face challenges, or need further assistance related to your grievance, please reach out to our designated support team for guidance and support.</li>
                    </ul>
                    <asp:Panel ID="Panel8" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/CreateGrievance.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
                <asp:Button ID="Button3" CssClass="subcategory-button" runat="server" Text="Create Grievance Log ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Create Grievance Log" page?</h1>
                        </li>
                        <li>The "Create Grievance Log" page serves the purpose of adding log entries related to specific grievances within the Engineering Club HR system. It allows users to document and record details of actions or updates concerning a grievance.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How can I view existing grievance logs on this page?</h1>
                        </li>
                        <li>Existing grievance logs related to a specific grievance are displayed on this page. To view these logs, you need to provide the relevant GrievanceID as a URL parameter. The grievance logs are presented in a structured format, showing the log date and log description.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. How do I add a new grievance log entry?</h1>
                        </li>
                        <li>To add a new grievance log entry, follow these steps: a. Provide a descriptive "Log Description" in the text box provided. b. Click the "Submit Grievance Log" button to record the log entry.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. Are there any mandatory fields when adding a grievance log entry?</h1>
                        </li>
                        <li>The only mandatory field when adding a grievance log entry is the "Log Description." Ensure you provide a clear and informative description of the log entry.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. How can I ensure that the grievance log is associated with the correct grievance?</h1>
                        </li>
                        <li>When you access this page with the GrievanceID provided as a URL parameter, the grievance log entry you create will automatically be associated with that specific grievance. The system handles this association for you.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. Can I edit or modify existing grievance log entries?</h1>
                        </li>
                        <li>This page is designed primarily for adding new grievance log entries. If you need to edit or modify an existing log entry, you may need to refer to the specific grievance management features within the system.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. What happens after I submit a grievance log entry?</h1>
                        </li>
                        <li>Once you submit a grievance log entry, it is recorded in the system and associated with the corresponding grievance. The entry includes the log description and the date it was submitted. The log entry becomes part of the grievance's historical record.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How can I contact support for further assistance with grievance logs?</h1>
                        </li>
                        <li>If you have additional questions, face challenges, or need further assistance related to grievance logs, please reach out to our designated support team for guidance and support.</li>
                    </ul>
                    <asp:Panel ID="Panel9" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/CreateGrievanceLog.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
                <asp:Button ID="Button4" CssClass="subcategory-button" runat="server" Text="Edit Grievance ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Edit Grievance" page in the Engineering Club HR system?</h1>
                        </li>
                        <li>The "Edit Grievance" page serves as a platform for editing and updating grievance-related information within the Engineering Club HR system. It allows authorized users to modify grievance descriptions, status, and the perpetrator associated with a specific grievance.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. What are the key components of the "Edit Grievance" page?</h1>
                        </li>
                        <li>The "Edit Grievance" page comprises several key components, including: - Grievance Description: A text area where users can edit the description of the grievance. - Status Dropdown: A dropdown menu for selecting the status of the grievance (e.g., open, resolved, etc.). - Perpetrator Dropdown: A dropdown menu for selecting the perpetrator (related to the grievance) from a list of employees. - Update Grievance Button: A button for submitting the edited grievance details. - Back Button: A link to navigate back to the "Manage Grievance" page.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. How can I edit the description of a grievance on the "Edit Grievance" page?</h1>
                        </li>
                        <li>To edit the description of a grievance, you can simply click inside the "Grievance Description" text area and modify the text. You can also use the "Update Grievance" button to save your changes.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. How can I change the status of a grievance on the "Edit Grievance" page?</h1>
                        </li>
                        <li>You can change the status of a grievance by selecting a new status from the "Status" dropdown menu. This dropdown lists various status options (e.g., open, resolved) that you can choose to update the status of the grievance.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. How do I update the perpetrator associated with a grievance on the "Edit Grievance" page?</h1>
                        </li>
                        <li>To update the perpetrator of a grievance, you can select a different employee from the "Perpetrator" dropdown menu. This dropdown contains a list of employees, and you can choose a new perpetrator from the available options.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. How do I save the edited grievance details on the "Edit Grievance" page?</h1>
                        </li>
                        <li>To save the edited grievance details, click the "Update Grievance" button. This action will update the grievance with the modified information and reflect the changes in the system.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How can I navigate back to the "Manage Grievance" page from the "Edit Grievance" page?</h1>
                        </li>
                        <li>You can navigate back to the "Manage Grievance" page by clicking the "Back" button, which is a link located at the top-left corner of the page. This link will take you back to the previous page where you can manage grievances.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How is grievance data pre-populated on the "Edit Grievance" page?</h1>
                        </li>
                        <li>Grievance data is pre-populated on the "Edit Grievance" page based on the GrievanceID parameter passed in the URL. The system retrieves the grievance details associated with the specified GrievanceID and displays them in the respective form fields for editing.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. What happens if the GrievanceID parameter is not found in the URL on the "Edit Grievance" page?</h1>
                        </li>
                        <li>If the GrievanceID parameter is not found in the URL, the system will not be able to identify the grievance to edit. It is essential to provide the GrievanceID parameter to ensure the correct grievance is loaded for editing.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">10. How can I handle errors or issues on the "Edit Grievance" page?</h1>
                        </li>
                        <li>If you encounter errors or issues on the "Edit Grievance" page, it is important to have error handling mechanisms in place. You can implement error messages or redirects to an error page to inform users of any problems that may arise during the editing process.</li>
                    </ul>
                    <asp:Panel ID="Panel10" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/EditGrievance.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
                <asp:Button ID="Button5" CssClass="subcategory-button" runat="server" Text="Manage Grievance ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Manage Grievances" page in the Engineering Club HR system?</h1>
                        </li>
                        <li>The "Manage Grievances" page is designed for managing and tracking employee grievances within the organization.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. What are the main components of the "Manage Grievances" page interface?</h1>
                        </li>
                        <li>The "Manage Grievances" page interface includes the following key components: - Title: A prominent title, "Manage Grievances," at the top of the page. - Buttons: Action buttons for opening a chat and adding a new grievance. - Filter Controls: Dropdown list for selecting grievance statuses and a checkbox to show inactive grievances. - Grievance Grid: A table displaying grievance details, including employee name, description, submission date, status, perpetrator, and actions. - JavaScript Function: A JavaScript function to make rows in the grid clickable and redirect to a detailed view.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. What actions can I perform on the "Manage Grievances" page?</h1>
                        </li>
                        <li>On this page, you can perform the following actions: - Open Chat: Click the "Open Chat" button to access a chat feature. - Add Grievance: Click the "Add Grievance" button to create a new grievance entry. - Filter Grievances: Use the dropdown list to filter grievances by status (e.g., "Submitted," "Under Review") and the checkbox to show or hide inactive grievances. - View Grievance Details: Click on a grievance row in the grid to view detailed information.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. How do I add a new grievance on the "Manage Grievances" page?</h1>
                        </li>
                        <li>To add a new grievance, click the "Add Grievance" button. This action will redirect you to a page where you can enter the details of the new grievance.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. What information is displayed in the "Grievance Grid" on the page?</h1>
                        </li>
                        <li>The "Grievance Grid" displays the following details for each grievance: - Employee Name - Grievance Description - Submission Date - Status (e.g., "Submitted," "Under Review") - Perpetrator Name - Action Buttons (Edit, Add Log, Toggle Active)</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. What do the action buttons in the "Grievance Grid" do?</h1>
                        </li>
                        <li>- Edit: Click the "Edit" button to edit the selected grievance's information. - Add Log: Click the "Add Log" button to add a log entry for the selected grievance. - Toggle Active: Click the "Toggle Active" button to change the active status of the grievance (Active/Inactive).</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How do I edit a grievance on the "Manage Grievances" page?</h1>
                        </li>
                        <li>To edit a grievance, click the "Edit" button in the "Grievance Grid" for the specific grievance you want to edit. This action will redirect you to a page where you can modify the grievance details.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How do I add a log entry for a grievance on the "Manage Grievances" page?</h1>
                        </li>
                        <li>To add a log entry for a grievance, click the "Add Log" button in the "Grievance Grid" for the specific grievance. This action will redirect you to a page where you can log additional information related to the grievance.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. What is the purpose of the "Toggle Active" button in the "Grievance Grid"?</h1>
                        </li>
                        <li>The "Toggle Active" button allows you to change the active status of a grievance. Clicking the button will switch the grievance between an active and inactive state.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">10. How do I access the chat feature from the "Manage Grievances" page?</h1>
                        </li>
                        <li>To access the chat feature, click the "Open Chat" button on the page. This action will allow you to engage in chat discussions with other users.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">11. How can I filter the displayed grievances based on status and active/inactive status?</h1>
                        </li>
                        <li>- Use the dropdown list to select a specific status (e.g., "Submitted," "Under Review") to filter grievances with that status. - Check or uncheck the "Show Inactive Grievances" checkbox to display or hide inactive grievances.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">12. What should I do if I encounter issues or have questions about the "Manage Grievances" page?</h1>
                        </li>
                        <li>If you encounter issues or have questions about the "Manage Grievances" page or its features, consider the following steps: - Review the FAQ for guidance on using the page. - Reach out to your system administrator or support team for assistance. - Utilize the chat feature if you need further assistance.</li>
                    </ul>
                    <asp:Panel ID="Panel11" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/ManageGrievance.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
                <asp:Button ID="Button6" CssClass="subcategory-button" runat="server" Text="View Grievance ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "View Grievance" page in Engineering Club?</h1>
                        </li>
                        <li>The "View Grievance" page allows you to view details related to a specific grievance. It provides information about the grievance title, employee, and associated grievance logs.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I access the "View Grievance" page?</h1>
                        </li>
                        <li>You can access the "View Grievance" page by logging into the Engineering Club system and navigating to the page. Typically, it can be found in the system's menu or dashboard. You can also access it by following a specific grievance link if shared.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. What information is displayed on the "Grievance Details" section of the page?</h1>
                        </li>
                        <li>The "Grievance Details" section displays the following information: - Grievance Title: The title or subject of the grievance. - Employee: The name of the employee associated with the grievance. - Description: A brief description of the grievance.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. How can I view the grievance logs related to this grievance?</h1>
                        </li>
                        <li>Scroll down to the "Grievance Logs" section of the page. Grievance logs provide a chronological history of actions and updates related to the grievance. You can click on a specific log to view more details.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. How do I view the full description of a grievance log?</h1>
                        </li>
                        <li>To view the full description of a grievance log, simply click on the log entry in the "Grievance Logs" section. A popup will appear displaying the log's date and full description.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. Can I edit a grievance log from this page?</h1>
                        </li>
                        <li>Yes, you have the option to edit a grievance log. To do so, click the "Edit" button on a specific log entry. This will redirect you to a page where you can make changes to the log description.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. What if there are no grievance logs available for this grievance?</h1>
                        </li>
                        <li>If there are no grievance logs available for the selected grievance, the system will display a message indicating that "No Logs Available."</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How can I close the popup displaying a full grievance log description?</h1>
                        </li>
                        <li>To close the popup displaying the full grievance log description, simply click the "Close" button within the popup.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. What should I do if I encounter issues or have specific questions about the "View Grievance" page?</h1>
                        </li>
                        <li>If you encounter issues or have specific questions related to viewing a grievance or using this page, please reach out to your organization's support team or administrator for assistance.</li>
                    </ul>
                    <asp:Panel ID="Panel13" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/ViewGrievance.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>

        <!-- Leave Section -->

        <asp:Panel ID="pnlLeave" CssClass="category-dropdown" runat="server">
            <asp:Button ID="btnLeave" CssClass="category-button" runat="server" Text="Leave ▼" OnClientClick="return false;" />
            <div class="category-content" runat="server">
                <!-- Create Leave Subcategory -->
                <asp:Button ID="btnCreateLeave" CssClass="subcategory-button" runat="server" Text="Create Leave ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Create Leave" page?</h1>
                        </li>
                        <li>The "Create Leave" page is designed to allow employees to request and apply for leave within the Engineering Club HR system. It provides a user-friendly interface for specifying leave details and submitting leave requests.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How can I apply for leave using this page?</h1>
                        </li>
                        <li>To apply for leave, follow these steps: a. Select the relevant "Employee" from the dropdown list. b. Choose the type of "Leave" you are requesting from the "Leave Type" dropdown. c. Specify the "Start Date" and "End Date" for your leave by selecting dates from the provided calendar inputs. d. Optionally, enter any additional "Comments" related to your leave request. e. Click the "Submit" button to submit your leave request.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. Are there any mandatory fields when applying for leave?</h1>
                        </li>
                        <li>The only mandatory fields when applying for leave are "Employee," "Leave Type," "Start Date," and "End Date." These fields must be filled out to complete your leave application.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. How do I ensure that my leave request is associated with the correct employee and their manager?</h1>
                        </li>
                        <li>When you select an "Employee" from the dropdown list, the system automatically associates the leave request with the chosen employee. The manager of the selected employee is also identified, ensuring that the request is sent to the appropriate approver.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. Can I edit or update my leave request after submitting it?</h1>
                        </li>
                        <li>If you need to modify or update your leave request after submitting it, you should contact your manager or the HR department directly. This page is primarily for initiating new leave requests.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. What happens after I submit a leave request?</h1>
                        </li>
                        <li>Once you submit a leave request, it is recorded in the system, and the approval process begins. The request is sent to your manager for review and approval. The status of your request is initially set to "Pending."</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How can I view the status of my leave request and any comments from my manager?</h1>
                        </li>
                        <li>You can view the status and comments related to your leave request on the "Manage Leave" page, which provides an overview of all your leave requests and their current statuses.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How can I contact support for further assistance with leave applications?</h1>
                        </li>
                        <li>If you have additional questions, face challenges, or need further assistance related to leave applications, please reach out to our designated support team for guidance and support.</li>
                    </ul>
                    <asp:Panel ID="Panel14" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/CreateLeave.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
                <!-- Manage Leave Subcategory -->
                <asp:Button ID="btnManageLeave" CssClass="subcategory-button" runat="server" Text="Manage Leave ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the main purpose of the "Manage Leave" page?</h1>
                        </li>
                        <li>The "Manage Leave" page serves as a platform to manage leave records for employees. It allows users to view, approve, reject, and edit leave requests.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I open a chat on this page?</h1>
                        </li>
                        <li>To open a chat, simply click the "Open Chat" button, which is the blue button with the label "Open Chat" located in the top-left corner of the page.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. How can I add a new leave record?</h1>
                        </li>
                        <li>To add a new leave record, click the "Add Leave Record" button, which is the blue button with the label "Add Leave Record" located in the top-right corner of the page. It will redirect you to a page where you can create a new leave request.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. How does the search feature work, and how can I use it?</h1>
                        </li>
                        <li>The search feature allows you to search for specific leave records. To use it, enter your search query in the "Search for a leave record..." text box and press "Enter" or trigger the search by typing and waiting for auto-suggestions.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. What is "Outstanding Leave," and how is it different from "Leave History"?</h1>
                        </li>
                        <li>"Outstanding Leave" displays leave records that are currently pending approval or have not yet been completed. "Leave History" shows records of past leave requests, including those that have been approved, rejected, or canceled.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. What can I do with leave records in the "Outstanding Leave" section?</h1>
                        </li>
                        <li>In the "Outstanding Leave" section, you can review pending leave requests. You have the option to approve or reject them by clicking the respective icons, or you can edit the leave request.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. What actions can I take in the "Leave History" section?</h1>
                        </li>
                        <li>In the "Leave History" section, you can view the historical data of leave requests. While you can't approve or reject these records, you have the option to edit them if needed.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How can I approve a leave request in the "Outstanding Leave" section?</h1>
                        </li>
                        <li>To approve a leave request in the "Outstanding Leave" section, click the checkmark icon (✓) associated with the request. This action changes the status to "Approved."</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. How can I reject a leave request in the "Outstanding Leave" section?</h1>
                        </li>
                        <li>To reject a leave request in the "Outstanding Leave" section, click the cross icon (✗) associated with the request. This action changes the status to "Rejected."</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">10. How can I edit a leave request in either section?</h1>
                        </li>
                        <li>To edit a leave request, click the pencil (edit) icon associated with the request. This action allows you to make changes to the leave request details.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">11. Is there a way to export leave records to an Excel file?</h1>
                        </li>
                        <li>While there is a "ButtonExportExcel," the code provided does not have the implementation for exporting leave records to Excel. Additional development may be required for this functionality.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">12. What happens when I click on the "Open Chat" button?</h1>
                        </li>
                        <li>Clicking the "Open Chat" button triggers an action, but the specific functionality is not implemented in the code provided. You may need to define the chat feature's behavior.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">13. How can I contact support for further assistance with leave management?</h1>
                        </li>
                        <li>If you have additional questions or need further assistance with managing leave records, please contact our support team for guidance and help.</li>
                    </ul>
                    <asp:Panel ID="Panel15" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/ManageLeave.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>


        <!-- Task Section -->

        <asp:Panel ID="pnlTask" CssClass="category-dropdown" runat="server">
            <asp:Button ID="btnTask" CssClass="category-button" runat="server" Text="Task ▼" OnClientClick="return false;" />
            <div class="category-content" runat="server">
                <!-- Create Task Subcategory -->
                <asp:Button ID="btnCreateTask" CssClass="subcategory-button" runat="server" Text="Create Task ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Create Tasks" page?</h1>
                        </li>
                        <li>The "Create Tasks" page is designed to help users create and manage tasks or assignments within the Engineering Club HR system. It allows you to specify task details and associated information.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How can I create a new task using this page?</h1>
                        </li>
                        <li>To create a new task, follow these steps...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. What fields are mandatory when creating a new task?</h1>
                        </li>
                        <li>The following fields are mandatory when creating a new task...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. How can I edit or update an existing task?</h1>
                        </li>
                        <li>If you need to edit or update an existing task, you can do so by...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. What happens after I create a new task?</h1>
                        </li>
                        <li>After creating a new task, the task details are recorded in the system...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. Can I change the priority level, status, or assignment of an existing task?</h1>
                        </li>
                        <li>Yes, you can update the priority level, status, or assignment of an existing task...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How can I delete a task?</h1>
                        </li>
                        <li>To delete a task, select the task from the list and click the "Create" button...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How do I switch the person creating the task ("Create on Behalf Of") and the person assigned to the task ("Assign To")?</h1>
                        </li>
                        <li>To change the person creating the task or the person assigned to the task, select the new individuals from the respective dropdown lists provided on the page...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. What are the available priority levels and task statuses?</h1>
                        </li>
                        <li>The available priority levels are "High," "Medium," and "Low." The task statuses include "Open," "Not Started," "In Progress," and "Completed." You can select these values from the respective dropdown lists...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">10. How do I contact support for further assistance with tasks or using this page?</h1>
                        </li>
                        <li>If you have additional questions, face any issues, or need further assistance related to tasks or using the "Create Tasks" page, please reach out to our support team for guidance and support.</li>
                    </ul>
                    <asp:Panel ID="Panel16" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/CreateTask.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
                <!-- Managing Task Subcategory -->
                <asp:Button ID="btnManageTask" CssClass="subcategory-button" runat="server" Text="Managing Task ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the primary purpose of the "Engineering Club Tasks" page?</h1>
                        </li>
                        <li>The "Engineering Club Tasks" page is designed to help you manage and track various tasks...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I create a new task?</h1>
                        </li>
                        <li>To create a new task, follow these steps...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. How can I search for a specific task?</h1>
                        </li>
                        <li>To search for a specific task, use the search bar at the top...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. What are the different task priorities?</h1>
                        </li>
                        <li>Tasks are categorized into four priority levels, each represented by a different color...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. How do I edit a task?</h1>
                        </li>
                        <li>To edit a task, follow these steps...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. How can I change the status of a task?</h1>
                        </li>
                        <li>To change the status of a task, follow these steps...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. What are the available task statuses?</h1>
                        </li>
                        <li>Tasks can have various statuses such as "In Progress," "Completed," "Pending," and more...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How can I open the chat feature?</h1>
                        </li>
                        <li>To open the chat feature, click the "Open Chat" button. This feature allows you to communicate with team members and discuss tasks in real-time...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. How can I distinguish tasks of different priorities?</h1>
                        </li>
                        <li>Tasks of different priorities are color-coded. High-priority tasks are red, medium-priority tasks are yellow, low-priority tasks are green, and completed tasks are blue...</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">10. How do I delete a task?</h1>
                        </li>
                        <li>To delete a task, find the task you want to remove and click the "Delete" button. Confirm the deletion, and the task will be permanently removed...</li>
                    </ul>
                    <asp:Panel ID="Panel17" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/ManageTask.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>


        <!-- Dashboard Section -->
        <asp:Panel ID="pnlDashboard" CssClass="category-dropdown" runat="server">
            <asp:Button ID="btnDashboard" CssClass="category-button" runat="server" Text="Dashboard ▼" OnClientClick="return false;" />
            <div class="category-content" runat="server">
                <!-- Landing Page Subcategory -->
                <asp:Button ID="btnLandingPage" CssClass="subcategory-button" runat="server" Text="Landing Page ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Dashboard" page in the Engineering Club HR system?</h1>
                        </li>
                        <li>The "Dashboard" page serves as a central hub to provide an overview and access to important information and functionalities within the Engineering Club HR system. It offers various features and data visualization elements to help users manage workflows, track leave, address grievances, and view payroll summaries.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. What are the key components of the "Dashboard" page?</h1>
                        </li>
                        <li>The "Dashboard" page comprises several key components, including:</li>
                        <ul>
                            <li>Workflow Summary: A chart displaying workflow-related information.</li>
                            <li>Chart Options: A dropdown menu to select different chart configurations.</li>
                            <li>Outstanding Leave: A section displaying leave-related information.</li>
                            <li>Actionable Grievances: A section showing actionable grievances with options to edit or add logs.</li>
                            <li>Payroll Summary: A chart presenting payroll-related data.</li>
                            <li>Pay Period Selection: A dropdown menu to choose different pay periods.</li>
                            <li>Chart Options: A dropdown menu for selecting various chart options.</li>
                        </ul>
                        <!-- Add more questions and answers here -->
                    </ul>
                    <asp:Panel ID="Panel18" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/DashBoard.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>


        <!-- Payroll Section -->
        <asp:Panel ID="pnlPayroll" CssClass="category-dropdown" runat="server">
            <asp:Button ID="btnPayroll" CssClass="category-button" runat="server" Text="Payroll ▼" OnClientClick="return false;" />
            <div class="category-content" runat="server">
                <asp:Button ID="btnManagePayroll" CssClass="subcategory-button" runat="server" Text="Manage Payroll ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the main purpose of the "Manage Payroll" page?</h1>
                        </li>
                        <li>The "Manage Payroll" page is designed for handling employee payroll information. It allows users to edit payroll details, generate payroll reports, export payroll data, load payroll information, and delete payroll records.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I edit an employee's payroll hours?</h1>
                        </li>
                        <li>To edit an employee's payroll hours, follow these steps:</li>
                        <ul>
                            <li>Select the desired month and year.</li>
                            <li>Choose the employee from the list.</li>
                            <li>Click "Load Employee Hours" to load the existing data.</li>
                            <li>Modify the "Total Hours Worked" and "Total Overtime Worked" fields.</li>
                            <li>Click "Save Changes" to update the payroll information.</li>
                        </ul>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. What actions can I perform in the "Payroll Actions" section?</h1>
                        </li>
                        <li>In the "Payroll Actions" section, you can perform the following actions:</li>
                        <ul>
                            <li>Generate Payroll: Create payroll records for employees.</li>
                            <li>Export to Excel: Save payroll data as an Excel file.</li>
                            <li>Load Payroll Details: Load payroll information.</li>
                            <li>Delete Payroll: Remove payroll records.</li>
                        </ul>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. How do I generate payroll records?</h1>
                        </li>
                        <li>To generate payroll records, click the "Generate Payroll" button. This action will create payroll records for the selected month and year.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. How can I export payroll data to an Excel file?</h1>
                        </li>
                        <li>To export payroll data to an Excel file, click the "Export to Excel" button. This will save the payroll information in an Excel format for further analysis or reporting.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. How do I load payroll details?</h1>
                        </li>
                        <li>To load payroll details, click the "Load Payroll Details" button. This action populates the "Payroll Overview" section with the selected month and year's payroll data.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How can I delete payroll records?</h1>
                        </li>
                        <li>To delete payroll records, click the "Delete Payroll" button. You can remove payroll data for the specified month and year.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. What information is displayed in the "Payroll Overview" section?</h1>
                        </li>
                        <li>The "Payroll Overview" section displays details for each employee, including:</li>
                        <ul>
                            <li>Employee name</li>
                            <li>Pay period</li>
                            <li>Total hours worked</li>
                            <li>Total overtime worked</li>
                            <li>Overtime pay</li>
                            <li>Gross pay</li>
                            <li>Additions</li>
                            <li>Deductions</li>
                            <li>Net pay</li>
                        </ul>
                    </ul>
                    <asp:Panel ID="Panel19" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/Payrolls.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>

        <!-- Settings Section -->
        <asp:Panel ID="pnlSettings" CssClass="category-dropdown" runat="server">
            <asp:Button ID="btnSettings" CssClass="category-button" runat="server" Text="Settings ▼" OnClientClick="return false;" />
            <div class="category-content" runat="server">
                <asp:Button ID="btnSettingsPage" CssClass="subcategory-button" runat="server" Text="Settings Page ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Settings Page" in Engineering Club?</h1>
                        </li>
                        <li>The "Settings Page" in Engineering Club allows you to manage various settings and configurations related to leave types. This includes adding, deleting, and modifying leave types used in your organization.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I add a new leave type on the Settings Page?</h1>
                        </li>
                        <li>To add a new leave type, follow these steps:</li>
                        <ul>
                            <li>Enter the name of the new leave type in the "New Leave Type" field.</li>
                            <li>Click the "Add Leave Type" button.</li>
                            <li>The new leave type will be added to the list of available leave types.</li>
                        </ul>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. How can I delete an existing leave type on the Settings Page?</h1>
                        </li>
                        <li>To delete an existing leave type, follow these steps:</li>
                        <ul>
                            <li>Select the leave type you want to delete from the dropdown list.</li>
                            <li>Click the "Delete Leave Type" button.</li>
                            <li>The selected leave type will be permanently removed from the system.</li>
                        </ul>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. Can I edit or modify an existing leave type on the Settings Page?</h1>
                        </li>
                        <li>Currently, direct editing or modification of leave types is not available on the Settings Page. To make changes to an existing leave type, you may need to contact your organization's administrator or follow specific procedures defined by your organization.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. What happens if I try to add a leave type that already exists?</h1>
                        </li>
                        <li>If you attempt to add a leave type that already exists, you will receive an error message indicating that the leave type already exists. Please make sure to use a unique name for each leave type.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. Is there a limit to the number of leave types that can be added?</h1>
                        </li>
                        <li>The number of leave types that can be added may vary based on your organization's configuration. Please consult your organization's policies and guidelines regarding the management of leave types.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. How do I ensure that changes made on the Settings Page are saved?</h1>
                        </li>
                        <li>Changes made on the Settings Page are automatically saved. You do not need to perform any additional actions to save your changes.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. Can I access additional settings or configurations on the Settings Page?</h1>
                        </li>
                        <li>The Settings Page primarily focuses on leave type management. If you need access to additional settings or configurations, you may need to explore other sections or functionalities within the Engineering Club system.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. What do I do if I encounter an error or have specific questions regarding the Settings Page?</h1>
                        </li>
                        <li>If you encounter errors or have specific questions about the Settings Page or leave type management, please contact your organization's support team or administrator for assistance.</li>
                    </ul>
                    <asp:Panel ID="Panel20" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/Settings.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>


        <!-- Add Team Chat Category and Subcategories -->
        <asp:Panel ID="pnlTeamChat" CssClass="category-dropdown" runat="server">
            <asp:Button ID="btnTeamChat" CssClass="category-button" runat="server" Text="Team Chat ▼" OnClientClick="return false;" />
            <div class="category-content" runat="server">
                <asp:Button ID="btnTeamChatFAQ" CssClass="subcategory-button" runat="server" Text="Team Chat FAQ ▼" OnClientClick="return false;" />
                <div class="subcategory-content" runat="server">
                    <ul class="faq-list">
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">1. What is the purpose of the "Team Page" in Engineering Club?</h1>
                        </li>
                        <li>The "Team Page" in Engineering Club provides a platform for team members to communicate and collaborate in real-time through a chat interface. It allows team members to exchange messages, making it easier to coordinate and work together.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">2. How do I access the "Team Page"?</h1>
                        </li>
                        <li>You can access the "Team Page" by logging into the Engineering Club system and navigating to the page. Typically, it can be found in the system's menu or dashboard.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">3. What can I do on the "Team Page"?</h1>
                        </li>
                        <li>On the "Team Page," you can do the following:</li>
                        <ul>
                            <li>Send and receive chat messages with your team members.</li>
                            <li>View a list of online employees on the right-hand side.</li>
                            <li>Participate in discussions and collaborate with your team.</li>
                        </ul>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">4. How do I send a message on the "Team Page"?</h1>
                        </li>
                        <li>To send a message on the "Team Page," follow these steps:</li>
                        <ul>
                            <li>Type your message in the "Type your message..." input field.</li>
                            <li>Click the "Send" button.</li>
                            <li>Your message will be sent to the team chat, and other team members can see it.</li>
                        </ul>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">5. How do I view messages in the chat?</h1>
                        </li>
                        <li>Messages in the chat are displayed in the main chat window on the left-hand side. You can scroll through the chat to view previous messages.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">6. What do the message colors indicate in the chat?</h1>
                        </li>
                        <li>Messages may have different colors to distinguish between sent and received messages. Sent messages are typically in one color, while received messages are in another color. The specific colors may vary based on your organization's configuration.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">7. Can I see who is online on the "Team Page"?</h1>
                        </li>
                        <li>Yes, you can see a list of online employees on the right-hand side of the page. This list displays the names of employees who are currently active and available for chat.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">8. How can I contact a specific team member in the chat?</h1>
                        </li>
                        <li>To contact a specific team member, you can simply type your message in the chat input field, and it will be visible to all team members. If you need to have a private conversation, you may need to explore additional features or initiate a private chat if supported by the system.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">9. Can I access previous chat messages or a chat history?</h1>
                        </li>
                        <li>Yes, you can access previous chat messages by scrolling up in the chat window. The chat typically retains a history of messages sent during the current session.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">10. Is there a limit to the number of messages I can send on the "Team Page"?</h1>
                        </li>
                        <li>The number of messages you can send may depend on your organization's policies or system configuration. There may be message size limits or other restrictions in place.</li>
                        <li style="background-color: darkblue;">
                            <h1 style="color: aliceblue;">11. What do I do if I encounter an issue or have specific questions about the "Team Page"?</h1>
                        </li>
                        <li>If you encounter issues or have specific questions related to the "Team Page" or chat functionality, please reach out to your organization's support team or administrator for assistance.</li>
                    </ul>
                    <asp:Panel ID="Panel21" CssClass="category-dropdown" runat="server">
                        <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
                            <video width="640" height="360" controls>
                                <source src="VideoTutorials/TeamChat.MP4" type="video/mp4">
                            </video>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </asp:Panel>


        <!-- Add Team Chat FAQ Questions and Answers -->

        <!-- Repeat the structure for other categories and subcategories -->

        <!-- Rest of the content and styling remains the same -->

        <!-- Repeat the above structure for other categories and subcategories -->

        <style>
            /* Reset default styles and apply some basic styling */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5; /* Add a background color */
            }

            .faq-container {
                max-width: 800px;
                margin: 0 auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Add a subtle box shadow */
                border-radius: 5px; /* Add rounded corners */
            }

            h1 {
                font-size: 24px;
                font-weight: bold;
                color: #2507B3;
                margin-bottom: 20px;
            }

            .category-dropdown {
                margin-bottom: 20px;
                border: 1px solid #ddd; /* Add a border to the dropdown */
                border-radius: 5px; /* Add rounded corners */
                overflow: hidden; /* Hide overflowing content */
            }

            .category-button, .subcategory-button {
                background: none;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 10px;
                cursor: pointer;
                padding: 10px 15px; /* Increase padding for better clickability */
                font-size: 18px;
                color: #333;
                display: block;
                width: 100%;
                text-align: left;
                transition: color 0.3s; /* Add smooth color transition on hover */
            }

                .category-button:hover, .subcategory-button:hover {
                    color: #2507B3;
                }

            .category-content, .subcategory-content {
                display: none;
                padding: 10px; /* Add padding to content for better readability */
            }

            .subcategory-button {
                background: none;
                border: none;
                cursor: pointer;
                padding: 10px 15px;
                font-size: 18px;
                color: #333;
                display: block;
                width: 100%;
                text-align: left;
                transition: color 0.3s;
            }

                .subcategory-button:hover {
                    color: #2507B3;
                }

            .faq-list {
                list-style-type: none;
                margin-top: 10px;
            }

                .faq-list li {
                    margin-bottom: 10px;
                    background-color: #4BA3E2; /* Background color for the buttons */
                    color: #fff; /* Text color */
                    border: none;
                    border-radius: 5px;
                    padding: 15px 20px;
                    cursor: pointer;
                    transition: background-color 0.3s;
                }

                    .faq-list li:hover {
                        background-color: #333; /* Darker background on hover */
                    }

            .faq-answer {
                background-color: darkblue !important;
                color: white !important; /* Change text color for better visibility on dark blue */
                text-align: left !important;
                padding: 10px !important;
                margin: 10px 0 !important;
                border-radius: 5px !important; /* Add rounded corners for better visual appeal */
            }

            .download-panel {
                margin: 10px;
                text-align: center; /* Centers the button in the panel */
            }

            .download-button {
                display: inline-block;
                padding: 10px 20px;
                margin: 5px;
                color: #fff; /* White text color */
                background-color: #007bff; /* Bootstrap primary color, you can choose any color you like */
                border: none;
                border-radius: 5px; /* Rounded corners */
                text-decoration: none;
                font-size: 16px;
                transition: background-color 0.3s ease; /* Smooth transition for hover effect */
                cursor: pointer; /* Changes the cursor to signify that it's clickable */
            }

                .download-button:hover,
                .download-button:focus {
                    background-color: #0056b3; /* Darker shade when hovered or focused */
                    text-decoration: none; /* Ensures that the text doesn't get underlined on hover */
                    color: #fff; /* Keeps the text white when hovered or focused */
                }

                /* You can also add styles for the button when it's active or clicked */
                .download-button:active {
                    background-color: #004080;
                    transition: background-color 0.1s ease; /* Faster transition for active state */
                }
        </style>


        <script>
            // Get all category buttons and subcategory buttons
            const categoryButtons = document.querySelectorAll(".category-button");
            const subcategoryButtons = document.querySelectorAll(".subcategory-button");

            // Add click event listeners to category buttons
            categoryButtons.forEach(button => {
                button.addEventListener("click", toggleCategoryContent);
            });

            // Add click event listeners to subcategory buttons
            subcategoryButtons.forEach(button => {
                button.addEventListener("click", toggleSubcategoryContent);
            });

            // Function to toggle category content
            function toggleCategoryContent(event) {
                const content = event.target.nextElementSibling;
                content.style.display = content.style.display === "block" ? "none" : "block";
            }

            // Function to toggle subcategory content
            function toggleSubcategoryContent(event) {
                const content = event.target.nextElementSibling;
                content.style.display = content.style.display === "block" ? "none" : "block";
            }
        </script>
</asp:Content>


