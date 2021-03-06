using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StoreFront.DATA.EF;
using System.ComponentModel.DataAnnotations;
namespace StoreFront.UI.MVC.Models
{
    public class CartItemViewModel
    {
        [Range(1, int.MaxValue)]
        public int Qty { get; set; }

        public Product Item { get; set; }
        public CartItemViewModel(int qty, Product item)
        {
            Qty = qty;
            Item = item;
        }
    }

}