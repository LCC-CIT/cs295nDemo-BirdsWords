using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    const string USER_NAME_KEY = "userName";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[USER_NAME_KEY] != null)
        {
            btnLogin.Visible = false;
            logoutButton.Visible = true;
            lblLoginMessage.Visible = true;
            lblLoginMessage.Text = Session[USER_NAME_KEY] + " is logged in";
        }
    }

    // TODO: Move databse queries and logic to a class outside of the code-behind

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        // Search for the user in the users table
        // if they aren't there make the register label and button visible
        // otherwise recored their name in the session object and make logout visible

        if (txtName.Text != "")
        {
            LangLearnEntities entities = new LangLearnEntities();

            // See if the user is in the database
            string userName = (from u in entities.Users
                               where u.Name == txtName.Text
                               select u.Name).FirstOrDefault<string>();

            if (userName != null)
            {
                Session[USER_NAME_KEY] = userName;
                btnLogin.Visible = false;
                logoutButton.Visible = true;
                lblLoginMessage.Visible = true;
                lblLoginMessage.Text = "Welcome " + userName + "!";
                txtName.Text = "";
            }
            else
            {
                btnLogin.Visible = false;
                registerButton.Visible = true;
                lblLoginMessage.Visible = true;
                lblLoginMessage.Text = "New user: please register your name";
            }
        }
        else
        {
            lblLoginMessage.Visible = true;
            lblLoginMessage.Text = "Please enter your name";
        }

    }

    protected void registerButton_Click(object sender, EventArgs e)
    {
        // Add this user to the Users table
        // record their name in the session object
        // make register label and button invisible
        // make logout visible
        if (txtName.Text != "")
        {
            LangLearnEntities entities = new LangLearnEntities();
            var user = new User() { Name = txtName.Text };
            entities.Users.Add(user);     // add the new object to the entity set
            entities.SaveChanges();                 // update the database tables
            Session[USER_NAME_KEY] = txtName.Text;

            registerButton.Visible = false;
            logoutButton.Visible = true;
            lblLoginMessage.Visible = true;
            lblLoginMessage.Text = "Welcome " + txtName.Text + "!";
            txtName.Text = "";
        }
        else
        {
            lblLoginMessage.Visible = true;
            lblLoginMessage.Text = "Please enter your name";
        }
    }

    protected void logoutButton_Click(object sender, EventArgs e)
    {
        // remove user's name from the session object (make it null)
        // make login visible
        lblLoginMessage.Visible = true;
        lblLoginMessage.Text = "Goodby " + Session[USER_NAME_KEY] + "!";
        Session[USER_NAME_KEY] = null;
        logoutButton.Visible = false;
        btnLogin.Visible = true;
    }
}