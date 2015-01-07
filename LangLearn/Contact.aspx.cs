using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        MailMessage myMessage = new MailMessage();
        myMessage.Subject = "Bird's Words contact message";
        myMessage.Body = txtMessage.Text;
        myMessage.From = new MailAddress(txtEmail.Text, txtName.Text);
        myMessage.To.Add(new MailAddress("lccProgStudent@gmail.com", "Ty Titan"));
        SmtpClient mySmtpClient = new SmtpClient();
        mySmtpClient.Send(myMessage);

        lblMessageSent.Visible = true;
        FormTable.Visible = false;
        //System.Threading.Thread.Sleep(5000); // simulate a delay so we can see the "Pleae wait" GIF
    }
}