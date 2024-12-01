using Harmic.Utilities;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Harmic.Models;

namespace Harmic.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class MenusController : Controller
    {
        private readonly HarmicContext _context;

        public MenusController(HarmicContext context)
        {
            _context = context;
        }

        // GET: Admin/Menus
        public async Task<IActionResult> Index()
        {
            if (Function.isLogin())
            {
                return View(await _context.TbMenus.ToListAsync());
            }
            return RedirectToAction("Index", "Login");
        }

        // GET: Admin/Menus/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (Function.isLogin())
            {
                if (id == null)
                {
                    return NotFound();
                }

                var tbMenu = await _context.TbMenus
                    .FirstOrDefaultAsync(m => m.MenuId == id);
                if (tbMenu == null)
                {
                    return NotFound();
                }

                return View(tbMenu);
            }
            return RedirectToAction("Index", "Login");

        }

        // GET: Admin/Menus/Create
        public IActionResult Create()
        {
            if (Function.isLogin())
            {
                return View();
            }
            return RedirectToAction("Index", "Login");
        }

        // POST: Admin/Menus/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MenuId,Title,Alias,Description,Levels,ParentId,Position,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy,IsActive")] TbMenu tbMenu)
        {
            if (Function.isLogin())
            {
                if (ModelState.IsValid)
                {
                    tbMenu.Alias = Harmic.Utilities.Function.TitleToAlias(tbMenu.Title);
                    _context.Add(tbMenu);
                    await _context.SaveChangesAsync();
                    return RedirectToAction(nameof(Index));
                }
                return View(tbMenu);
            }
            return RedirectToAction("Index", "Login");

        }

        // GET: Admin/Menus/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (Function.isLogin())
            {
                if (id == null)
                {
                    return NotFound();
                }

                var tbMenu = await _context.TbMenus.FindAsync(id);
                if (tbMenu == null)
                {
                    return NotFound();
                }
                return View(tbMenu);
            }
            return RedirectToAction("Index", "Login");

        }

        // POST: Admin/Menus/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MenuId,Title,Alias,Description,Levels,ParentId,Position,CreatedDate,CreatedBy,ModifiedDate,ModifiedBy,IsActive")] TbMenu tbMenu)
        {
            if (Function.isLogin())
            {
                if (id != tbMenu.MenuId)
                {
                    return NotFound();
                }

                if (ModelState.IsValid)
                {
                    try
                    {
                        _context.Update(tbMenu);
                        await _context.SaveChangesAsync();
                    }
                    catch (DbUpdateConcurrencyException)
                    {
                        if (!TbMenuExists(tbMenu.MenuId))
                        {
                            return NotFound();
                        }
                        else
                        {
                            throw;
                        }
                    }
                    return RedirectToAction(nameof(Index));
                }
                return View(tbMenu);
            }
            return RedirectToAction("Index", "Login");

        }

        // GET: Admin/Menus/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (Function.isLogin())
            {
                if (id == null)
                {
                    return NotFound();
                }

                var tbMenu = await _context.TbMenus
                    .FirstOrDefaultAsync(m => m.MenuId == id);
                if (tbMenu == null)
                {
                    return NotFound();
                }

                return View(tbMenu);
            }
            return RedirectToAction("Index", "Login");

        }

        // POST: Admin/Menus/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (Function.isLogin())
            {
                var tbMenu = await _context.TbMenus.FindAsync(id);
                if (tbMenu != null)
                {
                    _context.TbMenus.Remove(tbMenu);
                }

                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return RedirectToAction("Index", "Login");

        }

        private bool TbMenuExists(int id)
        {
            return _context.TbMenus.Any(e => e.MenuId == id);
        }
    }
}
