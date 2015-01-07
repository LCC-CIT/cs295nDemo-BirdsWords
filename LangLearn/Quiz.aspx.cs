using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using LangLogic;

public partial class Quiz : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string[] GetChoices(string pictureFileName)
    {
        return VocabQuiz.GetChoices(pictureFileName);
    }

    [WebMethod]
    public static string GetPicture()
    {
        return VocabQuiz.GetPicture();
    }

    [WebMethod]
    public static bool CheckAnswer(string word, string pictureFileName)
    {
        return VocabQuiz.CheckAnswer(word, pictureFileName);
    }

}