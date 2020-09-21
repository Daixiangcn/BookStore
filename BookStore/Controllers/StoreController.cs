using BookStore.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BookStore.Controllers
{
    public class StoreController : Controller
    {
        ICategoryRepository _categoryRepository;
        public StoreController() {
            _categoryRepository = new CategoryRepository();
        }
        // GET: Store
        public ActionResult Index()
        {
            // 获取所有种类
            return View(_categoryRepository.GetAllCategories());
        }
        // GET: Store/Browse
        public ActionResult Browse(int id) {
            // 根据类别ID 获取书籍
            return View(_categoryRepository.GetCategoriesById(id));
        }

        public ActionResult Details(int id) {
            // 根据书籍ID获取书籍详细内容
            return View(_categoryRepository.GetBooksById(id));
        }
    }
}
