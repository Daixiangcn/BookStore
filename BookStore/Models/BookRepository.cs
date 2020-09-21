using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BookStore.Models
{
    public class BookRepository:IBookRepository
    {
        // 获取畅销书籍
        public IList<Books> GetTopSellingBooks(int count) {
            using (Models.MvcBookStoreEntities db = new MvcBookStoreEntities()) {
                return db.Books.Take(count).ToList();
            }
        }
        // 根据ID获取书籍
        public Books GetBookById(int id) {
            using (Models.MvcBookStoreEntities db = new MvcBookStoreEntities()) {
                return db.Books.Include("Categories").Single(b => b.BookId == id);
            }
        }
        // 根据ID删除书籍
        public void DeleteBookById(int id) {
            using (Models.MvcBookStoreEntities db = new MvcBookStoreEntities()) {
                Books book = db.Books.Single(b=>b.BookId==id);
                db.Books.DeleteObject(book);
                db.SaveChanges();
            }
        }
        // 更新书籍数据
        public void UpdateBook(Books book) {
            using (Models.MvcBookStoreEntities db = new MvcBookStoreEntities()) {
                db.Books.Attach(book);
                db.ObjectStateManager.ChangeObjectState(book,System.Data.EntityState.Modified);
                db.SaveChanges();
            }
        }
        // 添加新书籍
        public void AddToBokks(Books book) {
            using (Models.MvcBookStoreEntities db = new MvcBookStoreEntities()) {
                db.Books.AddObject(book);
                db.SaveChanges();
            }
        }
        // 获取全部书籍
        public IList<Books> GetAllBooks() {
            using (Models.MvcBookStoreEntities db = new MvcBookStoreEntities()) {
                return db.Books.Include("Categories").ToList();
            }
        }
    }
}