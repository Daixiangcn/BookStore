using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class CategoryRepository: ICategoryRepository
    {
        // 获取所有类型
        public IList<Categories> GetAllCategories() {
            using (Models.MvcBookStoreEntities db= new MvcBookStoreEntities()) {
                return db.Categories.ToList();
            }
        }
        // 根据类别ID获取类别并包含书籍
        public Categories GetCategoriesById(int id) {
            using (Models.MvcBookStoreEntities db = new MvcBookStoreEntities()) {
                return db.Categories.Include("Books").Single(c=>c.CategoryId == id);
            }
        }
        // 根据ID获取书籍
        public Books GetBooksById(int id) {
            using (Models.MvcBookStoreEntities db = new MvcBookStoreEntities()) {
                return db.Books.Include("Categories").Single(b=>b.BookId == id);
            }
        }
    }
}