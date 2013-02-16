<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Home Page" %>

<script runat="server">

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (txtUpdate.Text != "")
        {
            bool done = UpdatesDAL.AddUpdate(Session["userid"].ToString(),
                                              txtUpdate.Text);
            if (done)
            {
                txtUpdate.Text = "";
                btnUpdate.Enabled = false;  // disable button
                DataList1.DataBind();    
            }
            else
                lblError.Text = "Sorry! Could not add update!";
        }
        
            
    }
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<script language = "javascript" type="text/javascript">

function checkInput()
{
  var txtupdate = document.getElementById("ctl00_ContentPlaceHolder1_txtUpdate");
  var countmsg = document.getElementById("count");
  var btnupdate = document.getElementById ("ctl00_ContentPlaceHolder1_btnUpdate");
  
  var countleft = 140 -  txtupdate.value.length;
  if ( countleft < 0 ) {
      btnupdate.disabled = true;
  }
  else 
      btnupdate.disabled = false;
    
  countmsg.innerHTML = countleft;
  
  
}
</script>

<table width="500px">
<tr>
<td>
  <span style="font:700  12pt arial">What are you doing?</span>
</td>
<td align="right"><span id="count" style="font:700 12pt verdana">140</span>
</td>
</tr>
</table>
<br />
<asp:TextBox ID="txtUpdate" runat="server" TextMode ="MultiLine" Rows="3"  
  Width="500px" MaxLength = "140" onKeydown="checkInput()">
</asp:TextBox>
<br />
<asp:Button ID="btnUpdate" runat="server" Text="Update" onclick="btnUpdate_Click" />
<asp:Label ID="lblError" runat="server" Text="" EnableViewState ="false"></asp:Label>
<p />
    <asp:DataList ID="DataList1" runat="server" DataSourceId ="ObjectDataSource1">
    <ItemTemplate>
    <tr>
    <td valign="top">
    <img width="50px" height="50px" src='photos/<%# Eval("picturefile")%>.jpg'></img>
    </td>
    <td valign="top">
    <b><%#Eval("username")%> </b> <%#Eval("text") %>
    <br />
    <%# Eval("timestamp") %>
    </td>
    </tr>
    </ItemTemplate>
    </asp:DataList>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetTotalUpdates" TypeName="UserDAL">
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

