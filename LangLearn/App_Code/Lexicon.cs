using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Drawing;

namespace LangLogic
{


    /// <summary>
    /// Objects created from this class will be used to get
    /// word-picutre pairs. 
    /// </summary>
    /// 

    public class Lexicon
    {
        Random randNums = new Random();        // used for getting random lexemes from the lexicon
        //Lexemes lexemes;

        public Lexicon()
        {
            /*
            // Pre-load the database
            AddVocab("Bird", "Pájaro", "noun", "Bird.png");
            AddVocab("Compact Disk", "Disco compacto", "noun", "CompactDisk.png");
            AddVocab("Dog", "Perro", "noun", "Dog.png");
            AddVocab("Garlic", "Ajo", "noun", "Garlic.png");
            AddVocab("Hammers", "Martillos", "noun", "Hammer.png");
            AddVocab("Hatchets", "Hachas", "noun", "Hatchet.png");
            AddVocab("Hippopotamus", "Hipopótamo", "noun", "Hippopotamus.png");
            AddVocab("Pear", "Pera", "noun", "Pear.png");
            AddVocab("Pumpkin", "Calabaza", "noun", "Pumpkin.png");
            AddVocab("Smart phone", "Teléfono inteligente", "noun", "SmartPhone.png");
            AddVocab("Teapot", "Tetera", "noun", "Teapot.png");
            AddVocab("Rake", "Rastrillo", "noun", "Rake.png");
            */
        }

        public void AddVocab(string englishWord, string spanishWord, string pos, string pictureFile)
        {
            LangLearnEntities entities = new LangLearnEntities();

            Spanish sWord = new Spanish() { Word = spanishWord };
            // See if the English word is already in the database, if it is we'll use it
            English eWord = (from eng in entities.Englishes.Include("Spanishes")
                             where eng.Word == englishWord
                             select eng).FirstOrDefault<English>();

            if (eWord == null)  // This word insn't in the database yet, so we'll create an object for it
            {
                eWord = new English() { Word = englishWord, PartOfSpeech = pos, Picture = pictureFile};
                entities.Englishes.Add(eWord);     // add the new object to the entity set
            }

            eWord.Spanishes.Add(sWord);          // This represents the English PK to Spanish FK relationship in the db
            entities.SaveChanges();                 // update the database tables
        }

        public string GetPictureByEnglishWord(string word)
        {

            LangLearnEntities entities = new LangLearnEntities();
            var eWord = (from eng in entities.Englishes
                         where eng.Word == word
                         select eng).FirstOrDefault<English>();
            return eWord.Picture;
        }

        public string GetSpanishWordFromPicture(string picture)
        {
            LangLearnEntities entities = new LangLearnEntities();
            var eWord = (from eng in entities.Englishes
                         where eng.Picture == picture
                         select eng).FirstOrDefault<English>();
            return eWord.Spanishes.ElementAt(0).Word;
        }

        // Returns a list of random spanish words. 
        public List<string> GetWords(int numWords)
        {
            List<string> wordList = new List<string>();

            List<Lexeme> lexemes = GetRandomLexemes(numWords);
            for (int i = 0; i < lexemes.Count; i++)
                wordList.Add(lexemes[i].Word);

            return wordList;
        }

        // Returns a list of random pictures. 
        public string[] GetPictures(int numPics)
        {
            string[] pictures = new string[numPics];
            List<Lexeme> lexemes = GetRandomLexemes(numPics);
            for (int i = 0; i < lexemes.Count; i++)
               pictures[i] = lexemes[i].Picture;

            return pictures;
        }

        // Get a random list of unique Lexemes
        public Lexemes GetRandomLexemes(int numLexemes)
        {
            Lexemes randLexemes = new Lexemes();  // This is where we will put the random Lexemes
           
            LangLearnEntities entities = new LangLearnEntities();

             int maxId = (from e in entities.Spanishes
                          select e.Id).Max();

            int randNum;
            int maxTries = numLexemes * 50; // don't get stuck in an infinite loop
            int numAdded = 0;
            for (int tries = 0; numAdded < numLexemes && tries < maxTries; tries++)
            {
                randNum = randNums.Next(maxId); // use these to get random words
                var sWord = (from s in entities.Spanishes
                             where s.Id == randNum
                             select s).FirstOrDefault<Spanish>();

                if (sWord != null &&                        // make sure we found a word for the random Id
                    sWord.English.Picture != "")       // it needs to have a picture for our quizzes and games
                {
                    Lexeme lexeme = new Lexeme(sWord.Word, sWord.English.Picture, 
                        sWord.English.Word, sWord.English.PartOfSpeech);

                    if (!randLexemes.Contains(lexeme))  // make sure it's unique
                    {
                        randLexemes.Add(lexeme);
                        numAdded++;
                    }
                }
            }

            return randLexemes;
        }

    }

}