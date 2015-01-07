<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/HomeLayout.master" AutoEventWireup="true"  CodeFile="VocabPractice.aspx.cs" Inherits="VocabPractice" ViewStateMode="Disabled" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainCol1" Runat="Server">
    <asp:ScriptManagerProxy runat="server">
        <Services>
            <asp:ServiceReference Path="~/VocabPracticeService.svc" />
        </Services>
    </asp:ScriptManagerProxy>

    <h2>Vocabulary Practice</h2>
    <p>Click on a picture to see the word that describes it</p>
    <div style="float: left">

        <table class="auto-style1">
            <tr>
                <td><img id="Img0" src="img/Bird.png"  style="float:left; padding:7px" onclick="GetWord(this)" /></td>
                <td><img id="Img1" src="img/Bird.png"  style="float:left; padding:7px" onclick="GetWord(this)" /></td>
            </tr>
            <tr>
                <td><img id="Img2" src="img/Bird.png"  style="float:left; padding:7px" onclick="GetWord(this)" /></td>
                <td><img id="Img3" src="img/Bird.png"  style="float:left; padding:7px" onclick="GetWord(this)" /></td>
            </tr>
        </table>

    </div>
    <div style="float: right; width: 165px; margin: 5px">
        <span id="word"  style="font-size:large">Word</span>
        <br /><br /><br />
        <input id="btnNewPics" type="button" value="Get New Pictures" onclick="GetPictures()" />
        <br />
        <br />
    </div>
    <script type="text/javascript">
        window.onload = GetPictures;

        var numPictures = 4;    // we'll hard code this for now, later we could let the user select it

        function GetPictures() {
            VocabPracticeService.GetPictures(numPictures, picturesCallback);
        }


        function picturesCallback(result) {
            for(i = 0; i < numPictures; i++)
            {
                image = document.getElementById('Img' + i);
                image.src = "img/" + result[i];
            }
            span = document.getElementById('word');
            span.innerHTML = "Click on a picture";
        }

        function GetWord(image) {
            var picturePath = new String(image.src);
            fileName = picturePath.slice(picturePath.lastIndexOf("/") + 1);
            VocabPracticeService.GetWord(fileName, wordCallback);
        }


        function wordCallback(result) {
            span = document.getElementById('word');
            span.innerHTML = result;
        }

    </script>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMainCol2" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpMain" Runat="Server">
</asp:Content>

