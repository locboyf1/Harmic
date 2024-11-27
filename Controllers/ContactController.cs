<<<<<<< HEAD
﻿using Harmic.Models;
using Microsoft.AspNetCore.Mvc;

namespace Harmic.Controllers
{
    public class ContactController : Controller
    {
        private readonly HarmicContext _context;

        public ContactController(HarmicContext context)
        {
            _context = context;
        }
=======
﻿using Microsoft.AspNetCore.Mvc;

namespace CarRental.Controllers
{
    public class ContactController : Controller
    {
>>>>>>> e65970a8c5da85161122fc0bdbc0681f49337f2d
        public IActionResult Index()
        {
            return View();
        }
<<<<<<< HEAD

        [HttpPost]
        public IActionResult Create(string name, string phone, string email, string message)
        {
            try
            {
                TbContact contact = new TbContact();
                contact.Name = name;
                contact.Phone = phone;
                contact.Email = email;
                contact.Message = message;
                contact.CreatedDate = DateTime.Now;
                _context.Add(contact);
                _context.SaveChanges();
                return Json(new { status = true });
            }
            catch
            {
                return Json(new { status = false });
            }
        }
=======
>>>>>>> e65970a8c5da85161122fc0bdbc0681f49337f2d
    }
}
