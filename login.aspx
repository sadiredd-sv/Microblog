<%@ Page Language="C#" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        Session.Add("userid",
             Membership.GetUser(Login1.UserName).ProviderUserKey.ToString());
        Session.Add("username",Login1.UserName);
        
    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <table height="600px" width="800px" align="center" bgcolor="white">
    <tr>
    <td colspan="2">
    <img src="images/logo.jpg"/>
    </td>
    <td colspan="2">
    <hr />
    </td>
    </tr>
    <tr>
    <td valign="top" style="background-color:#cccccc" width="175px">
        <asp:Login ID="Login1" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" 
            BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
            CreateUserText="Register!" CreateUserUrl="~/all/register.aspx" 
            Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" 
            PasswordRecoveryText="Forgot Password?" 
            PasswordRecoveryUrl="~/all/forgotpassword.aspx" 
            onloggedin="Login1_LoggedIn"  Width="175px">
            <TextBoxStyle Font-Size="0.8em" />
            <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                ForeColor="White" />
        </asp:Login>
    </td>
    <td valign="top" style="background-color:#eeeeee">
    <h3>About MicroBlog.Com</h3>
    This website allow you to answer a simple question - What are you doing?<br />
        <br />
        It is based on the simple idea of being able to know what your friends, family 
        members and co-workers are doing.<br />
        <p />
        <center>
         <img src="images/blog.jpg" height="250px" />
        </center>
    </td>
    </tr>
    </table>
    </form>
</body>
</html>
