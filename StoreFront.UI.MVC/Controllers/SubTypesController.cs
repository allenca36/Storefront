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
    public class SubTypesController : Controller
    {
        private StoreFrontEntities db = new StoreFrontEntities();

        // GET: SubTypes
        public ActionResult Index()
        {
            return View(db.SubTypes.ToList());
        }

        // GET: SubTypes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubType subType = db.SubTypes.Find(id);
            if (subType == null)
            {
                return HttpNotFound();
            }
            return View(subType);
        }

        // GET: SubTypes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: SubTypes/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "SubTypeID,SubTypeName")] SubType subType)
        {
            if (ModelState.IsValid)
            {
                db.SubTypes.Add(subType);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(subType);
        }

        // GET: SubTypes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubType subType = db.SubTypes.Find(id);
            if (subType == null)
            {
                return HttpNotFound();
            }
            return View(subType);
        }

        // POST: SubTypes/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "SubTypeID,SubTypeName")] SubType subType)
        {
            if (ModelState.IsValid)
            {
                db.Entry(subType).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(subType);
        }

        // GET: SubTypes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SubType subType = db.SubTypes.Find(id);
            if (subType == null)
            {
                return HttpNotFound();
            }
            return View(subType);
        }

        // POST: SubTypes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            SubType subType = db.SubTypes.Find(id);
            db.SubTypes.Remove(subType);
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
