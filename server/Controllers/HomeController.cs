using System.IO;
using Microsoft.AspNetCore.Mvc;

namespace server.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            string file = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "index.html");
            return PhysicalFile(file, "text/html");
        }
    }
}
