using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BookStore.Models
{
    public interface ICategoryRepository
    {
        // 获取所有类型
        IList<Categories> GetAllCategories();
        // 根据类别ID获取类别并包含书籍
        Categories GetCategoriesById(int id);
        // 根据ID获取书籍
        Books GetBooksById(int id);
    }
}
