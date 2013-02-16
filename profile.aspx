<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Profile" %>

<script runat="server">

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        string picturefile= "";
        
        if (FileUpload1.HasFile)
        {
            picturefile = Session["username"].ToString();
            FileUpload1.SaveAs( Request.MapPath("photos/" + picturefile + ".jpg"));
        }
 
        bool done = UserDAL.UpdateUserProfile(Session["userid"].ToString(), txtOnlineBio.Text, picturefile);
        if (done)
            lblMsg.Text = "Profile has been updated successfully!";
        else
            lblMsg.Text = "Sorry! Could not update profile!";
        
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            User u = UserDAL.GetUserDetails(Session["userid"].ToString());
            txtOnlineBio.Text = u.OnlineBio;
        }
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Profile</h2>
Enter Online Bio
<br />
<asp:TextBox ID="txtOnlineBio" runat="server" TextMode ="MultiLine" Rows="2" Columns ="50"></asp:TextBox>
<p />
Select Photo : <asp:FileUpload ID="FileUpload1" runat="server" />
<p />
<asp:Button ID="btnUpdate" runat="server" Text="Update Profile" 
        onclick="btnUpdate_Click" />
<p />
<asp:Label ID="lblMsg" runat="server" Text="" EnableViewState ="false"></asp:Label>

</asp:Content>

