using Harmic.Models;
using Harmic.Utilities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Harmic.Controllers
{
    public class CartController : Controller
    {
        private readonly HarmicContext _context;

        public CartController(HarmicContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            if (!Function.CustomerIsLogin())
            {

                return RedirectToAction("Index", "Login");
            }
            var cartItems = _context.TbCarts.Where(c => c.IdCustomer == Function._CustomerId).Include(i => i.IdProductNavigation).ToList();

            int TotalPrice = 0;
            foreach (var item in cartItems)
            {

                if (item.IdProductNavigation.PriceSale == 0)
                {
                    TotalPrice += (int)(item.IdProductNavigation.Price * item.Quantity);
                }
                else
                {
                    TotalPrice += (int)(item.IdProductNavigation.PriceSale * item.Quantity);

                }
            }

            ViewBag.TotalPrice = TotalPrice;

            return View(cartItems);
        }

        public async Task<IActionResult> AddToCart(int productId, int quantity = 1)
        {
            if (!Function.CustomerIsLogin())
            {
                return await Task.FromResult<IActionResult>(RedirectToAction("Index", "Login"));
            }
            var existingCartItem = _context.TbCarts.FirstOrDefault(c => c.IdProduct == productId && c.IdCustomer == Function._CustomerId);
            if (existingCartItem != null)
            {
                existingCartItem.Quantity += quantity;
                _context.Update(existingCartItem);
            }
            else
            {
                var newCartItem = new TbCart
                {
                    IdProduct = productId,
                    IdCustomer = Function._CustomerId,
                    Quantity = quantity
                };
                _context.TbCarts.Add(newCartItem);
            }
            _context.SaveChanges();
            return await Task.FromResult<IActionResult>(RedirectToAction("Index"));
        }

        public async Task<IActionResult> RemoveFromCart(int cartId)
        {
            if (!Function.CustomerIsLogin())
            {
                return await Task.FromResult<IActionResult>(RedirectToAction("Index", "Login"));
            }
            var cartItem = await _context.TbCarts.FindAsync(cartId);
            if (cartItem != null && cartItem.IdCustomer == Function._CustomerId)
            {
                _context.TbCarts.Remove(cartItem);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction("Index");

        }

        public async Task<IActionResult> ChangeQuantity(int cartId, int quantity)
        {
            if (!Function.CustomerIsLogin())
            {
                return await Task.FromResult<IActionResult>(RedirectToAction("Index", "Login"));
            }
            var cartItem = await _context.TbCarts.FindAsync(cartId);
            if (cartItem != null && cartItem.IdCustomer == Function._CustomerId)
            {
                cartItem.Quantity = quantity;
                _context.Update(cartItem);
                await _context.SaveChangesAsync();
            }
            return RedirectToAction("Index");
        }
    }
}
