<%@ Page Title="Administration" Language="C#" MasterPageFile="~/MasterPages/HomeLayout.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainCol1" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td>English Word</td>
            <td>Spanish Word</td>
            <td>Part of Speech</td>
            <td>Picture</td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="englishTextBox" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="spanishTextBox" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="posTextBox" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="pictureTextBox" runat="server"></asp:TextBox>
            </td>
        </tr>

    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMainCol2" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpMain" Runat="Server">
    <asp:Button ID="enterButton" runat="server" Text="Insert" Width="90px" OnClick="enterButton_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Add the word-set above to the database<br />
<br />
<asp:Button ID="findEnglishButton" runat="server" OnClick="findEnglishButton_Click" Text="Find English" Width="88px" />
&nbsp;&nbsp;&nbsp;
<asp:Button ID="findSpanishButton" runat="server" OnClick="findSpanishButton_Click" Text="Find Spanish" Width="93px" />
&nbsp;&nbsp;&nbsp;
<asp:TextBox ID="findTextBox" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp; Find this word in the database<br />
    <br />
    <asp:Button ID="deleteButton" runat="server" OnClick="deleteButton_Click" Text="Delete" Width="86px" />
    &nbsp;&nbsp;&nbsp;&nbsp; Remove the word-set found above from the database<br />
<br />
<asp:Button ID="showButton" runat="server" OnClick="showButton_Click" Text="Show All" Width="86px" />
<br />
<br />
<asp:TextBox ID="showAllTextBox" runat="server" Height="173px" ReadOnly="True" TextMode="MultiLine" Width="663px"></asp:TextBox>
<br />
    <br />
</asp:Content>

