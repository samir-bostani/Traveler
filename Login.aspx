<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Traveler Login</title>
    <link href="StyleSheet/LogIn.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="LoginDIV">
        <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tr>
                <td class="LoginDIVHeder">
                    <span style="color: White">Login</span>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="LoginDIVTextBoxContainer">
                        <table border="0" cellpadding="5" cellspacing="5">
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text="UserName:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxUser" runat="server" Width="200"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBoxPass" runat="server" Width="200" TextMode="Password"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                                    <asp:Button ID="BtnOK" Width="100" runat="server" Text="OK" OnClick="BtnOK_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
