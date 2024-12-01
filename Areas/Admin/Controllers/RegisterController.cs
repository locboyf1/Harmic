using Harmic.Models;
using Harmic.Utilities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;

namespace Harmic.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class RegisterController : Controller
    {
        private readonly HarmicContext _context;

        public RegisterController(HarmicContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(TbAccount account, string? repassword, bool? terms)
        {
            if (account == null)
            {
                return NotFound();
            }
            var check = _context.TbAccounts.Where(i => i.Email == account.Email).FirstOrDefault();
            if (check != null)
            {
                Function._Message = "Email đã tồn tại trong hệ thống";
                return RedirectToAction("Index", "Register");
            }
            if (repassword != account.Password)
            {
                Function._Message = "Mật khẩu và mật khẩu nhập lại phải giống nhau";
                return RedirectToAction("Index", "Register");
            }
            if (terms == false)
            {
                Function._Message = "Phải chấp nhận điều khoản";
                return RedirectToAction("Index", "Register");
            }
            Function._Message = string.Empty;
            account.Password = Function.md5password(account.Password);
            _context.TbAccounts.Add(account);
            _context.SaveChanges();

            return RedirectToAction("Index", "Login");
        }
    }
}
