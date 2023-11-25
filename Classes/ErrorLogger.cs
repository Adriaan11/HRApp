using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace EngineeringClubHR.Classes
{
    public class ErrorLogger
    {
        public static string ErrorDetails { get; private set; } // Store error details here
        public static void LogError(Exception ex, Page page)
        {
            // Log the error to a string
            ErrorDetails = $"Error Message: {ex.Message}\nStack Trace: {ex.StackTrace}";

            // Show a popup with the option to send an email
            string script = $@"
            var userChoice = window.confirm('An error occurred. Would you like to send an error report?');
            if(userChoice) {{
                window.location.href = 'mailto:gacroucamp@gmail.com?subject=Error Report&body=Error Message: {ex.Message}%0D%0AStack Trace: {ex.StackTrace}';
            }}
        ";
            ScriptManager.RegisterStartupScript(page, page.GetType(), "errorPopup", script, true);
        }
    }
}