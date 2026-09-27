using System.Web.Mvc;
using System.Web.Routing;

namespace EmployeeManagementSystem
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            RouteTable.Routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new
                {
                    controller = "Employee",
                    action = "Index",
                    id = UrlParameter.Optional
                }
            );
        }
    }
}