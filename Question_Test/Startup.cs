using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Question_Test.Startup))]
namespace Question_Test
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
