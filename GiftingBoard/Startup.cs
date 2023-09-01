using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(GiftingBoard.Startup))]
namespace GiftingBoard
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            app.MapSignalR();
            ConfigureAuth(app);
        }
    }
}
