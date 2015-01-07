using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LangLogic;

public partial class VocabMatchingGame : System.Web.UI.Page
{
    MatchingGame game;
    const string GAME_OBJ = "game_obj";
    const string FIRST_CLICK = "first_click";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session[GAME_OBJ] == null)
        {
            game = new MatchingGame();
            Session[GAME_OBJ] = game;
        }
        else
        {
            game = (MatchingGame)Session[GAME_OBJ];
        }

        LoadTables();

        // Get the top 3 high scores for the leader board
        LangLearnEntities entities = new LangLearnEntities();
        var users = (from u in entities.Users
                        orderby u.QuizScore descending    
                        select u).Take(3)                
                        .ToList<User>();        // sort with the highest score first, limit to the first 3

        const int LEADER_ROWS = 3;      // three rows in the leader board table
        int cellNum = 22;               // The first cell's ID is 20
        for (int rowCount = 0; rowCount < LEADER_ROWS; rowCount++)
        {
            string cellId = "Cell" + (cellNum).ToString();
            TableCell cell = (TableCell)tblWords.FindControl(cellId);
            cell.Text = users[rowCount].Name;
            cellId = "Cell" + (cellNum + 1).ToString();   // next column
            cell = (TableCell)tblWords.FindControl(cellId);
            cell.Text = users[rowCount].QuizScore.ToString();
            cellNum +=  2;                          //add 2 because there are 2 columns in the table
        }
    }

    // Load the server side tables with words and pictures
    private void LoadTables()
    {
        // Fill the word table
        TableCell cell;
        for (int i = 0; i < game.NumWords; i++)
        {
            cell = (TableCell)tblWords.FindControl("Cell" + i.ToString());
            cell.Text = game.GetWord(i);
        }

        // Fill the picture table
        ImageButton button;
        for (int i = 0; i < game.NumWords; i++)
        {
            button = (ImageButton)tblPictures.FindControl("ImageButton" + i.ToString());
            button.ImageUrl = "~/img/" + game.GetPicture(i);
            if (game.CheckMatch(i, i))
                button.BorderColor = Color.Green;
            else
                button.BorderColor = Color.Red;
        }

        // Fill Top Score table

    }


    // Event handler for all image buttons
    protected void ImgButton_Click(object sender, EventArgs e)
    {
        // See if this is the first click in a two click move sequence
        ImageButton imgSourceButton = (ImageButton)sender;
        if (Session[FIRST_CLICK] == null)
        {
            Session[FIRST_CLICK] = imgSourceButton.ID;  // save the ID of the source button
             // Change the color so we know it's the first click
            imgSourceButton.BorderColor = Color.Gray;
        }
        else     // This is the second click, the destination
        {
            int sourceButtonNum = int.Parse(((string)Session[FIRST_CLICK]).Substring(11));   // Retrieve the source button number
            ImageButton imgDestButton = (ImageButton)sender;  // destination button
            int destButtonNum = int.Parse(imgDestButton.ID.Substring(11));    // the destination button number

            game.MovePicture(sourceButtonNum, destButtonNum);

            // Clear the label so the next click will be interpreted as a first click
            Session[FIRST_CLICK] = null;
            LoadTables();

            // Check for a win
            if (game.AllDone())
            {
                lblMessage.Text = "Congratulations, you got them all!";
                // Update score
                scoreLabel.Text = game.GetScore().ToString();
                // Add the score to the database if it's the user's highest score
                // See if the user is in the database
                string userName = (string)Session["userName"];
                LangLearnEntities entities = new LangLearnEntities();
                User thisUser = (from u in entities.Users
                                   where u.Name == userName
                                   select u).FirstOrDefault<User>();

                if (thisUser != null)
                {
                    thisUser.QuizScore = Int32.Parse(scoreLabel.Text);
                    entities.SaveChanges();                 // update the database tables
                }

            }
        }
        // Update score
        scoreLabel.Text = game.GetScore().ToString();
    }


    protected void btnNewGame_Click(object sender, EventArgs e)
    {
        game.Initialize();
        LoadTables();
        lblMessage.Text = "";
    }
}