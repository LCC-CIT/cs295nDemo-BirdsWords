<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/HomeLayout.master"
    AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainCol1" runat="Server">
    <p>
        Welcome to <a href="Default.aspx">Bird's Words</a>. This site is designed to make
        it <strong>easy</strong> and <strong><em>fun</em></strong> to learn a new language.
        Currently we are working on vocabulary exercises that use pictures and recorded
        words so that you can learn vocabulary quickly.
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMainCol2" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        <asp:Button ID="logoutButton" runat="server" OnClick="logoutButton_Click" Text="Log out" Visible="False" />
        <asp:Button ID="registerButton" runat="server" OnClick="registerButton_Click" Text="Register" Visible="False" />
        <br />
        <asp:Label ID="lblLoginMessage" runat="server" Font-Size="Medium" Visible="False"></asp:Label>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpMain" runat="Server">
    <p>
        Here are some exercises to help you start learning a new langauge:
    </p>
    <p class="style1">
        <a href="VocabPractice.aspx">Vocabulary practice</a>
    </p>
    <p class="style1">
        <a href="VocabMatchingGame.aspx">Vocabulary matching game</a>
    </p>
    <p class="style1">
        <a href="Quiz.aspx">Vocabulary quiz</a>
    </p>
</asp:Content>
