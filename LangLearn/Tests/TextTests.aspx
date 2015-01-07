<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TextTests.aspx.cs" Inherits="Tests_TextTests" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            Dictionary Class Tests</h1>
        <br />
        <asp:Label ID="Label1" runat="server" Text="GetWords(12)"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox1" runat="server" Height="95px" TextMode="MultiLine" 
            Width="218px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="GetRandomWords(12)"></asp:Label>
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Height="95px" TextMode="MultiLine" 
            Width="218px"></asp:TextBox>
    </div>
    </form>
</body>
</html>
