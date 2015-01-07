<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/HomeLayout.master"
    AutoEventWireup="true" CodeFile="VocabMatchingGame.aspx.cs" Inherits="VocabMatchingGame" ViewStateMode="Disabled" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cpHead" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMainCol1" runat="Server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Table ID="tblPictures" Caption="Pictures" runat="server">
                <asp:TableRow ID="Row3" runat="server">
                    <asp:TableCell ID="Cell9" runat="server">
                        <asp:ImageButton ID="ImageButton0" runat="server" OnClick="ImgButton_Click" BorderWidth="4" ></asp:ImageButton></asp:TableCell>
                    <asp:TableCell ID="Cell10" runat="server">
                        <asp:ImageButton ID="ImageButton1" runat="server" OnClick="ImgButton_Click" BorderWidth="4" ></asp:ImageButton></asp:TableCell>
                    <asp:TableCell ID="Cell11" runat="server">
                        <asp:ImageButton ID="ImageButton2" runat="server" OnClick="ImgButton_Click" BorderWidth="4" ></asp:ImageButton></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Row4" runat="server">
                    <asp:TableCell ID="Cell12" runat="server">
                        <asp:ImageButton ID="ImageButton3" runat="server" OnClick="ImgButton_Click" BorderWidth="4" ></asp:ImageButton></asp:TableCell>
                    <asp:TableCell ID="Cell13" runat="server">
                        <asp:ImageButton ID="ImageButton4" runat="server" OnClick="ImgButton_Click" BorderWidth="4" ></asp:ImageButton></asp:TableCell>
                    <asp:TableCell ID="Cell14" runat="server">
                        <asp:ImageButton ID="ImageButton5" runat="server" OnClick="ImgButton_Click" BorderWidth="4" ></asp:ImageButton></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Row5" runat="server">
                    <asp:TableCell ID="Cell15" runat="server">
                        <asp:ImageButton ID="ImageButton6" runat="server" OnClick="ImgButton_Click" BorderWidth="4" ></asp:ImageButton></asp:TableCell>
                    <asp:TableCell ID="Cell16" runat="server">
                        <asp:ImageButton ID="ImageButton7" runat="server" OnClick="ImgButton_Click" BorderWidth="4" ></asp:ImageButton></asp:TableCell>
                    <asp:TableCell ID="Cell17" runat="server">
                        <asp:ImageButton ID="ImageButton8" runat="server" OnClick="ImgButton_Click" BorderWidth="4" ></asp:ImageButton></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
            Score:
            <asp:Label ID="scoreLabel" runat="server" Text="0"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cpMainCol2" runat="Server">
    <p>
        Move the pictures to the same positions as the words in the &quot;Words&quot; table.
        <br />
        When a picture is in the right place it&#39;s border will turn green.<br />
    </p>
    <asp:Table ID="tblWords" Caption="Words" CellPadding="5" runat="server">
        <asp:TableRow ID="Row0" runat="server">
            <asp:TableCell ID="Cell0" BorderStyle="Solid" BorderColor="Blue" Width="100px" BorderWidth="4px" runat="server"></asp:TableCell>
            <asp:TableCell ID="Cell1" BorderStyle="Solid" BorderColor="Blue" Width="100px" BorderWidth="4px" runat="server"></asp:TableCell>
            <asp:TableCell ID="Cell2" BorderStyle="Solid" BorderColor="Blue" Width="100px" BorderWidth="4px" runat="server"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="Row1" runat="server">
            <asp:TableCell ID="Cell3" BorderStyle="Solid" BorderColor="Blue" BorderWidth="4px" runat="server"></asp:TableCell>
            <asp:TableCell ID="Cell4" BorderStyle="Solid" BorderColor="Blue" BorderWidth="4px" runat="server"></asp:TableCell>
            <asp:TableCell ID="Cell5" BorderStyle="Solid" BorderColor="Blue" BorderWidth="4px" runat="server"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="Row2" runat="server">
            <asp:TableCell ID="Cell6" BorderStyle="Solid" BorderColor="Blue" BorderWidth="4px" runat="server"></asp:TableCell>
            <asp:TableCell ID="Cell7" BorderStyle="Solid" BorderColor="Blue" BorderWidth="4px" runat="server"></asp:TableCell>
            <asp:TableCell ID="Cell8" BorderStyle="Solid" BorderColor="Blue" BorderWidth="4px" runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Button ID="btnNewGame" runat="server" Text="Start a new game" OnClick="btnNewGame_Click" />
    <br />
    <br />

    <asp:Table ID="tblLeaderBoard" Caption="Leader Board" HorizontalAlign="Center" CellPadding="5" runat="server">
        <asp:TableRow runat="server">
            <asp:TableCell ID="Cell20" Width="100px" runat="server">Name</asp:TableCell>
            <asp:TableCell ID="Cell21" Width="100px" runat="server">Score</asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell ID="Cell22" runat="server"></asp:TableCell>
            <asp:TableCell ID="Cell23" runat="server"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell ID="Cell24" runat="server"></asp:TableCell>
            <asp:TableCell ID="Cell25" runat="server"></asp:TableCell>
        </asp:TableRow>
        <asp:TableRow runat="server">
            <asp:TableCell ID="Cell26" runat="server"></asp:TableCell>
            <asp:TableCell ID="Cell27" runat="server"></asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cpMain" runat="Server">
    <br />
</asp:Content>
