<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ViewGrievance.aspx.cs" Inherits="EngineeringClubHR.ViewGrievance" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        /* Styles for the form */
        .grievance-form {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-title {
            font-size: 24px;
            font-weight: bold;
            color: #2507B3;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-field {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            font-weight: bold;
            color: #333;
            margin-bottom: 5px;
        }

        .form-input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .form-textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
            resize: vertical;
        }

        .form-submit {
            background-color: #2507B3;
            color: #fff;
            cursor: pointer;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

            .form-submit:hover {
                background-color: #1b0566;
            }

        .no-data {
            text-align: center;
            font-size: 18px;
            color: #888;
        }

        /* Styles for Grievance Logs */
        .log-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .log-container:hover {
                background-color: #f0f0f0;
            }

        .log-content {
            flex-grow: 1;
            padding-right: 10px;
        }

        .log-date {
            font-size: 14px;
            color: #333;
            flex-grow: 1;
        }

        .log-description-short {
            font-size: 14px;
            color: #555;
        }

        .edit-log-button {
            background-color: #2507B3;
            color: #fff;
            border: none;
            border-radius: 4px;
            padding: 5px 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

            .edit-log-button:hover {
                background-color: #1b0566;
            }

        .log-popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .log-popup-content {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            width: 60%; /* Adjust the width as needed */
            max-width: 800px; /* Set a maximum width if desired */
            height: 80vh; /* Adjust the height as a percentage of the viewport height */
            overflow: auto; /* Add a scrollbar if content overflows the height */
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
        }

        .log-description-full {
            font-size: 14px;
            color: #333;
            flex-grow: 3;
        }

        .close-popup-button {
            background-color: #2507B3;
            color: #fff;
            cursor: pointer;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

            .close-popup-button:hover {
                background-color: #1b0566;
            }
    </style>
    <script>


        // Function to open the log popup and display full description
        function openLogPopup(logDate, logDescription) {
            // Create a popup element
            const popup = document.createElement("div");
            popup.className = "log-popup";
            popup.innerHTML = `
                     <div class="log-popup-content">
                        <div class="log-date">Log Date: ${logDate}</div>
                        <div class="log-description-full">Log Desciption: ${logDescription}</div>
                        <button class="close-popup-button" onclick="closeLogPopup(event);">Close</button>
                    </div>
                `;

            // Append the popup to the page
            document.body.appendChild(popup);
        }
        // Function to close the log popup
        function closeLogPopup(event) {
            const popup = document.querySelector(".log-popup");
            if (popup) {
                popup.remove();
            }
        }

        function openEditLogPopup(logID, logDescription) {
            // Create a popup element
            const popup = document.createElement("div");
            popup.className = "log-popup";
            popup.innerHTML = `
                    <div class="log-popup-content">
                        <div class="log-description-full">
                            <textarea id="logDescription" class="form-textarea">${logDescription}</textarea>
                        </div>
                        <button class="form-submit" onclick="saveLogChanges(${logID});">Save</button>
                        <button class="close-popup-button" onclick="closeLogPopup();">Close</button>
                    </div>
                `;

            // Append the popup to the page
            document.body.appendChild(popup);
        }



        function saveLogChanges(logID) {
            const newLogDescription = document.getElementById("logDescription").value;
            // You can send an AJAX request to update the description in the database.
            // Be sure to include the logID and newLogDescription in your request.
            // After saving the changes, you can update the UI.
            // For simplicity, we'll just update the UI here.
            // Find the log element and update the description.
            const logElement = document.querySelector(`[data-log-id="${logID}"]`);
            if (logElement) {
                const descriptionElement = logElement.querySelector(".log-description-short");
                if (descriptionElement) {
                    descriptionElement.textContent = newLogDescription;
                }
            }
            closeLogPopup();
        }

        document.addEventListener("DOMContentLoaded", function () {
            // Select all edit buttons
            const editButtons = document.querySelectorAll('.edit-log-button');

            // Attach click event listener to each button
            editButtons.forEach(function (button) {
                button.addEventListener('click', function (event) {
                    // Prevent event propagation if needed
                    event.stopPropagation();

                    // Get the LogID from the data attribute
                    const logID = event.currentTarget.getAttribute('data-log-id');

                    // Navigate to the edit page
                    window.location.href = `EditGrievanceLog.aspx?GrievanceLogId=${logID}`;
                });
            });
        });

    </script>



    <div class="container text-center mt-5">
        <div class="row">
            <div class="col">
                <h1 class="text-dark my-3 text-center">
                    <img src="Pictures/New Icons/bad.png" style="width: 50px; height: 50px; margin-right: 20px;" />View Grievance
                </h1>
            </div>
        </div>
        <div class="row mt-5">
            <div class="col">
                <div class="grievance-form">
                    <h2 class="form-title">Grievance Details</h2>
                    <div class="form-field">
                        <asp:Label ID="LabelGrievanceTitle" runat="server" CssClass="form-label"></asp:Label>
                    </div>
                    <div class="form-field">
                        <asp:Label ID="LabelGrievanceDetails" runat="server" CssClass="form-label"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div id="NoLogsAvailable" runat="server" class="no-data" style="display: none;">
            <p>No Logs Available</p>
        </div>

        <div class="row mt-5">
            <div class="col">
                <div class="grievance-form">
                    <h2 class="form-title">Grievance Logs</h2>
                    <asp:Repeater ID="RepeaterGrievanceLogs" runat="server">
                        <ItemTemplate>
                            <div class="log-container" onclick='openLogPopup("<%# Eval("LogDate", "{0:yyyy-MM-dd HH:mm:ss}") %>", "<%# Eval("LogDescription") %>");'>
                                <div class="log-content">
                                    <div class="log-date">Log Date: <%# Eval("LogDate", "{0:yyyy-MM-dd HH:mm:ss}") %></div>
                                    <div class="log-description-short" data-log-id='<%# Eval("LogID") %>'><%# Eval("LogDescription") %></div>
                                </div>

                                <%--<button class="edit-log-button" onclick="event.stopPropagation(); window.location.href = 'EditGrievanceLog.aspx?GrievanceLogId=<%# Eval("LogID") %>';">Edit</button>--%>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="no-data" runat="server">
                        <p>No Logs Available.</p>
                    </div>
                </div>
            </div>
            </div>
        </div>
</asp:Content>
