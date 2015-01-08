<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EfTests.aspx.cs" Inherits="Tests_EfTests" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <p>
        All Spanish Words&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; All English Words<br />
&nbsp;<asp:TextBox ID="AllSpanishTextBox" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox> &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="AllEnglishTextBox" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
    </p>
    <p>
        A Spanish Word&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; English Words<br />
&nbsp;<asp:TextBox ID="SpanishWordTextBox" runat="server"></asp:TextBox> &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="EnglishWordsTextBox" runat="server" TextMode="MultiLine" Rows="10"></asp:TextBox>
    
    </p>
    </form>
</body>
</html>
