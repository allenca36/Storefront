using System.Web.Mvc;
using StoreFront.UI.MVC.Models;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System;

namespace StoreFront.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]        
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpGet]
        public ActionResult Store()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel cvm)
        {
            if (!ModelState.IsValid)
            {
                return View(cvm); //Passing in cvm will populate the form with all the user typed in before the submitted the request
            }
            string message = $"You have received an email from {cvm.Name} with a subject of {cvm.Subject}. Please respond to {cvm.Email} with your response to the following message: <br/>{cvm.Message}";


            MailMessage mm = new MailMessage(
                ConfigurationManager.AppSettings["EmailUser"].ToString(),

                ConfigurationManager.AppSettings["EmailTo"].ToString(),

                cvm.Subject,

                message
                );


            mm.IsBodyHtml = true;
            mm.Priority = MailPriority.High;


            mm.ReplyToList.Add(cvm.Email);


            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["EmailClient"].ToString());


            client.Credentials = new NetworkCredential(
                ConfigurationManager.AppSettings["EmailUser"].ToString(),
                ConfigurationManager.AppSettings["EmailPass"].ToString());


            try
            {
                client.Send(mm);
            }
            catch (Exception ex)
            {
                ViewBag.CustomerMessage = $"We are sorry the request could not be sent at this time. Please try again later. <br/> Error Message: <br/> {ex.StackTrace}";
                return View(cvm);
            }


            return View("EmailConfirm", cvm);
        }
    }
}
