using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LangLogic
{


    /// <summary>
    /// Summary description for MatchingGame
    /// </summary>
    public class MatchingGame
    {
        private Lexicon dict = new Lexicon();
        private List<string> wordList;        // random list of words to match
        private Lexeme[] pictureArray;     // represents the grid of pictures on the web page
        int numLexemes = 9;               // use 9 words by default
        int numMoves = 0;
        int numMatches = 0;

        Random randNums;

        // **** Properties ****
        public int NumWords { get { return numLexemes; } }


        // **** Constructors and public methods ****

        public MatchingGame()
        {
            randNums = new Random();
            Initialize();
        }


        public MatchingGame(int nl)
        {
            randNums = new Random();
            numLexemes = nl;
            Initialize();
        }


        // Initializes and shuffles the two member lists
        public void Initialize()
        {
            numMatches = 0;
            numMoves = 0;
            Lexemes randLexemes = dict.GetRandomLexemes(numLexemes);
            wordList = new List<string>();
            foreach (Lexeme lex in randLexemes)
                wordList.Add(lex.Word);

            randLexemes.Shuffle();
            pictureArray = randLexemes.ToArray();
      }


        public string GetWord(int wordNum)
        {
            if (wordNum < wordList.Count)
                return wordList[wordNum];
            else
                return "";
        }


        public string GetPicture(int wordNum)
        {
            if (wordNum < pictureArray.Count())
                return pictureArray[wordNum].Picture;
            else
                return "";
        }


        public void MovePicture(int origin, int destination)
        {
            Lexeme pic = pictureArray[origin];
            pictureArray[origin] = pictureArray[destination];
            pictureArray[destination] = pic;
            numMoves++;
            CountMatches();
        }


        public bool CheckMatch(int pictureNum, int wordNum)
        {
            if (pictureNum < pictureArray.Count() && wordNum < wordList.Count())
                return pictureArray[pictureNum].Word == wordList[wordNum];
            else
                return false;
        }


        public int GetScore()
        {
            return 2 * numMatches - numMoves;
        }


        public bool AllDone()
        {
            return numMatches == numLexemes;
        }


        private void CountMatches()
        {
            numMatches = 0;
            for (int i = 0; i < NumWords; i++)
            {
                if (CheckMatch(i, i))
                    numMatches++;
            }
        }

    }

}