using Harmic.Models;
using Harmic.Utilities;
using Microsoft.AspNetCore.Mvc;

namespace Harmic.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class LoginController : Controller
    {
        public readonly HarmicContext _context;
        public LoginController(HarmicContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(TbAccount account)
        {
            if (account == null)
            {
                return NotFound();
            }
            if(string.IsNullOrEmpty(account.Email) || string.IsNullOrEmpty(account.Password))
            {
                Function._Message = "Phải nhập đủ trường";
                return RedirectToAction("Index", "Login");
            }
            string password = Function.md5password(account.Password);
            var check = _context.TbAccounts.Where(i => (i.Password == password) && (i.Email == account.Email)).FirstOrDefault();
            if (check == null)
            {
                Function._Message = "Sai email hoặc mật khẩu";
                return RedirectToAction("Index", "Login");
            }

            Function._AccountId = check.AccountId;
            Function._Message = string.Empty;
            Function._Email = check.Email;
            Function._FullName = check.FullName;

            return RedirectToAction("Index", "Home");
        }
    }
}
