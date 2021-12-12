﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StoreFront.UI.MVC.Models;

namespace StoreFront.UI.MVC.Controllers
{
    public class ShoppingCartController : Controller
    {
        // GET: ShoppingCart
        public ActionResult Index()
        {
            var shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            if (shoppingCart == null || shoppingCart.Count == 0)
            {
                shoppingCart = new Dictionary<int, CartItemViewModel>();
                ViewBag.Message = "There are no items in your cart.";
            }
            else
            {
                ViewBag.Message = null;
            }
            return View(shoppingCart);
        }//end Index

        public ActionResult RemoveFromCart(int id)
        {
            Dictionary<int, CartItemViewModel> shoppingCart =
                (Dictionary<int, CartItemViewModel>)Session["cart"];
            shoppingCart.Remove(id);
            Session["cart"] = shoppingCart;
            return RedirectToAction("Index");
        }//end RemoveFromCart

        public ActionResult UpdateCart(int productID, int qty)
        {
            Dictionary<int, CartItemViewModel> shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
            shoppingCart[productID].Qty = qty;
            Session["cart"] = shoppingCart;
            return RedirectToAction("Index");
        }
    }//class
}//namespace