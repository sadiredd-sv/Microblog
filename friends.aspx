<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Friends"%>

<script runat="server">

    protected void RemoveFriend(object sender, CommandEventArgs e)
    {
        // userid, friendid
        UserDAL.RemoveFriend(Session["userid"].ToString(), e.CommandArgument.ToString());
        DataList1.DataBind();
    }
    
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2>Friends</h2>
 <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1" DataKeyField="userid" >
    <ItemTemplate>
    <tr>
    <td valign="top">
    <img width="50px" height="50px" src='photos/<%# Eval("picturefile")%>.jpg'></img>
    </td>
    <td valign="top">
    <b><%#Eval("username")%> </b> <%#Eval("onlinebio") %>
    <br />
    <%# Eval("followerscount") %> followers
    </td>
    <td valign="top">
      <asp:Button runat="server" ID="btnRemoveFriend" CommandArgument='<%# Eval("userid")%>' text="Remove"  OnCommand="RemoveFriend"/>
    </td>
    </tr>
    </ItemTemplate>
  
       
    </asp:DataList>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetFriends" TypeName="UserDAL">
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>

