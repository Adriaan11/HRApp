<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SchedulingWeekView.aspx.cs" Inherits="EngineeringClubHR.SchedulingWeekView" %>
<%@ Register TagPrefix="daypilot" Namespace="DayPilot.Web.Ui" Assembly="DayPilot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Content/calendar_blue.css" rel="stylesheet" type="text/css" />

        <div class="calendarButtons mb-5">
            <div class="row align-items-center">
                <div class="col-auto">
                    <a href="javascript:dpc1.commandCallBack('previous');" class="btn btn-primary">Previous</a>
                </div>
                |
                <div class="col-auto">
                    <a href="javascript:dpc1.commandCallBack('next');" class="btn btn-primary">Next</a>
                </div>
                |
                <div class="col-auto">
                    <a href="javascript:dpc1.commandCallBack('today');" class="btn btn-primary">Today</a>
                </div>
                <div class="col"></div>
                <div class="col-auto d-flex justify-content-end">
                    <div class="btn-group" role="group" aria-label="ButtonsCalendarView">
                        <a href="CalendarMonths.aspx" class="btn btn-secondary">Month View</a>
                        <a href="CreateSchedule.aspx" class="btn btn-secondary">Create</a>
                    </div>
                </div>
            </div>
        </div>

    <div>
        <h2 id="todaysDate" class="">
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

               <DayPilot:DayPilotCalendar 
                   ID="DayPilotCalendar1" 
                   runat="server" 
                   CellDuration="30" 
                   ViewType="Week"
                   Shadow="Fill" 
                   DataValueField="scheduleID" 
                   DataTextField="taskDescription"
                   DataIdField="scheduleID" 
                   DataEndField="endDate"
                   DataStartField="startDate"
                   Days="7"
                   ClientObjectName="dpc1"
                   DataTagFields="taskDescription, scheduleID"
                   EventClickingHandling="Bubble"

                   TimeRangeSelectedHandling="JavaScript"
                   TimeRangeSelectedJavaScript="timeRangeSelected(start, end, resource)"
                   
                   Theme="calendar_blue"

                   BubbleID="DayPilotBubble1" 
                    ShowToolTip="false" 
                    EventStartTime="true" 
                    EventEndTime="true" 
                   OnCommand="DayPilotCalendar1_Command"

                   EventResizeHandling="CallBack" 
                   >



               </DayPilot:DayPilotCalendar>

           
</asp:Content>