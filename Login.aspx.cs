using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    DataClassesDataContext TDC = new DataClassesDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void BtnOK_Click(object sender, EventArgs e)
    {
        try
        {
            var SelectedUser = TDC.TblUserNames.Where(x => x.UserName == TextBoxUser.Text && x.Password == TextBoxPass.Text).SingleOrDefault();
            if (SelectedUser == null)
            {
                string msg = " alert('UserName Or Password Incorrect');";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
            }
            else
            {
                //create session
                if (Session["user"] == null)
                {
                    Session.Add("user", null);
                }

                //add user to session
                User userObj = new User();
                userObj.Name = SelectedUser.UserName;
                userObj.AccessLevel = SelectedUser.TblUserAccessLevels.Join(TDC.TblAccessLevels, x => x.AccessLevelID, y => y.AutoID, (TblUserAccessLevels, TblAccessLevels) => TblAccessLevels.AccessLevel).ToList();
                Session["user"] = userObj;

                //redirect to main page
                Response.Redirect("http://localhost/Traveler/Default.aspx");
            }

        }
        catch (Exception)
        {
            string msg = " alert('Error! Contact To Admin');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "key", msg, true);
        }

    }
}