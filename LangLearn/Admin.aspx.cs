using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LangLogic;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void enterButton_Click(object sender, EventArgs e)
    {
        Lexicon lex = new Lexicon();
        lex.AddVocab( englishTextBox.Text,  spanishTextBox.Text,  posTextBox.Text,  pictureTextBox.Text);

        englishTextBox.Text = "";
        spanishTextBox.Text = "";
        posTextBox.Text = "";
        pictureTextBox.Text = "";
        showAll();
    }

    // TODO: Move the Linq queries and logical operations to a class outside of the code-behind

    protected void deleteButton_Click(object sender, EventArgs e)
    {
        LangLearnEntities entities = new LangLearnEntities();
        var eWord = (from eng in entities.Englishes.Include("SpanishWords") 
                     where eng.Word == englishTextBox.Text 
                     select eng).ToArray<English>()[0];
        entities.Englishes.Remove(eWord);
        entities.SaveChanges();
    }

    protected void findEnglishButton_Click(object sender, EventArgs e)
    {
        LangLearnEntities entities = new LangLearnEntities();
        var eWord = (from eng in entities.Englishes.Include("SpanishWords") 
                     where eng.Word == findTextBox.Text
                     select eng).ToArray<English>()[0];

        englishTextBox.Text = eWord.Word;
        spanishTextBox.Text = eWord.Spanishes.ElementAt<Spanish>(0).Word;
        posTextBox.Text = eWord.PartOfSpeech;
        pictureTextBox.Text = eWord.Picture;
    }

    protected void showButton_Click(object sender, EventArgs e)
    {
        showAll();
    }

    private void showAll()
    {
        LangLearnEntities entities = new LangLearnEntities();
        var eWords = from eng in entities.Englishes.Include("SpanishWords")
                     select eng;

        showAllTextBox.Text = "";
        foreach (English eWord in eWords)
        {
            foreach(Spanish sWord in eWord.Spanishes)
            {
                showAllTextBox.Text += eWord.Word + "\t";
                showAllTextBox.Text += sWord.Word + "\t";
                showAllTextBox.Text += eWord.PartOfSpeech + "\t";
                showAllTextBox.Text += eWord.Picture + "\n";
            }
        }
    }

    protected void findSpanishButton_Click(object sender, EventArgs e)
    {
        LangLearnEntities entities = new LangLearnEntities();
        var sWord = (from s in entities.Spanishes.Include("EnglishWords") 
                     where s.Word == findTextBox.Text
                     select s).ToArray<Spanish>()[0];

        englishTextBox.Text = sWord.English.Word;
        spanishTextBox.Text = sWord.Word;
        posTextBox.Text = sWord.English.PartOfSpeech;
        pictureTextBox.Text = sWord.English.Picture;
    }
}