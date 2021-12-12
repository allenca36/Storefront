using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations; //added for validation purposes

namespace StoreFront.UI.MVC.Models
{
    public class ContactViewModel
    {
        
        [Required(ErrorMessage = "**Please provide a name**")]
        public string Name { get; set; }
        [Required(ErrorMessage = "**Please provide an email**")]
        [EmailAddress]
        public string Email { get; set; }
        //[Required(ErrorMessage = "**Please provide a subject**")]
        public string Subject { get; set; }
        [Required(ErrorMessage = "**Please provide a message**")]
        public string Message { get; set; }

    }
}