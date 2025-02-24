using Microsoft.AspNetCore.Mvc;
using MyDotNetApp.Models;

namespace MyDotNetApp.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            var message = new MessageModel { Text = "Hello from .NET Core!" };
            return View(message);
        }
    }
}
