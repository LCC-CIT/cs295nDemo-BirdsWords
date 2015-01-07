<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/HomeLayout.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainCol1" Runat="Server">
    This is Brian Bird's language learning web site.
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMainCol2" Runat="Server">
    Please send us any <a href="Contact.aspx">comments or quesitons</a> that you might have. 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpMain" runat="Server">
    Here are links to some experimental pages that didn&#39;t make it into the site:<br />
    <ul>
        <li><a href="Tests/DynamicTable.aspx">Programmatically created table Experiemnt</a>
            <br />
            The table is created in the code-behind, not in markup. Pictures are laoded 
            based on words stored in an array in the Session object. The array is managed by 
            the MatchingGame class.
        This has images that can be moved and all state is stored in the Session object.</li>
        <li><a href="Tests/TextTests.aspx">Tests for my Dictionary class</a></li>
        <li><a href="Tests/MatchingGameTest.aspx">Tests for my MatchingGame class</a></li>
        <li><a href="Tests/ImageTest.aspx">Image loading Experiments</a></li>
    </ul>
</asp:Content>
