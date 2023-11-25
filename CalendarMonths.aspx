<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CalendarMonths.aspx.cs" Inherits="EngineeringClubHR.CalendarMonths" %>
<%@ Register TagPrefix="daypilot" Namespace="DayPilot.Web.Ui" Assembly="DayPilot" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/month_blue.css" rel="stylesheet" type="text/css" />
    <style>
    .calendarButtons{
        margin:10px;
    }
    </style>





    <div class="calendarButtons mb-4">
    <div class="row align-items-center">
        <div class="col-auto">
            <a href="javascript:dpm.commandCallBack('previous');" class="btn btn-primary">Previous</a>
        </div>
        |
        <div class="col-auto">
            <a href="javascript:dpm.commandCallBack('next');" class="btn btn-primary">Next</a>
        </div>
        <div class="col"></div>
        <div class="col-auto d-flex justify-content-end">
            <div class="btn-group" role="group" aria-label="ButtonsCalendarView">
                <a href="SchedulingWeekView.aspx" class="btn btn-secondary">Week View</a>
                <a href="CreateSchedule.aspx" class="btn btn-secondary">Create</a>
            </div>
        </div>
    </div>
</div>

    <div>
        <h2 id="todaysDate" class="mb4">
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    var todaysDate = new Date();
                    var monthNames = [
                        "January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"
                    ];

                    var day = todaysDate.getDate();
                    var month = monthNames[todaysDate.getMonth()];
                    var year = todaysDate.getFullYear();

                    var formattedDate = month + " " + day + ", " + year;

                    document.getElementById("todaysDate").textContent = formattedDate;
                });
            </script>
        </h2>
    </div>



                       <DayPilot:DayPilotMonth Visible="true"
                    ID="DayPilotMonth1" 
                    runat="server" 
                    Shadow="Fill"
                    DataStartField="startDate" 
                    DataEndField="endDate"
                    DataValueField="scheduleID" 
                    DataTextField="taskDescription" 
                    DataIdField="scheduleID" 
                    DataTagFields="taskDescription, scheduleID,TypeOfTask"  
                    EventClickHandling="Bubble"
                    EventClickJavaScript="alert(e.text());" 
                    ContextMenuID="DayPilotMenu1" 
                     Theme="month_blue"
                    ClientObjectName="dpm" 
                    EventMoveHandling="CallBack"
                  
                    Width="100%" 
                   
                    EventResizeHandling="CallBack" 
                     
                   
                    TimeRangeSelectedHandling="JavaScript" 
                 
                    BubbleID="DayPilotBubble1" 
                    ShowToolTip="false" 
                    EventStartTime="false" 
                    EventEndTime="false" 
                    OnCommand="DayPilotMonth1_Command" 
                    
                    OnBeforeCellRender="DayPilotMonth1_BeforeCellRender" 
                    OnEventClick="DayPilotMonth1_EventClick" 
                    ContextMenuSelectionID="DayPilotMenuSelection"
                  
                   
                 
                    TimeRangeDoubleClickHandling="JavaScript"
                    TimeRangeDoubleClickJavaScript="alert('doubleclick:' + start)"
                  
                    >
                </DayPilot:DayPilotMonth>
</asp:Content>
