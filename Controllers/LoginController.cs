using Harmic.Models;
using Harmic.Utilities;
using Microsoft.AspNetCore.Mvc;

namespace Harmic.Controllers
{
    public class LoginController : Controller
    {
        private static HarmicContext _context;

        public LoginController(HarmicContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Index(TbCustomer customer)
        {

            if (customer == null)
            {
                return NotFound();
            }
            if (string.IsNullOrEmpty(customer.Email) || string.IsNullOrEmpty(customer.Password)) {
                Function._CustomerMessage = "Vui lòng nhập đủ các trường";
                return View();
            }
            string password = Function.md5password(customer.Password);
            var check = _context.TbCustomers.Where(i=>(i.Email == customer.Email) &&(i.Password == password)).FirstOrDefault();
            if(check == null)
            {
                Function._CustomerMessage = "Sai thông tin đăng nhập";
                return View(); 
            }
            Function._CustomerId = check.CustomerId;
            Function._CustomerFullname = check.Username;
            Function._CustomerMessage = string.Empty;
            Function._CustomerEmail = check.Email;

            return RedirectToAction("Index", "Home");
        }


    }
}
