using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookStore.Models
{
    public interface IBookRepository
    {
        // 获取畅销书籍
        IList<Books> GetTopSellingBooks(int count);
        // 根据ID获取书籍
        Books GetBookById(int id);
        // 根据ID删除书籍
        void DeleteBookById(int id);
        // 更新书籍数据
        void UpdateBook(Books book);
        // 添加新书籍
        void AddToBokks(Books book);
        // 获取全部书籍
        IList<Books> GetAllBooks();
    }
}
