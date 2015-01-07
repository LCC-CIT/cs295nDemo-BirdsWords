using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LangLogic
{

    /// <summary>
    /// VocabQuiz provides logic for a UI that will present the user with one
    /// picture and a list of words- one of which is right
    /// </summary>
    /// 


    public static class VocabQuiz
    {

        const int NUM_CHOICES = 5;  // number of multiple choice selections

        public static bool CheckAnswer(string word, string pictureFileName)
        {
            return word == new Lexicon().GetSpanishWordFromPicture(pictureFileName);
        }

        public static string GetPicture()
        {
            return (new Lexicon()).GetPictures(1)[0];
        }

        public static string[] GetChoices(string pictureFileName)
        {
            Random randNum = new Random();
            Lexicon lex = new Lexicon();
            // Get a random list of words
            string[] choices = lex.GetWords(NUM_CHOICES).ToArray();
            // Get the right answer
            string word = lex.GetSpanishWordFromPicture(pictureFileName);
            // If the right answer isn't in the choices array, add it
            if (!choices.Contains<string>(word))
                choices[randNum.Next(NUM_CHOICES)] =lex.GetSpanishWordFromPicture(pictureFileName);
            return choices;
        }
    }


}