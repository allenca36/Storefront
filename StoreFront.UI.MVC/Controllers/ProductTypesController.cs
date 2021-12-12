using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using StoreFront.DATA.EF;

namespace StoreFront.UI.MVC.Controllers
{
    public class ProductTypesController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: ProductTypes
        public ActionResult Index()
        {
            var productTypes = db.ProductTypes.Include("SubTypes");
            return View(productTypes.ToList());
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult AjaxDelete(int id)
        {
            ProductType pType = db.ProductTypes.Find(id);
            db.ProductTypes.Remove(pType);
            db.SaveChanges();
            string ConfirmMessage = string.Format("Delete publisher '{0}' from the database!",
                pType.ProductTypeName);
            return Json(new {id = id, ConfirmMessage = ConfirmMessage });
        }

        // GET: ProductTypes/Details/5
        [HttpGet]
        public PartialViewResult ProductTypeDetails(int id)
        {
            ProductType pType = db.ProductTypes.Find(id);
            return PartialView(pType);
        }

        // GET: ProductTypes/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(ProductType productType)
        {
            db.ProductTypes.Add(productType);
            db.SaveChanges();
            return Json(productType);
        }
                

        // GET: ProductTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductType productType = db.ProductTypes.Find(id);
            if (productType == null)
            {
                return HttpNotFound();
            }
            return View(productType);
        }

        // POST: ProductTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "TypeID,ProductTypeName,SubTypeID")] ProductType productType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(productType);
        }

        [HttpGet]
        public PartialViewResult ProductTypeEdit(int id)
        {
            ProductType pType = db.ProductTypes.Find(id);
            return PartialView(pType);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(ProductType productType)
        {
            db.Entry(productType).State = EntityState.Modified;
            db.SaveChanges();
            return Json(productType);
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
