using Harmic.Utilities;
using Microsoft.AspNetCore.Mvc;

namespace Harmic.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            if (Function.isLogin())
            {
                return View();
            }
            return RedirectToAction("Index", "Login");
        }

        public IActionResult Logout()
        {
            Function._FullName = string.Empty;
            Function._Message = string.Empty;
            Function._Email = string.Empty;
            Function._AccountId = 0;
            return RedirectToAction("Index", "Login");
        }
    }
}
