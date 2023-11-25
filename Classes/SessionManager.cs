using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EngineeringClubHR.Classes
{
    public class SessionManager
    {
        private static SessionManager _instance;

        public static SessionManager Instance
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new SessionManager();
                }
                return _instance;
            }
        }

        public List<WorkflowDto> WorkFlowList
        {
            get
            {
                return HttpContext.Current.Session["workFlowList"] as List<WorkflowDto>;
            }
            set
            {
                HttpContext.Current.Session["workFlowList"] = value;
            }
        }
    }
}