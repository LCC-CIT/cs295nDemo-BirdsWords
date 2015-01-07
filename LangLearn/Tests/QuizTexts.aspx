<%@ Page Language="C#" Debug="true" AutoEventWireup="true" CodeFile="QuizTexts.aspx.cs" Inherits="Tests_MatchingGameTest" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <!-- Tests for the logic classes are in the code-behind -->
        <h1>VocabQuiz class tests</h1>
        <asp:Label ID="lblOutput" runat="server" Text="Label"></asp:Label>  

        <!-- Tests for the Quiz web service are in the JavaScript below-->
        <h1>QuizService tests</h1>  

        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/QuizService.svc" />
            </Services>
        </asp:ScriptManager>

        <img id="picture"  src="../img/Bird.png" alt="Bird picture" /><br />
        <span id="choices">Choices: </span><br />
        <span id="responce">answer of Dog is: </span><br />

    
        <script type="text/javascript">
            QuizService.GetPicture(pictureCallback);

            function pictureCallback(result) {
                image = document.getElementById('picture');
                image.src = "../img/" + result;
            }

            QuizService.GetChoices(choicesCallback);

            function choicesCallback(result) {
                span = document.getElementById('choices');
                span.innerHTML += result;
            }

            QuizService.CheckAnswer("Dog", checkAnswerCallback);

            function checkAnswerCallback(result) {
                span = document.getElementById('responce');
                span.innerHTML += result;
            }

        </script>

        
    </div>
    </form>
</body>
</html>
