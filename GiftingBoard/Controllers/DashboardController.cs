using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using GiftingBoard.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace GiftingBoard.Controllers
{

    public class DashboardController : Controller
    {
        // GET: Dashboard
        GiftingBoardEntities db = new GiftingBoardEntities();
        private ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }
        public ActionResult Index()
        {
            ViewBag.currentId = User.Identity.GetUserId();
            if (User.IsInRole("Admin"))
            {
                ViewBag.totalboard = db.Boards.Count();
                ViewBag.totalactiveboard = db.Boards.Where(w => w.Isexpired == false).Count();
                ViewBag.totaluser = db.AspNetUsers.Count();
            }
            return View();
        }
        public ActionResult CreateBoard()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CreateBoard(Board board)
        {
            try
            {
                if (db.Boards.Where(w => w.BoardValueId == board.BoardValueId).Count() == 0)
                {
                    var core1 = Request.Form["CorememberId1"];
                    var core2 = Request.Form["CorememberId2"];
                    board.Number = 0;
                    db.Boards.Add(board);
                    for (int i = 0; i < 2; i++)
                    {
                        if (i == 0)
                        {
                            board.Members.Add(new Member { IsActive = true, isCoremember = true, memberId = core1 });
                        }
                        else
                            board.Members.Add(new Member { IsActive = true, isCoremember = true, memberId = core2, });
                    }

                    db.SaveChanges();
                }

            }
            catch
            {

            }

            return RedirectToAction("ListBoard");
        }
        public ActionResult ActiveBoard()
        {
            return View(db.Boards.Where(w => w.Isexpired != true));
        }
        public ActionResult ListBoard()
        {

            return View(db.Boards);
        }
        public ActionResult DetailslistBoard(int? id)
        {
            return View(db.Boards.Where(w => w.Id == id).FirstOrDefault());
        }
        public ActionResult DetailsBoard()
        {
            return View();
        }
        [HttpPost]
        public ActionResult addmember(Member member)
        {
            member.IsActive = true;
            db.Members.Add(member);
            db.SaveChanges();
            var boardvalue = db.Boards.Where(w => w.Id == member.BoardId).FirstOrDefault().BoardValueId;
            if (db.Members.Where(w => w.BoardId == member.BoardId && w.isCoremember == false).Count() == 8)
            {
                var exist = db.Boards.Where(w => w.Id == member.BoardId).FirstOrDefault();
                exist.Isexpired = true;
                if (boardvalue == 1)
                {
                    var coreget = db.Members.Where(w => w.BoardId == exist.Id && w.isCoremember == true).ToList();
                    foreach (var itm in coreget)
                    {
                        var existcore = db.Members.Where(w => w.Id == itm.Id).FirstOrDefault();
                        existcore.IsActive = false;
                    }
                }

                var memberlist = db.Members.Where(w => w.BoardId == member.BoardId && w.isCoremember == false).Select(s => s.memberId).ToArray();
                int j = db.Boards.Where(w => w.BoardValueId == exist.BoardValueId).Max(ww => ww.Number);

                for (int i = 0; i < 8; i++)
                {
                    var core1 = memberlist[i];
                    i += 1;
                    var core2 = memberlist[i];
                    j++;
                    Board board = new Board();
                    board.BoardValueId = member.Board.BoardValueId;
                    board.Name = member.Board.Name;
                    board.Isexpired = false;
                    board.Number = j;
                    db.Boards.Add(board);
                    for (int q = 0; q < 2; q++)
                    {
                        if (q == 0)
                        {
                            var existmember = db.Members.Where(w => w.memberId == core1 && w.BoardId == member.BoardId).FirstOrDefault();
                            existmember.IsActive = false;
                            board.Members.Add(new Member { IsActive = true, isCoremember = true, memberId = core1, });
                        }
                        else
                        {
                            var existmember = db.Members.Where(w => w.memberId == core2 && w.BoardId == member.BoardId).FirstOrDefault();
                            existmember.IsActive = false;
                            board.Members.Add(new Member { IsActive = true, isCoremember = true, memberId = core2, });
                        }
                    }
                }
                db.SaveChanges();
            }
            if (User.IsInRole("User"))
            {
                return RedirectToAction("Index");
            }
            return RedirectToAction("DetailslistBoard", "Dashboard", new { id = member.BoardId });
        }
        public ActionResult UserDatabase()
        {
            return View(db.AspNetUsers.Where(w => w.AspNetRoles.FirstOrDefault().Name != "Admin"));
        }
        public ActionResult MyProfile()
        {
            var current = User.Identity.GetUserId();
            return View(db.AspNetUsers.Where(w => w.Id == current).FirstOrDefault());
        }
        public ActionResult ProfileEdit(string id)
        {
            var exist = db.AspNetUsers.Where(w => w.Id == id).FirstOrDefault();
            return View(exist);
        }
        [HttpPost]
        public ActionResult ProfileEdit(AspNetUser user)
        {
            var id = Request.Form["Id"];

            var existuser = db.AspNetUsers.Where(w => w.Id == id).FirstOrDefault();
            string rolename = UserManager.GetRoles(user.Id).FirstOrDefault();
            try
            {
                if (existuser != null)
                {
                    var data = Request;
                    if (rolename == "Admin")
                    {
                        HttpPostedFileBase image = data.Files["image"];

                        if (image != null && image.FileName != "")
                        {
                            var oldResumePath = existuser.Image;
                            var fileName = Path.GetFileName(image.FileName);
                            var ext = Path.GetExtension(image.FileName);
                            string name = Path.GetFileNameWithoutExtension(fileName);
                            fileName = existuser.UserName + name + Request.Form["username"] + ext;
                            var path = Path.Combine(Server.MapPath("~/Content/UploadProfile"), fileName);
                            image.SaveAs(path);
                            existuser.Image = "/Content/UploadProfile/" + fileName;
                            string fullPath = Server.MapPath(oldResumePath);
                            if (System.IO.File.Exists(fullPath))
                            {
                                System.IO.File.Delete(fullPath);
                            }
                        }
                        existuser.FirstName = Request.Form["firstname"];
                        existuser.LastName = Request.Form["lastname"];
                        existuser.PhoneNumber = Request.Form["phoneNumber"];
                    }
                    else
                    {
                        HttpPostedFileBase image = data.Files["image"];

                        if (image != null && image.FileName != "")
                        {
                            var oldResumePath = existuser.Image;
                            var fileName = Path.GetFileName(image.FileName);
                            var ext = Path.GetExtension(image.FileName);
                            string name = Path.GetFileNameWithoutExtension(fileName);
                            fileName = existuser.UserName + name + Request.Form["username"] + ext;
                            var path = Path.Combine(Server.MapPath("~/Content/UploadProfile"), fileName);
                            image.SaveAs(path);
                            existuser.Image = "/Content/UploadProfile/" + fileName;
                            string fullPath = Server.MapPath(oldResumePath);
                            if (System.IO.File.Exists(fullPath))
                            {
                                System.IO.File.Delete(fullPath);
                            }
                        }
                        existuser.FirstName = Request.Form["firstname"];
                        existuser.LastName = Request.Form["lastname"];
                        existuser.PhoneNumber = Request.Form["phoneNumber"];
                        existuser.BankName = Request.Form["BankName"];
                        existuser.AccountHolderName = Request.Form["AccountHolderName"];
                        existuser.AccountNumber = Request.Form["AccountNumber"];
                        existuser.RoutingNumber = Request.Form["RoutingNumber"];
                        existuser.AccountType = Request.Form["AccountType"];
                    }
                    db.SaveChanges();
                }
            }
            catch
            {

            }

            var exist = db.AspNetUsers.Where(w => w.Id == existuser.Id).FirstOrDefault();
            return View(exist);
        }
        public ActionResult UserActiveBoard()
        {
            var current = User.Identity.GetUserId();
            return View(db.Members.Where(w => w.IsActive == true && w.memberId == current).ToList());
        }
        public ActionResult UserListBoard()
        {
            var current = User.Identity.GetUserId();
            return View(db.Members.Where(w => w.memberId == current).ToList());
        }
        public ActionResult Chat()
        {
            return View();
        }
        public ActionResult UserChat()
        {
            ViewBag.adminid = db.AspNetUsers.Where(w => w.AspNetRoles.FirstOrDefault().Name == "Admin").FirstOrDefault().UserName;
            var currentid = User.Identity.GetUserId();
            return View(db.tbl_Conversation.Where(w => w.SenderID == currentid || w.ReceiverID == currentid).ToList());
        }

        public ActionResult UserProfile(string id)
        {
            return View(db.AspNetUsers.Where(w => w.Id == id).FirstOrDefault());
        }

        public JsonResult getchatdata(string id)
        {
            var cuurent = User.Identity.GetUserId();
            var name = db.AspNetUsers.Where(w => w.Id == id).FirstOrDefault();
            JsonResult result = new JsonResult();
            var data = db.tbl_Conversation.Where(w => (w.ReceiverID == cuurent && w.SenderID == id) || (w.SenderID == cuurent && w.ReceiverID == id)).Select(s => new { username = name.UserName, name = name.FirstName, s.SenderID, s.ReceiverID, s.Msg, s.MsgDate, sendername = s.AspNetUser.FirstName, receivername = s.AspNetUser1.FirstName, imagesender = s.AspNetUser.Image, imagereceiver = s.AspNetUser1.Image }).ToList();
            result.Data = data;
            result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return result;

        }
        public JsonResult getuserlist()
        {
            MyHub myHub = new MyHub();
            var user = new List<UserInfo>();
            var cuurent = User.Identity.GetUserId();
            JsonResult result = new JsonResult();
            var userlist = db.AspNetUsers.Where(w => w.Id != cuurent && (w.tbl_Conversation.Count() > 0 || w.tbl_Conversation1.Count() > 0)).ToList();

            var data = userlist.Select(s => new { username = s.UserName, name = s.FirstName, s.Id, s.Image }).ToList();
            result.Data = data;
            result.JsonRequestBehavior = JsonRequestBehavior.AllowGet;
            return result;

        }

    }
}