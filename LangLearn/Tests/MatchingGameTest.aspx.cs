using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LangLogic;

public partial class Tests_MatchingGameTest : System.Web.UI.Page
{

    MatchingGame game = new MatchingGame();

    protected void Page_Load(object sender, EventArgs e)
    {
        // Test the word list and GetWord
        lblOutput.Text = "Word List <br />";
        for (int i = 0; i < game.NumWords; i++)
            lblOutput.Text += game.GetWord(i) + ", ";


        // Test the word list and GetWord
        lblOutput.Text += "<br /> Picture List <br />";
        for (int i = 0; i < game.NumWords; i++)
            lblOutput.Text += game.GetPicture(i) + ", ";

        // Test moving a picture
        lblOutput.Text += "<br /> After moving from 2 to 6 <br />";
        game.MovePicture(2, 6);
        for (int i = 0; i < game.NumWords; i++)
            lblOutput.Text += game.GetPicture(i) + ", ";


    }
    


}