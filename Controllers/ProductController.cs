using Harmic.Models;
using Harmic.Utilities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Harmic.Controllers
{
    public class ProductController : Controller
    {
        private readonly HarmicContext _context;

        public ProductController(HarmicContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult addCart(int id, int Quantity, string alias)
        {
            if (id == null || _context.TbProducts == null)
            {
                return NotFound();
            }

            TbCart miniCart = new TbCart();
            miniCart.IdProduct = id;
            miniCart.Quantity = Quantity;
            miniCart.IdCustomer = Function._CustomerId;
            _context.Add(miniCart);
            _context.SaveChanges();
            string url = $"/product/{alias}-{id}.html";
            return Redirect(url);

        }

        [Route("/product/{alias}-{id}.html")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.TbProducts == null)
            {
                return NotFound();
            }
            var product = await _context.TbProducts.Include(i=>i.TbProductReviews).Include(i => i.CategoryProduct).FirstOrDefaultAsync(m => m.ProductId == id);
            if (product == null)
            {
                return NotFound();
            }
            ViewBag.productReview = _context.TbProductReviews.Where(i => i.ProductId == id && i.IsActive).ToList();
            ViewBag.productRelated = _context.TbProducts.Where(i => i.ProductId != id && i.CategoryProductId == product.CategoryProductId).Take(5).OrderByDescending(i => i.ProductId).ToList();
            return View(product);
        }
    }
}
