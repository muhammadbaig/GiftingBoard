using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR;
using GiftingBoard.Models;
using Microsoft.AspNet.SignalR.Hubs;
using System.Collections.Concurrent;
using Microsoft.AspNet.Identity;

namespace GiftingBoard
{
    public class MyHub : Hub
    {
        public static List<UserInfo> UsersList = new List<UserInfo>();
        static List<MessageInfo> MessageList = new List<MessageInfo>();
       
        GiftingBoardEntities db = new GiftingBoardEntities();
        //-->>>>> ***** Receive Request From Client [  Connect  ] *****
        public void Connect(string username)
        {
            var id = Context.ConnectionId;
            string userGroup="";
            //Manage Hub Class
            //if freeflag==0 ==> Busy
            //if freeflag==1 ==> Free

            //if tpflag==0 ==> User
            //if tpflag==1 ==> Admin

            if (!Connections.ContainsKey(username))
            {
                Connections.TryAdd(username, Context.ConnectionId);
            }
            else
            {
                var itemToRemove = Connections.Single(r => r.Key == username);
                Connections.TryUpdate(itemToRemove.Key, Context.ConnectionId, itemToRemove.Value);
            }
            var userInfo =
                 (from m in db.AspNetUsers
                  where m.UserName == username
                  select new { m.Id, m.UserName }).FirstOrDefault();


            try
            {
                //You can check if user or admin did not login before by below line which is an if condition
                //if (UsersList.Count(x => x.ConnectionId == id) == 0)

                //Here you check if there is no userGroup which is same DepID --> this is User otherwise this is Admin
                //userGroup = DepID
               
               
                //if ((int)userInfo.AdminCode == 0)
                //{
                //    //now we encounter ordinary user which needs userGroup and at this step, system assigns the first of free Admin among UsersList
                //    var strg = (from s in UsersList where (s.tpflag == "1") && (s.freeflag == "1") select s).First();
                //    userGroup = strg.UserGroup;

                //    //Admin becomes busy so we assign zero to freeflag which is shown admin is busy
                //    strg.freeflag = "0";

                //    //now add USER to UsersList
                //    UsersList.Add(new UserInfo { ConnectionId = id, UserID = userInfo.UserID, UserName = userName, UserGroup = userGroup, freeflag = "0", tpflag = "0", });
                //    //whether it is Admin or User now both of them has userGroup and I Join this user or admin to specific group 
                //    Groups.Add(Context.ConnectionId, userGroup);
                //    Clients.Caller.onConnected(id, userName, userInfo.UserID, userGroup);

                //}
                //else
                //{
                    //If user has admin code so admin code is same userGroup
                    //now add ADMIN to UsersList
                    UsersList.Add(new UserInfo { ConnectionId = id,  UserName = username, freeflag = "1", tpflag = "1" });
                    //whether it is Admin or User now both of them has userGroup and I Join this user or admin to specific group 
                    Groups.Add(Context.ConnectionId, "1");
                    Clients.Caller.onConnected(id, username);

                //}

                
               

            }

            catch
            {
                string msg = "All Administrators are busy, please be patient and try again";
                //***** Return to Client *****
                Clients.Caller.NoExistAdmin();

            }


        }
        // <<<<<-- ***** Return to Client [  NoExist  ] *****



        //--group ***** Receive Request From Client [  SendMessageToGroup  ] *****
        public static ConcurrentDictionary<string, string> Connections = new ConcurrentDictionary<string, string>();

        public void SendMessageToGroup(string userName, string message,string date,string sendername)
        {
            string connectionToSendMessage;
            var sendId = db.AspNetUsers.Where(w => w.UserName == sendername).FirstOrDefault();
            var receiverId = db.AspNetUsers.Where(w => w.UserName == userName).FirstOrDefault();
            Connections.TryGetValue(userName, out connectionToSendMessage);
            if (!string.IsNullOrWhiteSpace(connectionToSendMessage))
            {
                Clients.Client(connectionToSendMessage).SendMessage(message, sendId.UserName,sendId.Image);
            }
            try
            {
                tbl_Conversation tbl = new tbl_Conversation();
                tbl.Msg = message;
                tbl.MsgDate = date;
                tbl.SenderID = sendId.Id;
                tbl.ReceiverID = receiverId.Id;
                db.tbl_Conversation.Add(tbl);
                db.SaveChanges();
            }
            catch
            {

            }
           
            //if (UsersList.Count != 0)
            //{
            //    userName = "kk";

            //    var strg = (from s in UsersList where (s.UserName == userName) select s).FirstOrDefault();

            //    MessageList.Add(new MessageInfo { UserName = userName, Message = message, UserGroup = strg.UserGroup });
            //    string strgroup = strg.UserGroup;
            //    // If you want to Broadcast message to all UsersList use below line
            //    // Clients.All.getMessages(userName, message);

            //    //If you want to establish peer to peer connection use below line so message will be send just for user and admin who are in same group
            //    //***** Return to Client *****
            //    Clients.All.getMessages(userName, message);


            //}

        }
        // <<<<<-- ***** Return to Client [  getMessages  ] *****

       
        //--group ***** Receive Request From Client ***** { Whenever User close session then OnDisconneced will be occurs }
        public override System.Threading.Tasks.Task OnDisconnected()
        {

            var item = UsersList.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);
            if (item != null)
            {
                UsersList.Remove(item);

                var id = Context.ConnectionId;

                if (item.tpflag == "0")
                {
                    //user logged off == user
                    try
                    {
                        var stradmin = (from s in UsersList where (s.UserGroup == item.UserGroup) && (s.tpflag == "1") select s).First();
                        //become free
                        stradmin.freeflag = "1";
                    }
                    catch
                    {
                        //***** Return to Client *****
                        Clients.Caller.NoExistAdmin();
                    }
                    
                }

                //save conversation to dat abase

                //tbl_Conversation tbl = new tbl_Conversation();
            }

            return base.OnDisconnected();
        }
    }
    public class UserInfo
    {
        public string ConnectionId { get; set; }
        public string UserName { get; set; }
        public string UserGroup { get; set; }

        //if freeflag==0 ==> Busy
        //if freeflag==1 ==> Free
        public string freeflag { get; set; }

        //if tpflag==2 ==> User Admin
        //if tpflag==0 ==> User Member
        //if tpflag==1 ==> Admin

        public string tpflag { get; set; }

        public int UserID { get; set; }
        public int AdminID { get; set; }
    }
    public class MessageInfo
    {
        public string UserName { get; set; }

        public string Message { get; set; }

        public string UserGroup { get; set; }

        public string StartTime { get; set; }

        public string EndTime { get; set; }

        public string MsgDate { get; set; }
    }

}