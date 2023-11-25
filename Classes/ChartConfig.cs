using Microsoft.Ajax.Utilities;
using Syncfusion.JavaScript.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Windows.Media;


namespace EngineeringClubHR.Classes
{
    public static class ChartConfig
    {
        private static ChartDataWrapper ManagerFilterByAT(List<WorkflowDto> workFlowList)//1
        {
            var result = workFlowList
                    .GroupBy(record => new { record.ManagerFullName, record.ApplicationType })
                    .Select(group => new
                    {
                        group.Key.ManagerFullName,
                        group.Key.ApplicationType,
                        ProcessCount = group.Count()
                    }).ToList();


            var seriesResult = result.GroupBy(x => x.ManagerFullName)
                .Select(z => new SeriesData
                {
                    Name = z.Key,
                    allSeries = z.GroupBy(record => record.ApplicationType)
                            .Select(p => new axesData
                            {
                                xName = p.Key,
                                yName = p.Sum(pp => pp.ProcessCount)
                            }).ToList()
                }).ToList();

            ChartDataWrapper chartDataWrapper = new ChartDataWrapper();
            chartDataWrapper.ChartType = "column";
            chartDataWrapper.SeriesDataList = seriesResult;
            return chartDataWrapper;


        }

        private static ChartDataWrapper ManagerFilterByDate(List<WorkflowDto> workFlowList)//2
        {
            string[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
            var d = DateTime.Now.ToString("MM/yyyy");
            int currentMonth = Int32.Parse(d.Substring(0, 2));
            int currentYear = Int32.Parse(d.Substring(3, 4));

            var filteredList = workFlowList //remove processes >1year old
                            .Where(record => record.ApplicationDate?.Month <= currentMonth
                             && record.ApplicationDate?.Year == currentYear
                             || record.ApplicationDate?.Month > currentMonth
                             && record.ApplicationDate?.Year == currentYear - 1).ToList();


            var result = filteredList
                        .GroupBy(record => new {
                            record.ManagerFullName,
                            MonthIndex = (record.ApplicationDate?.Month - 1) ?? -1
                        })
                    .Select(group => new
                    {
                        group.Key.ManagerFullName,
                        Month = group.Key.MonthIndex >= 0 ? months[group.Key.MonthIndex] : "Unknown",
                        ProcessCount = group.Count()
                    }).OrderBy(x => Array.IndexOf(months, x.Month) >= currentMonth - 1)
                      .ThenBy(x => Array.IndexOf(months, x.Month))
                      .ToList();




            var seriesResult = result.GroupBy(x => x.ManagerFullName)
                .Select(z => new SeriesData
                {
                    Name = z.Key,
                    allSeries = z.GroupBy(record => record.Month)
                            .Select(p => new axesData
                            {
                                xName = p.Key,
                                yName = p.Sum(pp => pp.ProcessCount)
                            }).ToList(),
                }).ToList();

            ChartDataWrapper chartDataWrapper = new ChartDataWrapper();
            chartDataWrapper.ChartType = "column";
            chartDataWrapper.SeriesDataList = seriesResult;
            return chartDataWrapper;
        }

        private static ChartDataWrapper EmployeeFilterByAT(List<WorkflowDto> workFlowList)//3
        {
            var result = workFlowList
                    .GroupBy(record => new { record.EmployeeFullName, record.ApplicationType })
                    .Select(group => new
                    {
                        group.Key.EmployeeFullName,
                        group.Key.ApplicationType,
                        ProcessCount = group.Count()
                    }).ToList();


            var seriesResult = result.GroupBy(x => x.EmployeeFullName)
                .Select(z => new SeriesData
                {
                    Name = z.Key,
                    allSeries = z.GroupBy(record => record.ApplicationType)
                            .Select(p => new axesData
                            {
                                xName = p.Key,
                                yName = p.Sum(pp => pp.ProcessCount)
                            }).ToList()
                }).ToList();

            ChartDataWrapper chartDataWrapper = new ChartDataWrapper();
            chartDataWrapper.ChartType = "column";
            chartDataWrapper.SeriesDataList = seriesResult;
            return chartDataWrapper;


        }

        private static ChartDataWrapper EmployeeFilterByDate(List<WorkflowDto> workFlowList)//4
        {
            string[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
            var d = DateTime.Now.ToString("MM/yyyy");
            int currentMonth = Int32.Parse(d.Substring(0, 2));
            int currentYear = Int32.Parse(d.Substring(3, 4));

            var filteredList = workFlowList //remove processes >1year old
                            .Where(record => record.ApplicationDate?.Month <= currentMonth
                             && record.ApplicationDate?.Year == currentYear
                             || record.ApplicationDate?.Month > currentMonth
                             && record.ApplicationDate?.Year == currentYear - 1).ToList();


            var result = filteredList
                        .GroupBy(record => new {
                            record.EmployeeFullName,
                            MonthIndex = (record.ApplicationDate?.Month - 1) ?? -1
                        })
                    .Select(group => new
                    {
                        group.Key.EmployeeFullName,
                        Month = group.Key.MonthIndex >= 0 ? months[group.Key.MonthIndex] : "Unknown",
                        ProcessCount = group.Count()
                    }).OrderBy(x => Array.IndexOf(months, x.Month) >= currentMonth - 1)
                      .ThenBy(x => Array.IndexOf(months, x.Month))
                      .ToList();


            var seriesResult = result.GroupBy(x => x.EmployeeFullName)
                 .Select(z => new SeriesData
                 {
                     Name = z.Key,
                     allSeries = z.GroupBy(record => record.Month)
                             .Select(p => new axesData
                             {
                                 xName = p.Key,
                                 yName = p.Sum(pp => pp.ProcessCount)
                             }).ToList(),
                 }).ToList();
            ChartDataWrapper chartDataWrapper = new ChartDataWrapper();
            chartDataWrapper.ChartType = "column";
            chartDataWrapper.SeriesDataList = seriesResult;
            return chartDataWrapper;

        }

        private static ChartDataWrapper SortEmployees(List<WorkflowDto> workFlowList)//5
        {
            var result = workFlowList
                    .GroupBy(record => new { record.EmployeeFullName })
                    .Select(group => new
                    {
                        group.Key.EmployeeFullName,
                        ProcessCount = group.Count()
                    }).OrderByDescending(x => x.ProcessCount)
                    .ToList();

            var seriesResult = result.GroupBy(x => x.EmployeeFullName)
                 .Select(z => new axesData
                 {
                     xName = z.Key,
                     yName = z.Sum(x => x.ProcessCount)
                 }).ToList();

            ChartDataWrapper chartDataWrapper = new ChartDataWrapper();
            chartDataWrapper.ChartType = "pie";
            chartDataWrapper.AxesDataList = seriesResult;
            return chartDataWrapper;

        }

        private static ChartDataWrapper SortManagers(List<WorkflowDto> workFlowList)//6
        {
            var result = workFlowList
                    .GroupBy(record => new { record.ManagerFullName })
                    .Select(group => new
                    {
                        group.Key.ManagerFullName,
                        ProcessCount = group.Count()
                    }).OrderByDescending(x => x.ProcessCount)
                    .ToList();

            var seriesResult = result.GroupBy(x => x.ManagerFullName)
                 .Select(z => new axesData
                 {
                     xName = z.Key,
                     yName = z.Sum(x => x.ProcessCount)
                 }).ToList();

            ChartDataWrapper chartDataWrapper = new ChartDataWrapper();
            chartDataWrapper.ChartType = "pie";
            chartDataWrapper.AxesDataList = seriesResult;
            return chartDataWrapper;

        }

        private static ChartDataWrapper SortAT(List<WorkflowDto> workFlowList)//7
        {
            var result = workFlowList
                    .GroupBy(record => new { record.ApplicationType })
                    .Select(group => new
                    {
                        group.Key.ApplicationType,
                        ProcessCount = group.Count()
                    }).OrderByDescending(x => x.ProcessCount)
                    .ToList();

            var seriesResult = result.GroupBy(x => x.ApplicationType)
                 .Select(z => new axesData
                 {
                     xName = z.Key,
                     yName = z.Sum(x => x.ProcessCount)
                 }).ToList();

            ChartDataWrapper chartDataWrapper = new ChartDataWrapper();
            chartDataWrapper.ChartType = "pie";
            chartDataWrapper.AxesDataList = seriesResult;
            return chartDataWrapper;

        }

        private static ChartDataWrapper SortDate(List<WorkflowDto> workFlowList)//8
        {
            string[] months = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
            var d = DateTime.Now.ToString("MM/yyyy");
            int currentMonth = Int32.Parse(d.Substring(0, 2));
            int currentYear = Int32.Parse(d.Substring(3, 4));

            var filteredList = workFlowList //remove processes >1year old
                            .Where(record => record.ApplicationDate?.Month <= currentMonth
                             && record.ApplicationDate?.Year == currentYear
                             || record.ApplicationDate?.Month > currentMonth
                             && record.ApplicationDate?.Year == currentYear - 1).ToList();

            var result = filteredList
             .GroupBy(record => new {
                 MonthIndex = (record.ApplicationDate?.Month - 1) ?? -1
             })
            .Select(group => new
            {
                Month = group.Key.MonthIndex >= 0 ? months[group.Key.MonthIndex] : "Unknown",
                ProcessCount = group.Count()
            }).ToList();


            var seriesResult = result.GroupBy(x => x.Month)
                 .Select(z => new axesData
                 {
                     xName = z.Key,
                     yName = z.Sum(x => x.ProcessCount)
                 }).ToList();

            ChartDataWrapper chartDataWrapper = new ChartDataWrapper();
            chartDataWrapper.ChartType = "pie";
            chartDataWrapper.AxesDataList = seriesResult;
            return chartDataWrapper;


        }

        public static ChartDataWrapper changeChart(int SelectedOption, List<WorkflowDto> workFlowList)
        {


            switch (SelectedOption)
            {
                case 1:
                    return ManagerFilterByAT(workFlowList);
                case 2:
                    return ManagerFilterByDate(workFlowList);
                case 3:
                    return EmployeeFilterByAT(workFlowList);
                case 4:
                    return EmployeeFilterByDate(workFlowList);
                case 5:
                    return SortEmployees(workFlowList);
                case 6:
                    return SortManagers(workFlowList);
                case 7:
                    return SortAT(workFlowList);
                case 8:
                    return SortDate(workFlowList);
                default:
                    return null;
            }




        }
    }
}