using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tests_EfTests : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (LangLearnEntities entities = new LangLearnEntities())
        {

            #region Add words to the database
            if (false)
            {
                // Note: only run this region once, otherwise you get duplicates in the database

                // Create an English word object and objects representing its Spanish translations
                English eWord1 = new English() { Word = "Good" };
                Spanish sWord1 = new Spanish() { Word = "Bien" };
                Spanish sWord2 = new Spanish() { Word = "Bueno" };
                Spanish sWord3 = new Spanish() { Word = "Sano" };


                // Note: only run this once
                // Add the Spanish translations to the English word object
                eWord1.Spanishes.Add(sWord1);
                eWord1.Spanishes.Add(sWord2);
                eWord1.Spanishes.Add(sWord3);
                // Add the English word object to the Entity model
                entities.Englishes.Add(eWord1);
            }
            #endregion

            #region delete an English object from the database
            if (true)
            {
                // Delete the English word object (and it's Spanish word objects)
                // Note that we have to delete the object retrieved from the db, not the new one we created above
                English eWord = (from eng in entities.Englishes.Include("Spanishes") 
                                 where eng.Word == "Fly" 
                                 select eng).ToArray<English>()[0];
                entities.Englishes.Remove(eWord);
            }

            if (false)
            {
                Spanish sWord = (from s in entities.Spanishes.Include("English")
                                 where s.Word == "Ajo"
                                 select s).FirstOrDefault<Spanish>();
                entities.Spanishes.Remove(sWord);
            }
            #endregion

            // Always do this after all the entity operations have been done
            entities.SaveChanges();

              #region Show all the words in the database
            // Get all Spanish words and display them
            var allSpanishWords = from s in entities.Spanishes select s;

            foreach (Spanish sWord in allSpanishWords.ToList<Spanish>())
                AllSpanishTextBox.Text += sWord.Word + "\n\r";

            // Get all English words and display them
            var allEnglishWords = from eng in entities.Englishes select eng;

            foreach (English engWord in allEnglishWords.ToList<English>())
                AllEnglishTextBox.Text += engWord.Word + "\n\r";
            #endregion

            #region Show one Spanish word and its translation
            // Spanish to English translation
            if (false)
            {
                string spanishWord = "volar";
                SpanishWordTextBox.Text = spanishWord;

                var englishWord = (from eng in entities.Englishes
                                     join s in entities.Spanishes
                                     on eng.Id equals s.English.Id
                                     where s.Word == spanishWord
                                     select eng.Word).FirstOrDefault();

                EnglishWordsTextBox.Text = englishWord;
            }
            #endregion

            #region Show one English word and its Spanish translations
            // English to Spanish translation
            if (true)
            {
                string englishWord = "Pear";

                EnglishWordsTextBox.Text = englishWord;

                var aSpanishWord = from s in entities.Spanishes
                                   where s.English.Word == englishWord
                                   select s.Word;
                //string spanishWord = aSpanishWord.SingleOrDefault<String>();
                //SpanishWordTextBox.Text = spanishWord;

                foreach (string sWord in aSpanishWord)
                    SpanishWordTextBox.Text += sWord + "\n\r";  
           }
            #endregion
        }
    }
}