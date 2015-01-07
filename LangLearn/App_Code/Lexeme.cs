using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LangLogic
{


    /// <summary>
    /// Lexeme holds word-picture pairs
    /// </summary>
    public class Lexeme
    {
        string word;
        string eWord;
        string image;
        string pos;

        public Lexeme(string w, string i)
        {
            word = w;
            image = i;
        }

        public Lexeme(string w, string i, string e, string p )
        {
            word = w;
            image = i;
            eWord = e;
            pos = p;
        }

        public string Word { get { return word; } }     // Just a word
        public string Picture { get { return image; } }       // ImageURL
        public string EnglishWord { get { return eWord; } }     // English translation
        public string PartOfSpeech { get { return pos; } }

        public override string ToString()
        {
            return word;
        }

        public override bool Equals(object obj)
        {
            return Word == ((Lexeme)obj).Word && image == ((Lexeme)obj).image;
        }
    }


    public class Lexemes : List<Lexeme>
    {
        Random randNum = new Random();

        // Shuffle the lexemes in this list
        public void Shuffle()
        {
            // shuffle by exchanging random pairs of Lexemes
            for (int i = 0; i < this.Count; i++)
            {
                int iRand = randNum.Next(this.Count);   // get a random number from 0 to highest index in this list
                Lexeme temp = this[i];
                this[i] = this[iRand];
                this[iRand] = temp;
            }

        }

        public Lexeme FindByWord(string word)
        {
            foreach (Lexeme lex in this)
            {
                if (lex.Word == word)
                    return lex;
            }
            return null;
        }

        public Lexeme FindByPicture(string picture)
        {
            foreach (Lexeme lex in this)
            {
                if (lex.Picture == picture)
                    return lex;
            }
            return null;
        }
 
    }
}