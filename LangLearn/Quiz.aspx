<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Quiz.aspx.cs" Inherits="Quiz" EnableViewState="false" MasterPageFile="~/MasterPages/HomeLayout.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainCol1" runat="Server">
    <h2>Quiz</h2>
    <img id="Picture" src="img/Bird.png" alt="Bird" style="float:left; padding:7px"/>
    <div style= "padding:7px" onclick="checkAnswer()">
        <br />
        <input name="Choice" type="radio" value="0" /><span id="Choice0"></span><br />
        <input name="Choice" type="radio" value="1" /><span id="Choice1"></span><br />
        <input name="Choice" type="radio" value="2" /><span id="Choice2"></span><br />
        <input name="Choice" type="radio" value="3" /><span id="Choice3"></span><br />
        <input name="Choice" type="radio" value="4" /><span id="Choice4"></span>
    </div>
    <span id="Answer">Choose an answer</span>
    <input id="NextPicture" type="button" style="float:right"
        value="Get the next picture" onclick="nextPicture();" />
    

<script type="text/javascript">
    window.onload = nextPicture;

    function nextPicture() {
        PageMethods.GetPicture(pictureCallback);
        
        // Clear the result
        //span = document.getElementById('Answer');
        //span.innerHTML = "Choose an answer";
        $('#Answer').innerHTML = "Choose an answer";

        // Clear the previous selection in the radio buttons
        var radios = $('[name=Choice]');
        for (var i = 0; i < radios.length;  i++) {
            radios[i].checked = false;
    }

        function pictureCallback(picFileName) {
            // Get the picture
            //image = document.getElementById('Picture');
            //image.src = "img/" + picFileName;
            $('#Picture').attr('src', "img/" + picFileName);
            // Get the multiple word choices
            PageMethods.GetChoices(picFileName, choicesCallback);
        }
    }

    function choicesCallback(result) {
        for (i = 0; i < $('[name=Choice]').length; i++)
            $('#Choice' + i).html(result[i]);
    }

    function checkAnswer() {
        var radios = $('[name=Choice]');
        for (var i = 0; i < radios.length; i++) {
            if (radios[i].checked) {
                word = $("#Choice" + i).html();
                fileName = getPictureFileName();
                PageMethods.CheckAnswer(word, fileName, checkCallback);
                // only one radio can be logically checked, don't check the rest
                break;
            }
        }
    }

    function checkCallback(result) {
        //span = document.getElementById('Answer');
        span = $('#Answer');
        if (result == true)
            span.html("Right!");
        else
            span.html("Try again");
    }

    // helper method for getting the filename of the picture
    function getPictureFileName() {
        // image = document.getElementById('Picture');
        // picturePath = image.src;
        picturePath = $('#Picture').attr('src');
        return picturePath.slice(picturePath.lastIndexOf("/") + 1);
    }

</script>

</asp:Content>


