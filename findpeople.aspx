<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" Title="Find People" %>

<script runat="server">
 protected void AddFriend(object sender, CommandEventArgs e)
 {
     UserDAL.AddFriend(Session["userid"].ToString(), e.CommandArgument.ToString());
     DataList1.DataBind();
          
 
 }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<h2>Find People</h2>
Enter  a part of person name : 
  <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
  <asp:Button ID="btnFind" runat="server" Text="Find" />
  <p />
  <asp:DataList ID="DataList1" runat="server" DataSourceID="ObjectDataSource1"  
        DataKeyField="userid" >
    
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
      <asp:Button runat="server" ID="btnAddFriend" CommandArgument='<%# Eval("userid")%>' text="Follow"  OnCommand="AddFriend"/>
    </td>
    </tr>
    </ItemTemplate>
       
    </asp:DataList>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="FindPeople" TypeName="UserDAL">
        <SelectParameters>
            <asp:SessionParameter Name="userid" SessionField="userid" Type="String" />
            <asp:ControlParameter ControlID="txtUsername" Name="pattern" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>

