using Harmic.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Harmic.Controllers
{
    public class BlogController : Controller
    {
        private readonly HarmicContext _context;
        public BlogController(HarmicContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }

        [Route("/blog/{alias}-{id}.html")]

        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.TbBlogs == null)
            {
                return NotFound();
            }

            var blog = await _context.TbBlogs.Include(m => m.TbBlogComments).Where(m=>m.BlogId == id).FirstOrDefaultAsync(m => m.BlogId == id);

            if (blog == null)
            {
                return NotFound();
            };

            return View(blog);
        }

        [HttpPost]
        public IActionResult Comment(TbBlogComment blogComment, string aliasblog)
        {
            blogComment.CreatedDate = DateTime.Now;
            blogComment.IsActive = true;
            _context.Add(blogComment);
            _context.SaveChanges(); 

            string url = $"/blog/{aliasblog}-{blogComment.BlogId}.html";
            return Redirect(url);
        }
    }
}
