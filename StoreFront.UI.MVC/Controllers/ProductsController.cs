using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;
using StoreFront.UI.MVC.Utils;
using System.Drawing;
using StoreFront.UI.MVC.Models;

namespace StoreFront.UI.MVC.Controllers
{
    public class ProductsController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: Products
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.ProductType1).Include(p => p.Status);
            return View(products.ToList());
        }

        public ActionResult ProductGrid()
        {
            var products = db.Products.Include(p => p.ProductType1).Include(p => p.Status);
            return View(products.ToList());
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                //return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                return RedirectToAction("Unresolved", "Errors");
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        //AddToCart
        public ActionResult AddToCart(int qty, int productID)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = null;
            if (Session["cart"] != null)
            {
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            }
            else
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
            }

            Product product = db.Products.Where(p => p.ProductID == productID).FirstOrDefault();
            if (product == null)
            {
                return RedirectToAction("Index");
            }
            else
            {
                CartItemViewModel item = new CartItemViewModel(qty, product);
                if (shoppingCart.ContainsKey(product.ProductID))
                {
                    shoppingCart[product.ProductID].Qty += qty;
                }
                else
                {
                    shoppingCart.Add(product.ProductID, item);
                }
                Session["cart"] = shoppingCart;
            }
            return RedirectToAction("Index", "ShoppingCart");

        }
        [Authorize(Roles = ("Admin"))]
        // GET: Products/Create
        public ActionResult Create()
        {
            ViewBag.ProductType = new SelectList(db.ProductTypes, "TypeID", "ProductTypeName");
            ViewBag.StatusID = new SelectList(db.Status, "StatusID", "StatusName");
            return View();
        }
        [Authorize(Roles = ("Admin"))]
        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.       
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,ProductType,Price,UnitsSold,StatusID,ProductImage")] Product product, HttpPostedFileBase ProductImage)
        {
            if (ModelState.IsValid)
            {
                #region File Upload
                string file = "NoImage.png";
                if (ProductImage != null)
                {
                    file = ProductImage.FileName;
                    // checking extension of file
                    string ext = file.Substring(file.LastIndexOf("."));
                    //list of good extensions
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };
                    //check the extension against the list
                    if (goodExts.Contains(ext.ToLower()) && ProductImage.ContentLength <= 4194304)
                    {
                        //Create a new file name
                        file = Guid.NewGuid() + ext;

                        #region Resize Image and Save to server
                        string savePath = Server.MapPath("~/Content/imgstore/products/");
                        //Below we actually pass the data from the image to our program - Image Service that will find its dimensions and resize the image
                        Image convertedImage = Image.FromStream(ProductImage.InputStream);
                        //Set the MaxSize of our image here
                        int maxImageSize = 500;
                        //Set the thumbnail
                        int maxThumbSize = 100;
                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);
                        #endregion
                    }
                    //No matter what we will update the photo URL with the value of the file variable
                    product.ProductImage = file;

                }
                #endregion
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductType = new SelectList(db.ProductTypes, "TypeID", "ProductTypeName", product.ProductType);
            ViewBag.StatusID = new SelectList(db.Status, "StatusID", "StatusName", product.StatusID); return View(product);
        }

        [Authorize(Roles = ("Admin"))]
        // GET: Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductType = new SelectList(db.ProductTypes, "TypeID", "ProductTypeName", product.ProductType);
            ViewBag.StatusID = new SelectList(db.Status, "StatusID", "StatusName", product.StatusID);
            return View(product);
        }
        [Authorize(Roles = ("Admin"))]
        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,ProductType,Price,UnitsSold,StatusID,ProductImage")] Product product, HttpPostedFileBase productImage)
        {
            if (ModelState.IsValid)
            {
                string file = "NoImage.png";

                if (productImage != null)
                {
                    file = productImage.FileName;
                    string ext = file.Substring(file.LastIndexOf("."));
                    string[] goodExts = { ".jpeg", ".jpg", ".png", ".gif" };

                    if (goodExts.Contains(ext.ToLower()) && productImage.ContentLength <= 4194304)
                    {
                        file = Guid.NewGuid() + ext;
                        string savePath = Server.MapPath("~/Content/imgstore/products/");
                        Image convertedImage = Image.FromStream(productImage.InputStream);
                        int maxImageSize = 500;
                        int maxThumbSize = 100;

                        ImageUtility.ResizeImage(savePath, file, convertedImage, maxImageSize, maxThumbSize);

                        //dispose of the old image IF it is not null and it is not 'noimage.png'
                        if (product.ProductImage != null && product.ProductImage != "NoImage.png")
                        {
                            string path = Server.MapPath("~/Content/imgstore/products/");
                            ImageUtility.Delete(path, product.ProductImage);
                        }

                        //update the property of the object
                        product.ProductImage = file;
                    }
                }

                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductType = new SelectList(db.ProductTypes, "TypeID", "ProductTypeName", product.ProductType);
            ViewBag.StatusID = new SelectList(db.Status, "StatusID", "StatusName", product.StatusID);
            return View(product);
        }

        [Authorize(Roles = ("Admin"))]
        // GET: Products/Delete/5        
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }
        [Authorize(Roles = ("Admin"))]
        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            string path = Server.MapPath("~/Content/imgstore/products/");
            ImageUtility.Delete(path, product.ProductImage);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
