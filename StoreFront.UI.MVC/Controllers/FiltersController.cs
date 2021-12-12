using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;
using PagedList;


namespace StoreFront.UI.MVC.Controllers
{
    public class FiltersController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();
        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }//end Index

        public ActionResult ProductNameQS(string searchFilter)
        {
            if (String.IsNullOrEmpty(searchFilter))
            {
                var product = db.Products;
                return View(product.ToList());
            }
            else
            {
                string searchUpCase = searchFilter.ToUpper();
                List<Product> searchResults = db.Products.Where(p => p.ProductName.ToUpper().Contains(searchUpCase)).ToList();
                return View(searchResults);
            }
        }

            public ActionResult ProductPaging(string searchString, int page= 1)
            {
            int pagesize = 5;
            var products = db.Products.OrderBy(p => p.ProductName).ToList();
            if (!String.IsNullOrEmpty(searchString))
            {
                products = (
                    from p in products
                    where p.ProductName.ToLower().Contains(searchString.ToLower())
                    select p).ToList();
            }

            ViewBag.SearchString = searchString;
            return View(products.ToPagedList(page, pagesize));      
            }
    }
}