using Syncfusion.Licensing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace EngineeringClubHR
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            SyncfusionLicenseProvider.RegisterLicense("Mgo+DSMBaFt/QHRqVVhkWFpFdEBBXHxAd1p/VWJYdVt5flBPcDwsT3RfQF5jQX1SdkFgX39ddX1WRg==");
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}